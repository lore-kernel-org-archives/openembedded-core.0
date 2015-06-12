Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6C99D7595E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:26:23 +0000 (UTC)
Received: by qgf75 with SMTP id 75so10422897qgf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 04:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KbivSlvH+P6T2YmheWsBrYyVBTgF6kd+N1nYkYuA9QQ=;
	b=j3xtPLfWNnwA04E8XaLV4GvPWFpEAyDZPEmHRg808RqS2uc+KX2LSSHvy/OjdXsmx0
	eCFMbc/wpiU3oeOxkqB4JsTz3atdv3/GFnIrSowfCh34rv1tZtGCEZOIx42EAOfwaKu2
	9mPa6+2sXLpRMF5uMVeEZHzFB3ELFYCcKLob6zFO9j96cZbyAJiSe3Pdu/vEdXXWFQjb
	dvI21YjWJ4K7JYdhqObPH8fttjq6P/V1qXIxvPfCwjPLql014qR93E4lwSIhKsd3eIhn
	4AS5ne387ri2Ww/bLOeUj8uOKKqHXmTOUfXi2dv/BoiIABMgQZ4SmIWUd9z8BuWxFZ8p
	X1+g==
X-Gm-Message-State: ALoCoQl6UNUpCbE23CQ/ETHp1jCsG5zqjuBJQZANX27Af5+eFzircNnHRfpKMLNIoD0I+tGfJEOr
X-Received: by 10.140.133.199 with SMTP id 190mr18599677qhf.17.1434108384230; 
	Fri, 12 Jun 2015 04:26:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 12 Jun 2015 04:26:03 -0700 (PDT)
In-Reply-To: <1434102524-2036-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1434102524-2036-1-git-send-email-lixin.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Jun 2015 12:26:03 +0100
Message-ID: <CAJTo0Lb9f6OG79hS9=tVfNthSQxqpXr457q-1N7PyYFudJopWQ@mail.gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libnewt-python: add native support
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
X-List-Received-Date: Fri, 12 Jun 2015 11:26:23 -0000
Content-Type: multipart/alternative; boundary=001a11353390cfd488051850606f

--001a11353390cfd488051850606f
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 10:48, Li xin <lixin.fnst@cn.fujitsu.com> wrote:

> +BBCLASSEXTEND = "native"
>

Have you actually tested this in oe-core?

$ bitbake libnewt-python-native
ERROR: Nothing PROVIDES 'libnewt-native' (but
virtual:native:/home/ross/Yocto/poky/meta/recipes-extended/newt/
libnewt-python_0.52.18.bb DEPENDS on or otherwise requires it)

Ross

--001a11353390cfd488051850606f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 10:48, Li xin <span dir=3D"ltr">&lt;<a href=3D"mailto:li=
xin.fnst@cn.fujitsu.com" target=3D"_blank">lixin.fnst@cn.fujitsu.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border=
-left-style:solid;padding-left:1ex"><div id=3D":11d" class=3D"" style=3D"ov=
erflow:hidden">+BBCLASSEXTEND =3D &quot;native&quot;<div class=3D""><div id=
=3D":10x" class=3D"" tabindex=3D"0"></div></div></div></blockquote></div><b=
r>Have you actually tested this in oe-core?</div><div class=3D"gmail_extra"=
><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">$ bitbake =
libnewt-python-native</div><div class=3D"gmail_extra">ERROR: Nothing PROVID=
ES &#39;libnewt-native&#39; (but virtual:native:/home/ross/Yocto/poky/meta/=
recipes-extended/newt/<a href=3D"http://libnewt-python_0.52.18.bb">libnewt-=
python_0.52.18.bb</a> DEPENDS on or otherwise requires it)<br></div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></=
div>

--001a11353390cfd488051850606f--
