Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 463FB71BFC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Feb 2018 10:34:24 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id z6so1970875iob.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Feb 2018 02:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9p8KYH7y7fuL7jx7E//y/GXQKzn931fPQKXdHzqKWuo=;
	b=wB1SXg4eFimVsxbUKPVrLlwiW/yL/XGo11rLzNXNcN7mwXazZxChX81nu3cnK8XLAK
	j/4wnOIjT6fguhTc5NtTZJq1Y6BmIoo+VlrF30ALdIBYe+Bl/G3MyOkv1klSRQVZpJ0l
	2cQPFcCFV9oYUcs4EQPjD4dn0OQLP6m9GfDj21KjHQb465LcTOWpsSZTBylFXVibbt9i
	pwOOf9QyvwRAP/yB+fmXiSYIB39H6m33QW8/uxKmJaNwHW81mKmqMgzTMyGa7/YXOovi
	RuBNRTQ/SXs/FKptMPdc075tD/kvIsnG8lwVfZsWW4PtkESkFM8FydqRzkQyTD8x8rEJ
	4Mpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9p8KYH7y7fuL7jx7E//y/GXQKzn931fPQKXdHzqKWuo=;
	b=LfRIqazjjM1uQ1+X4tLa00f+irOXwO2O8BcPEa/K3cEK722n6mt/ZCfyAeckvwx+i9
	i2++LY/0hl5N1+3aFD/nFHXv68Oye4qbAfDngmPVRrv6HdpBR98XI6+JMBTvxXur8wi8
	PWZMt53YW8HFBKceX6tBILtvBVqoItYo/SSkr9XvKJqPGJWRHHdSrFWSfSgHtH2XwlCk
	WCs6ckTxwCHv1KEELtdXG5JaEAvNCLd5odDtBVXcTcKFamI/eu1aHP1tQgnWg0w14im1
	BHGcUtFyj/3Ps+An3R27weKnjoVJLhiJm/UP7YLMDpd893/mEvf+fzu+pIDwPzmx0S2j
	CaMQ==
X-Gm-Message-State: APf1xPCWFEmG9f3uETidTxjkwq83kxh+Cro8DU6iRkdiUBaFvtWP1GZr
	cNqJeTkTCM4pfJ0wvBhGuF6kUYiHDxC5MIWUEIr01/b8
X-Google-Smtp-Source: AH8x226HIZG3FVei3beDGy1xN4orYnwkWLWWOOvSacvENwtw+Mgf4P1HcGDyCoRjk5/RoUl3qqVexHuPJJg7zFFeuMY=
X-Received: by 10.107.133.75 with SMTP id h72mr2281727iod.227.1517913265855;
	Tue, 06 Feb 2018 02:34:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Tue, 6 Feb 2018 02:34:05 -0800 (PST)
In-Reply-To: <1517882640-731-2-git-send-email-anuj.mittal@intel.com>
References: <1517882640-731-1-git-send-email-anuj.mittal@intel.com>
	<1517882640-731-2-git-send-email-anuj.mittal@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Feb 2018 10:34:05 +0000
Message-ID: <CAJTo0LYC8dfucVG_J43GCj7wE3DQR8dStQWNM3VfWNcNDLcyCQ@mail.gmail.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/3] libva: upgrade to 2.0.0
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
X-List-Received-Date: Tue, 06 Feb 2018 10:34:25 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e4037c9d056488b97f"

--001a113ec5e4037c9d056488b97f
Content-Type: text/plain; charset="UTF-8"

On 6 February 2018 at 02:03, Anuj Mittal <anuj.mittal@intel.com> wrote:

> +SRC_URI = "https://github.com/intel/${BPN}/releases/download/${PV}/$
> {BPN}-${PV}.tar.bz2"
>

For convenience bitbake.conf defines BP:

BP = "${BPN}-${PV}"

Don't bother sending a V3 as I'll just make this change when merging.

Ross

--001a113ec5e4037c9d056488b97f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 February 2018 at 02:03, Anuj Mittal <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal=
@intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex">+SRC_URI =3D &quot;<a href=3D"https://git=
hub.com/intel/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.bz2" rel=3D"n=
oreferrer" target=3D"_blank">https://github.com/intel/${<wbr>BPN}/releases/=
download/${PV}/$<wbr>{BPN}-${PV}.tar.bz2</a>&quot;<br></blockquote><div><br=
></div><div>For convenience bitbake.conf defines BP:</div><div><br></div><d=
iv>BP =3D &quot;${BPN}-${PV}&quot;</div><div><br></div><div>Don&#39;t bothe=
r sending a V3 as I&#39;ll just make this change when merging.</div><div><b=
r></div><div>Ross=C2=A0</div></div></div></div>

--001a113ec5e4037c9d056488b97f--
