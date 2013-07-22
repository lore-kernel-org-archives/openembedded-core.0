Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF9361959
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 09:02:07 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id j1so8622565oag.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jul 2013 02:02:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=PMbhoNq6guTxkm1eejmcpp9GB+9nhQIJBPqe3szfVEk=;
	b=ZnGtsAmsBRf2i2mkqCDv0nXlsZJYUYKp94rTKTSvoeDVtg//CkIHItfXagAW4hxxta
	d4+X9PMmtBjrWBwalsNJ4DWrtbzQe7HxBv53tzORad3ViThlqGluuGweEBbFAFh/goOs
	a1cW4jK7nhjiG9QrI3/7pec4aqEGNBZ9Oirmh3n0CJPj/2UojuSFM3C13T+FfrQB4moq
	Nxht5WbMHv+sZWxCx1QKXE0YedWH/XEe9U9HnFDgIyfDARBw27OQ3ih85XYf1A/mkboi
	3RE3JHzLGr4M7hgoJm3y5dEoussvE4S0/i/rjEajezW+rGd1bDbU1Df8HhD9xZBDa0rD
	HeRg==
X-Received: by 10.60.99.42 with SMTP id en10mr25668438oeb.85.1374483727548;
	Mon, 22 Jul 2013 02:02:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.126.144 with HTTP; Mon, 22 Jul 2013 02:01:47 -0700 (PDT)
In-Reply-To: <51ECCF5C.2020505@dresearch-fe.de>
References: <51ECCF5C.2020505@dresearch-fe.de>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 22 Jul 2013 11:01:47 +0200
Message-ID: <CAP71Wjz6vU5iiSoc9LqDczGo_SJ02ppRJizQui_MLYKPK_61Wg@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Gm-Message-State: ALoCoQnvEadHMuAJqcpb0Q/RMKVy++q10sQ49OPygm578+FQRO036tv1WtFiFJOM8PCYakG2NEYH
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SRC_URI and latest HEAD revision with git
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
X-List-Received-Date: Mon, 22 Jul 2013 09:02:07 -0000
Content-Type: multipart/alternative; boundary=047d7b33d26a54942804e215ee7f

--047d7b33d26a54942804e215ee7f
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <sledz@dresearch-fe.de>wrote:

> After being OE abstinent for some months i'd like to ask what is the
> current suggested method for recipes building from the HEAD revision of a
> git repository (we need this for continuous integration).
>
> I read some RFC's in the ml about PKGV/PKGR stuff, but i miss a final
> decision, documentation and a good example.
>

you can use ${AUTOREV} for this purpose. You can look at poky-bleeding
distro config for such an example.

e.g.
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/distro/include/poky-floating-revisions.inc

--047d7b33d26a54942804e215ee7f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jul 22, 2013 at 8:21 AM, Steffen Sledz <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:sledz@dresearch-fe.de" target=3D"_blank">sledz@dresearch-fe.de<=
/a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":5o" style=3D"overflow:hidden">After being OE a=
bstinent for some months i&#39;d like to ask what is the current suggested =
method for recipes building from the HEAD revision of a git repository (we =
need this for continuous integration).<br>


<br>
I read some RFC&#39;s in the ml about PKGV/PKGR stuff, but i miss a final d=
ecision, documentation and a good example.<br></div></blockquote></div><br>=
you can use ${AUTOREV} for this purpose. You can look at poky-bleeding dist=
ro config for such an example.=A0</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">e.g.=A0<a h=
ref=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta-yocto/conf/=
distro/include/poky-floating-revisions.inc">http://git.yoctoproject.org/cgi=
t/cgit.cgi/poky/tree/meta-yocto/conf/distro/include/poky-floating-revisions=
.inc</a></div>

<div class=3D"gmail_extra"><br></div></div>

--047d7b33d26a54942804e215ee7f--
