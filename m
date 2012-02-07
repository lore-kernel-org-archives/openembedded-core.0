Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Rukr7-0004Xv-My
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 14:13:09 +0100
Received: by eekd41 with SMTP id d41so2146369eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 05:05:07 -0800 (PST)
Received: by 10.14.119.197 with SMTP id n45mr6917011eeh.72.1328619907297; Tue,
	07 Feb 2012 05:05:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.213.114.18 with HTTP; Tue, 7 Feb 2012 05:04:47 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <F229F287-890C-429C-BE74-8E38AB5E0C25@dominion.thruhere.net>
References: <1328613869-19250-1-git-send-email-andrei@gherzan.ro>
	<F229F287-890C-429C-BE74-8E38AB5E0C25@dominion.thruhere.net>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 7 Feb 2012 15:04:47 +0200
Message-ID: <CAK18fxFPfknw2GFTaK1oh2tqLKvyyTOFfj=3pPoJe=gjeqH+tg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] nspr: Integrate version 4.8.9
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2012 13:13:09 -0000
Content-Type: multipart/alternative; boundary=90e6ba539f389db2a504b85f6db8

--90e6ba539f389db2a504b85f6db8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 7, 2012 at 14:12, Koen Kooi <koen@dominion.thruhere.net> wrote:

>
> Op 7 feb. 2012, om 12:24 heeft Andrei Gherzan het volgende geschreven:
>
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > Signed-off-by: Sergey 'Jin' Bostandzhyan <jin@mediatomb.cc>
> > ---
> > meta/recipes-support/nspr/files/nspr.pc |   11 +++++++++
> > meta/recipes-support/nspr/nspr_4.8.9.bb |   36
> +++++++++++++++++++++++++++++++
> > 2 files changed, 47 insertions(+), 0 deletions(-)
> > create mode 100644 meta/recipes-support/nspr/files/nspr.pc
> > create mode 100644 meta/recipes-support/nspr/nspr_4.8.9.bb
> >
> > diff --git a/meta/recipes-support/nspr/files/nspr.pc
> b/meta/recipes-support/nspr/files/nspr.pc
> > new file mode 100644
> > index 0000000..c3aed84
> > --- /dev/null
> > +++ b/meta/recipes-support/nspr/files/nspr.pc
> > @@ -0,0 +1,11 @@
> > +os_libs=-lpthread -ldl
> > +prefix=/usr
> > +exec_prefix=/usr
> > +libdir=/usr/lib
> > +includedir=/usr/include
>
> The above hardcodes an fs layout that isn't true for e.g. micro
>
>
A pc was the only way to make js "see" nspr.  Actually it was Jin's idea
and i found it accurate for my use-case.
Koen, on micro how these hardcodes should look like?

--90e6ba539f389db2a504b85f6db8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Feb 7, 2012 at 14:12, Koen Kooi <span di=
r=3D"ltr">&lt;<a href=3D"mailto:koen@dominion.thruhere.net">koen@dominion.t=
hruhere.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
Op 7 feb. 2012, om 12:24 heeft Andrei Gherzan het volgende geschreven:<br>
<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; Signed-off-by: Sergey &#39;Jin&#39; Bostandzhyan &lt;jin@mediatomb.cc&=
gt;<br>
&gt; ---<br>
&gt; meta/recipes-support/nspr/files/nspr.pc | =A0 11 +++++++++<br>
&gt; meta/recipes-support/nspr/<a href=3D"http://nspr_4.8.9.bb" target=3D"_=
blank">nspr_4.8.9.bb</a> | =A0 36 +++++++++++++++++++++++++++++++<br>
&gt; 2 files changed, 47 insertions(+), 0 deletions(-)<br>
&gt; create mode 100644 meta/recipes-support/nspr/files/nspr.pc<br>
&gt; create mode 100644 meta/recipes-support/nspr/<a href=3D"http://nspr_4.=
8.9.bb" target=3D"_blank">nspr_4.8.9.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/nspr/files/nspr.pc b/meta/recipes-su=
pport/nspr/files/nspr.pc<br>
&gt; new file mode 100644<br>
&gt; index 0000000..c3aed84<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/nspr/files/nspr.pc<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +os_libs=3D-lpthread -ldl<br>
&gt; +prefix=3D/usr<br>
&gt; +exec_prefix=3D/usr<br>
&gt; +libdir=3D/usr/lib<br>
&gt; +includedir=3D/usr/include<br>
<br>
The above hardcodes an fs layout that isn&#39;t true for e.g. micro<br>
<br></blockquote><div><br></div><div>A pc was the only way to make js &quot=
;see&quot; nspr. =A0Actually it was Jin&#39;s idea and i found it accurate =
for my=A0use-case.=A0</div><div>Koen, on micro how these hardcodes=A0should=
=A0look like?</div>

<div><br></div></div>

--90e6ba539f389db2a504b85f6db8--
