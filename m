Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id A8FC375C60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 10:27:43 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id n128so29331266ith.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R82rkvv2gprwjSsWYhfoDvbDMaBwz5zV/JJaFCJc23Y=;
	b=DRHHCPX6UwRRUpUfR3/KPvzr8Ku+bbmH/7Zw19iid+HNnaT01mlErFjDUAO6RTg2IN
	JyaXXVhikDK9OGL5gYL47yxA1ane4LZO4uCk831NByvGW0PFz8nnJGndc4ljfjHfAuOA
	eQGikRstoAX+rJ1ifzi8G9fHU4zaY1JZDEZapfSDX0YiZqMiptLEAfuzcWu4AOIeqDz0
	i/oWj51lNEC8iFJIz9HhVOgMBXdEDBpr3535PSfTDzhk38z+6Y1MxQzXrnen4UqAJchS
	mpvaoW4SmHRMtjTL9uN+gp2tqqj7BaDD35I6E3MrIJVcVu/bCB92JZUCjDerVFXAmvFx
	0DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R82rkvv2gprwjSsWYhfoDvbDMaBwz5zV/JJaFCJc23Y=;
	b=dFJDEPlT3K3duCBK4Zka259eFMMJnf2BcNII/YavYyZsJx+Fpnr53LLDpWuDTFHKru
	1r0uGyNZElgGWxWeuOYqI1gDD4cZFgNlTi8XT10ZaytPnUdSbklL90A3PAt1T5+CUmK3
	XFo1T5qNu9NvKwUnqkWnhrQQ6Vl2t2f0S+4SM7fPFQtaZXXOZGlWi9jQzIXJCbiuHomA
	QR8YelE1SYQ7ML3fc9hdM2pYOrS63B9Y0z+YWZCieaacIEAyDDgEoDx7V6K4DwH+Q6yq
	vVb3vB5CIU7SmETUf2bx4WPxeoo9OsnsNRT9mtO1LuP033+K0sbGiGhJSCeqhaQsAGLl
	DWNw==
X-Gm-Message-State: AEkooutSuSa+FukNVCRBpAwIpOiO//hcZqwTqjiHNvUNWF0Ux2+5JCTl/RILmDgiXqrGWYbjyuWlVzFZOEH8xDFB
X-Received: by 10.36.19.75 with SMTP id 72mr19708008itz.83.1471343264632; Tue,
	16 Aug 2016 03:27:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 16 Aug 2016 03:27:24 -0700 (PDT)
In-Reply-To: <edcd29bb-7b7f-f8e1-88ae-ae33bc1413c0@xilinx.com>
References: <1470762907-25824-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<edcd29bb-7b7f-f8e1-88ae-ae33bc1413c0@xilinx.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 11:27:24 +0100
Message-ID: <CAJTo0LafPs_QCN6BjzM7Sskb9v9MXW1g21Y__BTuVJT6Fcgmig@mail.gmail.com>
To: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] u-boot.inc: Enable out-of-tree builds
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
X-List-Received-Date: Tue, 16 Aug 2016 10:27:44 -0000
Content-Type: multipart/alternative; boundary=001a1145180aa1ba94053a2dcccb

--001a1145180aa1ba94053a2dcccb
Content-Type: text/plain; charset=UTF-8

On 16 August 2016 at 01:50, Manjukumar Harthikote Matha <
manjukumar.harthikote-matha@xilinx.com> wrote:

> Is there something fundamentally broken with this patch? It just enables
> out of tree build for u-boot source.
>

No, it's in my staging branch and appears to work.  Should be in master
soon.

Ross

--001a1145180aa1ba94053a2dcccb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 August 2016 at 01:50, Manjukumar Harthikote Matha <span dir=3D"ltr">&=
lt;<a href=3D"mailto:manjukumar.harthikote-matha@xilinx.com" target=3D"_bla=
nk">manjukumar.harthikote-matha@xilinx.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"><div id=3D":d3" class=3D"a3s aXjCH m15690d742e0e4b4=
e">Is there something fundamentally broken with this patch? It just enables=
 out of tree build for u-boot source.<br></div></blockquote></div><br>No, i=
t&#39;s in my staging branch and appears to work.=C2=A0 Should be in master=
 soon.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a1145180aa1ba94053a2dcccb--
