Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgTKV-0000v0-2e
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 05:44:59 +0100
Received: by mail-wi0-f169.google.com with SMTP id hq12so146585wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2012 20:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zpN7ZKQTK4l8kYvAfm5wcC9hitdVqsvu64PXwDgmBVY=;
	b=sxhjSVnUBZ5SgIYyLr48PYkxDrzjz+x1nj7876lnI3JURjy/oZLADJczQbdkHgOF1X
	Utka4e9JCWWsS0zygGOd1EgvUgKsdj1F0AV66nnbCYk+5HARmNy+Wu2kdgX7Huezz/yh
	B4esKX57TcxrJ+lsShBaADZVZfTCkRqVQiwolWZOP6uheszP13RAn24349Ta7XwrXsMf
	g/doyLXJYS/pZ4qnM6iO3WGo8Z/SnED7gN90siyQ89l/DKwPyTpD+sc+FdlPupox31HW
	GFsGqp+qJU5f/XA9iQI+ZfzGiG4Pot5lHUIWkEDLCiyVGkSIgmDAADOj11up73uuKZ/m
	CSIw==
MIME-Version: 1.0
Received: by 10.180.7.199 with SMTP id l7mr362633wia.15.1354768234454; Wed, 05
	Dec 2012 20:30:34 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 5 Dec 2012 20:30:34 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Wed, 5 Dec 2012 20:30:34 -0800 (PST)
In-Reply-To: <lywqwwglm8.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1354731942.git.Martin.Jansa@gmail.com>
	<8184c008606ece423da0122a9fa6087509dfa0f5.1354731942.git.Martin.Jansa@gmail.com>
	<lyehj48gmo.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20121205193523.GG3396@jama.jama.net>
	<lywqwwglm8.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Thu, 6 Dec 2012 05:30:34 +0100
Message-ID: <CA+chaQef1QfEjrvVwPk4Uc5LrVUZoQq62PjW2g4iZ1LwRN6pOw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
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
X-List-Received-Date: Thu, 06 Dec 2012 04:44:59 -0000
Content-Type: multipart/alternative; boundary=f46d044404905e1d8904d0278f37

--f46d044404905e1d8904d0278f37
Content-Type: text/plain; charset=UTF-8

That would match .*/var/pseudo/too/bar,wouldn't it? but true that making
that group optional is probably easier to read.. But who doesn't read
regexps fluently nowadays? :)
On Dec 5, 2012 11:49 PM, "Enrico Scholz" <enrico.scholz@sigma-chemnitz.de>
wrote:

> Martin Jansa <martin.jansa@gmail.com> writes:
>
> > .*/var/pseudo
> > and
> > .*/var/pseudo/somefile$
> >
> > which matches also /var/pseudosomepath, I can split it in 2 regexps if
> > that's likely to show in sysroot, or use "\/var\/pseudo\($\|\/[^\/]*$\)"
>
> A basic regexp '/var/pseudo\(/.*\)\?$' should suffice.  Btw, to avoid
> escaping of '/', you can write
>
>   sed -i "\!${var}!d"
>
>
> Enrico
>

--f46d044404905e1d8904d0278f37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">That would match .*/var/pseudo/too/bar,wouldn&#39;t it? but =
true that making that group optional is probably easier to read.. But who d=
oesn&#39;t read regexps fluently nowadays? :)</p>
<div class=3D"gmail_quote">On Dec 5, 2012 11:49 PM, &quot;Enrico Scholz&quo=
t; &lt;<a href=3D"mailto:enrico.scholz@sigma-chemnitz.de">enrico.scholz@sig=
ma-chemnitz.de</a>&gt; wrote:<br type=3D"attribution"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gma=
il.com</a>&gt; writes:<br>
<br>
&gt; .*/var/pseudo<br>
&gt; and<br>
&gt; .*/var/pseudo/somefile$<br>
&gt;<br>
&gt; which matches also /var/pseudosomepath, I can split it in 2 regexps if=
<br>
&gt; that&#39;s likely to show in sysroot, or use &quot;\/var\/pseudo\($\|\=
/[^\/]*$\)&quot;<br>
<br>
A basic regexp &#39;/var/pseudo\(/.*\)\?$&#39; should suffice. =C2=A0Btw, t=
o avoid<br>
escaping of &#39;/&#39;, you can write<br>
<br>
=C2=A0 sed -i &quot;\!${var}!d&quot;<br>
<br>
<br>
Enrico<br>
</blockquote></div>

--f46d044404905e1d8904d0278f37--
