Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id CBBD67FCCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 11:56:39 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id r22so2049763uam.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 03:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y5p18bGeQKuNXb7YSO/tfzhRQXHpiJmFq0Sz0OcQjhI=;
	b=KX9x7UC7+F0QWzzAwx6F+YCPQ/qnaKIfOHTpVKMjM77LerBpSKgUJPs4dybNHsk0UO
	q4LPZidBce4ikjomYELsBq8Avja6y0tAZyhKsim+/AZ/eGlzt5GVO+o+drqti9H4aImC
	GOLAI+JGC0shx3XAAwSgkfkNmUOiNeqpex4NBNROGralSsO636DyNitP1Y2iIwOnRGrP
	qdGO8NNwNEn/YZ7LeMw3kbTTCUNFMJv8z0X+vnCdFnmYaKC5a7aHjBsDU//zC85IrUZ1
	2/OBcjy7wqzS/JV2oQiQrxp0mqfXoqmaUMbgv6jQxY8Z1w/iZczBmYmUdC+hQr5pLjk8
	qdew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y5p18bGeQKuNXb7YSO/tfzhRQXHpiJmFq0Sz0OcQjhI=;
	b=czPMPaMX5/CDMmVEOOcJgYTGlIfXvZcL2TkHjTD0TJPH6SKENPZeZwXfcR8Co0LTCM
	kJLrq7XxJDdOmhuDBk+ru0DRizrvPBuMT4Ua2890dM8xAbA+RaSPfXbA25+EcxxqNw6C
	dPe2iruzQuhmrnYm6vvpvYt0NOoJZNR9TkW7TM3m/2Y3ZFcUhaPmeZ06gVxhWviA2Ut8
	aPPjGSfXdpVzzHAHmhB1tJYH5kk2GTUU6HHfdEt93Unuq5+UrCPiBkTQAvPuAJdxlO7X
	4uyv/wCXF/uE7Wovn9m0FcmznFtjxfyGq0yMT4BQpDtOBrCuvnXsm22fEEIQfzUWVP23
	7+Lg==
X-Gm-Message-State: APjAAAVxfvbChUa8BlMG7TddziY+Y/yT2vNZFe+ds0WxXGfoP16guOKq
	VepdOExFHghDFdOSf1Lvy8KS+s6S6QHtdHKvMpr9qQ==
X-Google-Smtp-Source: APXvYqypjMIRlv3wbSaELiq8eBy9y68MwAOXZ5vmqFq8oV25sJdzjZZAKSWvHQBgd985SzJjunSsefrcn7dCIRkUj+E=
X-Received: by 2002:ab0:49e9:: with SMTP id f38mr8966685uad.71.1574423800565; 
	Fri, 22 Nov 2019 03:56:40 -0800 (PST)
MIME-Version: 1.0
References: <1574439782-29100-1-git-send-email-wangmy@cn.fujitsu.com>
	<1574439782-29100-3-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1574439782-29100-3-git-send-email-wangmy@cn.fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 22 Nov 2019 12:56:29 +0100
Message-ID: <CANNYZj-b2C6LbrDCNKSV4DL0+zbWVq6-dVj-pcgytEce--VnEw@mail.gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] cmake-native:upgrade 3.15.3 -> 3.15.5
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
X-List-Received-Date: Fri, 22 Nov 2019 11:56:40 -0000
Content-Type: multipart/alternative; boundary="0000000000005bd3880597ee1b0f"

--0000000000005bd3880597ee1b0f
Content-Type: text/plain; charset="UTF-8"

On Fri, 22 Nov 2019 at 10:17, Wang Mingyu <wangmy@cn.fujitsu.com> wrote:

>  .../cmake/{cmake-native_3.15.3.bb => cmake-native_3.15.5.bb}          | 0
>  meta/recipes-devtools/cmake/cmake.inc                                 | 4
> ++--
>

You need to rename the target recipe as well.

Alex

--0000000000005bd3880597ee1b0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 22 Nov 2019 at 10:17, Wang Mingyu=
 &lt;<a href=3D"mailto:wangmy@cn.fujitsu.com" target=3D"_blank">wangmy@cn.f=
ujitsu.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">=C2=A0.../cmake/{<a href=3D"http://cma=
ke-native_3.15.3.bb" rel=3D"noreferrer" target=3D"_blank">cmake-native_3.15=
.3.bb</a> =3D&gt; <a href=3D"http://cmake-native_3.15.5.bb" rel=3D"noreferr=
er" target=3D"_blank">cmake-native_3.15.5.bb</a>}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 0<br>
=C2=A0meta/recipes-devtools/cmake/cmake.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 4 ++--<br></blockquote><div><br></div><div>You need to renam=
e the target recipe as well.</div><div><br></div><div>Alex<br></div></div><=
/div>

--0000000000005bd3880597ee1b0f--
