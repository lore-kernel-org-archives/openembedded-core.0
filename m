Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id B23496FFC7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 20:08:24 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 77so197995641ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 12:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MDkTMQRypqeRenQSFtm/dI4oymdtEZEVGSpJtb0FYDA=;
	b=fE089uZOdu1cjqx5adJyZ4Bn+jSowyZ3Uzg7DgQY91asqqI9AOfoF/ddQj08uv5aJf
	+AVhoAOq7vK0VgYaI/Aa4WB0RVxZOGPFv8AfPB3OlmeN9cIXqRaKDAiK6tyww7T+0Bxc
	kILWGSuLUfyS4T0S9lfdIV0WrC5lCfGOJQnXCBWwIU2VjcMPkLJobXODHejGlxzBgADV
	8AqrpAaUJLHz2j4qSffvvDZSJ0CpuS4j7Z5X1k5riU2b8vcucREB/Y6IGsVVctJhabMr
	nOabSrTANlFu84z5g1JEtImeidNFX/RgSG4MHszpOftve+Ew9ekIwlKzjCRvWBiJ2596
	Ke4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MDkTMQRypqeRenQSFtm/dI4oymdtEZEVGSpJtb0FYDA=;
	b=miIcbuQePVfeICpZRPbIAYGQps00RfTG80VMLUZMs2S84ODgovlBtvXyrw45dJLU2/
	4Cr3H2CKaYA09AFryISX/hUcX0zGQzQIVRcM8igyjkOi5oWgLS5jdVOtalbBCnP1WeRo
	SNcZQa1zkCj3ggRCWyHDduuYsNxNNocpX8a5I/GLJL4brlewz7V3DklTqrKgs0fataPZ
	7bc0f8F7MNZYAcElrB0PVO3/+6CaKBISriEE/82CZ8+hf8ifJ2iD/trTioYZe/gPLYAQ
	ZATFfX67srAS+hiLC4aVI0o4iTD7yeCnJj2Hf23qU8nakSTvCJsUMuNRKILC7z3GvdsN
	fi7A==
X-Gm-Message-State: AG10YORRZDLJFbh7SBm0XIuBvlHCAxR+EjjQVaMU2WTqT7lNvpf/PO7ItN7OJInq220pX+JOPS1zI5akTKrazAjP
X-Received: by 10.107.3.154 with SMTP id e26mr22677095ioi.99.1453838905419;
	Tue, 26 Jan 2016 12:08:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 26 Jan 2016 12:08:06 -0800 (PST)
In-Reply-To: <024e4a066a9ba9ee5333961b46fc6bbb5814d31d.1453746280.git.raj.khem@gmail.com>
References: <cover.1453746280.git.raj.khem@gmail.com>
	<024e4a066a9ba9ee5333961b46fc6bbb5814d31d.1453746280.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Jan 2016 20:08:06 +0000
Message-ID: <CAJTo0LZxqgccVkB38Skp=5tqvKm8U7g+gryzpdokihdMcfgtbw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 04/11] pth: Delete
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
X-List-Received-Date: Tue, 26 Jan 2016 20:08:25 -0000
Content-Type: multipart/alternative; boundary=001a113ec10a84d1ee052a423ffc

--001a113ec10a84d1ee052a423ffc
Content-Type: text/plain; charset=UTF-8

On 25 January 2016 at 18:32, Khem Raj <raj.khem@gmail.com> wrote:

> replacement in npth is available in OE-core
>

This breaks anyone using core-image-lsb because that pulls in pth
explicitly.

I can't see any mention of pth in the LSB specification so it could be that
it can just be removed.  Or maybe it should be replaced with npth.  Does
anyone have any opinions here?

Ross

--001a113ec10a84d1ee052a423ffc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 25 January 2016 at 18:32, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":1yh" class=3D"a3s" sty=
le=3D"overflow:hidden">replacement in npth is available in OE-core<br></div=
></blockquote></div><br>This breaks anyone using core-image-lsb because tha=
t pulls in pth explicitly.</div><div class=3D"gmail_extra"><br></div><div c=
lass=3D"gmail_extra">I can&#39;t see any mention of pth in the LSB specific=
ation so it could be that it can just be removed.=C2=A0 Or maybe it should =
be replaced with npth.=C2=A0 Does anyone have any opinions here?</div><div =
class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10a84d1ee052a423ffc--
