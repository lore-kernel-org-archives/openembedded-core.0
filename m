Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8C05977D78
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 10:10:28 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id n4so969388qte.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 03:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OpUHtfDPjjxK0Ot10ZNbgPXxffrkZSESKX2vQZbytcY=;
	b=0lKVYpI+3IHqqkyAlUxBajbvwfss96EK5/7mYoBh48lK7Cqo6hrGM/ytgrGNkvtpVY
	iGvZodc3P6OrVUC3dLAztIlcEHy86Y7acvjD2MKIXiLDgQq07D4uOwVAsFr3aNf2PYEJ
	eyLWDRQ53s4HsDFCPv5HgDw0RV6OxTKX/nI3VN6MkEr404H1tdh685CtJan7P6HAtzs6
	8sKiRDSpz6rNLgkZvz08N2vZvTTTsAltjKIOsy8d/grVAbhdPYo58uRULFjJs8wq86P3
	bsyxJT4DE1lozvu1EqUHhNph4kJjk0WrRXbSgI1+zi1VkeW1KeBFtc4hzBQuWHOa1ZY9
	CzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OpUHtfDPjjxK0Ot10ZNbgPXxffrkZSESKX2vQZbytcY=;
	b=kww+e8bfmOkvnJFIXr//wrAcK7BHDetxP/Fyytal5paB3JB4i2YdNWQfmP9nZp8wZz
	gCJvvNSjd/54b61MdATYnXMamT5WgdFtX2hga472QoZDlwJtryPv+yheGZPtMkNA7J9K
	WUIUqxyR+oHh1wCshoeGe3COxifiPmdpyo88gB4lEFWsMiO/roeYrJ4DW8shNL7ZsDhG
	/Xs7sQ6FL52U0zIpqjySfdWE+q/3ph5I1VhvqD5EihVHFhJWbodpK0qLgQK2qsDdMwwE
	zmJmsI0n+fESb8wnCdjcxZAYDsscx6J2z/zcclXHwQWpTVdojHMYtr9BIm79IJ4Z6R91
	k7aA==
X-Gm-Message-State: AN3rC/7VuBzRXVt8+JuC/dax7ehfEGS7oB93g2FxyfZ1mx+54xiqaY9d
	GbrcuQhpGfUNNRpLkGcH0EFllfdZ/aI5
X-Received: by 10.200.50.49 with SMTP id x46mr14880694qta.105.1493979029759;
	Fri, 05 May 2017 03:10:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Fri, 5 May 2017 03:10:09 -0700 (PDT)
In-Reply-To: <1493941692.3022.18.camel@gmail.com>
References: <20170503131153.1780-1-alexander.kanavin@linux.intel.com>
	<20170503131153.1780-3-alexander.kanavin@linux.intel.com>
	<1493836892.2405.4.camel@gmail.com>
	<CAJTo0LZ3O5au502TRqVUZY_gCT4r_9X-2Jtk+_-3o=u5j2UASg@mail.gmail.com>
	<cf767fe3-3c98-f32b-d27c-3f63b924ab7f@linux.intel.com>
	<CAJTo0LYDLu5zPf1EKrJKS-Hw-C=MumF8QXej_+i958AyWqy4CA@mail.gmail.com>
	<1493941692.3022.18.camel@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 May 2017 11:10:09 +0100
Message-ID: <CAJTo0LaaZx_-rpwOSV72Q4tS55bJOiVvUAJgX4PbhryDPtgaJw@mail.gmail.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] libpng12: remove the recipe
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
X-List-Received-Date: Fri, 05 May 2017 10:10:28 -0000
Content-Type: multipart/alternative; boundary=001a113577a25f023d054ec4192a

--001a113577a25f023d054ec4192a
Content-Type: text/plain; charset=UTF-8

On 5 May 2017 at 00:48, Max Krummenacher <max.oss.09@gmail.com> wrote:

> My concern at the moment is that anything removed now from oe-core will
> also be removed
> in oe-core pyro in the foreseeable future but the fix or relocation in
> meta-xyz will
> take time.
>

Releases only receive critical and security fixes, a recipe will never[1]
be removed once a release branch has frozen.


> Around the release of morty the same happened with libwnck3 which then
> made morty fail for
> anyone using libwnck3.
>

I think you're remembering wrong, or using master.

$ git show 5741419426c6f8255d55560e3a4721fa4c68a179
commit 5741419426c6f8255d55560e3a4721fa4c68a179
Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date:   Mon Oct 24 15:45:48 2016 +0300

    libwnck3: remove the recipe

    Nothing requires it in oe-core now, so it will be re-added to
meta-openembedded.

$ git branch -r --contains 5741419426c6f8255d55560e3a4721fa4c68a179 | grep
oe-core/
  oe-core/master
  oe-core/pyro

It was removed in master *after* morty branched, and was subsequently aded
to meta-oe.

Ross

[1] Almost never.  Don't think it's ever happened but we won't remove a
recipe from a stable release because we don't like it.

--001a113577a25f023d054ec4192a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 May 2017 at 00:48, Max Krummenacher <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:max.oss.09@gmail.com" target=3D"_blank">max.oss.09@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:r=
gb(204,204,204);padding-left:1ex"><div id=3D"gmail-:4uk" class=3D"gmail-a3s=
 gmail-aXjCH gmail-m15bd5dd783f0a02c">My concern at the moment is that anyt=
hing removed now from oe-core will also be removed<br>
in oe-core pyro in the foreseeable future but the fix or relocation in meta=
-xyz will<br>
take time.<br></div></blockquote><div><br></div><div>Releases only receive =
critical and security fixes, a recipe will never[1] be removed once a relea=
se branch has frozen.</div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-styl=
e:solid;border-left-color:rgb(204,204,204);padding-left:1ex"><div id=3D"gma=
il-:4uk" class=3D"gmail-a3s gmail-aXjCH gmail-m15bd5dd783f0a02c">
Around the release of morty the same happened with libwnck3 which then made=
 morty fail for<br>
anyone using libwnck3.</div></blockquote></div><br></div><div class=3D"gmai=
l_extra">I think you&#39;re remembering wrong, or using master.</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gma=
il_extra">$ git show 5741419426c6f8255d55560e3a4721fa4c68a179</div><div cla=
ss=3D"gmail_extra">commit 5741419426c6f8255d55560e3a4721fa4c68a179</div><di=
v class=3D"gmail_extra">Author: Alexander Kanavin &lt;<a href=3D"mailto:ale=
xander.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a>&gt;</=
div><div class=3D"gmail_extra">Date: =C2=A0 Mon Oct 24 15:45:48 2016 +0300<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0=
 =C2=A0 libwnck3: remove the recipe</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">=C2=A0 =C2=A0 Nothing requires it in oe-core =
now, so it will be re-added to meta-openembedded.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra">$ gi=
t branch -r --contains 5741419426c6f8255d55560e3a4721fa4c68a179 | grep oe-c=
ore/</div><div class=3D"gmail_extra">=C2=A0 oe-core/master</div><div class=
=3D"gmail_extra">=C2=A0 oe-core/pyro<br></div><div class=3D"gmail_extra"><b=
r></div><div class=3D"gmail_extra">It was removed in master *after* morty b=
ranched, and was subsequently aded to meta-oe.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div><div class=3D"gmail_extr=
a"><br></div></div></div><div class=3D"gmail_extra">[1] Almost never.=C2=A0=
 Don&#39;t think it&#39;s ever happened but we won&#39;t remove a recipe fr=
om a stable release because we don&#39;t like it.</div><div class=3D"gmail_=
extra"><br></div></div>

--001a113577a25f023d054ec4192a--
