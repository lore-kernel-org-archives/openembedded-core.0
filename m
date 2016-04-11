Return-Path: <akuster808@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 422C371E63
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 14:14:49 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id 4so12417434obi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=8J0CL/8qYoftEsZkjgOcTmuqm2AIY5y07jV11QjuIM4=;
	b=yBsos1yeQlOVIVaIccE8exWNDp1M41aGeABlXxFXXOV4GFDknUVrOiaKDyvdtZHfZJ
	DMLr11hxzGkrTqwozasBz3pgJl9b3RCv96FMqG/ZxzqU1FsQRlauGz/h/EsmZXivd0XS
	tPoZpLDX9UZ9h18BSiZSdhf8/kWOAA8Pbdt/B2IdrMxH6nUW9ArG5nrsVjFglrkIwYbW
	Lm+uBjUJNPdnNCuhpC+eR8sqkiNG0hg7EYcF+1r+TdnNKjL6iqsxlu08MLnNqVrZ+8i3
	xFgwKj/s887PamQYOtjm8Azi8RTHi0OAptSyuo1lilBOtFl1PuRpA9CmZfm24gb0mqm2
	kYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=8J0CL/8qYoftEsZkjgOcTmuqm2AIY5y07jV11QjuIM4=;
	b=kzzI+RkhFTV6evzmbK8G/zDpP4FFhiADbJvNshjlaHmafPT/5T2bMtmUTkKqzry0z1
	jybltH6FU+MBKKncyA7Yug1QIFvmK0CAduyKCnKexgJi7/XN0esCxb/SdZ2tLniM+yFk
	0CogVUxVFFBtJ40RiD4hSEZkaqqxy6Tg5R74YAgSk23PiVc1ZDBS86p3l7LShbNQd+tY
	bgNyiCPo1tNhZ3FOOBoh8GjnY/taIB8NcXrmRN1cVxpPUdVXEq77UDiBEb6bhX0a2Ulh
	g6prhlzxBeW4A5N/pHVNL8oc7SzGbKXUeEJGFs/NZUxo01atAsGAGmxkKzpMrDq2xitw
	xsiA==
X-Gm-Message-State: AD7BkJLzAtL6rVOfM7hCGj3IrkpHZ5kMbDaUV77+XANhzdDeX3AkPm3BMixujyxlPifRxw==
X-Received: by 10.60.129.166 with SMTP id nx6mr10541256oeb.13.1460384090543;
	Mon, 11 Apr 2016 07:14:50 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:cac:bf3:bc26:fd0c?
	([2601:202:4000:1239:cac:bf3:bc26:fd0c])
	by smtp.googlemail.com with ESMTPSA id
	q1sm8306321obi.20.2016.04.11.07.14.49
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Apr 2016 07:14:49 -0700 (PDT)
To: openembedded-core@lists.openembedded.org
References: <cover.1460359568.git.liezhi.yang@windriver.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <570BB157.4050708@gmail.com>
Date: Mon, 11 Apr 2016 07:14:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <cover.1460359568.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 00/14] [jethro] Consolidated pull
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
X-List-Received-Date: Mon, 11 Apr 2016 14:14:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit





On 04/11/2016 12:29 AM, Robert Yang wrote:
> The following changes since commit 4d879cb8d7384ac4a96f22c1664b8875f2d8f615:
> 
>   devtool: extract: update SRCTREECOVEREDTASKS for kernel (2016-03-20 10:22:55 +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

please cherry-pick the timezone updates too.

tdata:
d3ab7005f0c899da9f9f132b22861bd5d4f952ba
66031bcf8cec2e8e7a6803f2c6cfc2c2ba071ffe

and
tzcode:
0c4816c1f723951179988a274f236f28fe4db20f
41adb87c2f1aa20e51f1af3542d65c920eb94be6


> 
> Awais Belal (2):
>   systemd-serialgetty: allow baud rate overriding
>   lttng-tools: fix regression tests hang
> 
> Bill Randle (1):
>   systemd: fix segfault on shutdown
> 
> Brad Mouring (2):
>   busybox-1.23: Backport patch to fix zcip false-conflict
>   busybox_git: Fix SRCREV
> 
> Christopher Larson (1):
>   systemd: chown hwdb.bin to root:root for do_rootfs
> 
> Javier Viguera (1):
>   bluez5: allow D-Bus to spawn obexd in systems without systemd
> 
> Juro Bystricky (1):
>   python3: fix building nativesdk-python3
> 
> Khem Raj (1):
>   ruby-native: Depend on openssl-native
> 
> Li Xin (1):
>   gcc-cross-canadian.inc: add INSANE_SKIP_ to avoid build warning
> 
> Lukas Bulwahn (1):
>   boost: ensure boost to remain an empty metapackage
> 
> Ross Burton (2):
>   cdrtools: update SRC_URI
>   ncurses: update SRC_URI
> 
> Ulrich Ölmann (1):
>   nfs-utils: bugfix: adjust name of statd service unit
> 
>  meta/recipes-connectivity/bluez5/bluez5.inc        |   1 +
>  ...-obexd-without-systemd-in-the-user-sessio.patch |  63 +++
>  .../files/bugfix-adjust-statd-service-name.patch   |  34 ++
>  .../nfs-utils/nfs-utils_1.3.1.bb                   |   1 +
>  ...wrong-comparison-of-source-IP-with-our-IP.patch |  38 ++
>  meta/recipes-core/busybox/busybox_1.23.2.bb        |   1 +
>  meta/recipes-core/busybox/busybox_git.bb           |   2 +-
>  meta/recipes-core/ncurses/ncurses_5.9.bb           |   6 +-
>  .../systemd-serialgetty/serial-getty@.service      |   2 +-
>  .../0023-backported-fixes-for-null-messages.patch  | 101 +++++
>  meta/recipes-core/systemd/systemd_225.bb           |   2 +
>  .../cdrtools/cdrtools-native_3.01a31.bb            |   2 +-
>  meta/recipes-devtools/gcc/gcc-cross-canadian.inc   |   2 +
>  meta/recipes-devtools/python/python3_3.4.3.bb      |   1 +
>  meta/recipes-devtools/ruby/ruby.inc                |   2 +-
>  .../lttng/lttng-tools/Fix-regression-tests.patch   | 480 +++++++++++++++++++++
>  meta/recipes-kernel/lttng/lttng-tools_2.6.0.bb     |   1 +
>  meta/recipes-support/boost/boost.inc               |   1 +
>  18 files changed, 734 insertions(+), 6 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch
>  create mode 100644 meta/recipes-connectivity/nfs-utils/files/bugfix-adjust-statd-service-name.patch
>  create mode 100644 meta/recipes-core/busybox/busybox/0001-zcip-fix-wrong-comparison-of-source-IP-with-our-IP.patch
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-backported-fixes-for-null-messages.patch
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/Fix-regression-tests.patch
> 

