Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id DFBCC731D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 16:48:30 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id hb3so80750295igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 08:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GYTSzTcARF9dHj2aRtRl8CHgrGTNEd1vTVnbfAOTUgA=;
	b=Oz+ZA45p4lfj4fbfRlfK4csnVH+qNkwuNsqqslTA/iZUokr+coRJEC5aw1XgPkgsRw
	2LVe2byk4hpZ0W/H+F1q83TIsYZDOFqTmodX3ANfvKvef7nr7vJ5RWpnnKBLS0hPjNXa
	zxIL8SLIC4KPL1KWCxazvopOGxy67f/OWn/SFoMqzpD257NfIoa45Hws7MZ7Uyyi8h/N
	z+5X41XtQbDvGv9AKx2D4iuGudNrIxAw4Wqi10Xh1lGUqJs30EZuYGn9RtNVfO+q4CTk
	SMe8ITQIX38ZvGJqHszJyTqmmzJ8uVYXUKeUR0XkZ51HPNKtbd12CynbG5YqnDk4ytCi
	dsfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GYTSzTcARF9dHj2aRtRl8CHgrGTNEd1vTVnbfAOTUgA=;
	b=R8gLR3+vtpcXOztpuXpIY1ES16lRSHu2N3AjSAPjKC9bSVs8Gl3VR2uimy5wZZhf3t
	4nY9YmAQ+qOwh6sxkNO9D/bFa7EsPuNXnPxRMIwN5en+B3RzjEYnTvG4BxijOUbaX3W9
	wYqKqwfQH7ttBG3YWSwMglxdVFz+1EWG1yZaA49qZsXfDoegk2+vF3ECePpPOddQvxJx
	H2p1rq7zSDJ1ERCrZHB8srRN3P8VJykR/RL1bc2hy8Q/lATYLSmFfNRADOKJJa+xy46O
	ag3/8TbTHxy3gN1ydfKEkJBfM29d3HbXczscLuk8SaEb9lBUR5mTIBufe2nReo5eU9x4
	tysg==
X-Gm-Message-State: AG10YORHOhDSfQKkxBTMlQEGy1naas3FMAaUYic7VQL/u4gsFzxkHpuVXJ3sg+bhoDrNqAfuMSf3BU4rTCfvlK5U
X-Received: by 10.50.66.238 with SMTP id i14mr10196635igt.52.1456159711133;
	Mon, 22 Feb 2016 08:48:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 22 Feb 2016 08:48:11 -0800 (PST)
In-Reply-To: <56CB3949.5030804@linux.intel.com>
References: <cover.1456153260.git.anibal.limon@linux.intel.com>
	<99d32b8b8e7d0422dfa5f89a30e86668d88ef77f.1456153260.git.anibal.limon@linux.intel.com>
	<56CB2F1D.4050605@linux.intel.com> <56CB32C1.9040308@linux.intel.com>
	<56CB35E8.6060301@linux.intel.com> <56CB3949.5030804@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Feb 2016 16:48:11 +0000
Message-ID: <CAJTo0LZ+onCXJXw74VJSJkaOGdYi=qwBeXCnBtz0jvkpdrybJQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] classes/testsdk: Move the removal of bitbake PATH to eSDK context only
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
X-List-Received-Date: Mon, 22 Feb 2016 16:48:31 -0000
Content-Type: multipart/alternative; boundary=047d7bdc109c519ed6052c5e9a69

--047d7bdc109c519ed6052c5e9a69
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 February 2016 at 16:37, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.in=
tel.com>
wrote:

> I agree with you to modify avoid_paths_in_environ for return the new
> PATH variable is better than only modify it internally but for
> simplicity i will maintain the os.environ['PATH'] set/restore instead of
> generate the environment line.
>

Totally agree with Randy here for what it's worth.  The environment-munging
code in avoid_paths... should return the strings instead of manipulating
the current environment so the caller has the choice whether to modify the
current environment or pass a new environment to subprocess.  And in
general I'd say that passing modified environments to subprocess is a
cleaner solution as it means that there's no way cleanup can fail to
happen.  Whilst that's just a try/except now, the code could get copied and
extended and end up with codepaths that don't hit the right cleanup.  By
having an explicit environment passed in, this isn't possible.

Ross

--047d7bdc109c519ed6052c5e9a69
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 February 2016 at 16:37, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;=
<a href=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.li=
mon@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div style=3D"overflow:hidden">I agree with you to modify avoid_paths_in_e=
nviron for return the new<br>
PATH variable is better than only modify it internally but for<br>
simplicity i will maintain the os.environ[&#39;PATH&#39;] set/restore inste=
ad of<br>
generate the environment line.<br>
<div></div></div></blockquote></div><br>Totally agree with Randy here for w=
hat it&#39;s worth.=C2=A0 The environment-munging code in avoid_paths... sh=
ould return the strings instead of manipulating the current environment so =
the caller has the choice whether to modify the current environment or pass=
 a new environment to subprocess.=C2=A0 And in general I&#39;d say that pas=
sing modified environments to subprocess is a cleaner solution as it means =
that there&#39;s no way cleanup can fail to happen.=C2=A0 Whilst that&#39;s=
 just a try/except now, the code could get copied and extended and end up w=
ith codepaths that don&#39;t hit the right cleanup.=C2=A0 By having an expl=
icit environment passed in, this isn&#39;t possible.</div><div class=3D"gma=
il_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc109c519ed6052c5e9a69--
