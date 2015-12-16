Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 24B456FF97
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 22:11:54 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id jw2so8677602igc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 14:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=bs+yDv0R+ITOme+RKotGiT4wUdGZW6KAfTs44QgX3xo=;
	b=Mr0NPrfCqGWW0SQVLrJNDbt91A1Wgfml+DYiGpdXAboTetW3I5NDZsweSoWxtr1KzF
	gqjXvoJPosEsG6NkAucEmsH2pXwnIlD9/eap9m1iBCM5vJ6tu7nGba2kiQfycHt/ABxu
	VkJnbn7d2HUpOkv3V8mnPnv4pfS+mTSQ1RXfWNIz5C0CFyfNU7n53nzB38VUg2ReDjjy
	Pkq1Yg8EUamyWi6tksO/Z1nbqoxXyb38K+kCAssofZy1NTX6rqjaz+FR0GkpENutv/zv
	CEDb3nukrBEG2gDQSHMnxD0tZZ/w15czEBbRqOS+cHh41peNtjDFNr6QmAVB1m0SUShG
	23sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bs+yDv0R+ITOme+RKotGiT4wUdGZW6KAfTs44QgX3xo=;
	b=dQnrsONIDd2J/skT+KPdruxavcr3OZ/n19ryNo12UgY3Mo4IEo+Et5BS2UZhazRm0l
	bxOgVuUjF3etmZwI9bjngHCJMMAW2PCBOcMxebfzNzpsctJr05fInWeuwMXXn8g9JfC2
	QbREl6inlj1sIceloXNstEPcXiJNFAHxmqjYD6l4syPoU3WqVXeX5atJbAVLlh4i11Fx
	lrKAl/3EG2Q0W52DA2U7hlefZ5w3wv5i+MgOinuALMnbjrHkAWRz+3r3NMYByYRGNEmT
	5Mh8P8RAsB6HX0GFhTQm8zG8Led2FUMY7UfAvJ876jclekN7ydVBmjY7x/gVLBIi2fXF
	ZIpQ==
X-Gm-Message-State: ALoCoQkKxjAJ1GBgux0HEtsfrFjtjitNCJhRvbUDHHGhpLPW8Lo6vJOSxyCR+W57QYf4Bhu4wKLnZeEP3bhkvx3diDoX2eM30ijIoGhPcILZ4cUkY7Yh1zE=
X-Received: by 10.107.3.154 with SMTP id e26mr9885071ioi.99.1450303915325;
	Wed, 16 Dec 2015 14:11:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Wed, 16 Dec 2015 14:11:35 -0800 (PST)
In-Reply-To: <1450285378-21007-1-git-send-email-alejandro.delcastillo@ni.com>
References: <1450285378-21007-1-git-send-email-alejandro.delcastillo@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Dec 2015 22:11:35 +0000
Message-ID: <CAJTo0LZ9VCCnpeTBK1noUrO8twF3UJ3WGN0-2BmsS2O6R1snzw@mail.gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] opkg: upgrade to v0.3.1
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
X-List-Received-Date: Wed, 16 Dec 2015 22:11:55 -0000
Content-Type: multipart/alternative; boundary=001a113ec10ab0897a05270b311f

--001a113ec10ab0897a05270b311f
Content-Type: text/plain; charset=UTF-8

On 16 December 2015 at 17:02, Alejandro del Castillo <
alejandro.delcastillo@ni.com> wrote:

> * Drop merged patches
> * Add patch to fix crash when using the libsolv backend
> * Add patch to add pkgconfig support for libsolv
> * Add libsolv support via a PACKAGECONFIG option.
>
> Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>

This doesn't apply to master, can you rebase please?

Ross

--001a113ec10ab0897a05270b311f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 December 2015 at 17:02, Alejandro del Castillo <span dir=3D"ltr">&lt;=
<a href=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">alejandro=
.delcastillo@ni.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><div id=3D":3vc" class=3D"a3s" style=3D"overflow:hidden">* Drop merged pat=
ches<br>
* Add patch to fix crash when using the libsolv backend<br>
* Add patch to add pkgconfig support for libsolv<br>
* Add libsolv support via a PACKAGECONFIG option.<br>
<br>
Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delca=
stillo@ni.com">alejandro.delcastillo@ni.com</a>&gt;</div></blockquote></div=
><br>This doesn&#39;t apply to master, can you rebase please?</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ec10ab0897a05270b311f--
