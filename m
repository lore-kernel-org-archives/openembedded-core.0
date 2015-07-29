Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id 9D59D601F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 10:20:08 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so1876165qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 03:20:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7McEWagAr/+qB4xoo7b9amPJ0T7BBun7G2Sx8M/Ule4=;
	b=mgqQBokkhTZ8C6Nt+n9m7elLwZBjvYSu5MkY+HYh9P107FuLRxDGdEfVivaZ2F+xde
	JTvcJJKRmK/x3d5HWqCXb31pHXWEcnM5YwDBTbr4eT3G79Pu1RrJGQ4/WoM4V42AFIgS
	zRy6yT6QVOgW9L9zsYG9R0ybTKkrpAax2adsrg+AiJOppoYWHUiJODLuXy3Fy/ccwpbf
	yLnHXcMYEQwGTCShf/wV0DqsVDZp3U/1GQ1xksME69CF4C4F21nfVTjMSphADdq5Q4qy
	hoSJgYyLuJMEct+zxB0dYOioJyDX6FtS9204zL0fLbizaNPL+SaPt6G7wcGFJJIMnBrk
	Qgpg==
X-Gm-Message-State: ALoCoQmdvnRg9cCqlCtOYi/B9oLSPrPBcRs3dC3U/cXRrbgB2z14hgt1GXDGdvC47S2nY666Suzi
X-Received: by 10.55.25.35 with SMTP id k35mr59007161qkh.76.1438165208919;
	Wed, 29 Jul 2015 03:20:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Wed, 29 Jul 2015 03:19:49 -0700 (PDT)
In-Reply-To: <1438155256-3385-1-git-send-email-wenzong.fan@windriver.com>
References: <1438155256-3385-1-git-send-email-wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 29 Jul 2015 11:19:49 +0100
Message-ID: <CAJTo0LY_8MGszbQYJziM+bj4GUV+qmQgnzSTOHb4XG0+1GVb8A@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bjam-native: inhibit sysroot strip
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
X-List-Received-Date: Wed, 29 Jul 2015 10:20:11 -0000
Content-Type: multipart/alternative; boundary=001a1147e69a6803ad051c00ee32

--001a1147e69a6803ad051c00ee32
Content-Type: text/plain; charset=UTF-8

On 29 July 2015 at 08:34, <wenzong.fan@windriver.com> wrote:

> +# bjam is already stripped, don't strip it again
> +INHIBIT_SYSROOT_STRIP = "1"
>

In case it's even needed to debug bjam-native, how hard would it be to stop
bjam from being stripped in the first place?

Ross

--001a1147e69a6803ad051c00ee32
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 08:34,  <span dir=3D"ltr">&lt;<a href=3D"mailto:wenzong.=
fan@windriver.com" target=3D"_blank">wenzong.fan@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div id=3D":1xb" class=3D"a3s" =
style=3D"overflow:hidden">+# bjam is already stripped, don&#39;t strip it a=
gain<br>
+INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;<br></div></blockquote></div><br></=
div><div class=3D"gmail_extra">In case it&#39;s even needed to debug bjam-n=
ative, how hard would it be to stop bjam from being stripped in the first p=
lace?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a1147e69a6803ad051c00ee32--
