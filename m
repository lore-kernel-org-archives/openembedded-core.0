Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD5D60248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 16:01:35 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id w5so135244472oib.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Y81v/krgZI3fZ9x3A2y8wUz5lUppGxgAD13fNYlhtMA=;
	b=z8T5fHZ6ZIu/B9e+y+fTDUohwflc67Pgk8UnyY7CtLpoba3bdDdCKRcJQMdeix/uJ8
	hK/cfN3MCTaoz6mHPbar1wvVw2hZgQjZ4cNByG8pO+fr+uwaR5/OcxCru7xseujvEcj1
	o0OuiO5XK8ME85MXWoRdQ9SYwo+Y54hzdEeQycDBKhvd1zfmzJwNUz2yxQPm+F0noDfW
	613DUpC0tU4f5mxc+DvMKMxOoDjkQ7DgHG3rQpZjAJHwuknbN7GdvS1Rjkm422dEr6xl
	1sw4Wmiii6bjT5QuwFq+ym9VN71twHfHDR6O/2b9okHThup3LOIkevzfnsStnX2B1A1V
	cKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Y81v/krgZI3fZ9x3A2y8wUz5lUppGxgAD13fNYlhtMA=;
	b=gnBqn2ofeA5QFxQsEHT24EVTMx+RcxtPo2IdG392KG39K3pnKj7EruV3JWxqkiM12S
	4TyQQPDxBqPyaIyvRBiZJc0+gXk0nk4QB/DnpFH59TBk7/wzmJhgRAkis+SAaZxT82s+
	JuqSAqV8foxqT0EBKFBh3q5v5+Nmw68nK0zntmrClk2PGUzyahwigtY6rKjKFVkm9Y8X
	calyfDoVgjvrAlUrfF1MavDfInJeeOzHK/Wvbj1aDtEitYSCBNKZ9CS7BPZEGHml70KT
	vFk0ZC725EkrayH3/eG1niBalw7f+Xx6FHw9yp4+OK465l1D7KTg5ZEbxzilugZpdb62
	Ws9g==
X-Gm-Message-State: ALyK8tKorpqCy8U6tne2jPhruxEtkjzIdMdlLN24J9hiZScr18gEKEok8+sqdBO7RfheIH/RrGnlQN9xAcpWwQ==
X-Received: by 10.157.7.11 with SMTP id 11mr7153889ote.145.1465833696456; Mon,
	13 Jun 2016 09:01:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.26.78 with HTTP; Mon, 13 Jun 2016 09:01:17 -0700 (PDT)
In-Reply-To: <cover.1465787274.git.paul.eggleton@linux.intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jun 2016 09:01:17 -0700
X-Google-Sender-Auth: Ap9T0iM2wdQsow0Sfbavh4PuNXk
Message-ID: <CABcZAN=WqDtLwbkhgDeSoodNXfA4NSTZ0On9GN1=aaBjFcfoXQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Show progress during build and eSDK install
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
X-List-Received-Date: Mon, 13 Jun 2016 16:01:35 -0000
Content-Type: multipart/alternative; boundary=001a113ed45ec6f7b005352b00f6

--001a113ed45ec6f7b005352b00f6
Content-Type: text/plain; charset=UTF-8

