Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id CF91F734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 20:19:24 +0000 (UTC)
Received: by qgev79 with SMTP id v79so54091358qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 13:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8Y2Bn7pEK/IXssd/wI+F/CTeo3cKq9+izqhexTiWYJ8=;
	b=gNtOkFK5rJnDzdMfcBxRiaNFO9BH2UZX/tkp7qMZ/Dmp1APQO5EWl/Ih9WEHiYEkKo
	lsNW6uiS5wXqphkCPMBKkfmsJz5Gk08uJXPONnYza+IhXDqU1EoDQyhlAU2FQ3FonDyQ
	+22hyasZvxn+TJ+0LoEjaxG2KhWCwRgLjooUwq3nW4CJrWTz6r5UQAGlR772ElOEkDNt
	kr0IN3zvxUyEhSqEgLi/3WdaIWfajL9/lEpgwsHiln3VINFoC+5/9YgnfxLSDqmk8Js+
	0ZiDUv2q4MrgT+C4AsD+Gqd7aTi56kSZLsAm7RNyMbjjK+Yu6r3Ynw0qFlbuPFfN0zc9
	DdXg==
X-Gm-Message-State: ALoCoQlJ1e6cH0G7RV8vTVXB4wjnGEArjHMUPZjUvTB3hBrGwkzI4QPNV18Wk5Z9MAF1tFsxsQWv
X-Received: by 10.140.232.150 with SMTP id d144mr2146305qhc.17.1443125964233; 
	Thu, 24 Sep 2015 13:19:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Thu, 24 Sep 2015 13:19:04 -0700 (PDT)
In-Reply-To: <CAP71Wjz0zd_gTE8J82P0bvxvqSb_iH2CkK5jy=sGUGjKk_dGSQ@mail.gmail.com>
References: <1443116526-16989-1-git-send-email-alexander.kanavin@linux.intel.com>
	<CAP71Wjz0zd_gTE8J82P0bvxvqSb_iH2CkK5jy=sGUGjKk_dGSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 24 Sep 2015 21:19:04 +0100
Message-ID: <CAJTo0LZdyUDn-pmDAKL7OaQKpwiz=m1Z4WsV7WdaTvjX3oPD9g@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: change glimagesink rank to marginal
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
X-List-Received-Date: Thu, 24 Sep 2015 20:19:26 -0000
Content-Type: multipart/alternative; boundary=001a11354852771737052083f283

--001a11354852771737052083f283
Content-Type: text/plain; charset=UTF-8

On 24 September 2015 at 21:03, Nicolas Dechesne <nicolas.dechesne@linaro.org
> wrote:

> fwiw... on my platforms (QCOM DragonBoard) I rely on glimagesink, and
> we have good OpenGL support.. but I understand that this isn't the
> norm for ARM, and more an exception.. I can manage that in my BSP
> layer, if that ever gets merged. Note we might want to wait for the
> upstream discussion to settle before merging.
>

Does your platform support Xvideo?  If not then glimagesink will likely be
picked anyway.

Ross

--001a11354852771737052083f283
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 September 2015 at 21:03, Nicolas Dechesne <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesn=
e@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":13c" class=3D"a3s" style=3D"overflow:hidden">fwiw... on my platforms =
(QCOM DragonBoard) I rely on glimagesink, and<br>
we have good OpenGL support.. but I understand that this isn&#39;t the<br>
norm for ARM, and more an exception.. I can manage that in my BSP<br>
layer, if that ever gets merged. Note we might want to wait for the<br>
upstream discussion to settle before merging.</div></blockquote></div><br>D=
oes your platform support Xvideo?=C2=A0 If not then glimagesink will likely=
 be picked anyway.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--001a11354852771737052083f283--
