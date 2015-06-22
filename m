Return-Path: <otavio.salvador@gmail.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id CC5E273D2F;
	Mon, 22 Jun 2015 14:27:29 +0000 (UTC)
Received: by pacyo7 with SMTP id yo7so31997605pac.2;
	Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=/GvLysZPpNtbh/8HS6pYc3e3Mw9gQTlGeORRO6/C9cU=;
	b=a8NHH586RWtCAJVCQ+t8FfomEZSxSXFvCLNCaa+QkoZ7kRDtkzJP7OmZ/3k/9FieEm
	IY/EqHqin4m0fHkE2j4woJduZ14Gc6RPirhUrtGrL8jpa87yR68WdzMv9BnpceUP1jgH
	onl6obqK+TIGUi6Rj5/fI/qa6VTmZVB3a0F3U/OTUY+eH9RkntdF81YFavH8RdZ9VMz9
	UNdvi2lN1O0DQoK70SCLnbLR2Lj4kn93jzMhSPuDIw5T9bMyhVsdj+ZaUVvrslcfJiPM
	la0llqPi/KaKGSpyQLHbGjIrzWY0/CmVkgws0dHiXM+v0+9tEZTXr8nHWP6cnmULvZnv
	pIcg==
MIME-Version: 1.0
X-Received: by 10.66.62.231 with SMTP id b7mr53078827pas.80.1434983250745;
	Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.70.34.109 with HTTP; Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
Received: by 10.70.34.109 with HTTP; Mon, 22 Jun 2015 07:27:30 -0700 (PDT)
In-Reply-To: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
References: <CAJTo0LaKEvtznsdfz8gLWFSLyb6Rx2XsgbYG_cfOrAm+W2UfEg@mail.gmail.com>
Date: Mon, 22 Jun 2015 11:27:30 -0300
X-Google-Sender-Auth: 5e3vSjFXbrkN5k2-1YXTG9VxKoY
Message-ID: <CAP9ODKq5Gg5-fv=ibhmeh_peXyL_z81q3RQd29Uh8iKrtOiw2Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Ross Burton <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Future of Qt4 recipes
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
X-List-Received-Date: Mon, 22 Jun 2015 14:27:32 -0000
Content-Type: multipart/alternative; boundary=001a11380f6aeb648405191c12c8

--001a11380f6aeb648405191c12c8
Content-Type: text/plain; charset=UTF-8

I vote for 2 as well.
Em 22/06/2015 07:44, "Burton, Ross" <ross.burton@intel.com> escreveu:

> Hi,
>
> So, Qt 4.8.7 was released last month[1].  Support for Qt4 stops at the end
> of 2015, and 4.8.7 is planned to be the last ever release of Qt4. It's
> still mandated by the long-awaited LSB 5 but I think it's fair to say that
> the majority of developers have moved to Qt5. So, what should we do with
> Qt4 moving forward?[2]  I see several options:
>
> 1) There's still lots of people using Qt4 in production, please keep it in
> oe-core!  (and revisit in six months time)
> 2) Move Qt4 recipes and classes to a meta-qt4 layer now so that oe-core
> 1.9 ships without Qt4, and anyone wanting full LSB compliance or Qt4 will
> need to add that layer to their distro.
>
> Personally, I vote for (2).  Any other comments?
>
> Ross
>
> [1] https://blog.qt.io/blog/2015/05/26/qt-4-8-7-released/
> [2] https://bugzilla.yoctoproject.org/show_bug.cgi?id=7812
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a11380f6aeb648405191c12c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I vote for 2 as well.</p>
<div class=3D"gmail_quote">Em 22/06/2015 07:44, &quot;Burton, Ross&quot; &l=
t;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; es=
creveu:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"=
ltr">Hi,<br><br><div>So, Qt 4.8.7 was released last month[1].=C2=A0 Support=
 for Qt4 stops at the end of 2015, and 4.8.7 is planned to be the last ever=
 release of Qt4. It&#39;s still mandated by the long-awaited LSB 5 but I th=
ink it&#39;s fair to say that the majority of developers have moved to Qt5.=
 So, what should we do with Qt4 moving forward?[2] =C2=A0I see several opti=
ons:</div><div><br></div><div>1) There&#39;s still lots of people using Qt4=
 in production, please keep it in oe-core! =C2=A0(and revisit in six months=
 time)</div><div>2) Move Qt4 recipes and classes to a meta-qt4 layer now so=
 that oe-core 1.9 ships without Qt4, and anyone wanting full LSB compliance=
 or Qt4 will need to add that layer to their distro.</div><div><br></div><d=
iv>Personally, I vote for (2).=C2=A0 Any other comments?</div><div><br></di=
v><div>Ross</div><div><br></div><div>[1] <a href=3D"https://blog.qt.io/blog=
/2015/05/26/qt-4-8-7-released/" target=3D"_blank">https://blog.qt.io/blog/2=
015/05/26/qt-4-8-7-released/</a></div><div>[2]=C2=A0<a href=3D"https://bugz=
illa.yoctoproject.org/show_bug.cgi?id=3D7812" target=3D"_blank">https://bug=
zilla.yoctoproject.org/show_bug.cgi?id=3D7812</a></div></div>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div>

--001a11380f6aeb648405191c12c8--