On Sun, Jun 12, 2016 at 8:13 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Show progress during build and extensible SDK installation.
>
> I've often thought it would be nice if we could print progress information
> for individual tasks so that you could get some idea of whether the task
> is doing anything and how much longer it might take, and so I've been
> working
> on a set of patches to implement just that in the background for a while
> now
> and this is the result.  Unfortunately this isn't necessarily practical to
> do
> for all tasks, but things like do_fetch are running processes that do
> output
> progress information so it's not too hard to tap into that and present it
> in
> the form of a progress bar next to the task, which is what this patchset
> does. I was also able to enable progress for do_compile in recipes that use
> cmake (since that outputs % complete as it runs) as well as do_rootfs where
> it has a number of internal steps that can be counted and weighted.
>
> I have contemplated and even prototyped going a step further and using the
> count of lines in the output to track progress for *all* long-running
> tasks,
> which does work reasonably well - the caveat is you actually need the
> expected line count ahead of time for each task, so you have to be able to
> get that from somewhere. I  haven't worked out a practical means of
> delivering that, suggestions would be very much welcome - my prototype
> stuff
> is on poky-contrib paule/progress-wip and relies on someone profiling a
> build containing all the tasks beforehand and that information somehow
> being
> made available to everyone else.
>
> Also included in this patchset is support for showing progress in a couple
> of other stages during the build - when checking for the availability of
> sstate artifacts, when initialising the tasks (formerly "Preparing
> RunQueue")
> and overall progress of running setscene and normal tasks.
>
> There are also a few semi-related changes to improve progress reporting and
> speed of extensible SDK installation.
>
> NOTE: this patchset requires the corresponding set of changes just sent
> to the bitbake-devel list in order to work.
>

This is pretty sweet, nice work on this, Paul. A couple random thoughts:

1. do_fetch progress is *awesome*, especially for the kernel :)
2. there are do_setscene progress bars, but they seem to just pop up and
vanish in the common case, since they run so quickly. we might want to add
a minimum time threshold to the UI, so if the task has been running less
than 5 seconds, don't even bother showing it
3. it may be worth adding a spinner for cases where we don't know the
expected line count, but want to be able to indicate that something is
happening, i.e. just spin the spinner if output is still coming from the
task's stdout, so the user doesn't get paranoid and think the compile hung
:)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ed45ec6f7b005352b00f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Jun 12, 2016 at 8:13 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Show progress during build and extensible SDK installation.<br>
<br>
I&#39;ve often thought it would be nice if we could print progress informat=
ion<br>
for individual tasks so that you could get some idea of whether the task<br=
>
is doing anything and how much longer it might take, and so I&#39;ve been w=
orking<br>
on a set of patches to implement just that in the background for a while no=
w<br>
and this is the result.=C2=A0 Unfortunately this isn&#39;t necessarily prac=
tical to do<br>
for all tasks, but things like do_fetch are running processes that do outpu=
t<br>
progress information so it&#39;s not too hard to tap into that and present =
it in<br>
the form of a progress bar next to the task, which is what this patchset<br=
>
does. I was also able to enable progress for do_compile in recipes that use=
<br>
cmake (since that outputs % complete as it runs) as well as do_rootfs where=
<br>
it has a number of internal steps that can be counted and weighted.<br>
<br>
I have contemplated and even prototyped going a step further and using the<=
br>
count of lines in the output to track progress for *all* long-running tasks=
,<br>
which does work reasonably well - the caveat is you actually need the<br>
expected line count ahead of time for each task, so you have to be able to<=
br>
get that from somewhere. I=C2=A0 haven&#39;t worked out a practical means o=
f<br>
delivering that, suggestions would be very much welcome - my prototype stuf=
f<br>
is on poky-contrib paule/progress-wip and relies on someone profiling a<br>
build containing all the tasks beforehand and that information somehow bein=
g<br>
made available to everyone else.<br>
<br>
Also included in this patchset is support for showing progress in a couple<=
br>
of other stages during the build - when checking for the availability of<br=
>
sstate artifacts, when initialising the tasks (formerly &quot;Preparing Run=
Queue&quot;)<br>
and overall progress of running setscene and normal tasks.<br>
<br>
There are also a few semi-related changes to improve progress reporting and=
<br>
speed of extensible SDK installation.<br>
<br>
NOTE: this patchset requires the corresponding set of changes just sent<br>
to the bitbake-devel list in order to work.<br></blockquote><div><br></div>=
<div>This is pretty sweet, nice work on this, Paul. A couple random thought=
s:</div><div><br></div><div>1. do_fetch progress is *awesome*, especially f=
or the kernel :)</div><div>2. there are do_setscene progress bars, but they=
 seem to just pop up and vanish in the common case, since they run so quick=
ly. we might want to add a minimum time threshold to the UI, so if the task=
 has been running less than 5 seconds, don&#39;t even bother showing it</di=
v><div>3. it may be worth adding a spinner for cases where we don&#39;t kno=
w the expected line count, but want to be able to indicate that something i=
s happening, i.e. just spin the spinner if output is still coming from the =
task&#39;s stdout, so the user doesn&#39;t get paranoid and think the compi=
le hung :)</div></div>-- <br><div class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Fo=
under - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior S=
oftware Engineer, Mentor Graphics</div>
</div></div>

--001a113ed45ec6f7b005352b00f6--
