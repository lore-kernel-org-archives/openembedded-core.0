Return-Path: <danismostlikely@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id E647F6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Feb 2015 03:40:44 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id n4so29441265qaq.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 19:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=TsjR+/KTiowTLAvqVy8wEamhkZHTvg7zySMxh1V7wXc=;
	b=vg6zz6dheLn5TarIY4Go81SMbAsVW/nNXznEiGsA6pb9ofQTEaIH3tCIlPOcH8oqBz
	ZYFPOsrzkJ9WgL+YMLG7L3HkYODdqynOZOllAUPXQ6rVICM4BWQsxpuXcKlcdpQe97tv
	Y1/CLZxJe1v7shnTn12aRpW9lg3oLpKptmFkaMmKBlU14SI91avdqc/k+mW/NwTpzGa7
	HLlgkbQ4toGBQFbHL6iRA5WsdYmKnm9XFEGvYftCrnXHvznQ3ZP0gRYjEYtF04fhhc2M
	G6blyjGrC1fO7KqOQkPD30dAUC2iAn5om4C6ZZHRjpDVeLdhjqKnCnEsmGHG/P0SI2OX
	Y/kg==
MIME-Version: 1.0
X-Received: by 10.140.41.169 with SMTP id z38mr786646qgz.56.1424230845592;
	Tue, 17 Feb 2015 19:40:45 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Tue, 17 Feb 2015 19:40:45 -0800 (PST)
Received: by 10.96.118.39 with HTTP; Tue, 17 Feb 2015 19:40:45 -0800 (PST)
In-Reply-To: <54E375B2.9080002@windriver.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
	<54E3723B.9050606@windriver.com>
	<CABcZAN=4puvBHBwH72ioVdGHpfSO5kngJGCWrJgED8xO_4xQkw@mail.gmail.com>
	<54E375B2.9080002@windriver.com>
Date: Tue, 17 Feb 2015 21:40:45 -0600
Message-ID: <CACS+7ZTaJgfBkDOzSsnPqoi+MCwo9_46sC1hr8o9NpQMGwkzhw@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 18 Feb 2015 03:40:45 -0000
Content-Type: multipart/alternative; boundary=001a11c11dbaa13aac050f549523

--001a11c11dbaa13aac050f549523
Content-Type: text/plain; charset=UTF-8

On 17 Feb 2015 11:09, "Mark Hatle" <mark.hatle@windriver.com> wrote:
>
> On 2/17/15 10:57 AM, Christopher Larson wrote:
> >
> > On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle <mark.hatle@windriver.com
> > <mailto:mark.hatle@windriver.com>> wrote:
> >
> >     On 2/17/15 7:42 AM, Patrick Ohly wrote:
> >     > os.walk() returns symlinks to directories in the "dirs" lists,
> >     > but then never enters them by default. As a result, the old
> >     > code applied neither the directory handling (because that
> >     > is active once a directory gets entered) nor the file handling,
> >     > and thus never packaged such symlinks.
> >     >
> >     > The fix is simple: find such special directory entries and move
> >     > them to the "files" list.
> >
> >     I'm curious, what is the problem that is being fixed with this.
> >
> >     Normally you don't want to walk into symlinks to directories, as
either you want
> >     to capture the symlink itself -- or the symlink is pointing to
something you
> >     don't have access to when packaging (i.e. /proc).
> >
> >
> > This patch doesn't make it walk into the directory symlinks, it moves
them into
> > the files list rather than the dirs list so they'll be captured
themselves, as
> > far as I can tell from reading it.
>
> Ok.. I missed that bit.. I'm still curious what this fixes.
>

I haven't tried myself, but I expect it helps with the /usr merge.

> --Mark
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a11c11dbaa13aac050f549523
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On 17 Feb 2015 11:09, &quot;Mark Hatle&quot; &lt;<a href=3D"mailto:mark.hat=
le@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 2/17/15 10:57 AM, Christopher Larson wrote:<br>
&gt; &gt;<br>
&gt; &gt; On Tue, Feb 17, 2015 at 9:54 AM, Mark Hatle &lt;<a href=3D"mailto=
:mark.hatle@windriver.com">mark.hatle@windriver.com</a><br>
&gt; &gt; &lt;mailto:<a href=3D"mailto:mark.hatle@windriver.com">mark.hatle=
@windriver.com</a>&gt;&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0On 2/17/15 7:42 AM, Patrick Ohly wrote:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; os.walk() returns symlinks to directories=
 in the &quot;dirs&quot; lists,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; but then never enters them by default. As=
 a result, the old<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; code applied neither the directory handli=
ng (because that<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; is active once a directory gets entered) =
nor the file handling,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; and thus never packaged such symlinks.<br=
>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; The fix is simple: find such special dire=
ctory entries and move<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0&gt; them to the &quot;files&quot; list.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0I&#39;m curious, what is the problem that is b=
eing fixed with this.<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0Normally you don&#39;t want to walk into symli=
nks to directories, as either you want<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0to capture the symlink itself -- or the symlin=
k is pointing to something you<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0don&#39;t have access to when packaging (i.e. =
/proc).<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; This patch doesn&#39;t make it walk into the directory symlinks, =
it moves them into<br>
&gt; &gt; the files list rather than the dirs list so they&#39;ll be captur=
ed themselves, as<br>
&gt; &gt; far as I can tell from reading it.<br>
&gt;<br>
&gt; Ok.. I missed that bit.. I&#39;m still curious what this fixes.<br>
&gt;</p>
<p dir=3D"ltr">I haven&#39;t tried myself, but I expect it helps with the /=
usr merge.</p>
<p dir=3D"ltr">&gt; --Mark<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a>=
<br>
</p>

--001a11c11dbaa13aac050f549523--
