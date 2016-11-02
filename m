Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0718C71A25
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 10:58:43 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id q130so13121818qke.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 03:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lOwhN28n0B+wQk3QV66rVhigo8VGXoJuX5/t33GaTj4=;
	b=X8R2pXkXfQrTXUDuamJRHE5ttaquxxGbuoR2fcXRqo8a2aOI8Vx8V/Q4qlPn0YQ3L5
	QOCNRPr1ekd7XZwhOYOlfYC+sJMutez+HLir7byuWaZ1xS5B1Q4G+IlD9vRYnK51cTIT
	U3SbQ04Z2cnejG3UyDlf6L4v/r7DIDDFRzisS7aqa/nqNnr5E2/6TipG+DsaYYpFnB+q
	yoG3dxb1UT7F70fBN+nGYncLUSpIdpqkV6gUYVVzFKBBtDZBM3eVLskbOlJRmaVZtw4x
	Msywck5+jO1FrKy3Lv1sgq4YuyALiLjmkpRhqCNY6IGm5gdEFRfaRYilUq7s2EbYnlbE
	eQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lOwhN28n0B+wQk3QV66rVhigo8VGXoJuX5/t33GaTj4=;
	b=VI1eM0V3eX4qgSZGcyKtHNoGYoDN+SnAOF20diEAuiRVHwb8ryFU8FrEfmqPtVDoz+
	XtAly2lu1D8lUFe3e6zrHNx9rd7wjAKbVX3jpFGQ6scnZXVGTp26zODxhJDDkbUTfM8U
	HD73WhuD/D3zTeILH8XVNAbW/hjhR4pZQiiNWXlNIMVnB1HENxqrvBCyQbOYuxLsipqc
	wcQASZdM0px0WoMJSYYV2e+FcXCXPGnF+DPULw7DY5L49FDgn0QqAhpNWUdcIkQNoEiS
	oVX0UnGWtIMOtJLFqBKWbyjtGYP4/YdFHlSC4NXsF2L3vj04jATfQKIJ+E11TUjjLaqn
	EKLg==
X-Gm-Message-State: ABUngvdELP/qXm7m96GXI43yz77LIb4jX2DSahjDWLdVVlDVNHZYnqtR7XDP2p8t2Ys0kRQGrGN+Enk2PhkJ3NNV
X-Received: by 10.55.8.20 with SMTP id 20mr2703638qki.3.1478084324792; Wed, 02
	Nov 2016 03:58:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Wed, 2 Nov 2016 03:58:24 -0700 (PDT)
In-Reply-To: <11200184.2dbvXmKaFJ@peggleto-mobl.ger.corp.intel.com>
References: <1478012813-7913-1-git-send-email-ross.burton@intel.com>
	<1478012813-7913-2-git-send-email-ross.burton@intel.com>
	<11200184.2dbvXmKaFJ@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 2 Nov 2016 10:58:24 +0000
Message-ID: <CAJTo0Lakd2n=pMS70B4ULo2t--a3r1uyHP-XsooGad_kOK=Tzg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] shadow: add nologin.8 to alternatives
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
X-List-Received-Date: Wed, 02 Nov 2016 10:58:44 -0000
Content-Type: multipart/alternative; boundary=001a114c9d6020b03905404f530b

--001a114c9d6020b03905404f530b
Content-Type: text/plain; charset=UTF-8

On 2 November 2016 at 02:50, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Missing commit message. Probably the most important thing to include would
> be
> which other recipe packages the same named binary.
>

Fixed in git, thanks.  I meant to go back and fill this in...

Ross

--001a114c9d6020b03905404f530b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 2 November 2016 at 02:50, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":ln" class=3D"a3s aXjCH m15822f2c46c079a5">Missing commit message. Prob=
ably the most important thing to include would be<br>
which other recipe packages the same named binary.<br></div></blockquote></=
div><br>Fixed in git, thanks.=C2=A0 I meant to go back and fill this in...<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a114c9d6020b03905404f530b--
