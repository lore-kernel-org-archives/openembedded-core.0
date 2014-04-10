Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id CECA365D8C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 14:50:31 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id w7so2396314lbi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Apr 2014 07:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=l9BHNMGdPyW+CXNqgO4Yt3ouLNMtZVcLnbLP+b+9pRE=;
	b=g/LRokYjySNBVhs5MopEW4T77M0AqwjAGndWKZ0lQ6W8mcROzhCuYNDwa/qj6julz2
	Z1sDXe54laDI4CKHaHAdE6JsPaKuc69H2bF44lxwND0Adg2PrQozajt0ky/Xl31kP4qE
	YjEDvsx7XAWOIbkeO5n/Wu+vgWj0mAe0FkLkPtsXc35JidijtfFUJo/Wm0whedv97yNg
	NotSbdZt9P8cPTG1qRCQcxWhXnkXOwXjwQAbca6aJ8Of8jUuEcKErN9CA9bsz18CeRX5
	LZNoOSrhWwtRBlLAiPsbOGAATzCMVqS8bi2egsIj8mF06RZnciE3h5MhPdlGnaH/799T
	ke7A==
X-Received: by 10.112.128.231 with SMTP id nr7mr12081060lbb.9.1397141431884;
	Thu, 10 Apr 2014 07:50:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.194 with HTTP; Thu, 10 Apr 2014 07:50:11 -0700 (PDT)
In-Reply-To: <20140410144540.GA30915@mcrowe.com>
References: <1396965083-15863-1-git-send-email-mac@mcrowe.com>
	<1396965083-15863-2-git-send-email-mac@mcrowe.com>
	<CABcZANnp_AN2Tjnsc=UGougBJ511cy+K52d++h6Y12nts0vBCw@mail.gmail.com>
	<20140410144540.GA30915@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 10 Apr 2014 07:50:11 -0700
X-Google-Sender-Auth: KlCr131_mnkuz8kXSsSQlzDuoR4
Message-ID: <CABcZAN=-kuddW-nHGX1VftGLW7NUxQU=qsf-000hu3Aguz9oZw@mail.gmail.com>
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
X-List-Received-Date: Thu, 10 Apr 2014 14:50:32 -0000
Content-Type: multipart/alternative; boundary=047d7b343d20bfa1eb04f6b15610

--047d7b343d20bfa1eb04f6b15610
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 10, 2014 at 7:45 AM, Mike Crowe <mac@mcrowe.com> wrote:

> On Tuesday 08 April 2014 at 09:37:32 -0700, Chris Larson wrote:
> > On Tue, Apr 8, 2014 at 6:51 AM, Mike Crowe <mac@mcrowe.com> wrote:
> >
> > > The cmake recipe doesn't depend on libacl yet cmake will detect
> libacl.h
> > > and use it by default. This risks build failures if libacl.h is
> unstaged
> > > during the build and it also means that the build cmake will sometimes
> > > support ACLs and sometimes not.
> > >
> >
> > Is this not also a concern for the non-native recipe? And wouldn't it be
> > better yet to use PACKAGECONFIG, rather than hardcoding the disable of
> acl
> > support?
>
> libacl is used by cmake's internal libarchive implementation. The
> cmake-native recipe makes use of that but the non-native cmake recipe
> depends on the real libarchive so cmake doesn't use libacl itself.
>

Ah, understood. Nevermind then, it's likely not worthwhile to switch it to
PACKAGECONFIG, but I wanted to confirm. Thanks!
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b343d20bfa1eb04f6b15610
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Apr 10, 2014 at 7:45 AM, Mike Crowe <span dir=3D"ltr">&lt;<a href=
=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">

<div class=3D"">On Tuesday 08 April 2014 at 09:37:32 -0700, Chris Larson wr=
ote:<br>
&gt; On Tue, Apr 8, 2014 at 6:51 AM, Mike Crowe &lt;<a href=3D"mailto:mac@m=
crowe.com">mac@mcrowe.com</a>&gt; wrote:<br>
&gt;<br>
&gt; &gt; The cmake recipe doesn&#39;t depend on libacl yet cmake will dete=
ct libacl.h<br>
&gt; &gt; and use it by default. This risks build failures if libacl.h is u=
nstaged<br>
&gt; &gt; during the build and it also means that the build cmake will some=
times<br>
&gt; &gt; support ACLs and sometimes not.<br>
&gt; &gt;<br>
&gt;<br>
&gt; Is this not also a concern for the non-native recipe? And wouldn&#39;t=
 it be<br>
&gt; better yet to use PACKAGECONFIG, rather than hardcoding the disable of=
 acl<br>
&gt; support?<br>
<br>
</div>libacl is used by cmake&#39;s internal libarchive implementation. The=
<br>
cmake-native recipe makes use of that but the non-native cmake recipe<br>
depends on the real libarchive so cmake doesn&#39;t use libacl itself.<br><=
/blockquote><div><br></div><div>Ah, understood. Nevermind then, it&#39;s li=
kely not worthwhile to switch it to PACKAGECONFIG, but I wanted to confirm.=
 Thanks!</div>

</div>-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics
</div></div>

--047d7b343d20bfa1eb04f6b15610--
