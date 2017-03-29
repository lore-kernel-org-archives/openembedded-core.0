Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6101F77BF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:38:40 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id e75so86282507itd.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=yFeCwD9Vfbwlu+2Uzlhm7FHxelUi1zFycCklnqXax78=;
	b=qQcNS76EovLl2ePdu5KypTd/Z+LTmw+tCLOfoq39Fcpl1ckNNPsl0a1eyKV6gkYX15
	b4r5yD+B1rM6KVpHIkxFxtrhinCLDrg6y1sDpv7xFpD9gMaZ4d8qkO0wy0anBR9ZwwxR
	NQLeuSKH9xGSxgtUC4YvJaa/4ZybQL6t4AZvLgTHJGrHpGu/d8Zxih9GdumC7QRDlVOP
	anfv0ewoLebjmZ1c4jE/fmJ2T5bZSayQGYeRU0wB021uyHxgROHlkLDiYOUzXUifoEdy
	locmWs+y7p0pt2R34Sqzi/66DDbqCZ+5rQDT4M7oGVVVY3tt05XsMv2DgJyBQQEwGrmF
	n5ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=yFeCwD9Vfbwlu+2Uzlhm7FHxelUi1zFycCklnqXax78=;
	b=jCCkVaCNI5kYbxMq6967DTRHAp+FGMNWM13xdt/G8lylNiuG5FUTqIbpA7hh0Npd0V
	zthZTrYen/xz7+nkTrs/SMCR2ZURi4aeitBNiM9fqOlsU+YDOL153AUhv3ksxM1FHZEd
	1izbHeT6B0Qg/ViD7CpZoFWxfVfJIKqU/gFoWNT+dOQTMdYJjicWXngkqA8sn5hQ0N24
	w1Uoy+R7cUWgtUixRY0K9WOPnSf1lTr4prBJbtIJW8Q9vIP2Eudy4kyYRqoovW/aq+Z/
	F4ngUX/nO0vQLox4o1oH0F3gDl6gD7M79lHpG3I2cKPDyB5J68lYRjBXieHG19bNPqqw
	c79g==
X-Gm-Message-State: AFeK/H3DpdfsJ0GglY4msbYC8QYLrHK11sU28wTIL636YHgu6V4pk0hoW8Vo7JscfV0xXDgZ
X-Received: by 10.36.33.68 with SMTP id e65mr258313ita.21.1490780322220;
	Wed, 29 Mar 2017 02:38:42 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D6D7.dip0.t-ipconnect.de. [93.232.214.215])
	by smtp.gmail.com with ESMTPSA id 71sm3468546iof.29.2017.03.29.02.38.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:38:41 -0700 (PDT)
Message-ID: <1490780318.6396.410.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Mar 2017 11:38:38 +0200
In-Reply-To: <20170329091444.GB3298@jama>
References: <20170329072316.GA3298@jama>
	<1490776523.6396.407.camel@intel.com> <20170329091444.GB3298@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-03-27
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
X-List-Received-Date: Wed, 29 Mar 2017 09:38:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-29 at 11:14 +0200, Martin Jansa wrote:
> On Wed, Mar 29, 2017 at 10:35:23AM +0200, Patrick Ohly wrote:
> > On Wed, 2017-03-29 at 09:23 +0200, Martin Jansa wrote:
> > > INFO: jenkins-job.sh-1.8.19 Complete log available at http://logs.nslu2-linux.org/buildlogs/oe/world/pyro/log.report.20170328_014155.log
> > 
> > That used OE-core 552bd78, if I read this right:
> > 
> >         == Tested changes (not included in master yet) - openembedded-core ==
> >         latest upstream commit: 
> >         552bd78 wic: use kernel_dir to find systemd-efi bootloader
> > 
> > >     * openembedded-core/meta/recipes-core/ovmf/ovmf_git.bb:do_compile
> > 
> > http://errors.yoctoproject.org/Errors/Details/135202/
> > 
> > "gcc-ar: not found" - that should have been fixed by OE-core 23a12d87a6
> > "fix toolchain selection", which is included in OE-core 552bd78 and thus
> > should have been included in the build.
> > 
> > However, the error above was "Submitted on: 11/03/17 10:13", which was a
> > while ago and in particular before that fix.
> > 
> > Did ovmf really fail in the latest world build?
> 
> The report shows:
> http://errors.yoctoproject.org/Errors/Build/34933/
> which leads to:
> 
> http://errors.yoctoproject.org/Errors/Details/138261/
> Submitted on: 27/03/17 05:31

Got it. I followed the wrong link at some point.

> So yes it failed again, but this time with different error:
> TOPDIR/tmp-glibc/work/i586-oe-linux/ovmf/git-r0/recipe-sysroot-native/usr/bin/i586-oe-linux/../../libexec/i586-oe-linux/gcc/i586-oe-linux/6.3.0/ld:
> internal error in do_layout, at ../../gold/object.cc:1821

Hmm, internal error in gold. Not sure what to do about that :-/

Can individual recipes choose to be built using the normal ld?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




