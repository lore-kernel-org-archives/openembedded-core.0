Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id 97FB960123
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:59:26 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id p204so214226513oih.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 08:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=bGiS33Rb+5z2Cj7Tt1mcTw92Er9j2Gd1Ap0GkS2gPTA=;
	b=AcBfCg19ItGfID2mlSpIqqU54QAUr4FsE64mTUHtZ1FwlFWdETjEvRBcvT4B0onkNq
	Ouv47gepI47MjeBBS9jPGc0Et1ekx/GhyrmCGqjBM5E6JO3cwxIBRQfD+hJ9LC8dbehS
	/Uv6WByLB8u/ZUNqaYAaOVJ4OquHjLEc1ORn9+IGPL0KKHi/ZN1JbpJd3vJSepsc7R3V
	U/q05f5yUJAtNt/EAzWlaVdqzS+4cTMVBuhTDsHPczuzorVUNO53htuyPsfsfa8iScg4
	B+u8O0ePT9dA9OFT8Ejb5uC8qvfwV4AEgtBWtJ1OKBaXMNwMZ5+uPiqLjCDRgZ1ow4YX
	eCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=bGiS33Rb+5z2Cj7Tt1mcTw92Er9j2Gd1Ap0GkS2gPTA=;
	b=EFgf8ewPxwgb0DMgqbCfH47KIIcCc1363yr36c4Cavk16bXvaVqOwvAlFKKangzYN+
	ioW9U9Nf20mbtQhX4OfYn+W85dRA59B+JL2Z2zlER3PQpbIo/sNx6jMNscTCySY1j9dx
	h7Ffg/MT8ycYuLYmCL24HoadBxZsaNpGCClmo/ouLowfc9ZCj8EVSUZFHVNgvFfipjoO
	3DRe8WgxbyCtRQEluJS98Nq2MXOEl+qm2skULgu4TMNxLEwQNxiXWdwYf7FFEWpx3KSc
	MFUVvDXsJNCFZ9enZmmrtF3xFe9yENsHbmrpn1UMHS4yHvKgCaGrHfBXpEs/SN9bYSui
	Qniw==
X-Gm-Message-State: ALyK8tJyhb+KFaUJBrmt4R2Y9gJ8z/gcY8eKI26VPcFGucbltjNS5ME2ly8BpYqkxaum8J/xDJWPO561j20eUA==
X-Received: by 10.157.12.246 with SMTP id o51mr8289009otd.72.1465833566589;
	Mon, 13 Jun 2016 08:59:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.26.78 with HTTP; Mon, 13 Jun 2016 08:59:07 -0700 (PDT)
In-Reply-To: <1465832830.31160.9.camel@intel.com>
References: <cover.1465787274.git.paul.eggleton@linux.intel.com>
	<1465832830.31160.9.camel@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 13 Jun 2016 08:59:07 -0700
X-Google-Sender-Auth: nNCZrQY_0GCRArYBGQwH8i0XF7Y
Message-ID: <CABcZANk5w5AEUG0GyobRPKiaHOoHPYsyFuEpz8qUs8qu15V+7A@mail.gmail.com>
To: "Randle, William C" <william.c.randle@intel.com>
Cc: "paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
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
X-List-Received-Date: Mon, 13 Jun 2016 15:59:28 -0000
Content-Type: multipart/alternative; boundary=001a1142f2fa097c8005352af980

--001a1142f2fa097c8005352af980
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 13, 2016 at 8:47 AM, Randle, William C <
william.c.randle@intel.com> wrote:

> On Mon, 2016-06-13 at 15:13 +1200, Paul Eggleton wrote:
> >
> > I have contemplated and even prototyped going a step further and using
> the
> > count of lines in the output to track progress for *all* long-running
> tasks,
> > which does work reasonably well - the caveat is you actually need the
> > expected line count ahead of time for each task, so you have to be able
> to
> > get that from somewhere. I  haven't worked out a practical means of
> > delivering that, suggestions would be very much welcome - my prototype
> stuff
> > is on poky-contrib paule/progress-wip and relies on someone profiling a
> > build containing all the tasks beforehand and that information somehow
> being
> > made available to everyone else.
>
> Could this be done somewhat analagous to the way the sstate stuff works,
> in the
> sense you could specify a local or remote line count mirror, or use a local
> directory. The first time a unique task is run, the line count from the
> output
> is saved in the line count db. On subsequent runs, it would detect there's
> already an entry in the db and would be able to provide the progress
> report.
>
> Similar to the way an autobuilder can create a shared sstate mirror, when
> a task
> is run on an autobuilder, it could save the line count and make it
> available to
> other consumers, so on first run you would get a progress report, rather
> than
> having to bootstrap the line counts first.


I think if you want to do this, then we should do it in a generic way, to
store info of that sort from a build and use it as input to another build,
i.e. another sqlite3 db or something, as this isn't the only case where
build output could be used as hints for another build.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1142f2fa097c8005352af980
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Jun 13, 2016 at 8:47 AM, Randle, William C <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:william.c.randle@intel.com" target=3D"_blank">william.c.ran=
dle@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span=
 class=3D"">On Mon, 2016-06-13 at 15:13 +1200, Paul Eggleton wrote:<br>
&gt;<br>
&gt; I have contemplated and even prototyped going a step further and using=
 the<br>
&gt; count of lines in the output to track progress for *all* long-running =
tasks,<br>
&gt; which does work reasonably well - the caveat is you actually need the<=
br>
&gt; expected line count ahead of time for each task, so you have to be abl=
e to<br>
&gt; get that from somewhere. I=C2=A0=C2=A0haven&#39;t worked out a practic=
al means of<br>
&gt; delivering that, suggestions would be very much welcome - my prototype=
 stuff<br>
&gt; is on poky-contrib paule/progress-wip and relies on someone profiling =
a<br>
&gt; build containing all the tasks beforehand and that information somehow=
 being<br>
&gt; made available to everyone else.<br>
<br>
</span>Could this be done somewhat analagous to the way the sstate stuff wo=
rks, in the<br>
sense you could specify a local or remote line count mirror, or use a local=
<br>
directory. The first time a unique task is run, the line count from the out=
put<br>
is saved in the line count db. On subsequent runs, it would detect there&#3=
9;s<br>
already an entry in the db and would be able to provide the progress report=
.<br>
<br>
Similar to the way an autobuilder can create a shared sstate mirror, when a=
 task<br>
is run on an autobuilder, it could save the line count and make it availabl=
e to<br>
other consumers, so on first run you would get a progress report, rather th=
an<br>
having to bootstrap the line counts first.</blockquote></div><br>I think if=
 you want to do this, then we should do it in a generic way, to store info =
of that sort from a build and use it as input to another build, i.e. anothe=
r sqlite3 db or something, as this isn&#39;t the only case where build outp=
ut could be used as hints for another build.<br>-- <br><div class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson=
 at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maint=
ainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--001a1142f2fa097c8005352af980--
