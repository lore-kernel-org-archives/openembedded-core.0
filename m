Return-Path: <kergoth@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0CE256028B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 22:35:10 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id w10so946034lbi.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 15:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=e/0DBT6UVQL6aYa3Ti2133RqN3iyJ9ejKM/Zj+b/x9k=;
	b=f4gagx3GSr0dm5pVqKafywhWIOaDjUYdfZYpsFiZ9iFzo1cMTv8KU8IrrUh9RwmWeO
	TkckAMgLqntMirRtLL0zGkAUcsU/dv4k4B1BHbWYW1tbnh/TMFSqOC6Ur9skaa76LI3k
	aFO3X809GxhsijPaVtk25Rg5/6W8yzFGwpQxunSljvrIWMOtg+qTwVac0K2rrwgl1d6R
	TK6XryisrrjQgdaDjLMO7JrR7ImW3hiiC+hZYTCTfViQtv2RzaM4BDpoM84slQM5pP9z
	i81fNAZ0oNDiOJxZdLaP97Fcos6NXgeOBgJehlhjbcNPtY7rSEOGNV9rPAFkkVmXQz65
	X2Bw==
X-Received: by 10.112.140.231 with SMTP id rj7mr17784585lbb.16.1374705310767; 
	Wed, 24 Jul 2013 15:35:10 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.17.67 with HTTP; Wed, 24 Jul 2013 15:34:50 -0700 (PDT)
In-Reply-To: <CAP9ODKouv4sp08h5dnm4M=4bfhewoqSSqgPiTiQm=VyN7=gZCQ@mail.gmail.com>
References: <CABcZANmOQBbYKAk145vSMZn2ag1Us=ySmjq_sECCrscQCqk+dg@mail.gmail.com>
	<CAP9ODKouv4sp08h5dnm4M=4bfhewoqSSqgPiTiQm=VyN7=gZCQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 24 Jul 2013 15:34:50 -0700
X-Google-Sender-Auth: 3H3twJb6PJbkOwIOO_CMlhXlSJU
Message-ID: <CABcZAN=Kn_V82JE3e=781cHBd6WwH9=96wZx=o=u_z6X89Vg=w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: meta-ro-rootfs approach and volatiles vs tmpfiles.d
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
X-List-Received-Date: Wed, 24 Jul 2013 22:35:11 -0000
Content-Type: multipart/alternative; boundary=001a11c26a30b8214904e2498586

--001a11c26a30b8214904e2498586
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 24, 2013 at 2:51 PM, Otavio Salvador <otavio@ossystems.com.br>wrote:

> On Wed, Jul 24, 2013 at 3:54 PM, Chris Larson <clarson@kergoth.com> wrote:
> ...
> > The standalone systemd-tmpfiles recipe I've created has a fairly small
> set
> > of dependencies: intltool-native, dbus, libcap. Given this, I'd like to
> > propose transitioning away from populate-volatiles to systemd-tmpfiles,
> even
> > for non-systemd images. I think that the update-tmpfiles shell script
> may be
> > of use in a transition, but before we even begin discussing a transition
> > path, I'd like to request comments on the notion of moving to it at all.
>
> I think it shouldn't be hard to make an C app or script which could
> parse systemd-tmpfiles and use this for non-systemd systems. What do
> you think?
>

I considered this too, but systemd-tmpfiles supports quite a lot more than
volatiles, for example restoring selinux labels. Maybe that sounds fun to
you, but it sounded like more trouble than it was worth to me, given
systemd-tmpfiles can be used without systemd :) But yes, it's definitely
another option to consider.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c26a30b8214904e2498586
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 24, 2013 at 2:51 PM, Otavio Salvador <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.c=
om.br</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":zx" style=3D"overflow:hidden">On=
 Wed, Jul 24, 2013 at 3:54 PM, Chris Larson &lt;<a href=3D"mailto:clarson@k=
ergoth.com">clarson@kergoth.com</a>&gt; wrote:<br>


...<br>
<div class=3D"im">&gt; The standalone systemd-tmpfiles recipe I&#39;ve crea=
ted has a fairly small set<br>
&gt; of dependencies: intltool-native, dbus, libcap. Given this, I&#39;d li=
ke to<br>
&gt; propose transitioning away from populate-volatiles to systemd-tmpfiles=
, even<br>
&gt; for non-systemd images. I think that the update-tmpfiles shell script =
may be<br>
&gt; of use in a transition, but before we even begin discussing a transiti=
on<br>
&gt; path, I&#39;d like to request comments on the notion of moving to it a=
t all.<br>
<br>
</div>I think it shouldn&#39;t be hard to make an C app or script which cou=
ld<br>
parse systemd-tmpfiles and use this for non-systemd systems. What do<br>
you think?</div></blockquote></div><br>I considered this too, but systemd-t=
mpfiles supports quite a lot more than volatiles, for example restoring sel=
inux labels. Maybe that sounds fun to you, but it sounded like more trouble=
 than it was worth to me, given systemd-tmpfiles can be used without system=
d :) But yes, it&#39;s definitely another option to consider.=C2=A0<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c26a30b8214904e2498586--
