Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8D85E6093F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 17:37:23 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id r126so106093922oib.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2016 10:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=fVOARWbYHQKAuRXeR27a0/Xmmv4PN5qU1uLwNULysSI=;
	b=O+xJPdMXrU+zuYhbpjKTvctzE6OM+likvj0O90LXoUSTXXELlCr3r+N4JUPLjhIeoJ
	ItiR0QueR6DjTSYp7CyClCtYCgw9U6OvB6+6BZ0YDw1v6pi3f7n+EuGuoU39ih5sabXg
	GmFpa77QBw0AF2BiPbw5fQIhc9LZdFz/I3ciGF4Kzp2e0jsgSBnr6iRk2AZt1gje+JaC
	2n9zuIRZbIynzXDmYog4lT9LVT0UPAjzB+1vGY9boGNVWlmXLcW1QTlgB4pxkcttkJqL
	VSbQdyvHyw57z2FdK/LXPFmZzMi47GsiBBiVDsD9ESUwBs0XuZUYpQwlEtx6bu7LTSHE
	PyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=fVOARWbYHQKAuRXeR27a0/Xmmv4PN5qU1uLwNULysSI=;
	b=XH347270BIS3qfIJOmXEu8MbaYfosdqqxOXGc615vy7H2vWfYOXyaH76+e9YGg9QD5
	3Jn/nKAOWoLFsPhDdLbL3ZrmDnlu6GO9dKcJrVq2rdFzNZ50BdTbohgjiKliaG29eUbS
	NEPd/b9PPG4BARJM6mQ9gUhp7TOyz13tLsx3Ed1EKp3+FTVAf4Ew68ivw0YuWMyrYPAr
	JaXMv6ZdeHYaOfFz8433fYyBjQ3AXJXzTcGwlA0GYOA8p3SzUm0Uiwzo9mRTRr84+pIb
	7+2agVsjl/mhtzPn+/oj99dGE4oCLZya6tBYCH1FGY3K56npeCf78P3qcciETuWk/ivj
	iKJQ==
X-Gm-Message-State: AE9vXwNcSekn3LOwy/ft97VdnpweHCgEQqw3j+nEvmRBigcqWV9qpgGL2f2v7VvUL7mf88VrEaTEXYn9xYWReA==
X-Received: by 10.202.6.133 with SMTP id 127mr4186545oig.65.1474565844197;
	Thu, 22 Sep 2016 10:37:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Thu, 22 Sep 2016 10:37:02 -0700 (PDT)
In-Reply-To: <1474548771.16834.100.camel@intel.com>
References: <1474472342.16834.96.camel@intel.com> <20160921160854.GB2633@jama>
	<1474548771.16834.100.camel@intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 22 Sep 2016 10:37:02 -0700
X-Google-Sender-Auth: b_S8Cu1KiZBxKQg9heZeM5MEVxM
Message-ID: <CABcZANn=y0AK=_Uqed+5E4hQk01JyoTcofQNGdHfxkSG7NQmjA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OpenEmbedded <openembedded-core@lists.openembedded.org>
Subject: Re: rm_work + pybootchart enhancements
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
X-List-Received-Date: Thu, 22 Sep 2016 17:37:26 -0000
Content-Type: multipart/alternative; boundary=94eb2c0d0504576791053d1c1d35

--94eb2c0d0504576791053d1c1d35
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2016 at 5:52 AM, Patrick Ohly <patrick.ohly@intel.com>
wrote:

> On Wed, 2016-09-21 at 18:08 +0200, Martin Jansa wrote:
> > On Wed, Sep 21, 2016 at 05:39:02PM +0200, Patrick Ohly wrote:
> > > Test script attached. I only ran this once, so I can't vouch that the
> > > numbers are stable. I remember reading about a benchmark wrapper whic=
h
> > > can run such a test script multiple times and then will automatically
> > > merge the output of all runs together, adding
> min/max/average/deviation,
> > > but couldn't find the tool again. Does anyone know which tool does
> that?
> >
> > it's in oe-core:
> > ./scripts/contrib/bb-perf/bb-matrix-plot.sh
> > ./scripts/contrib/bb-perf/bb-matrix.sh
> >
> > ...
>
> That's bitbake specific. What I was remembering is something generic
> that works for anything that prints test results on stdout. Perhaps I
> was dreaming ;-}
>

I use https://github.com/rustyrussell/stats for that, quite handy. For
cases simpler than yours, when I=E2=80=99m just checking for deviation of c=
ommand
execution times, I use a little wrapper around time + stats at
https://github.com/kergoth/dotfiles/blob/master/scripts/time-stats.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c0d0504576791053d1c1d35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Sep 22, 2016 at 5:52 AM, Patrick Ohly <span dir=3D"ltr">&lt;<a href=
=3D"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204)=
;border-left-style:solid;padding-left:1ex"><span class=3D"gmail-">On Wed, 2=
016-09-21 at 18:08 +0200, Martin Jansa wrote:<br>
&gt; On Wed, Sep 21, 2016 at 05:39:02PM +0200, Patrick Ohly wrote:<br>
</span><span class=3D"gmail-">&gt; &gt; Test script attached. I only ran th=
is once, so I can&#39;t vouch that the<br>
&gt; &gt; numbers are stable. I remember reading about a benchmark wrapper =
which<br>
&gt; &gt; can run such a test script multiple times and then will automatic=
ally<br>
&gt; &gt; merge the output of all runs together, adding min/max/average/dev=
iation,<br>
&gt; &gt; but couldn&#39;t find the tool again. Does anyone know which tool=
 does that?<br>
&gt;<br>
&gt; it&#39;s in oe-core:<br>
&gt; ./scripts/contrib/bb-perf/bb-<wbr>matrix-plot.sh<br>
&gt; ./scripts/contrib/bb-perf/bb-<wbr>matrix.sh<br>
&gt;<br>
&gt; ...<br>
<br>
</span>That&#39;s bitbake specific. What I was remembering is something gen=
eric<br>
that works for anything that prints test results on stdout. Perhaps I<br>
was dreaming ;-}<div class=3D"gmail-yj6qo gmail-ajU"><div id=3D"gmail-:ua" =
class=3D"gmail-ajR" tabindex=3D"0"></div></div></blockquote></div><br>I use=
=C2=A0<a href=3D"https://github.com/rustyrussell/stats">https://github.com/=
rustyrussell/stats</a>=C2=A0for that, quite handy. For cases simpler than y=
ours, when I=E2=80=99m just checking for deviation of command execution tim=
es, I use a little wrapper around time + stats at=C2=A0<a href=3D"https://g=
ithub.com/kergoth/dotfiles/blob/master/scripts/time-stats">https://github.c=
om/kergoth/dotfiles/blob/master/scripts/time-stats</a>.<br>-- <br><div clas=
s=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c0d0504576791053d1c1d35--
