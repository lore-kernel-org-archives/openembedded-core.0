Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7759270018
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 14:19:11 +0000 (UTC)
Received: by igcto18 with SMTP id to18so12736986igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 06:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LgvrDutGhWEpTplMGFPjdHBj+GARIaBRHZUSMzhUyug=;
	b=2Iu2G9hSnV0Ch4nbeCwQb+Bfw+KVWNHkIA6CPKW4u3fsUt46CIyQlG9OYOxJFT5tls
	TY3VyZbUMzZH02sN/gRz5FaGkLaMCA/L29JIkdeWebwFrqs2Cs9868Pt3RUfG8EFkDGp
	XUrfd0YuZjARwMAHLz5JdE0qPlu00gScQXpqBQjPliLIg7jXfWY5hlwaHGy74sYBU2Rm
	6eK60jCEP+jBq5LZbRoMlA9Me9rJbu6wHE+W/dxv5AANi+qwGlkIuAFnZDcgoJ18Y7+P
	y1iwV4MlSMDPHCOVP9FUpmpvc65fJZu+lWNeKgygi6Wf+XF//oOR0xazHAHq534WAKSg
	p9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LgvrDutGhWEpTplMGFPjdHBj+GARIaBRHZUSMzhUyug=;
	b=Ji7uqyvFK6CVbJ7W7iFYeHYrVNNSLg6Dh5vIPbZDbALpNH7n4Zn2/hFClLkD5MKqyi
	hNgXppbPtwD9RVvpQ9eZfuggLwb1VtnkQCkeG2dZ9zlgIs9dPtpYxmOs42TVWohRAujH
	V/xpZzwFckl6ruPOXlxgo8rTSrVH2k3yE3gE6Rr611SPiCwMbs/OR3sL0mefCdAw+Sfy
	nl04Tr29XfokwqN/McVG+0hTXXq9wFgo94THsUCEYPdSrDu17iNREACfj5PrUZ1Vj5yr
	MHemPdfOr45jmH5Cn2G3CmjAiORUPyFAykyyMEagByvlEND/0VMh4niTkxoG3/0bxsCK
	vQ6Q==
X-Gm-Message-State: ALoCoQm5/dNQ+kjK9nsa/kO+7WPl2DtMzzBZYVWQTtxBRg7qx0CeG+5kKjOvynFjqiUOy7spK0HK
X-Received: by 10.50.30.69 with SMTP id q5mr9993896igh.78.1449152352539; Thu,
	03 Dec 2015 06:19:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Thu, 3 Dec 2015 06:18:53 -0800 (PST)
In-Reply-To: <1449137834-20165-1-git-send-email-adrian.ratiu@ni.com>
References: <1449137834-20165-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Dec 2015 14:18:53 +0000
Message-ID: <CAJTo0LYjcHpM20DUiu2CzR8hw-wH0zCya+nUzGjBC1FkMRmzPw@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RESEND PATCH] x11vnc: move recipe to meta-oe
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
X-List-Received-Date: Thu, 03 Dec 2015 14:19:12 -0000
Content-Type: multipart/alternative; boundary=047d7bdc1c0c330f010525ff13b6

--047d7bdc1c0c330f010525ff13b6
Content-Type: text/plain; charset=UTF-8

On 3 December 2015 at 10:17, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> x11vnc can be configured with --use-system-libvncserver to use an
> external libvncserver which will be added to meta-oe. Since oe-core
> should not depend on meta-oe, we move x11vnc there.
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>

Obviously we shouldn't remove it from oe-core until it's been merged into
meta-oe, so please ping when that's happened.

Ross

--047d7bdc1c0c330f010525ff13b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 December 2015 at 10:17, Ioan-Adrian Ratiu <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adrian.ratiu@ni.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8qy" class=
=3D"a3s" style=3D"overflow:hidden">x11vnc can be configured with --use-syst=
em-libvncserver to use an<br>
external libvncserver which will be added to meta-oe. Since oe-core<br>
should not depend on meta-oe, we move x11vnc there.<br>
<br>
Signed-off-by: Ioan-Adrian Ratiu &lt;<a href=3D"mailto:adrian.ratiu@ni.com"=
>adrian.ratiu@ni.com</a>&gt;</div></blockquote></div><br>Obviously we shoul=
dn&#39;t remove it from oe-core until it&#39;s been merged into meta-oe, so=
 please ping when that&#39;s happened.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--047d7bdc1c0c330f010525ff13b6--
