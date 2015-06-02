Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id AD9A2756CB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jun 2015 14:16:10 +0000 (UTC)
Received: by qgg60 with SMTP id 60so59194266qgg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Jun 2015 07:16:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yYnt04G5OZEkRrVLJfoFXwk60gcbWwLN/v1mpf77NNU=;
	b=kxTJYuV+csuMUmfGIofqA9XXMNY3JGDfuMaU68WsY9Ar/Sg1mt24wQRyW8SMthcb/u
	DOGfH+qkDWO7KuyAIsodYN35QTeRluaIqHkiWBCETdRLyFsnZ0wSsE1DHjRdn+5S+aZ2
	NwdGn1DzMFZe2sLbKyPlaKTr6/fIeIzPsVTQzRBLrNDDmneA+luIII5mhB8tNmAkoBdF
	/gjOe9K+dsOPQlrwlhsGQmFdBh1YIf8Pn5i/wk+po4MsjQrrMDh9GB+6DXtj0pYnolhA
	jPU6pmf9BOz5OQ9tgpf00sJVHHEurW8oWFSch+R8MfqJNJJLWN65ZlrXjmsgBhteAxWL
	jCQw==
X-Gm-Message-State: ALoCoQmnVLgvv1mbOLeXRpjPWoJzqJGRWPgjbxti4cYA9LzS7D84lkGq94u5iKyZoIMJ8Y4Dioq+
X-Received: by 10.55.18.155 with SMTP id 27mr48532718qks.36.1433254571192;
	Tue, 02 Jun 2015 07:16:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 2 Jun 2015 07:15:50 -0700 (PDT)
In-Reply-To: <5566EA64.5080600@kernelconcepts.de>
References: <1432122583-24497-1-git-send-email-florian.boor@kernelconcepts.de>
	<CAJTo0LbOKfUpUyor7AczZyffp7gQruYy3hYMqz+ewGxZzRc+mQ@mail.gmail.com>
	<555C896A.8020107@kernelconcepts.de>
	<CAP9ODKo7H5T3Thb+1SW9hGwkzxEbTzYJr2=fLraqje67ssHRpw@mail.gmail.com>
	<555C8BAC.7090603@kernelconcepts.de>
	<CAJTo0LYM_V=Ee5hzfhvK0OW224yZ7+TG+6iuQkk5WKxYHmJQeQ@mail.gmail.com>
	<555C90A4.3000407@kernelconcepts.de>
	<5566EA64.5080600@kernelconcepts.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Jun 2015 15:15:50 +0100
Message-ID: <CAJTo0LY1FrzSDhHJEOoH4Fg-sK9LsuV=J6zoaf76eEV1189XhA@mail.gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk-engines: Allow gtk-engines package to be empty in order to make the -dev package installable.
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
X-List-Received-Date: Tue, 02 Jun 2015 14:16:10 -0000
Content-Type: multipart/alternative; boundary=001a1147379696c739051789955b

--001a1147379696c739051789955b
Content-Type: text/plain; charset=UTF-8

On 28 May 2015 at 11:13, Florian Boor <florian.boor@kernelconcepts.de>
wrote:

> > ok great... then I'll change it to dropping the dependency of the -dev
> package
> > while I'm working on it anyway.
>
> hrm strange... somehow my new patch did not make it to the list. Anyone an
> idea
> if it ended up in some filter?
>

You mean this patch?

    gtk-engines: Make gtk-engines-dev installable by dropping dependency to
not generated gtk-engines package.

It made it to the list as it's been merged. :)

Ross

--001a1147379696c739051789955b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 28 May 2015 at 11:13, Florian Boor <span dir=3D"ltr">&lt;<a href=3D"mail=
to:florian.boor@kernelconcepts.de" target=3D"_blank">florian.boor@kernelcon=
cepts.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"">&gt; =
ok great... then I&#39;ll change it to dropping the dependency of the -dev =
package<br>
&gt; while I&#39;m working on it anyway.<br>
<br>
</span>hrm strange... somehow my new patch did not make it to the list. Any=
one an idea<br>
if it ended up in some filter?<div class=3D""><div id=3D":18r" class=3D"" t=
abindex=3D"0"></div></div></blockquote></div><br>You mean this patch?</div>=
<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0 =C2=
=A0 gtk-engines: Make gtk-engines-dev installable by dropping dependency to=
 not generated gtk-engines package.<br></div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">It made it to the list as it&#39;s been m=
erged. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1147379696c739051789955b--
