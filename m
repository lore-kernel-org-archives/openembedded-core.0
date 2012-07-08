Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SnoPT-0003ll-Ni
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 12:08:12 +0200
Received: by obcva7 with SMTP id va7so17639089obc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 02:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=c7unh+TyXUvRaKXecIsrgfR1A8Mpf4OJYoQtW0jEU6U=;
	b=g/0izYajMyCvQgsRZ6nBp5papjm0TRbZa7xTObm3QZEXEehE2aRqm2Oe/7bWxZJ+h/
	IfURsu9Kw3+8SQpD4EtFAUSDS88XelPMGaWTCkiT/zR/OPyu0rtEkZIBaB4zaeXprOR3
	VTa0lXcq7rmoxFVQqFi6CtovmE2ZBNXrTaYt/pgk0GwwLyKITtPQ833orFTY6zsoBxLr
	u4sEJaBpDRE5Ur1LqM9R1+qqubw7+aSmK4QLncG/03NEuUOwXLLyIR4Y+UdjO7s8JHmv
	15tQOe5utx02oiPnRwdTgP6zZuy29S04gwuxnHwU0Go00/0LR4we5hKGAbXMWAISnOSJ
	EJpw==
MIME-Version: 1.0
Received: by 10.50.94.163 with SMTP id dd3mr5979759igb.8.1341741422754; Sun,
	08 Jul 2012 02:57:02 -0700 (PDT)
Received: by 10.64.98.162 with HTTP; Sun, 8 Jul 2012 02:57:02 -0700 (PDT)
X-Originating-IP: [79.117.61.13]
Received: by 10.64.98.162 with HTTP; Sun, 8 Jul 2012 02:57:02 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207071212460.22356@oneiric>
References: <alpine.DEB.2.02.1207071126550.20571@oneiric>
	<4FF85E97.9010202@linux.intel.com>
	<alpine.DEB.2.02.1207071212460.22356@oneiric>
Date: Sun, 8 Jul 2012 12:57:02 +0300
Message-ID: <CAK18fxG2Ahi+qVcaw43vJCDiCUf8g+G3C-wYF0Fpv9d8dqXsvw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlv2tgUkzq54EksjrqMz3fA4rT4enKyXQNdb0jWxbtA91UF1fVFquV/r55os0/Za6rVFy2v
Subject: Re: what's the easiest way to see the difference some local configuration makes?
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
X-List-Received-Date: Sun, 08 Jul 2012 10:08:12 -0000
Content-Type: multipart/alternative; boundary=e89a8f2357fde23c4304c44e8432

--e89a8f2357fde23c4304c44e8432
Content-Type: text/plain; charset=ISO-8859-1

On Jul 7, 2012 7:14 PM, "Robert P. J. Day" <rpjday@crashcourse.ca> wrote:
>
> On Sat, 7 Jul 2012, Saul Wold wrote:
>
> > On 07/07/2012 08:43 AM, Robert P. J. Day wrote:
> > >
> > >    i recall that there's a current request to be able to list the
> > > packages and versions that relate *just* to the current target and
> > > machine, so i'm looking for any other way to do this so students can
> > > see the difference for themselves.
> > >
> > >    for example, i'm starting with a configuration of "qemuarm", and i
> > > can do a fetchall:
> > >
> > > $ bitbake -c fetchall core-image-minimal
> > >
> > > and let that run.  so far, so good -- i've now fetched everything
> > > required for this target.  if i repeat that command, obviously,
> > > nothing should change, and it doesn't.  (i don't even have to build
> > > the target, i'm just doing fetching for now.)
> > >
> > >    now let's say i add to my local.conf:
> > >
> > > IMAGE_INSTALL_append = " strace"
> > >
> > > i suspect there's an easier way to see this, but if i want to *prove*
> > > that the strace recipe would be part of the build, i can do:
> > >
> > > $ bitbake -c fetchall -n core-image-minimal     [dry run]
> > >
> > Have you tried bitbake -e which prints out all the variables and python
> > functions, you can then grep for ^IMAGE_INSTALL or what ever you expect
to
> > affect by your change
> >
> > Sau!
>
>    oh, that's already on my list, i was just trying to dig up
> clever(?) ways to show *only* what would change.

If you don't know what would change just save bitbake -e before and after
changes and meld / diff.

@g

--e89a8f2357fde23c4304c44e8432
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p><br>
On Jul 7, 2012 7:14 PM, &quot;Robert P. J. Day&quot; &lt;<a href=3D"mailto:=
rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>&gt; wrote:<br>
&gt;<br>
&gt; On Sat, 7 Jul 2012, Saul Wold wrote:<br>
&gt;<br>
&gt; &gt; On 07/07/2012 08:43 AM, Robert P. J. Day wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0i recall that there&#39;s a current request to be abl=
e to list the<br>
&gt; &gt; &gt; packages and versions that relate *just* to the current targ=
et and<br>
&gt; &gt; &gt; machine, so i&#39;m looking for any other way to do this so =
students can<br>
&gt; &gt; &gt; see the difference for themselves.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0for example, i&#39;m starting with a configuration of=
 &quot;qemuarm&quot;, and i<br>
&gt; &gt; &gt; can do a fetchall:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $ bitbake -c fetchall core-image-minimal<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; and let that run. =A0so far, so good -- i&#39;ve now fetched=
 everything<br>
&gt; &gt; &gt; required for this target. =A0if i repeat that command, obvio=
usly,<br>
&gt; &gt; &gt; nothing should change, and it doesn&#39;t. =A0(i don&#39;t e=
ven have to build<br>
&gt; &gt; &gt; the target, i&#39;m just doing fetching for now.)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; =A0 =A0now let&#39;s say i add to my local.conf:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; IMAGE_INSTALL_append =3D &quot; strace&quot;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; i suspect there&#39;s an easier way to see this, but if i wa=
nt to *prove*<br>
&gt; &gt; &gt; that the strace recipe would be part of the build, i can do:=
<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; $ bitbake -c fetchall -n core-image-minimal =A0 =A0 [dry run=
]<br>
&gt; &gt; &gt;<br>
&gt; &gt; Have you tried bitbake -e which prints out all the variables and =
python<br>
&gt; &gt; functions, you can then grep for ^IMAGE_INSTALL or what ever you =
expect to<br>
&gt; &gt; affect by your change<br>
&gt; &gt;<br>
&gt; &gt; Sau!<br>
&gt;<br>
&gt; =A0 =A0oh, that&#39;s already on my list, i was just trying to dig up<=
br>
&gt; clever(?) ways to show *only* what would change.</p>
<p>If you don&#39;t know what would change just save bitbake -e before and =
after changes and meld / diff.</p>
<p>@g<br>
</p>

--e89a8f2357fde23c4304c44e8432--
