Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TLsx0-0003nC-Ut
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 11:51:39 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so203253iac.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Oct 2012 02:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=ObFlIuenCFVbgiwRQLy4RzJKzTk4IAnG9sqIkxq/wIk=;
	b=bnEqdWHYK5mH1irDiSzc8x8nWesdhr97gvSvvYqEFKLemn1aIImOKZt4BTKJCAR4ew
	eQuaGiJaExy1FdUEAu7m1YSONGD2RBKkj7uyzORIsfyFcvhQew2k6dLkXg5MeehDvYHp
	E72cfCRPVUmq0gA12IvqOAMQ/AEyv0OYahxC5O35Gn+aqHWrJCCQj4gMAKWIHgQCuASv
	WdNBiGv/G4KRh9KF1Lc6lf0tmi4i9lnKYhbTiVZTPO8oV9sGwiKo33lbMyfxi+JZjrWf
	sndPUdbL1JQa7X7jVYIhUk1R9o4McNLk203DkF7UJmETzXsoPF3oUVwTYnSRBtgNSeoD
	GgYg==
Received: by 10.50.100.137 with SMTP id ey9mr4638225igb.57.1349861909678; Wed,
	10 Oct 2012 02:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Wed, 10 Oct 2012 02:38:09 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAJTo0LZxZYY-w78mP2mQSwOJ+4E9QSPvZWfFp+2AWzDjQWWmQQ@mail.gmail.com>
References: <CAK18fxGx+aH7nnGOa-36hAJkUQJEaEzrqVK9HOZ_gPs_w71-fA@mail.gmail.com>
	<CAJTo0LZxZYY-w78mP2mQSwOJ+4E9QSPvZWfFp+2AWzDjQWWmQQ@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Wed, 10 Oct 2012 12:38:09 +0300
Message-ID: <CAK18fxFQYHv0YaugocFN1OBCoypBdeqQmOBJ+EFSuLn5eq0n6w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Gm-Message-State: ALoCoQniGysI99NSp2Q7frzatJMjzz/0fFpd8PGpVzsgmjJY/cvsgLlL7nE9zrzjC6FhBYdz+mSg
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: Systemd fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Oct 2012 09:51:39 -0000
Content-Type: multipart/alternative; boundary=e89a8f23532b9f4a9e04cbb1372f

--e89a8f23532b9f4a9e04cbb1372f
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 8, 2012 at 7:05 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 8 October 2012 16:45, Andrei Gherzan <andrei@gherzan.ro> wrote:
> >
> tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/systemd-git-r7/git/src/journal/journal-verify.c:69:
> > undefined reference to `uncompress_blob'
>
> See [oe] [meta-systemd][PATCH] systemd: Add patch so we can compile
> without xz, from 14th September.  Obviously it wasn't merged.
>
> Ross
>

Thank you.

Above that
http://cgit.freedesktop.org/systemd/systemd/patch/?id=48b617399d7d8446c5310b2568b2af6f13331b4c
should
be applied too.

ag

--e89a8f23532b9f4a9e04cbb1372f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Oct 8, 2012 at 7:05 PM, Burton, Ross <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

<div class=3D"im">On 8 October 2012 16:45, Andrei Gherzan &lt;<a href=3D"ma=
ilto:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>
&gt; tmp-eglibc-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/systemd-git-r7=
/git/src/journal/journal-verify.c:69:<br>
&gt; undefined reference to `uncompress_blob&#39;<br>
<br>
</div>See [oe] [meta-systemd][PATCH] systemd: Add patch so we can compile<b=
r>
without xz, from 14th September. =A0Obviously it wasn&#39;t merged.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br><div>Thank you.=A0</div><div><br></div=
><div>Above that=A0<a href=3D"http://cgit.freedesktop.org/systemd/systemd/p=
atch/?id=3D48b617399d7d8446c5310b2568b2af6f13331b4c">http://cgit.freedeskto=
p.org/systemd/systemd/patch/?id=3D48b617399d7d8446c5310b2568b2af6f13331b4c<=
/a>=A0should be applied too.</div>

<div><br></div><div>ag</div>

--e89a8f23532b9f4a9e04cbb1372f--
