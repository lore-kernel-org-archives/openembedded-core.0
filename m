Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id EB83C76DDA
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Aug 2015 06:18:06 +0000 (UTC)
Received: by obkg7 with SMTP id g7so58136455obk.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 23:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ci6eKvpM+T1Ue7U3pNE1ksN0zr5KiUNuxp3zQjWyJF8=;
	b=KYY5A1glW7zllEIWLNCd7M+u5K4wfFa1G4kALEAhT/fvprShrNK4gjP5WH1avgPA/P
	CZ1vUMS8aYaP3ZK88QafIAvGFwtXM06pMEzqo2QtXs/wEsl3VoTO25QYLE0b4Kke0anz
	CVHb3JjDxi+CP4uSW3YIg6+b06X2zswfGE8nyz/eoml13rSFLXYk4JYOFLeLpGpzvPmM
	d8idTbZO6HpNl0UnsMUOY3PV5QEBMsD5VzKvDa5wnU6+Ib9ucyiJwZFM7yqkCmo3lFDz
	7o7P0pOqHbuGOvgHzAWf0fAUSBPWRBOfiV7L8bpcUNOoCzYG1xPQstNpxC0zBB5w2ahA
	HI6A==
X-Gm-Message-State: ALoCoQl+zqrF4NH8Aj3VKucPEv4BwG2wCywDBTGmDoIL0ZvsgYRplo67DwkxdMtMZQ5VwPs+Q25c
X-Received: by 10.182.246.41 with SMTP id xt9mr8290317obc.55.1440829086601;
	Fri, 28 Aug 2015 23:18:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 28 Aug 2015 23:17:37 -0700 (PDT)
In-Reply-To: <CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
	<CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sat, 29 Aug 2015 09:17:37 +0300
Message-ID: <CAHiDW_FTdPR1gP12VLfVtijg5NVpYPCm_3vmDga-O_8KoHkDag@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/6] gmp: Bring back version 4.2.1 (LGPL 2.1+)
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
X-List-Received-Date: Sat, 29 Aug 2015 06:18:09 -0000
Content-Type: multipart/alternative; boundary=001a11c3241ee3a899051e6d2999

--001a11c3241ee3a899051e6d2999
Content-Type: text/plain; charset=UTF-8

On 28 August 2015 at 10:44, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
> On 28 August 2015 at 09:03, Khem Raj <raj.khem@gmail.com> wrote:
> > > On Aug 27, 2015, at 6:05 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:
> > >
> > > gmp 4.2.1 was removed in f181c6ce8b apparently accidentally: It
> > > was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provides
> > > a useful alternative to the newer "GPLv2 | LGPLv3" version.
> > >
> > > * Reintroduce 4.2.1. The source includes files that are GPL but the
> > >  library package is LGPL 2.1+
> > > * Also reintroduce the two patches removed in f181c6ce8b.
> > > * Refactor gmp.inc: gmp 6.0.0 build should not be affected in any way.
> > > * Update 6.0.0 license from "GPLv2 | LGPLv3" to "GPLv2+ | LGPLv3+".
> > >
> > > [YOCTO #8197]
> >
> > there are issues with gmp on arm especially thumb mode. What kind of
testing have you done on this ?
>
> I have not tested on arm and at don't really have means to do so.
Suggestions to limit the possible harm are welcome.

Ok, that was sent before morning coffee, not really the whole story... What
I should have said is: Can you expand on the possible problems (keeping in
mind that I don't know much about arm in general or how thumb might relate
to this)?

I did build 4.2.1 successfully for qemuarm and it seems ok in a very quick
test.

 - Jussi

--001a11c3241ee3a899051e6d2999
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 August 2015 at 10:44, Jussi Kukkonen &lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br=
>&gt; On 28 August 2015 at 09:03, Khem Raj &lt;<a href=3D"mailto:raj.khem@g=
mail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt; &gt; &gt; On Aug 27, 20=
15, at 6:05 AM, Jussi Kukkonen &lt;<a href=3D"mailto:jussi.kukkonen@intel.c=
om">jussi.kukkonen@intel.com</a>&gt; wrote:<br>&gt; &gt; &gt;<br>&gt; &gt; =
&gt; gmp 4.2.1 was removed in f181c6ce8b apparently accidentally: It<br>&gt=
; &gt; &gt; was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provide=
s<br>&gt; &gt; &gt; a useful alternative to the newer &quot;GPLv2 | LGPLv3&=
quot; version.<br>&gt; &gt; &gt;<br>&gt; &gt; &gt; * Reintroduce 4.2.1. The=
 source includes files that are GPL but the<br>&gt; &gt; &gt; =C2=A0library=
 package is LGPL 2.1+<br>&gt; &gt; &gt; * Also reintroduce the two patches =
removed in f181c6ce8b.<br>&gt; &gt; &gt; * Refactor gmp.inc: gmp 6.0.0 buil=
d should not be affected in any way.<br>&gt; &gt; &gt; * Update 6.0.0 licen=
se from &quot;GPLv2 | LGPLv3&quot; to &quot;GPLv2+ | LGPLv3+&quot;.<br>&gt;=
 &gt; &gt;<br>&gt; &gt; &gt; [YOCTO #8197]<br>&gt; &gt;<br>&gt; &gt; there =
are issues with gmp on arm especially thumb mode. What kind of testing have=
 you done on this ?<br>&gt;<br>&gt; I have not tested on arm and at don&#39=
;t really have means to do so. Suggestions to limit the possible harm are w=
elcome.<br><br><div>Ok, that was sent before morning coffee, not really the=
 whole story... What I should have said is: Can you expand on the possible =
problems (keeping in mind that I don&#39;t know much about arm in general o=
r how thumb might relate to this)?</div><div><br></div><div>I did build 4.2=
.1 successfully for qemuarm and it seems ok in a very quick test.</div><div=
><br></div><div>=C2=A0- Jussi</div><div><br></div></div>

--001a11c3241ee3a899051e6d2999--
