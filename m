Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 86F9F7687B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 09:24:54 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id n128so3180974ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2016 02:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Pvp9eL6tjhSf98SVNI6lCCUi+TIVU9Q2wQ7xAxEyWK8=;
	b=fVrbla5QLHDUqLhuYp7q72a5oxMEp6NtwNj73mYrCVcnoF404zWzjFZs4QMTF+CLtw
	DsG/Pzhx5vvKzrVCf4lxScafCOgrIqDKTIVAau6qdsU76R1Yz1VDle7vPmFOoK3/g8N5
	5DTVRhCTU2OmGAFO9CdK+Lb5CleHKDFtad5KOe5TB3Avbdj/Du2J6Q4064hVGujL0cnd
	+4KeUZ5ByFIXyscwNrddh9FRiS+ANuepAe81E5SWv/690DH4GlFRl7WCTBMcCKkofPe2
	lGfhoAEdOliSO/Qnv1sLgUNzm794g8uIW5z9vPZRoTnX6gcTZphqoFV/HGcE24s4ex0y
	el/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Pvp9eL6tjhSf98SVNI6lCCUi+TIVU9Q2wQ7xAxEyWK8=;
	b=NQ3gedFXcovLlFUoF1n3dGw14cKTSICqTG87UunWHth7qwNk8lMmQX3C9r7TuwZeUS
	aAF3kfJ+2y4cKwvEZEIbHrfrpy/nR8kN+wil4EZLuGGyKKsmeIpT54jYEaJ+J68vIhfx
	3zaurGmOKLoyQIR7SkJWL50tyZQGhTawAm8t4rXMs6tRn8RrPAl6A2JK4yGKkhUFfSRj
	L8vI198H7VY8z2y/oVjbeNlSPLlnnT1t5UXRNJqaELSxpoBPF706Trw3i8uvtyf1V6wu
	R+bIQIeUlLtkNyKLitr9SdoPjRjQf0M8dbzfNfFXc45pnkZI29LOnjX/VLxwmAhuTrsE
	WPVQ==
X-Gm-Message-State: AEkooutLM5txSfzJ9K6EA7KeLMI4c6X/FhCKT7pmA2ZkaxwTs1eXxUVa0KL2bw+SGlIuPpFCkBOTrtN1nOdmewQy
X-Received: by 10.36.57.211 with SMTP id l202mr12991815ita.22.1471253095588;
	Mon, 15 Aug 2016 02:24:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 15 Aug 2016 02:24:35 -0700 (PDT)
In-Reply-To: <ddcae3ee-b5a1-c9b8-b53d-50a4001f3eeb@mender.io>
References: <1469001221-26502-1-git-send-email-kristian.amlie@mender.io>
	<CAJTo0LbW8c7V=5vHXML8srwVgzacqGJp2o0M4OOReVE42DnW0g@mail.gmail.com>
	<ddcae3ee-b5a1-c9b8-b53d-50a4001f3eeb@mender.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Aug 2016 10:24:35 +0100
Message-ID: <CAJTo0LbauTnzYsW=fVkM5zG4BqsYShDhwr0=d5HNX=XPSi8zFw@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [krogoth] systemd network service fails to start on boot
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
X-List-Received-Date: Mon, 15 Aug 2016 09:24:55 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca233b41053a18ce09

--001a114ab3ca233b41053a18ce09
Content-Type: text/plain; charset=UTF-8

On 15 August 2016 at 07:38, Kristian Amlie <kristian.amlie@mender.io> wrote:

> So, I did what you asked. Is there anything else missing?
>

No, just wait for the krogoth maintainer to pick up the patches.

Ross

--001a114ab3ca233b41053a18ce09
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 August 2016 at 07:38, Kristian Amlie <span dir=3D"ltr">&lt;<a href=3D=
"mailto:kristian.amlie@mender.io" target=3D"_blank">kristian.amlie@mender.i=
o</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1pn" =
class=3D"a3s aXjCH m1568ced10f328251">So, I did what you asked. Is there an=
ything else missing?<br></div></blockquote><div><br></div><div>No, just wai=
t for the krogoth maintainer to pick up the patches.</div><div><br></div><d=
iv>Ross=C2=A0</div></div><br></div></div>

--001a114ab3ca233b41053a18ce09--
