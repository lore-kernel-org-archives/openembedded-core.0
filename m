Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 58666730C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 16:49:44 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id y76so31818061qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Mar 2017 08:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6qCfv/uXjK2HPKuqRXAMZsH+STEbtefzo/3Um8nDXGs=;
	b=i3N/tGQcrxL+qEa1OFCGcBj4TtMVMpqg+kEqfnHUJM8dqcEcFsAssePTuYQPS4Qnnm
	bwmdk8YUYsUa6Qm884YUZztfAUPOCVX447+oMKzqMnGazmkG4Q2Yvu0ffwbaNHlf5oU2
	js66B1UkEg1SaP1NbiaFikjrQ01qODwZKCbZ72T31++sz3ZlUpqOD/Cn6Sbj8NjdVutA
	mpzDyP03hmnXFhFzqUS74vxRgzJXJYQ6YHptHWP9VZl5T6g1viWW3DgfWf1KSiY1PLQV
	yel5ennv/6muM7QmXZiR1S9ru3SNEnvDxC2KcbXuU+nfEMo8JIPi/SJ6D0sMsxPSr97z
	JdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6qCfv/uXjK2HPKuqRXAMZsH+STEbtefzo/3Um8nDXGs=;
	b=VUL1konR2Z+MIpJxMRf2R1UmzhNne32aDFaNO69mJyeQdHsPUvcQyEebNoa5yoKL9g
	8oIUtvYDtQhTB18mpQ0bUJMzLwfFq+ps18sB7SmkYxG+Yuhp2lOdo8lCMq76Ts8ovCM1
	MGGParwSDGcNpDniT5j6e8rv5H863fPvvFG9Q0VbEyCK3mSRakFtjL2AS7ZWMbnH4/VR
	o34sjyTCTC05U9Aj4XEZO5aByn4r+e83KCfycOF84vOtleLUg0or/RERHrCmfkCvstBd
	CoavODFpL424AnJ9tXZBRHG3ZpuNhoOVEnqYOhh4wh6K7fB4gKXstbeg/mchRw7O/AvP
	Hyfg==
X-Gm-Message-State: AMke39kXlvyq3fhUmuwM6FnoYkZu+YQbdVa1FLq46/BM5Z3SQrp01sPNs9AN/bYjQhpgREMzwjW6yBJ93BYNJX3u
X-Received: by 10.55.175.195 with SMTP id y186mr15972718qke.26.1488818986205; 
	Mon, 06 Mar 2017 08:49:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.22.166 with HTTP; Mon, 6 Mar 2017 08:49:25 -0800 (PST)
In-Reply-To: <1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
References: <CAJTo0LaafDCfjH_cCHJDx0BCeZxVi7DPv3Cw_QdXvqYD+ehseA@mail.gmail.com>
	<1488814260-8668-1-git-send-email-ed.bartosh@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 6 Mar 2017 16:49:25 +0000
Message-ID: <CAJTo0LY7pOtUWsbCJQ8_4A=Bxws04Sdfr1M-59fa6K5gdqJk-Q@mail.gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] sstate.bbclass: update .siginfo atime
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
X-List-Received-Date: Mon, 06 Mar 2017 16:49:45 -0000
Content-Type: multipart/alternative; boundary=94eb2c06093cced898054a12aee5

--94eb2c06093cced898054a12aee5
Content-Type: text/plain; charset=UTF-8

On 6 March 2017 at 15:31, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> +       [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
>

$ ( [ -h / ] && echo something ); echo $?
1

If the -h fails then this is still going to cause sstate_unpack_package to
trap.

Ross

--94eb2c06093cced898054a12aee5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 March 2017 at 15:31, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);=
border-left-style:solid;padding-left:1ex"><span class=3D"gmail-">+=C2=A0 =
=C2=A0 =C2=A0 =C2=A0[ -h ${SSTATE_PKG}.siginfo ] &amp;&amp; touch -a ${SSTA=
TE_PKG}.siginfo<br></span></blockquote></div><br><div class=3D"gmail_extra"=
>$ ( [ -h / ] &amp;&amp; echo something ); echo $?</div><div class=3D"gmail=
_extra">1</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">If the -h fails then this is still going to cause sstate_unpack_package=
 to trap.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div></div>

--94eb2c06093cced898054a12aee5--
