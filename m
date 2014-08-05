Return-Path: <sujith.h@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id 3A20F60809
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Aug 2014 13:09:15 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id j107so917403qga.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Aug 2014 06:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=y1fy6/OFsWk0Wtqw7CFh9J/RcCQ5eWNJMuQdDpWqggg=;
	b=qdWUB/tGJ6lNGXsVbHDmkfJw3b9Z5nDB6tIdsE5pr4vX3l3yfEE6RkU6k36Pt85M6B
	NaNo/iW/rgih0lOLIKizSNbtC+ss1+uReJhIrSoU9+jotCqUNaL9pcciGoFBN//sUDdD
	FBIWOHLO9416ls0esmFm9sQV/B8LPvHqdvFuQQI8RFivuBb4lr4R0TFDIQVABj2aHITL
	MVkG/neZDZj/pvqfDXtHmo6C/pNGeIZvx1L3JO8js3PykMRQgEZb6vha9hwgH2tqs2VN
	0i4o7sbxegyIfxYW+MwrKhiivVMRWbHw5pNuZJWJzxIGL8U2Naf4oeUjYnm+c8m75WVU
	RYtQ==
X-Received: by 10.140.103.74 with SMTP id x68mr5360498qge.34.1407244156623;
	Tue, 05 Aug 2014 06:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.148 with HTTP; Tue, 5 Aug 2014 06:08:56 -0700 (PDT)
In-Reply-To: <4B4C3C6C-7C4A-4037-A03A-5F20E06CD918@dominion.thruhere.net>
References: <1407160628-30775-1-git-send-email-sujith.h@gmail.com>
	<4B4C3C6C-7C4A-4037-A03A-5F20E06CD918@dominion.thruhere.net>
From: sujith h <sujith.h@gmail.com>
Date: Tue, 5 Aug 2014 18:38:56 +0530
Message-ID: <CADyYWLkRMQAC=uvu4bkBEndRCn0SdgrN=jE=-edO3crdn9cG2A@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Adding loop back for machine name in hosts file
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
X-List-Received-Date: Tue, 05 Aug 2014 13:09:16 -0000
Content-Type: multipart/alternative; boundary=001a1134eda811622e04ffe190e3

--001a1134eda811622e04ffe190e3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 5, 2014 at 6:17 PM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

>
> Op 4 aug. 2014, om 15:57 heeft Sujith H <sujith.h@gmail.com> het volgende
> geschreven:
>
> > From: Sujith H <Sujith_Haridasan@mentor.com>
> >
> > If hostname is not added to /etc/hosts file then rpcinfo
> > command fails when hostname is passed as argument. This was
> > observed when rpcinfo command was tested on freescale target.
> > Below was the output observed without this change.
>
> Isn't this what nssmyhostname is for?


Yes adding nss-myhostname would be the cleaner solution. Thanks Koen Kooi.



--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--001a1134eda811622e04ffe190e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Tue, Aug 5, 2014 at 6:17 PM, Koen Kooi <span dir=3D"ltr">&lt;<a =
href=3D"mailto:koen@dominion.thruhere.net" target=3D"_blank">koen@dominion.=
thruhere.net</a>&gt;</span> wrote:<br>


<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Op 4 aug. 2014, om 15:57 heeft Sujith H &lt;<a href=3D"mailto:sujith.h@gmai=
l.com" target=3D"_blank">sujith.h@gmail.com</a>&gt; het volgende geschreven=
:<br>
<div><br>
&gt; From: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" targ=
et=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
&gt;<br>
&gt; If hostname is not added to /etc/hosts file then rpcinfo<br>
&gt; command fails when hostname is passed as argument. This was<br>
&gt; observed when rpcinfo command was tested on freescale target.<br>
&gt; Below was the output observed without this change.<br>
<br>
</div>Isn&#39;t this what nssmyhostname is for?</blockquote><div><br></div>=
<div>Yes adding nss-myhostname would be the cleaner solution. Thanks Koen K=
ooi. <br></div></div><br><br clear=3D"all"><br>-- <br>=E0=B4=B8=E0=B5=81=E0=
=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=E0=B4=BF=E0=B4=A6=E0=
=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>


Bangalore<br>&lt;Project&gt;Contributor to KDE project<br><a href=3D"http:/=
/fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">http://fci.wikia.c=
om/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"http://sujithh.inf=
o" target=3D"_blank">http://sujithh.info</a><br>



</div></div>

--001a1134eda811622e04ffe190e3--
