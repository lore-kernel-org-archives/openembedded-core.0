Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id E6F81736B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 07:21:48 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id o6so44676915qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=xafqHyHV+0s13n049ANAqJ/JRPOuMGVBLvQirwh9G5Q=;
	b=bQseejczHGZoOM3uJ2k4f+l4lXPpX5wcze7k+MvJ+4B9UE4CdEj6TPvKFPlYA1voi4
	yKsNJygPKJ1hykB9lUZ9gkdCuB2Jenr1UOlEq+GtiRJpdiQqXNe+O62qb2bNWtLkzSp5
	8ldKxsSxJ24kI2qBSjQYDlVUZ49fjbo3BINuJz+s4+ur0fmGh1zwLCBuP3RRD0yUM0zQ
	LD/aIZxQK1KDHp+ZP8Om4hXJVC9VJW1xXJPXrB8Y70ReD5C4pvqGPn/ZibJLmXk0jxVR
	x23vtHdT6ki28zojUWm8GdphVCydw9WRSeTFXlFnE6wbeVN2MPRWvkJLUHUJLkbDpIiH
	sHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=xafqHyHV+0s13n049ANAqJ/JRPOuMGVBLvQirwh9G5Q=;
	b=QWjBgYbqjFghUT/BRhqZ1IO3D0l8Cq+4SO08eH0aS0La0ws5jJuhS9OaqLGk7h3LRR
	cvxxLQ27DyuZdczAk0yRZspjmkW296gmtp11mgSNL1seQbbEA2vWG23+Jy3rVbkGkJcS
	D504qIpXRqbyFPh+nsRDKv0PCuLqboCq8vOq3rWFAuBqiCjHYw5n4oqVCgrYWNjAiyXt
	2048YeJSTU7wtQ6rH5nqlhZU/fLdewyWx6ftWKmz1qB8wclEaVW0KRrTpZ/7p/O4KKMV
	4/ZDlU287DC1ZLaVIWdyYzfEG8IwHbEA6R3LmLV8+nKy77eKVrAnnNdyDL9aibmTGwtR
	HP+Q==
X-Gm-Message-State: AD7BkJJyCuWjpezjLcFqeadMGNf9hGWHKg/szLFfXGfs0ao8HfYWe0KomqG8JxhXTAEjvZPLL/N9Ykc20wcAgg==
MIME-Version: 1.0
X-Received: by 10.55.78.70 with SMTP id c67mr9557563qkb.37.1457680908927; Thu,
	10 Mar 2016 23:21:48 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Thu, 10 Mar 2016 23:21:48 -0800 (PST)
Received: by 10.55.130.196 with HTTP; Thu, 10 Mar 2016 23:21:48 -0800 (PST)
In-Reply-To: <E219D57B-2F63-40DE-9C33-161AE6F738CC@gmail.com>
References: <56E1028C.6080605@mlbassoc.com>
	<E219D57B-2F63-40DE-9C33-161AE6F738CC@gmail.com>
Date: Fri, 11 Mar 2016 14:21:48 +0700
Message-ID: <CAMKF1sq8MV9JowZ=LQZbaUJ79i6edjLEw+tF3q1Juxh5tmWu7Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problems with perl 5.22
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
X-List-Received-Date: Fri, 11 Mar 2016 07:21:50 -0000
Content-Type: multipart/alternative; boundary=001a114a9bbec5ca50052dc0c8eb

--001a114a9bbec5ca50052dc0c8eb
Content-Type: text/plain; charset=UTF-8

Compare the output of configure run on working and non working versions.
Usually this is very helpful. See if its enabling or disabling something
new.
On Mar 10, 2016 10:55 PM, "Jens Rehsack" <rehsack@gmail.com> wrote:

