Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 78CDA606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:46:14 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id j124so28137877ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rpAxxDuAfZN1OKGtEyWKmERQpRsMJtvYYuAlRCNf79o=;
	b=eX7obG8yCT4aSgbtNY5hgZUg6fImsbHtCJvhQljE2IW934nqv/GhCmj+4XSmA+awgX
	ieMsvjX8kxGWMgZY1vzF0ax+mvexrCtVuCKqD1CwMPwljJzKhbItQ06kl1yKS6C/kdXZ
	z+m16r6mTlQ0o54mH3SFpzhjVFRm+v31HpjtU9kksj5Uk0xHOf3jVJ9AEABpsJ2on4Oj
	+aKvdlmul9NA8nbuzoxjGSlZv1ZoQVfUJ+o8fpn1ZXpayuPWalhlnvnR6TuPVMAasGH/
	sH2sO23+w3Ty6mih3Pj/0FopUUGrmyBoDnBUtmM0ZE6QG4L5HQchoOhHEz6k6fjOAVHy
	1rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rpAxxDuAfZN1OKGtEyWKmERQpRsMJtvYYuAlRCNf79o=;
	b=V4yFnURGAcDXP2+b6PqlzpWJukG30sPZfSrxcanMKogzvmPECx2iWMeuq1SxD6SR3Q
	je65pyNvz8tocoDyXP57e1+XbrySBVROGufMFmKxOtafjjxZLmkwqzaCK+NM3uhdKDjq
	PdwKxFxOI7RHVtdHa8P34+VBK0hBSrjb+legGSplqmh03sg6nutGlGHRFJs1/xXProrZ
	OyZOS/l4yYfutCqQE46ye3Mpxyeanq5s6gLgfohWI/SvMrNiiwrdBPZnVRJlmyg8m8XP
	tbaGnRfQdgwlAokZtQLALo13c/n402W8FnOG/3voxm8zBa2hYpcFwyGLP1zhh6rsvSxF
	Z2vQ==
X-Gm-Message-State: AEkoouuAvIccoi9+LTsfNZzqq15PWwptYzdKyu9n1xSUsVX0ye1ou9YTGKV/lrXTSTzyUrHieipdhXNAu+6a9hft
X-Received: by 10.36.57.211 with SMTP id l202mr63825ita.22.1469130375622; Thu,
	21 Jul 2016 12:46:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 21 Jul 2016 12:45:56 -0700 (PDT)
In-Reply-To: <1468599986-26072-1-git-send-email-clemens.lang@bmw-carit.de>
References: <1468599986-26072-1-git-send-email-clemens.lang@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jul 2016 20:45:56 +0100
Message-ID: <CAJTo0Lb=OdKYCog2jMW=r6XWNFkyHv7VB0ho4ndDOt=V1NDYyA@mail.gmail.com>
To: Clemens Lang <clemens.lang@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/path: Fix tar invocation with --no-recursion
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
X-List-Received-Date: Thu, 21 Jul 2016 19:46:16 -0000
Content-Type: multipart/alternative; boundary=001a114ab3ca2b3f3a05382a9247

--001a114ab3ca2b3f3a05382a9247
Content-Type: text/plain; charset=UTF-8

Hi Clemens,

On 15 July 2016 at 17:26, Clemens Lang <clemens.lang@bmw-carit.de> wrote:

> -        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
> --files-from - --no-recursion | tar -xf - -C %s' % (src, src, dst)
> +        cmd = 'cd %s; find . -type d -print | tar -cf - -C %s -p
> --no-recursion --files-from - | tar -xf - -C %s' % (src, src, dst)
>

I applied this manually as it's just a one-liner, but please do try to send
a patch based on master (the commit which caused this patch to not apply
was a week old when this was sent).

Ross

--001a114ab3ca2b3f3a05382a9247
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Hi Clemens,</div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On 15 July 2016 at 17:26, Cleme=
ns Lang <span dir=3D"ltr">&lt;<a href=3D"mailto:clemens.lang@bmw-carit.de" =
target=3D"_blank">clemens.lang@bmw-carit.de</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex"><div id=3D":5w4" class=3D"a3s aXjCH m155ef66fa597d=
8ee">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;cd %s; find . -type d -print=
 | tar -cf - -C %s -p --files-from - --no-recursion | tar -xf - -C %s&#39; =
% (src, src, dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &#39;cd %s; find . -type d -print | ta=
r -cf - -C %s -p --no-recursion --files-from - | tar -xf - -C %s&#39; % (sr=
c, src, dst)</div></blockquote></div><br>I applied this manually as it&#39;=
s just a one-liner, but please do try to send a patch based on master (the =
commit which caused this patch to not apply was a week old when this was se=
nt).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a114ab3ca2b3f3a05382a9247--
