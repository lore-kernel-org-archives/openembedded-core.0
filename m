Return-Path: <joaohf@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 47B176F725
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 15:47:08 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so15392591ykr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Mar 2014 08:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oOJqWBAR88dRwXSiBWbl6HaT8ITQYPiVHPkrRr++dGw=;
	b=LTrPYuBrGa5RDzl3asB4LPserxvReEuvn9VNQaDd71LNkI4NIeK7QgpeYFrP5alIQ9
	sGhCVVc9/xOls++XCFp3BQaiGtzHQbzJSttXxlcuJJ3lp+TmQFn+UasSWLYXDpBoKc7P
	yEjkOZw2lr3K43WuTYN9h7J+32etUr1KR6WvtmFORr1BG1EKIRihgbw2xxfoTg50AQ4P
	E9a8PbxV1qzsJH6WoEYmJoJ5UOCzqULjJrd4rVqglQHIpgaOMoNf3hrLOkDQky4eE15Y
	nwgN/Y7Y8ow394Qu3bSVt8u/bI80Wpvyvzm6lot5KDx6tGK6ULdL00jgu/xnf6vqkOGU
	WlXg==
MIME-Version: 1.0
X-Received: by 10.236.16.83 with SMTP id g59mr11135807yhg.14.1395071229284;
	Mon, 17 Mar 2014 08:47:09 -0700 (PDT)
Received: by 10.170.140.138 with HTTP; Mon, 17 Mar 2014 08:47:09 -0700 (PDT)
In-Reply-To: <CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>
References: <1394918271-14153-1-git-send-email-joaohf@gmail.com>
	<CAP9ODKoAeOS46F4LqnaMGfJ_5QJKo=vnnRLOgHU0sRC4imRz3Q@mail.gmail.com>
Date: Mon, 17 Mar 2014 12:47:09 -0300
Message-ID: <CANFVK7_uz3pr=WTdjqg8eXnfQzCSPnvaQq+kymud=YTj-8AV9g@mail.gmail.com>
From: =?UTF-8?Q?Jo=C3=A3o_Henrique_Freitas?= <joaohf@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] wic: Add --rootfs option to --source param
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
X-List-Received-Date: Mon, 17 Mar 2014 15:47:11 -0000
Content-Type: multipart/alternative; boundary=089e01634eee0ed64c04f4cf55ac

--089e01634eee0ed64c04f4cf55ac
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 17, 2014 at 11:53 AM, Otavio Salvador
<otavio@ossystems.com.br>wrote:

>
> So this allows you to include 'a directory' as source of a partition
> to be created, right?
>

Yes.


>
> If my understand is right, I like the feature. My only concern is
> people overusing it and adding contents which are not 'tracked' in the
> build system in a product release which seems attractive when we first
> think about it but cause some management, tracking and authenticity
> check problems in long term.
>
>
I don't know how to better address this from wic perspective. Usually
> we end doing multiple images as part of the build process for those
> special cases and I don't know how wic could be 'told' about those
> secondary rootfs existence.
>
>
I agree that this could be a problem. I will start to think a way to pass
--image param. Like this:

 part /standby --source rootfs --image=3Dcore-image-xpto \
     --ondisk sda --fstype=3Dext3 --label secondary --align 1024

So, wic could check it and add management, tracking, authenticity.

Do you have any suggestion?

Thanks.



> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>



--=20
Jo=C3=A3o Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil

--089e01634eee0ed64c04f4cf55ac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Mon, Mar 17, 2014 at 11:53 AM, Otavio Salvador <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@os=
systems.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D""><br>
</div>So this allows you to include &#39;a directory&#39; as source of a pa=
rtition<br>
to be created, right?<br></blockquote><div><br></div><div>Yes.<br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If my understand is right, I like the feature. My only concern is<br>
people overusing it and adding contents which are not &#39;tracked&#39; in =
the<br>
build system in a product release which seems attractive when we first<br>
think about it but cause some management, tracking and authenticity<br>
check problems in long term.<br>=C2=A0
<br></blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I don&#39;t know how to better address this from wic perspective. Usually<b=
r>
we end doing multiple images as part of the build process for those<br>
special cases and I don&#39;t know how wic could be &#39;told&#39; about th=
ose<br>
secondary rootfs existence.<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v><br></div><div>I agree that this could be a problem. I will start to thin=
k a way to pass --image param. Like this:<br><br>=C2=A0part /standby --sour=
ce rootfs --image=3Dcore-image-xpto \<br>
=C2=A0=C2=A0 =C2=A0 --ondisk sda --fstype=3Dext3 --label secondary --align =
1024<br><br></div><div>So, wic could check it and add management, tracking,=
 authenticity.<br><br></div><div>Do you have any suggestion?<br><br></div><=
div>Thanks.<br>
</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><span class=3D""><font color=3D"#888888">
--<br>
Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossyst=
ems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://code.ossystems.=
com.br" target=3D"_blank">http://code.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=
=3D"ltr">Jo=C3=A3o Henrique Ferreira de Freitas - <a href=3D"http://joaohf_=
at_gmail.com" target=3D"_blank">joaohf_at_gmail.com</a><br>Campinas-SP-Bras=
il</div>
</div></div>

--089e01634eee0ed64c04f4cf55ac--