>
> > Am 10.03.2016 um 06:13 schrieb Gary Thomas <gary@mlbassoc.com>:
> >
> > I'm working on a package (amanda - the Advanced Maryland Archiving
> > system) that is written heavily in perl with swig interfaces to C.
> > This code ran great until the update to perl 5.22; it now dies a
> > horrible death on almost every activity.  These failures seem to
> > always be in the swig generated wrappers, but that may just be
> > where most of the work gets done.
> >
> > I've narrowed this down to exactly the change to perl 5.22 from
> > 5.20. Using bisect as well as experimentation (e.g. trying all
> > the compiler combinations that have occurred since a last good
> > version) and I can go from working to failing by only the change
> > in perl.
> >
> > The interesting (scary) thing is that I've built amanda for my
> > target natively on my board running debian, including perl 5.22.
> > This means I can't say definitively  that perl 5.22 is the culprit
> > as on debian it runs fine.  So, it's got something to do with the
> > OE environment/porting/packaging of perl and not just the revision.
> >
> > I've also tested this on multiple architectures (ARM, PowerPC) with
> > the same results - with perl 5.20 amanda works, with perl 5.22 it fails.
> >
> > I've compared the actual 5.22.1 sources used by OE-core and debian
> > and they are subtly different, although I can't pinpoint any change
> > that might be responsible.
> >
> > For the moment, I can just fall back to perl 5.20 for my target
> > that needs to run amanda, but this isn't a real solution (e.g.
> > in this state I can't propose my recipe to any layer as it's
> > totally broken with the current OE-core).  I'd like to see this
> > fixed but the amanda code (swig wrappers) are horribly complex
> > which makes debugging quite the challenge, not to mention they
> > may be about the only way to uncover the bug, whether it's in
> > amanda or perl.
> >
> > Any suggestions on how to move forward?
>
> Since I have no clue what's wrong and how it fails (backtrace
> would point in some directions), several ideas might work:
>
> How clean is your build location (we realize that often between
> updates some files remain in our target images until we wipe
> tmp/ - cleansstate for image doesn't help ...)?
>
> Did you prove the library path's of your *.so's? Perl does
> almost everything within libperl.so - build against wrong version
> causes in weird crashes (scan DBI mailing list for admin's
> build issues of DBI on AIX/HP-UX ...).
>
> Maybe share your recipe can help to reproduce the problem
> elsewhere and debug locally.
>
> Cheers
> --
> Jens Rehsack - rehsack@gmail.com
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a114a9bbec5ca50052dc0c8eb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Compare the output of configure run on working and non worki=
ng versions. Usually this is very helpful. See if its enabling or disabling=
 something new. </p>
<div class=3D"gmail_quote">On Mar 10, 2016 10:55 PM, &quot;Jens Rehsack&quo=
t; &lt;<a href=3D"mailto:rehsack@gmail.com">rehsack@gmail.com</a>&gt; wrote=
:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
&gt; Am 10.03.2016 um 06:13 schrieb Gary Thomas &lt;<a href=3D"mailto:gary@=
mlbassoc.com">gary@mlbassoc.com</a>&gt;:<br>
&gt;<br>
&gt; I&#39;m working on a package (amanda - the Advanced Maryland Archiving=
<br>
&gt; system) that is written heavily in perl with swig interfaces to C.<br>
&gt; This code ran great until the update to perl 5.22; it now dies a<br>
&gt; horrible death on almost every activity.=C2=A0 These failures seem to<=
br>
&gt; always be in the swig generated wrappers, but that may just be<br>
&gt; where most of the work gets done.<br>
&gt;<br>
&gt; I&#39;ve narrowed this down to exactly the change to perl 5.22 from<br=
>
&gt; 5.20. Using bisect as well as experimentation (e.g. trying all<br>
&gt; the compiler combinations that have occurred since a last good<br>
&gt; version) and I can go from working to failing by only the change<br>
&gt; in perl.<br>
&gt;<br>
&gt; The interesting (scary) thing is that I&#39;ve built amanda for my<br>
&gt; target natively on my board running debian, including perl 5.22.<br>
&gt; This means I can&#39;t say definitively=C2=A0 that perl 5.22 is the cu=
lprit<br>
&gt; as on debian it runs fine.=C2=A0 So, it&#39;s got something to do with=
 the<br>
&gt; OE environment/porting/packaging of perl and not just the revision.<br=
>
&gt;<br>
&gt; I&#39;ve also tested this on multiple architectures (ARM, PowerPC) wit=
h<br>
&gt; the same results - with perl 5.20 amanda works, with perl 5.22 it fail=
s.<br>
&gt;<br>
&gt; I&#39;ve compared the actual 5.22.1 sources used by OE-core and debian=
<br>
&gt; and they are subtly different, although I can&#39;t pinpoint any chang=
e<br>
&gt; that might be responsible.<br>
&gt;<br>
&gt; For the moment, I can just fall back to perl 5.20 for my target<br>
&gt; that needs to run amanda, but this isn&#39;t a real solution (e.g.<br>
&gt; in this state I can&#39;t propose my recipe to any layer as it&#39;s<b=
r>
&gt; totally broken with the current OE-core).=C2=A0 I&#39;d like to see th=
is<br>
&gt; fixed but the amanda code (swig wrappers) are horribly complex<br>
&gt; which makes debugging quite the challenge, not to mention they<br>
&gt; may be about the only way to uncover the bug, whether it&#39;s in<br>
&gt; amanda or perl.<br>
&gt;<br>
&gt; Any suggestions on how to move forward?<br>
<br>
Since I have no clue what&#39;s wrong and how it fails (backtrace<br>
would point in some directions), several ideas might work:<br>
<br>
How clean is your build location (we realize that often between<br>
updates some files remain in our target images until we wipe<br>
tmp/ - cleansstate for image doesn&#39;t help ...)?<br>
<br>
Did you prove the library path&#39;s of your *.so&#39;s? Perl does<br>
almost everything within libperl.so - build against wrong version<br>
causes in weird crashes (scan DBI mailing list for admin&#39;s<br>
build issues of DBI on AIX/HP-UX ...).<br>
<br>
Maybe share your recipe can help to reproduce the problem<br>
elsewhere and debug locally.<br>
<br>
Cheers<br>
--<br>
Jens Rehsack - <a href=3D"mailto:rehsack@gmail.com">rehsack@gmail.com</a><b=
r>
<br>
<br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
<br></blockquote></div>

--001a114a9bbec5ca50052dc0c8eb--
