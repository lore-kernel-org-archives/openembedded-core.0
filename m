Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id B5FA776844
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 07:29:09 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so102122567wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 00:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4pj7p2z9npSKG2giAnIRgLGpaomn0hqn0hDgjH6Hryg=;
	b=QnmpnyVDQlJqG9fAVxKE7tljUM9l/F9+cAiNUl3LYOVGXbmlvbmBj2cgTgchVdb2Cv
	A7mbQETi9DqcYAtZrynKvNQ9Zh9qc4g34rgimQ213NfUhZZ2IoSUFoRpRnAn/eOfhDlZ
	xlwmvks2JA6ZyoY7/oBhbZQG7VHpEz3630/3pGd5y1vwKdbUt6mKsAMNiGPelv9D+Izv
	1IxqXg43d1+HyjKQXeJl08CPwfWOWcMbu84AWrilxdLflMx8RUma9z8Fiu8qe+MCi34M
	WO2NRPAITvOroXhy8eHBwsvotdQK40aCG0B2A2ri4bzAEvpaXzXCxE0lIbngoW1OdwPn
	/fkA==
X-Gm-Message-State: ALoCoQktG0kQmc64GS+9yo606D03huMXH6wj3TbiZ99DcqFSKOinpFRe1gSt0YOuq3engSUD3RH1
X-Received: by 10.194.87.4 with SMTP id t4mr71193509wjz.84.1439364549868; Wed,
	12 Aug 2015 00:29:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.27.175.160 with HTTP; Wed, 12 Aug 2015 00:28:40 -0700 (PDT)
In-Reply-To: <CE58424F-B08C-41D9-B302-D4C4C2C3D074@gmail.com>
References: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
	<cover.1439318387.git.jussi.kukkonen@intel.com>
	<6591f1a55a50b6417755e7e6720750818dab6532.1439318387.git.jussi.kukkonen@intel.com>
	<CE58424F-B08C-41D9-B302-D4C4C2C3D074@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 12 Aug 2015 10:28:40 +0300
Message-ID: <CAHiDW_FC3mXkOoKUTXbfuhAvX_YZSTt8EG02nVna7NSK8g2HHA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] nfs-utils: Upgrade 1.3.1 -> 1.3.2
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
X-List-Received-Date: Wed, 12 Aug 2015 07:29:15 -0000
Content-Type: text/plain; charset=UTF-8

On 12 August 2015 at 04:50, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 11, 2015, at 12:13 PM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> Let "--enable-tirpc" be selected in configure by default: it is
>> a requirement for ipv6 support. This should not grow a typical
>> image size as libtirpc is a rpcbind dependency already.
>>
>
> ideally you would want to define a PACKAGECONFIG for this which is enabled/disabled with ipv6 distro feature knob.

Thanks, sounds sensible. I can send a v2.

Jussi

>
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>> ---
>> .../nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb}           | 7 +++----
>> 1 file changed, 3 insertions(+), 4 deletions(-)
>> rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.3.1.bb => nfs-utils_1.3.2.bb} (95%)
>>
>> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
>> similarity index 95%
>> rename from meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
>> rename to meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
>> index 6da8509..59252c5 100644
>> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.1.bb
>> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_1.3.2.bb
>> @@ -8,7 +8,7 @@ LICENSE = "MIT & GPLv2+ & BSD"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
>>
>> # util-linux for libblkid
>> -DEPENDS = "libcap libnfsidmap libevent util-linux sqlite3"
>> +DEPENDS = "libcap libnfsidmap libevent libtirpc util-linux sqlite3"
>> RDEPENDS_${PN}-client = "rpcbind bash"
>> RDEPENDS_${PN} = "${PN}-client bash"
>> RRECOMMENDS_${PN} = "kernel-module-nfsd"
>> @@ -33,8 +33,8 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
>>            file://nfs-utils-debianize-start-statd.patch \
>> "
>>
>> -SRC_URI[md5sum] = "8de676b9ff34b8f9addc1d0800fabdf8"
>> -SRC_URI[sha256sum] = "ff79d70b7b58b2c8f9b798c58721127e82bb96022adc04a5c4cb251630e696b8"
>> +SRC_URI[md5sum] = "4cdffb2c7f7fd2bdceaba55ab1b881da"
>> +SRC_URI[sha256sum] = "2966bb431c06e9ba35a54f48f89db03a5132bc2d8ed8084ac8ccb34e25a9b739"
>>
>> # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
>> # pull in the remainder of the dependencies.
>> @@ -58,7 +58,6 @@ EXTRA_OECONF = "--with-statduser=rpcuser \
>>                 --disable-nfsv41 \
>>                 --enable-uuid \
>>                 --disable-gss \
>> -                --disable-tirpc \
>>                 --disable-nfsdcltrack \
>>                 --with-statdpath=/var/lib/nfs/statd \
>>                "
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

