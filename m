Return-Path: <kergoth@gmail.com>
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id A7CAC60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 15:16:23 +0000 (UTC)
Received: by vkhf67 with SMTP id f67so103429265vkh.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 08:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=6PSy3JNfHj5LhR3rckm6M0zBWbw6KdKQ2LTNNyYHh94=;
	b=YB+WTLUD2tgiukoeMRhrZi8eiYspmHwCtx4ebn2Adwqu1fMadcivVXsd7aHxtKCNKE
	vm9X5oSIFC44QiYWNO8kKDq+0Nk09n+I68LjVXp5FXCv8mXPikGGAlcXF1PmEwjimfqp
	M6n70jIffUWgmmOe8esqxiWqRNaqdajsX4XkuCB+dnQr2pbe08zbBknVQprMJOKOh56U
	P1u4J5RI/+uLeH/Oz2MLPObJCyF5tr6JVpfd1Qx6HZZ+pUXYFDTy3wTBoRK2vDDbbLaq
	szRLWFaBljPXx66JS1ftJqexbjsAVhnLnyjkVLknf5eW4BtCIBxAfeM1ODPEf5RXf4vl
	OsPQ==
X-Received: by 10.31.149.82 with SMTP id x79mr29037613vkd.111.1442416584002;
	Wed, 16 Sep 2015 08:16:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.31.203.2 with HTTP; Wed, 16 Sep 2015 08:16:04 -0700 (PDT)
In-Reply-To: <1442357793-20405-1-git-send-email-kergoth@gmail.com>
References: <1442357793-20405-1-git-send-email-kergoth@gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 16 Sep 2015 08:16:04 -0700
X-Google-Sender-Auth: IDPYVgzQsKQPW1gAx8nj1R3AIuw
Message-ID: <CABcZANkoCx76x8-LDwoNfJwZXeMo_h3K+c1qJkjzSdB9kOS2OQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH] devshell: symlink $TOPDIR to $WORKDIR/topdir
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
X-List-Received-Date: Wed, 16 Sep 2015 15:16:25 -0000
Content-Type: multipart/alternative; boundary=001a114263d01b9598051fdec83a

--001a114263d01b9598051fdec83a
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 15, 2015 at 3:56 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> It's quite common to need to copy files out of the devshell back to your
> layers, but most of the variables referring to such paths are not exported
> (and in some cases, should not be, as it'll affect buildsystems we run,
> e.g.
> TOPDIR/BUILDDIR). To resolve this while still making it easier to get files
> out of the devshell, create a ${WORKDIR}/topdir symlink to ${TOPDIR},
> removing
> it after exiting the devshell.
>
> [YOCTO #7670]
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>

This should probably have been an RFC, thinking about it, as I'm not
entirely happy with this implementation, but I can't think of a good
alternative, lacking a way to set unexported shell variables in the shell
spawned by the terminal, and there's no real way to do that, since we don't
know the shell the user is using. I think this is a decent alternative, if
not a pretty one. Thoughts welcome.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a114263d01b9598051fdec83a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Sep 15, 2015 at 3:56 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2uj" class=
=3D"a3s" style=3D"overflow:hidden">From: Christopher Larson &lt;<a href=3D"=
mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt;<br>
<br>
It&#39;s quite common to need to copy files out of the devshell back to you=
r<br>
layers, but most of the variables referring to such paths are not exported<=
br>
(and in some cases, should not be, as it&#39;ll affect buildsystems we run,=
 e.g.<br>
TOPDIR/BUILDDIR). To resolve this while still making it easier to get files=
<br>
out of the devshell, create a ${WORKDIR}/topdir symlink to ${TOPDIR}, remov=
ing<br>
it after exiting the devshell.<br>
<br>
[YOCTO #7670]<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;</div></blockquote></div><br>This shou=
ld probably have been an RFC, thinking about it, as I&#39;m not entirely ha=
ppy with this implementation, but I can&#39;t think of a good alternative, =
lacking a way to set unexported shell variables in the shell spawned by the=
 terminal, and there&#39;s no real way to do that, since we don&#39;t know =
the shell the user is using. I think this is a decent alternative, if not a=
 pretty one. Thoughts welcome.<br>-- <br><div class=3D"gmail_signature"><di=
v dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software E=
ngineer, Mentor Graphics</div></div>
</div></div>

--001a114263d01b9598051fdec83a--
