Return-Path: <kergoth@gmail.com>
Received: from mail-bk0-f52.google.com (mail-bk0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6419060C14
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Apr 2014 16:37:52 +0000 (UTC)
Received: by mail-bk0-f52.google.com with SMTP id my13so742294bkb.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Apr 2014 09:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=Oq3q7jpEcmd6uV2i3uKslpTXFw71ffKDBjPfnT//cE0=;
	b=kw5lB6hOb+tnY421FhTWbC48FKi4YalmNdDiSYhN31z33wcbRFunxvx0NOT875u6K9
	Y4Wn1W4tAkrOb8wXwNeqnZwVpfopE2MA8tpAmolevG8+49H5CY3tZvEk03tHm0Tu6jZP
	pR+6TEi3qjYeKx3K5s2/fK6Kd19dWfdux2KxpHzmBLEkQ1Uy76HFvYSQZCFR7IIzUXMb
	PgpQK8tgxQZ4PhxL9aLi1ka4sIzdbRme+yD2VO3AkoPrpeIU8kN8Acto4dCuAqmTimSH
	mlJw4IpH3bPmRhZHXDOx+qNK547rFD8ts+vZQyw+pH6+0zSDdJaOPdforq/+q37CIdnt
	KL6w==
X-Received: by 10.153.7.69 with SMTP id da5mr2582552lad.38.1396975072591; Tue,
	08 Apr 2014 09:37:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Tue, 8 Apr 2014 09:37:32 -0700 (PDT)
In-Reply-To: <1396965083-15863-2-git-send-email-mac@mcrowe.com>
References: <1396965083-15863-1-git-send-email-mac@mcrowe.com>
	<1396965083-15863-2-git-send-email-mac@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 8 Apr 2014 09:37:32 -0700
X-Google-Sender-Auth: sPdyHK_SHZgeQRUXggtrOxkLPVI
Message-ID: <CABcZANnp_AN2Tjnsc=UGougBJ511cy+K52d++h6Y12nts0vBCw@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cmake: Avoid accidentally including libacl.h
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
X-List-Received-Date: Tue, 08 Apr 2014 16:37:56 -0000
Content-Type: multipart/alternative; boundary=001a11345630f6464404f68a9ad7

--001a11345630f6464404f68a9ad7
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 8, 2014 at 6:51 AM, Mike Crowe <mac@mcrowe.com> wrote:

> The cmake recipe doesn't depend on libacl yet cmake will detect libacl.h
> and use it by default. This risks build failures if libacl.h is unstaged
> during the build and it also means that the build cmake will sometimes
> support ACLs and sometimes not.
>

Is this not also a concern for the non-native recipe? And wouldn't it be
better yet to use PACKAGECONFIG, rather than hardcoding the disable of acl
support?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11345630f6464404f68a9ad7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Apr 8, 2014 at 6:51 AM, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D=
"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">

<div id=3D":m5" class=3D"a3s" style=3D"overflow:hidden">The cmake recipe do=
esn&#39;t depend on libacl yet cmake will detect libacl.h<br>
and use it by default. This risks build failures if libacl.h is unstaged<br=
>
during the build and it also means that the build cmake will sometimes<br>
support ACLs and sometimes not.</div></blockquote></div><br>Is this not als=
o a concern for the non-native recipe? And wouldn&#39;t it be better yet to=
 use PACKAGECONFIG, rather than hardcoding the disable of acl support?<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11345630f6464404f68a9ad7--
