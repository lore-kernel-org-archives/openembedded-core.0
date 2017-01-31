Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id A6F9571CA7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 07:09:08 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id x1so119732825lff.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 23:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=LkasCg1mxrZjbaLFZ7G/IC19m1CncBoIObKZPWQ2WBM=;
	b=zNRelr/bVHMxMqxs/bFaS/cAgc0etSZ2EE0dSw5lyUAYdA3hNC5msfXdae/OPPYWGU
	JHsrnYgR4qVh3EAqYgbX27qJIPIYfkBfwyYdLW0a7sK4FM0GDKRHqtcYtSZWOlZ1JlAF
	EZM1uuUPiEToP5rmrMnOmSGLAA1vwzFCmMZ8JUXZTm+yB10nFv4lCnokQK+tqOWilrId
	sAbPo9Tzxxze+jiA71FXFPFVfcku9ajjtN62aWTLf/ccXEY+7EDHSI4UZG96PdfmICMj
	09eEnWrs4Ha1zY7qsuc8cVOZJO1KhqKzUkm3WylA+nhIWArexX6sGEV61YSwtJKFfEVD
	kz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=LkasCg1mxrZjbaLFZ7G/IC19m1CncBoIObKZPWQ2WBM=;
	b=mJWf03wEwbfvtk12aq5CgAkbPTzZ9l7NqxUOWjQliezkzMDaJiE3aj4LjTIeYdJvqr
	ei/by+IfryezfCYiiyUrsbq+NyQsyW55NRW7wXmH0E6fCtbJ9b4MWBOkhvV1ERJsfeqo
	WzSXob6/pzandkH621EiS0TJPUYicEuY36TO+44Tyld3AnpT4uhdHiWJ910X/PSIdJKO
	bxeYraRsA1jtP8ztbfVgs/T51RlqNeK2DpUlScmTo5Ok9Y0z0vMPklndXHfxTWgv2/sm
	PP0z/rAdLA6vSzntQ5DvxU1nVoWUkUz4kmCr7PgR/tMpSUvBgw+semOZEdxkmOyzRlcx
	adOg==
X-Gm-Message-State: AIkVDXJXvdBqSVDKokuqaWyW+GdQAd3RA/NWNKuJkyL/fnp1wAXwDVmegl+TsnoPYmVs6g==
X-Received: by 10.25.10.6 with SMTP id 6mr8661838lfk.88.1485846548217;
	Mon, 30 Jan 2017 23:09:08 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id r9sm1416706ljd.14.2017.01.30.23.09.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 30 Jan 2017 23:09:07 -0800 (PST)
Date: Tue, 31 Jan 2017 08:09:05 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170131070905.6ari3rqvni3vl73u@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1485505680.git.anders@chargestorm.se>
	<20170127092329.4462.45493@do.openembedded.org>
	<20170127094032.zpdy3uaohktwcgqk@ad.chargestorm.se>
	<04ba7ca8-b4ad-9ccb-656d-654da5c710b4@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <04ba7ca8-b4ad-9ccb-656d-654da5c710b4@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFB5dGhvbjMgcGFja2FnaW5nIGZpeGVz?=
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
X-List-Received-Date: Tue, 31 Jan 2017 07:09:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com> [170130 16:00]:



> On 01/27/2017 03:40 AM, Anders Darander wrote:
> > Hi,

> > * Patchwork <patchwork@patchwork.openembedded.org> [170127 10:23]:

> > > Series: Python3 packaging fixes
> > > Revision: 1
> > > URL   : https://patchwork.openembedded.org/series/5024/
> > > State : failure
> > > * Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> > >    Suggested fix    Rebase your series on top of targeted branch
> > >    Targeted branch  master (currently at a99cca0e8e)
> > This is likely due to issues with the email-patches. One of the patches,
> > 0003, has a line > 998 characters (one line in the patch context, ie not
> > modified by me).

> Anders, I do not think the problem is the patch format because git-am does
> not complain at this stage. This is what I am getting when either git-am or
> git-apply

Have you tried pulling it directly from github?

I can assure you, that the series was created on top of the current
master when it was sent, and when patchwork complained about it.

> git pw mbox 5024 | git am
> Applying: python-3-manifest: fix adding imp to importlib
> Applying: python3-manifest: move htlm.py to python3-html
> Applying: python-3-manifest: add argparse to RDEPENDS for netclient
> error: patch failed:
> meta/recipes-devtools/python/python-3.5-manifest.inc:154
> error: meta/recipes-devtools/python/python-3.5-manifest.inc: patch does not
> apply
> Patch failed at 0003 python-3-manifest: add argparse to RDEPENDS for
> netclient
> The copy of the patch that failed is found in:
>    /home/lsandov1/repos/openembedded-core/.git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> lsandov1@lsandov1-mobl2:~/repos/openembedded-core$ git am --abort

Sure, I get the same error, 

git am ~/Downloads/Python3-packaging-fixes.mbox
Applying: python-3-manifest: fix adding imp to importlib
Applying: python3-manifest: move htlm.py to python3-html
Applying: python-3-manifest: add argparse to RDEPENDS for netclient
error: patch failed:
meta/recipes-devtools/python/python-3.5-manifest.inc:154
error: meta/recipes-devtools/python/python-3.5-manifest.inc: patch does
not apply
Patch failed at 0003 python-3-manifest: add argparse to RDEPENDS for
netclient
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

However, the issue is a broken line in the 3rd patch.

If I instead do:

git checkout a99cca0e8ee15f7b542986d89b70054ac7cb24be
git merge --ff-only github/python-splitting

It works OK, (which was the master of the time at sending).

However, today it doesn't apply cleanly, thus I'm sending 2nd version.
(Though, I'm sure that patchwork will complain again)...

Hope you'll have better luck applying the 2nd version.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

