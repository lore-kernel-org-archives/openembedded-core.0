Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by mail.openembedded.org (Postfix) with ESMTP id E4E1A78317
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 21:34:52 +0000 (UTC)
Received: by mail-it0-f50.google.com with SMTP id j81so360870ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jQpFAZDnfg06SZEw5Rt9MzNYzv2M0FwAePme5J/XL8s=;
	b=kpG2spqxyADtu7D0tTDT3AK7ppMuGwUHUxDyQuI+35FOK6TK1BPoIDF/eBhKYEDzJu
	3B3O2cBX+MIyHsHYEv4frwoRRrMSOMykwHeGetfQm1oCuwHCyQ4ChB72gWf7uoz+KL65
	VZqQmKBqtLWIq6zcf8UiUci/8cf26/TDtfSJQHN+MkzPH5DIFXIaag+9c11Ah7q5AbqY
	N7EL0NXwp0ExQxWMp1L2ojxM2+0jQVRmiU7ABqJ2BoGglEMDTZEHVVg75z5sm71Eej1u
	5COnKO6VekT3IGz04S+eqctB0prbVO/htF9r06G0ljrYeoqxBUuULqr0lajMKrZeOqZo
	Hujw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jQpFAZDnfg06SZEw5Rt9MzNYzv2M0FwAePme5J/XL8s=;
	b=PWurHSFtmB4YfYI+vZgs6Sb2iu9ixi64Go4Ua1sQRydrF99ri/xKz9QzczFUBwizIK
	QZD+ef5dlDjMpsi4980hFxnO6YoSDmqaIMfhnn54UQyWQRxa+8imbYQVir/QxaOI7ocl
	GIEBr6+72phWDr4Ae/3pHotbYRPEfCKjU8YnvruNNZePLuMweHCSypmhOoFyDbWJ1xya
	LT3PrkYpk08020gP5JfOkEZE4MKdQicONTpLUcMea/etEJ62WxpOIxDOFAuZo/jixGqw
	FlfaZBCl2/1qy1q6zl/rVDqCyH2jLyOepFRhF6tjkDcOs3LRPD4Hr0GX1kZCIWAT0iok
	qz9Q==
X-Gm-Message-State: AIVw111vGHEcI9/Eixntu31qivwHanUo35bSR0BuWFbRRck2PMongcJC
	1j0Nsgk2777bxb8aZ9r8CPL44OFlMMBR
X-Received: by 10.36.26.13 with SMTP id 13mr4569481iti.87.1500586493969; Thu,
	20 Jul 2017 14:34:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 14:34:33 -0700 (PDT)
In-Reply-To: <CAP9ODKreV8ydJ30cWn3C-FeQ-O5uNt-6qp9vB28F1DSFfMW5eQ@mail.gmail.com>
References: <20170717184050.5474-1-otavio@ossystems.com.br>
	<CAJTo0La-FM3ThuMWJPB4riFf1QLeq0Vd=cRJ_DBjrCCbOCV4Vw@mail.gmail.com>
	<CAJTo0LapT9NrznbPkFYoVmLcQwVMArSjGT0vFjJ0Z-7x-TvWBw@mail.gmail.com>
	<CAMKF1spheC7ODGgJ3FeBUiUfDDLH=K1SFJ1=Vr8odT55Q4WTuQ@mail.gmail.com>
	<CAP9ODKo3H0WUp1T3jQK6qANHMhHLgX5T7cR9HLmmXPJnwpj7FQ@mail.gmail.com>
	<CAP71WjyVmM=a3rpoGm+CoyERx2=q60sHhT-TanoXHxEef_o6PQ@mail.gmail.com>
	<CAJTo0Lb8YFtgzfX5m+0mBo52Opc7ayzThQFuxcHDqbVKV1qmCA@mail.gmail.com>
	<CAP9ODKreV8ydJ30cWn3C-FeQ-O5uNt-6qp9vB28F1DSFfMW5eQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 22:34:33 +0100
Message-ID: <CAJTo0LZK1_ge8Q-Ernm9JYpZGX9sX5GQVR=DBHgoNf5KXYEjMQ@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Upgrade to 17.1.5 release
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
X-List-Received-Date: Thu, 20 Jul 2017 21:34:53 -0000
Content-Type: multipart/alternative; boundary="001a11441b5ceda0330554c684d1"

--001a11441b5ceda0330554c684d1
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 21:36, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> My understanding was that mesa was going to include those headers and
> stop requiring libdrm-intel. I don't recall if it made into 17.1 or it
> is master development.
>

Ok, this isn't related to the upgrade, I reverted it and 17.1.4 does the
same:

| configure: error: Package requirements (libdrm >= 2.4.75 libdrm_intel >=
2.4.75) were not met:

I'll bisect that tomorrow...

Ross

--001a11441b5ceda0330554c684d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 21:36, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"=
mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@=
ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:=
solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail=
-:4b9" class=3D"gmail-a3s gmail-aXjCH gmail-m15d61b7e1b06c380">My understan=
ding was that mesa was going to include those headers and<br>
stop requiring libdrm-intel. I don&#39;t recall if it made into 17.1 or it<=
br>
is master development.<br></div></blockquote><div><br></div><div>Ok, this i=
sn&#39;t related to the upgrade, I reverted it and 17.1.4 does the same:</d=
iv><div><br>| configure: error: Package requirements (libdrm &gt;=3D 2.4.75=
 libdrm_intel &gt;=3D 2.4.75) were not met:=C2=A0<br></div></div><br></div>=
<div class=3D"gmail_extra">I&#39;ll bisect that tomorrow...</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11441b5ceda0330554c684d1--
