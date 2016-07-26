Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E92F0606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 16:06:27 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id i6so211786pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jul 2016 09:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=NNpUAhOsvj1TjanIMlYKSR1Y1iwNAcOnEmc/zwXh/KA=;
	b=Fb4beCeg6sQSdpDTqVQnAyFsEfs6IzXyjWDukI3HTHQA63QSfXybQHiHCOyrbaoH3Z
	tvRR8vIM9lc+0+0xMvMhbKR+I3NdJkECk50KnlNDZAzMieojffUva3yBcIMKjzmlibUx
	49zs99pEPkTLRDmWAlWhgQ4s5X3Gxv56tdS5RIcvlNMZGzl4P1metmVL8PYlu7HvWHmW
	Z2j+gsH7rcyKxc2MGhVhluRkmWQvxrpHLPj5py4k4lUu/pU1n1U/gvI4q2k9NMXroe13
	UkaMqf83mhSsDmUN0Zq8j9/H148i+i6K3guhYqeZ+P73RMKQmABgcggR+sBv5LZhVUux
	yzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=NNpUAhOsvj1TjanIMlYKSR1Y1iwNAcOnEmc/zwXh/KA=;
	b=dXuu4qgL/15FWqyHm52cM9A+FJfLggJPZbmL5FMQkJK0uQZoo9/c1MN6sx1VmkjseA
	vUFj+iZ4fe9j2IqVCPtxaJeU6KVSm3JSBnzvmlgNvjv2vKk4s7IyCfn5u5EuimJS9fRr
	dwKz7lPxiW7RWNXmIYrVSg3mh8mxhbBD5L7upeYInW4suUBPWU5F/HNnQ1YzXhbE6feK
	0tkK8uuO6moIpylQRvESxVkEo6GMZrgq56TrMjL7Jy5g9x9X8Ag51LO08K6KQSIh+gyn
	DJi8NNntq3u/84YSW6IrlHxV51Oq+rKb0aXLHpEBK4Z+cpKXz2vjTp2g5spZOOKn9zEv
	3j7Q==
X-Gm-Message-State: AEkooutu141te4NmZ2ynHoheT8goW5DVAD0t6tmljMawVsarNL77IGSrEyjqzqzvOxu34g==
X-Received: by 10.98.111.133 with SMTP id k127mr40485166pfc.90.1469549187482; 
	Tue, 26 Jul 2016 09:06:27 -0700 (PDT)
Received: from Akusters-laptop.local ([2601:202:4001:9ea0:18a0:3335:4f9e:7426])
	by smtp.googlemail.com with ESMTPSA id
	p64sm2692834pfd.11.2016.07.26.09.06.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Jul 2016 09:06:25 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <1469488551-17704-1-git-send-email-ross.burton@intel.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <49b80f61-b6f8-cfee-7325-f84396494e0c@gmail.com>
Date: Tue, 26 Jul 2016 09:06:24 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1469488551-17704-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] dpkg: use snapshot.debian.org for SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Jul 2016 16:06:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 7/25/16 4:15 PM, Ross Burton wrote:
> Using ${DEBIAN_MIRROR} for SRC_URI doesn't work very well as that will only
> contain releases that are currently in Debian, so currently doesn't contain
> 1.18.7 as unstable has moved on to 1.18.9.
>
> So, move all of SRC_URI to the .bb so it can use snapshot.debian.org instead,
> and set UPSTREAM_CHECK_URI to ${DEBIAN_MIRROR} so upstream release checking
> continues to work.

thanks.

Krogoth needs the same fix.

- armin
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/dpkg/dpkg.inc       |  6 ++----
>  meta/recipes-devtools/dpkg/dpkg_1.18.7.bb | 23 ++++++++++++-----------
>  2 files changed, 14 insertions(+), 15 deletions(-)
>
> diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
> index c2215ce..da6985c 100644
> --- a/meta/recipes-devtools/dpkg/dpkg.inc
> +++ b/meta/recipes-devtools/dpkg/dpkg.inc
> @@ -2,13 +2,13 @@ SUMMARY = "Package maintenance system from Debian"
>  LICENSE = "GPLv2.0+"
>  SECTION = "base"
>  
> -SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.xz"
> -
>  DEPENDS = "zlib bzip2 perl ncurses"
>  DEPENDS_class-native = "bzip2-replacement-native zlib-native virtual/update-alternatives-native gettext-native perl-native"
>  RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} xz run-postinsts perl"
>  RDEPENDS_${PN}_class-native = "xz-native"
>  
> +UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/dpkg/"
> +
>  inherit autotools gettext perlnative pkgconfig systemd
>  
>  python () {
> @@ -73,5 +73,3 @@ PACKAGES += "${PN}-perl"
>  FILES_${PN}-perl = "${libdir}/perl"
>  
>  BBCLASSEXTEND = "native"
> -
> -
> diff --git a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
> index 5375923..28fdc13 100644
> --- a/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
> +++ b/meta/recipes-devtools/dpkg/dpkg_1.18.7.bb
> @@ -1,18 +1,19 @@
>  require dpkg.inc
>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>  
> -SRC_URI_append_class-native =" file://glibc2.5-sync_file_range.patch "
> -SRC_URI += "file://noman.patch \
> -            file://remove-tar-no-timestamp.patch \
> -            file://arch_pm.patch \
> -            file://dpkg-configure.service \
> -            file://add_armeb_triplet_entry.patch \
> -	    file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
> -	    file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
> -	    file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
> -	    file://0005-dpkg-compiler.m4-remove-Wvla.patch \
> -	    file://0006-add-musleabi-to-known-target-tripets.patch \
> +SRC_URI = "http://snapshot.debian.org/archive/debian/20160509T100042Z/pool/main/d/${BPN}/${BPN}_${PV}.tar.xz \
> +           file://noman.patch \
> +           file://remove-tar-no-timestamp.patch \
> +           file://arch_pm.patch \
> +           file://dpkg-configure.service \
> +           file://add_armeb_triplet_entry.patch \
> +           file://0002-Adapt-to-linux-wrs-kernel-version-which-has-characte.patch \
> +           file://0003-Our-pre-postinsts-expect-D-to-be-set-when-running-in.patch \
> +           file://0004-The-lutimes-function-doesn-t-work-properly-for-all-s.patch \
> +           file://0005-dpkg-compiler.m4-remove-Wvla.patch \
> +           file://0006-add-musleabi-to-known-target-tripets.patch \
>             "
> +SRC_URI_append_class-native = " file://glibc2.5-sync_file_range.patch "
>  
>  SRC_URI[md5sum] = "073dbf2129a54b0fc627464bf8af4a1b"
>  SRC_URI[sha256sum] = "ace36d3a6dc750a42baf797f9e75ec580a21f92bb9ff96b482100755d6d9b87b"



