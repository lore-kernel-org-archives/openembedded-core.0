Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0A560232
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 10:26:44 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id y9so20599934igg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 03:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=BNbPFyLSEmImdQxvJ5F3pE9C5EwBj9jt4s6We+t2WUg=;
	b=Cai/heTCYpzQJH0qCI4T4qtM8L5l8QAf5nxRt/eeSzAbWpN7U3KsQ8rlw57UpPX3ZO
	2PJZPb8ZugNPMFcXmkgKb7o3FDSTNt5K3tBJ8JcnV16nur7uySQ0zoqjolthM9yaM56S
	9TmrN62K8fAVw5GHz2C4pWL2HgyoLSi7ga+v3ePbwfzL7bKAik7SWMaB++qnlnj+P/OF
	MiEqaDt/9uAuvj22duuVKHVfcBUc1NuPETHVODkSHCu6b5+C6Eq08RgV9gkxKsRCd6ep
	E49s4rH6pWrGg1x3ziyJyQd4RWbmEqsYNYZUFQGqoIKFyAmo8FjoNTguhU/1QK62b3PX
	qg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=BNbPFyLSEmImdQxvJ5F3pE9C5EwBj9jt4s6We+t2WUg=;
	b=XV2LTdeOSagMWR09CQo2aw8TSkC4bVBO3rgsx72++7J+V4izo+jL0FuA5xF1Y9IiSx
	S2N/OC4fimsOERGKr3ehS1+fCOpkJ6Ioc8iBCaR8QlC8vFTbGXvQtaUG5Llu78wr2kuJ
	un/WmzG4khcBtE1I3UCJRbo+HxaGgpsz0opGHB36K0G1cnLrQSW5uWGlo2jSCCMzz8v5
	z33F1fZ02jBYW2gFxQ8AOP8X5KXBTD0mYvVnV78/ucLo2uQFEfAqGMtG6ohGFdhyJwUP
	siQrXZAM193X9OiUhik4HSZ9MBrOy4DoF1ZB/J52vbp7Zrxo87jyXg3gF5viZFZrE2rP
	Wmpg==
X-Gm-Message-State: AOPr4FWCa5OTya/xsaSxdYLUPrt3BVAvI6J9/QdjBDM9QeBaqiCtolWG81Wu53hu9wDvktY+8deMw+ah1fmGJI2U
X-Received: by 10.50.78.8 with SMTP id x8mr18608894igw.78.1460975205539; Mon,
	18 Apr 2016 03:26:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.132.24 with HTTP; Mon, 18 Apr 2016 03:26:26 -0700 (PDT)
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Apr 2016 11:26:26 +0100
Message-ID: <CAJTo0LZtDL-hbxXmYWdgf7HTZtSA4D2FgRKtx1+n6Rqxq50n=g@mail.gmail.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: bugzilla.yoctoproject.org policy for bugs against multiple releases
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
X-List-Received-Date: Mon, 18 Apr 2016 10:26:45 -0000
Content-Type: multipart/alternative; boundary=089e01183a4c274bd50530bfcc30

--089e01183a4c274bd50530bfcc30
Content-Type: text/plain; charset=UTF-8

Hi,

At the moment we don't really have a policy for oe-core bugs in
bugzilla.yoctoproject.org that apply to multiple releases, for example
https://bugzilla.yoctoproject.org/show_bug.cgi?id=9400.  This is a CVE bug
that should be fixed in all supported branches, and indeed Sona has sent
patches for Fido/Dizzy/Jethro/master.  Of course now we've got to track
where these patches are in the submission process and ensure that we don't
drop any of these, but bugzilla only has a single target milestone for each
bug.

I propose that for bugs such as this we file a bug report for master and
then clone it (there's a Clone This Bug button at the bottom) for each
stable release that is affected.  Then each bug can have it's own target
milestone set and we can be sure that the patches don't get left out of
being merged and that QA can effectively verify each branch.

Any objection or feedback? (the first person to suggest moving to Jira gets
to manually review all CVEs from CVE-1999-0001 onwards are fixed in
krogoth).

Ross

--089e01183a4c274bd50530bfcc30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>At the moment we don&#39;t really h=
ave a policy for oe-core bugs in <a href=3D"http://bugzilla.yoctoproject.or=
g">bugzilla.yoctoproject.org</a> that apply to multiple releases, for examp=
le=C2=A0<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9400=
">https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D9400</a>.=C2=A0 This =
is a CVE bug that should be fixed in all supported branches, and indeed Son=
a has sent patches for Fido/Dizzy/Jethro/master.=C2=A0 Of course now we&#39=
;ve got to track where these patches are in the submission process and ensu=
re that we don&#39;t drop any of these, but bugzilla only has a single targ=
et milestone for each bug.</div><div><br></div><div>I propose that for bugs=
 such as this we file a bug report for master and then clone it (there&#39;=
s a Clone This Bug button at the bottom) for each stable release that is af=
fected.=C2=A0 Then each bug can have it&#39;s own target milestone set and =
we can be sure that the patches don&#39;t get left out of being merged and =
that QA can effectively verify each branch.</div><div><br></div><div>Any ob=
jection or feedback? (the first person to suggest moving to Jira gets to ma=
nually review all CVEs from CVE-1999-0001 onwards are fixed in krogoth).</d=
iv><div><br></div><div>Ross</div></div>

--089e01183a4c274bd50530bfcc30--
