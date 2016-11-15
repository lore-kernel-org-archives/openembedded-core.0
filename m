Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 27CA371A03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:18:56 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id x190so130922706qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 03:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ARF+VGES2l1gHhjmdYPr04Jh7jrJQBXayep8nC6A9zY=;
	b=dQYdVd6hjUrmfeWLvWf8CizUm2VSDmUu2iIauyU6B0NkWrc0F9ovW44td073kiuC9S
	/7cdLxBRD3/fOni+R+Me9XgdFPjmsLjSFLrZbdqC/6ISgzIwePLoBjHoM5mPb5OP/Zqx
	uzNZDO+aPgHe0uJ/wjrTUQHhtrxO2I8arq0+SJMTMrjpCDijNXG1ANCspxAvvjTt+mRf
	Mz2Z+xkVpJYXv1pVDrA2Dv0tOlsfD7mmkp05Crt71CgFOJCJJQJcxY6uSC94lp4ubCD1
	ZT3igpEHCutCOizn0qf1l/FBXGCDhYdRCLkXfwEfO7KwGqhSXcQGqRXPIKuePlgwCrYN
	oEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ARF+VGES2l1gHhjmdYPr04Jh7jrJQBXayep8nC6A9zY=;
	b=hc63y3ZN10O1tYICsR9NBIX5JRB/T3dyrSB9aOSys6UQFJtxufvGbN5kyBLqdhINhG
	QbH36/sXgSu++6fp+egVXC3MaJ3qsM+m4gEPH0EVYlvmexkDop7Vrx/YiVXbvCsqS186
	bMu6Q4schpOiBaVCEcdwFpioISyGhwUhyH8RjguMGRwLvqPBw/OKPbUoPCKbW+ZO899W
	uPuU3NIj/sw3IYBog7wJtXkn62beI1EtEkv9p1b5x2u2KkH627k085W5vmuuNHUnrZQM
	wQk3oNefxPBNUPJiOzp4TGYr/kf06oftusK4KX6SBeX/rSii456GYbQFV3nEG3ciMH6R
	ciBA==
X-Gm-Message-State: ABUngvehGCMbE+Cqwey7TY+JlCTRv8wyOQbJO3YD4526R/kIDHti+FLhXdrDT8V0lsNHSum1hqBrdfH53+tlFPH6
X-Received: by 10.55.75.17 with SMTP id y17mr21658456qka.26.1479208737878;
	Tue, 15 Nov 2016 03:18:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 15 Nov 2016 03:18:37 -0800 (PST)
In-Reply-To: <1479208109-20859-1-git-send-email-diego.ml@zoho.com>
References: <1479208109-20859-1-git-send-email-diego.ml@zoho.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Nov 2016 11:18:37 +0000
Message-ID: <CAJTo0LYb35C9dy1+Bj_BRL8_gvvtrqcPxiA-cPe8-T5cj7ZeQA@mail.gmail.com>
To: Diego Rondini <diego.ml@zoho.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] xinput-calibrator: use up-to-date git version
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
X-List-Received-Date: Tue, 15 Nov 2016 11:18:57 -0000
Content-Type: multipart/alternative; boundary=001a114a88c85ecf480541551fd1

--001a114a88c85ecf480541551fd1
Content-Type: text/plain; charset=UTF-8

On 15 November 2016 at 11:08, Diego Rondini <diego.ml@zoho.com> wrote:

> Use up-to-date version from git. While currently there aren't official
> releases
> newer than 0.7.5, quite some new features have been added in git, for
> example
> the ability to disable the calibration screen timeout.
>

buildhistory-diff in my local automated testing says:

packages/corei7-64-poky-linux/xinput-calibrator/xinput-calibrator:
RDEPENDS: removed "libxrandr (['>= 1.5.1'])"

https://github.com/tias/xinput_calibrator/blob/master/configure.ac#L72
shows that xinput-calibrator has an automatic dependency on xrandr.  We
build and ship this, and I can't see any downside to using it, so this
should be in DEPENDS so the build is deterministic.

Ross

--001a114a88c85ecf480541551fd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 November 2016 at 11:08, Diego Rondini <span dir=3D"ltr">&lt;<a href=
=3D"mailto:diego.ml@zoho.com" target=3D"_blank">diego.ml@zoho.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D"gmail-:51w" class=3D"gmail-a3s =
gmail-aXjCH gmail-m15867a84aec1d8ce">Use up-to-date version from git. While=
 currently there aren&#39;t official releases<br>
newer than 0.7.5, quite some new features have been added in git, for examp=
le<br>
the ability to disable the calibration screen timeout.<br></div></blockquot=
e></div><div class=3D"gmail_extra"><br></div>buildhistory-diff in my local =
automated testing says:</div><div class=3D"gmail_extra"><br>packages/corei7=
-64-poky-linux/xinput-calibrator/xinput-calibrator: RDEPENDS: removed &quot=
;libxrandr ([&#39;&gt;=3D 1.5.1&#39;])&quot;<br></div><div class=3D"gmail_e=
xtra"><br></div><div class=3D"gmail_extra"><a href=3D"https://github.com/ti=
as/xinput_calibrator/blob/master/configure.ac#L72">https://github.com/tias/=
xinput_calibrator/blob/master/configure.ac#L72</a> shows that xinput-calibr=
ator has an automatic dependency on xrandr.=C2=A0 We build and ship this, a=
nd I can&#39;t see any downside to using it, so this should be in DEPENDS s=
o the build is deterministic.<br></div><div class=3D"gmail_extra"><br></div=
><div class=3D"gmail_extra">Ross</div><div class=3D"gmail_extra"><br></div>=
</div>

--001a114a88c85ecf480541551fd1--
