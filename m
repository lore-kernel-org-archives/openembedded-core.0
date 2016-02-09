Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6D6CC7319C
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 14:42:24 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id xg9so78474812igb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Feb 2016 06:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:content-type:mime-version:content-transfer-encoding;
	bh=9um+KZvOpYkUy1i+ffOfC0vfHTPadUk19/NEQa9ECKc=;
	b=j0/icOz/KWBLeO3fVsn2/dDWd4W8d7VE3eVNRQc6TunAgaOCI4mEdJK4X2fojKWOFb
	595aH8vD1L/NV5I9Y6gEYPdR3M8yiyo5MRFTOLYUig3MFANupP82LfOOLPKc9U8Vj9jG
	kcMI9mrDOUXcw1Rqupd4Y2GRRQJ5uYUk3/jL6UtX2Nw5XENV8n/HtOJnGpW5MGGmfjbU
	VsMojFgW6D+YXw9+cOes18mEy0oirQVFGPH6T+Vl4S5vbZw9NYm51SoRNamHxgFg+uE7
	GXFUrVo6dqvoUqSYz0orfk2VP4LiI1H8+r+QCxT3+0HcShBuDUuZN/UgtKTuuW9AtC1u
	o2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=9um+KZvOpYkUy1i+ffOfC0vfHTPadUk19/NEQa9ECKc=;
	b=IB8EmQW78eX03Iq0n4dftN6nUA64M1fYBbHlIsZj99pNNVHZwWeXU84WhKv8EWGvDj
	YOG9aQsrQYXd8yXobcIG+XogNH8ca2m2/NEH2F+ocIHL23ZnxaQmZ27jFUFn9uHxIfRh
	PPRCMWbKVSNpduaxlynYz+gsHwl3Ab/hyubuPSXJQb9G24g2VP6HpkaZed9EQCLKDpdj
	fnrFY6wQJK8Dwztz/LnGrKKPDQy+UE5W5BDIW/xdpbk6tCv554uU21OaReNcSF2Pdkz8
	3iSP/upD0lIJZy7xIIe/a5oetG662a/l2bkpqehl+zU4WzjOjE/KbLbFeCB1IsHj3L9P
	/Mdg==
X-Gm-Message-State: AG10YOQVorPauSDIQev1LuPaBAlF/UPNYfUcD9fNEwehqtJw5knlSe1ADSpko7/8sZ7HJqtU
X-Received: by 10.50.93.42 with SMTP id cr10mr4208022igb.14.1455028945526;
	Tue, 09 Feb 2016 06:42:25 -0800 (PST)
Received: from pohly-mobl1 (p57A57CC2.dip0.t-ipconnect.de. [87.165.124.194])
	by smtp.gmail.com with ESMTPSA id n8sm7492806igv.1.2016.02.09.06.42.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Feb 2016 06:42:24 -0800 (PST)
Message-ID: <1455028942.32190.18.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: OpenEmbedded <openembedded-core@lists.openembedded.org>
Date: Tue, 09 Feb 2016 15:42:22 +0100
In-Reply-To: <1455015819.17004.21.camel@intel.com>
References: <1455015819.17004.21.camel@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: update-alternatives + absolute links
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
X-List-Received-Date: Tue, 09 Feb 2016 14:42:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-02-09 at 12:03 +0100, Patrick Ohly wrote:
> Hello!
> 
> I noticed that toybox's switch_root has problems handling /sbin/init
> -> /lib/systemd/systemd. Apparently it tries to check permissions with
> stat() before switching the root, and at that point resolving the
> symlink fails.
> 
> Are there reasons for preferring absolute paths as link target? Using
> relative paths would avoid the problem, and also make it easier to
> investigate the content of the rootfs on the build host.
> 
> Is that something that would have to be fixed in the different
> virtual/update-alternatives providers? I'm using opkg-utils at the
> moment.

Here's a proof-of-concept patch that modifies opkg-utils-native so that
it calls lnr for turning the absolute link target into something
relative. This turned out to be more complex than anticipated, so a
proper patch instead of the sed mangling would be more appropriate now.

It is limited to opkg-utils-native and thus image creation. On the
target it's harder: "ln --relative" only works for coreutils, lnr is not
installed, and Python cannot be taken for granted either.

Not sure how to proceed. Perhaps its not worth changing after all.

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 1bc561c..4ea7132 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -38,6 +38,12 @@ do_install_append_class-target() {
        fi
 }
 
+do_install_append_class-native() {
+       if [ -e "${D}${bindir}/update-alternatives" ]; then
+               sed -i ${D}${bindir}/update-alternatives -e 's!ln -snf .*!case "$path" in /*) realpath="$D$path"; rm -f $link \&\& lnr $realpath $link;; *) ln -snf $path $link;; esac!'
+       fi
+}
+
 PACKAGES =+ "update-alternatives-opkg"
 FILES_update-alternatives-opkg = "${bindir}/update-alternatives"
 RPROVIDES_update-alternatives-opkg = "update-alternatives update-alternatives-cworth"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




