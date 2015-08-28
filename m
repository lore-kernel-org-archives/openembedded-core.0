Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5271771633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:45:02 +0000 (UTC)
Received: by obbhe7 with SMTP id he7so40717425obb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 00:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=bWi6JlZDnaj6+x4DKk9wQXsD0i1Wlijey2+0B6HBdB0=;
	b=Z++kVtnPtpTq3TajPgWLu+dr1by8CsGOfNqEaqG/4Iv+kwo+p1zt5y+v7VDNR0aQVw
	iiEKuF1UtcNxs4MA2RILHSEekofXt4s71yUqCEU5F74/8hF5fNYcY+adN68PUrkLJWOu
	1dcqibhaRSQwNB9Dctye/RMcPkWue0KLRLJsE0daxK+vsad7VzLQSKnaUToU3oeux9i9
	FOZHwhCuqxTeactT4iupcgRHHe12NPyvxW2cTlAmXZ2S8gWVo8rsxrNxzL359ftwCZ0Y
	s7YNx/GP3XO9aRbcJO+AzjhuEyMm40t0ZOYizWtwcbUgfmjWEw7PKDsBAlwBDyXzvbri
	Cmvw==
X-Gm-Message-State: ALoCoQmVqBQu+Knfpt/nnhOXA56l5LL6yEs9Cswiyl5flMBVfvVJ3c/kYAhuqgsAf0nfleNgiQa7
X-Received: by 10.60.70.104 with SMTP id l8mr4891464oeu.37.1440747902361; Fri,
	28 Aug 2015 00:45:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 28 Aug 2015 00:44:33 -0700 (PDT)
In-Reply-To: <7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
References: <ac5380e48da5a3385086887d8a7bd5cf5478112b.1440680489.git.jussi.kukkonen@intel.com>
	<cover.1440680489.git.jussi.kukkonen@intel.com>
	<694e679ee04cff2ca5029720b316cf1c6fb55496.1440680489.git.jussi.kukkonen@intel.com>
	<7D73CC7E-2609-4B6F-8E92-6A71CB25983F@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 28 Aug 2015 10:44:33 +0300
Message-ID: <CAHiDW_GULRgXqOMkAyPFFEU0ROdTmL+tc93w40eLwOvnrFsd2A@mail.gmail.com>
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
X-List-Received-Date: Fri, 28 Aug 2015 07:45:02 -0000
Content-Type: multipart/alternative; boundary=001a113308f6ee78a2051e5a4219

--001a113308f6ee78a2051e5a4219
Content-Type: text/plain; charset=UTF-8

On 28 August 2015 at 09:03, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> > On Aug 27, 2015, at 6:05 AM, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:
> >
> > gmp 4.2.1 was removed in f181c6ce8b apparently accidentally: It
> > was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so provides
> > a useful alternative to the newer "GPLv2 | LGPLv3" version.
> >
> > * Reintroduce 4.2.1. The source includes files that are GPL but the
> >  library package is LGPL 2.1+
> > * Also reintroduce the two patches removed in f181c6ce8b.
> > * Refactor gmp.inc: gmp 6.0.0 build should not be affected in any way.
> > * Update 6.0.0 license from "GPLv2 | LGPLv3" to "GPLv2+ | LGPLv3+".
> >
> > [YOCTO #8197]
>
> there are issues with gmp on arm especially thumb mode. What kind of
testing have you done on this ?

I have not tested on arm and at don't really have means to do so.
Suggestions to limit the possible harm are welcome.

 Jussi

--001a113308f6ee78a2051e5a4219
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 28 August 2015 at 09:03, Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>&gt;<br>&gt;<br>&=
gt; &gt; On Aug 27, 2015, at 6:05 AM, Jussi Kukkonen &lt;<a href=3D"mailto:=
jussi.kukkonen@intel.com">jussi.kukkonen@intel.com</a>&gt; wrote:<br>&gt; &=
gt;<br>&gt; &gt; gmp 4.2.1 was removed in f181c6ce8b apparently accidentall=
y: It<br>&gt; &gt; was not noticed that 4.2.1 is LGPL 2.1 (and not GPL) so =
provides<br>&gt; &gt; a useful alternative to the newer &quot;GPLv2 | LGPLv=
3&quot; version.<br>&gt; &gt;<br>&gt; &gt; * Reintroduce 4.2.1. The source =
includes files that are GPL but the<br>&gt; &gt; =C2=A0library package is L=
GPL 2.1+<br>&gt; &gt; * Also reintroduce the two patches removed in f181c6c=
e8b.<br>&gt; &gt; * Refactor gmp.inc: gmp 6.0.0 build should not be affecte=
d in any way.<br>&gt; &gt; * Update 6.0.0 license from &quot;GPLv2 | LGPLv3=
&quot; to &quot;GPLv2+ | LGPLv3+&quot;.<br>&gt; &gt;<br>&gt; &gt; [YOCTO #8=
197]<br>&gt;<br>&gt; there are issues with gmp on arm especially thumb mode=
. What kind of testing have you done on this ?<br><br>I have not tested on =
arm and at don&#39;t really have means to do so. Suggestions to limit the p=
ossible harm are welcome.<br><br>=C2=A0Jussi</div>

--001a113308f6ee78a2051e5a4219--
