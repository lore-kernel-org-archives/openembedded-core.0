Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D187C731A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 01:25:24 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g202so103034pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding;
	bh=ooF2dKeMYXS086jBEnxNO4OyMMmLkx1pW+EQB7m1QEQ=;
	b=fLrkVolFxZUb2Mp38TJ6diVbT7UOQdjmxZyRQ4Z10TiJPdx+f2DDoU/Gw4UrBcAB/R
	fDSPUh4jwCCVa6Qv6ndUHBvPK66kpbvih+f+j1O1nZ85fu4n4M+R0HPjA2LLkSRgGCJq
	eb5dVconPFBe7dxsTe/MCFWvS802L7y3l+/pwtcINe+yoiGOB70eZKmWYbtSHTnJBKCj
	jnH06VSb2sqLD3Jkm+SlXJhvyF4AXF+3JuBKqSM05jeMdAgEBZNccHSlFvdoiZJUZYg4
	PSkgaITX3a+xvdhrM79MTP23JccSUcJWC0O9MfJ2hBGBzGl8i9PdmBATlmzfqdhU5CDi
	wh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ooF2dKeMYXS086jBEnxNO4OyMMmLkx1pW+EQB7m1QEQ=;
	b=jcbIZrjycegG8SOg/ZgiDg7jlPTH1L/zthr4JY1kSuhi6MEH2hQP3R1FCrw12JzIKJ
	5SyrdzwgTIRir6hbxgY+/lJC51GiW2JJkJ7U/O52MJsux1wSn3100DhG1b/HKLrxmVBz
	8xBLc50c6a+esLaF2ZV6K+Ski3yBF8Lz/lgj6iAi5IL+m1OMmWA0/qifc3H1xZfF1Rgl
	s6Ry8sy/JPpdBu7FZEPmdCvlkPHS7xdlQcEUKXaRC4rGXUwBd69D4DS3yZqpIbwNGYEa
	wKwgnhfsAbnCCFxa3jhkkzCsPpm0QC4jRfg50Kwp9vVrlK1JufOVFk0ltRwsXsiUTIUB
	Zy0A==
X-Gm-Message-State: ALyK8tJgTGwS9gmiPqvhiuhWDF8hFrfaUmkoQQZaIebPXIplb9HsiVt+QoPPcB8BYzucKw==
X-Received: by 10.98.9.68 with SMTP id e65mr39957390pfd.121.1468286724781;
	Mon, 11 Jul 2016 18:25:24 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:344d:d49:bd5b:9177?
	([2601:202:4001:9ea0:344d:d49:bd5b:9177])
	by smtp.gmail.com with ESMTPSA id
	n80sm1999193pfi.19.2016.07.11.18.25.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 18:25:23 -0700 (PDT)
To: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAP9ODKp17vE1xOJiePAq6d3poMvCkkK-BCdf4_m6yAUXgsWsPw@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57844702.9050108@gmail.com>
Date: Mon, 11 Jul 2016 18:25:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp17vE1xOJiePAq6d3poMvCkkK-BCdf4_m6yAUXgsWsPw@mail.gmail.com>
Subject: Re: [for-krogoth] Backport of new libarchive release
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
X-List-Received-Date: Tue, 12 Jul 2016 01:25:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Otavio,

On 07/11/2016 07:41 AM, Otavio Salvador wrote:
> Hello Armin and OE-Core fellows,
>
> The libarchive 3.2.1 fixes several bugs and security related issues so
> it seems like a good candidate for backport. I list below the commits
> I did in our local fork while testing it:

CVE-2016-1541 is the only missing CVE. Are you aware of others? General 
bug fixes are good.  But If I am not mistaken, there are 803 commits 
between 3.1.2 (krogoth) and 3.2.1 (master). The is more than I want to 
take at this time.

thanks for keeping an eye out for changes needing to go into krogoth.

kind regards,
Armin

>
> commit 95e2a448d857659935ecd4762faea851151d1bce (HEAD -> for-krogoth)
> Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> Date:   Tue Jun 28 11:06:13 2016 +0300
>
>      libarchive: update to 3.2.1
>
>      Drop merged 0001-configure.ac-check-acl-libacl.h-and-sys-acl.h-based-.patch
>
>      Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>      Signed-off-by: Ross Burton <ross.burton@intel.com>
>      (cherry picked from commit 4d65a93d3e705cfb9b4cfe102e9d0cabaffe7a52)
>
> commit 088ad58922bd6af83a17c3c0a9ae3b78564e798d
> Author: Maxin B. John <maxin.john@intel.com>
> Date:   Mon Jun 6 00:12:03 2016 +0300
>
>      libarchive: respect disable-acl configuration option
>
>      Update configure.ac to properly handle --disable-acl option
>
>      [YOCTO #9668]
>
>      Signed-off-by: Maxin B. John <maxin.john@intel.com>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>      (cherry picked from commit 84fe3f29f2bdaf98c9beefdfede143084fba093b)
>
> commit 71a550d24e1098e34e35da68335d83f893afe169
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Sat Jun 4 09:04:26 2016 +0100
>
>      libarchive: Add PACKAGECONFIG for lz4 to ensure determinism
>
>      This avoids:
>
>      WARNING: opkg-1_0.3.1-r0 do_package_qa: QA Issue: libopkg rdepends
> on lz4, but it isn't a build dependency, missing lz4 in DEPENDS or
> PACKAGECONFIG? [build-deps]
>
>      and ERROR:
>
>      build-appliance-image-15.0.0-r0 do_rootfs: Unable to install
> packages. Command
> '/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/sysroots/x86_64-linux/usr/bin/smart
> --log-level=warning
> --data-dir=/home/pokybuild/yocto-autobuilder/yocto-worker/build-appliance/build/build/tmp/work/qemux86_64-poky-linux/build-appliance-image/15.0.0-r0/rootfs/var/lib/smart
> install -y packagegroup-core-boot@qemux86_64
> packagegroup-core-ssh-openssh@all psplash@core2_64
> kernel-dev@qemux86_64 packagegroup-core-x11-base@all
> kernel-devsrc@qemux86_64 smartpm@core2_64 packagegroup-self-hosted@all
> rpm@core2_64 locale-base-en-us@core2_64 locale-base-en-gb@core2_64'
> returned 1:
>      Loading cache...
>      Updating cache...
> ######################################## [100%]
>
>      Computing transaction...error: Can't install
> libopkg1-1:0.3.1-r0.0@core2_64: no package provides lz4 >=
> 131+git0+d86dc9167
>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>      (cherry picked from commit f12fe90a78ca1239691e8fd8f7b06ce59b8b72cc)
>
> commit afc19399bfe4e5dfff5243ed14ab806c78c092bb
> Author: Paul Barker <paul@paulbarker.me.uk>
> Date:   Sat May 28 14:26:15 2016 +0100
>
>      libarchive: Upgrade to v3.2.0
>
>      All patches are removed as they are no longer needed. Most were
> merged into this
>      release of libarchive. "0001-Set-xattrs-after-setting-times.patch"
> was dropped
>      upstream after discussion, see
> https://github.com/libarchive/libarchive/pull/664.
>
>      The COPYING file in libarchive had a couple of minor changes to
> clarify which
>      files are under which copyrights but the overall license is unaffected.
>
>      Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
>      Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>      (cherry picked from commit 4976382011106b9515e44359f2f6bb1d0c69fdb3)
>
> Please consider those for next krogoth pull request.
>
> Thanks in advance,
>


