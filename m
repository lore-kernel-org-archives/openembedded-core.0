Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1AD657F334
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 15:00:42 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id a21so5352408edt.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vLSSmKhM7Pa86JBc5UH9bGcp4cpbNx7Kh0zEk0GHAwM=;
	b=WgbzMOOJ1ScnM0CewY8h+U0ValYcJfo2mj4SdkSXuSpUsEQ/uZZJWuSq4Q39ScIX7U
	4K9pZyL9mjfp+bYztOnWESJHyb4SidieHROZa2A8G7f6yP6rgxk1EEg8n9CkfjyyoW8+
	BYOzxe7uSfQpf23X9LldMQqD8EoWCIctrMfxAFOuYac+9NrYF6lJ96DIz/OGj42l4p0e
	QUCiBQMjCBXoQkcqh2H8I9tr6Er6yTJiuMYUsa+HP7iomFCdWp+iTc0atxavQ8i+V35v
	uC9NF3eaK/6EGZXoItnFDPWiWw33ukDhvjgEGnijl7kdKFnQnXiGdjLsMimX0uL4+2M7
	N4JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vLSSmKhM7Pa86JBc5UH9bGcp4cpbNx7Kh0zEk0GHAwM=;
	b=ZWbfidBYCN2ZtykYrfktC2IOy/nDLhI3uLLec/UwQFb8HAFbOqEl5v52+LVY8ddzLs
	6RAPcrTdpoehEHNOeUpYPelIgg2akTkjSwOrtrkHURG4pnYpgY6TaE3qAEXUmQZpQy+K
	gq4rhsxmxYIlfSy5Wt+YA/YE2OTcWtIGUEnJdwAqG5K6xnNVCqq4IW4Gqot14vyq9p+E
	P+yuNRtyvUuNKvYd+UWQD/0zg2ZpEwNW6dhl2Lr5uDtDpLIBtlfruBNUkqyKmo3JBdrw
	V5qh0LR3Cz0P/ZHsLkFeKnXp7EgjJY1E82PK2JWpVuzTCrObNnqxxIDOANhsuIm0SsYx
	HD/A==
X-Gm-Message-State: APjAAAW2XlxNg6ytF9X92vnAppM4f99ZqUe/AUDOOmP8mX38uQC/r7r/
	kl8H0/soF5BGORf1QJIwrBoNgCZOHNB0wrwHvRE=
X-Google-Smtp-Source: APXvYqy0/Ces4jBbtWWriVOT7oG6qqtmsTVpBVJmiO74FVZCX2Oq4u7RCZeGQRt4S6HnO3iWLx6zfIp1Oif+bJUtAOs=
X-Received: by 2002:a50:f05a:: with SMTP id u26mr11369546edl.116.1565967643723;
	Fri, 16 Aug 2019 08:00:43 -0700 (PDT)
MIME-Version: 1.0
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<20190815150548.GA1515@jama> <20190816102441.GB1515@jama>
In-Reply-To: <20190816102441.GB1515@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 16 Aug 2019 17:00:40 +0200
Message-ID: <CA+chaQdS_QHpe2jmr6Epqc_CBBHTwbtA5beg1rjD4kwMHbhycA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Fri, 16 Aug 2019 15:00:43 -0000
Content-Type: multipart/alternative; boundary="000000000000224cea05903d4137"

--000000000000224cea05903d4137
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Will try to bump BB_NUMBER_THREADS from 8 to 72.

I've tried to remove icecc.bbclass inherit (because it does things while
parsing and RP probably doesn't have it inherited), but that didn't save
much time.

All 3 tests were with bitbake 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7
94m19.081s  8 BB_NUMBER_THREADS and icecc
82m59.574s  8 BB_NUMBER_THREADS no icecc
68m3.556s    72 BB_NUMBER_THREADS no icecc

Still don't know how to get to sub 10min world runs RP was seeing, but at
least it's as slow as it was before runqeueu changes (or even a bit faster
in lastest master).

On Fri, Aug 16, 2019 at 12:24 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Aug 15, 2019 at 05:05:48PM +0200, Martin Jansa wrote:
> > On Tue, Aug 13, 2019 at 10:04:08AM +0100, Richard Purdie wrote:
> > > On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:
> > > > Comparing that build to a corresponding do-nothing build with Thud,
> > > > the time difference matches those three minutes where I have no ide=
a
> > > > what bitbake is doing now that it didn=E2=80=99t need to do before=
=E2=80=A6
> > > >
> > > > Hopefully these time degradations can be solved, because the curren=
t
> > > > state of bitbake is barely usable. We also need to look into possib=
le
> > > > ways to improve the cooker output when it is running the setscene
> > > > tasks so it makes some kind of sense again.
> > >
> > > We talked on irc and you pointed at the commit things started to go
> > > wrong. Just to summarise things for the benefit of the list, this is
> > > some quick testing I did:
> > >
> > > "bitbake -p; time bitbake core-image-minimal -n"
> > >
> > > 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26
> > > 30.6s a0d941c787cf3ef030d190903279d311bc05d752
> > > 40.3s 7df31ff36892c2f9c65326b06b4c70
> > > 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e
> > > 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c
> > > 76.9s master-next
> >
> > I know I'm late to the party, but it took really long for the test to
> finish..
> >
> > I'm not using poky, so reproduce this testing on our builds I've used
> > bitbake revisions matching with poky revision RP was testing:
> >
> > + oe-core 18cdc087fd5da30e2b31f3d4e81b153cd36ca844 for older bitbake,
> because current master isn't compatible with old bitbake
> (bb.data_smart.ExpansionError: Failure expanding variable OE_IMPORTED[:=
=3D],
> expression was ${@oe_import(d)} which triggered exception AttributeError:
> module 'bb.siggen' has no attribute 'SignatureGeneratorUniHashMixIn')
> > and oe-core 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae for newer bitbake
> (to possibly eliminate impact of metadata changes)
> >
> > tested on 72core (Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz) with 380GB
> RAM
> >
> > nothing in TMPDIR/SSTATE_DIR, no SSTATE_MIRRO, no Hash Equivalence
> Server configured
> >
> > on a build with few more layers:
> > Parsing of 3238 .bb files complete (0 cached, 3238 parsed). 7632
> targets, 1927 skipped, 54 masked, 0 errors.
> >
> > but first doing just core-image-minimal like RP did:
> >
> > time          poky                                            bitbake
>                                      oe-core
> > 2m8.191s      6c7c0cefd34067311144a1d4c01986fe0a4aef26
> 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7
> 18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> > N/A           a0d941c787cf3ef030d190903279d311bc05d752        doesn't
> exist in poky/poky-contrib
> 18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> > 2m17.053s     7df31ff36892c2f9c65326b06b4c70
> 1f630fdf0260db08541d3ca9f25f852931c19905
> 18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> > 2m18.515s     a0542ed3ff700eca35f9195f743c9e28bcd50f3e
> f43778c2d19e70d4befd483b06aaf247fc65c799
> 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae
> > 2m22.220s     9983b07fffd19082abded7c3f15cc77d306dd69c
> 8c26b451f22193ef1c544e2017cc84515566c1b8
> > 2m38.185s     master-next
>  fbcb89dc3dbabfc80310e9a4ebe72d919300a32e
> > cache.py:446: ResourceWarning: unclosed <socket.socket fd=3D10,
> family=3DAddressFamily.AF_INET, type=3DSocketKind.SOCK_STREAM, proto=3D0,
> laddr=3D('127.0.0.1', 41117)>
> >   value =3D pickled.load()
> > started showing with this revision
> > 2m17.991s     master-next + fixups
> f7cd14f90463957b3e4be6d3876def98b78f1424
> > 2m9.651s      master-next + "Holding off tasks %s" out
> >
> > now world
> > 253m36.637s   7df31ff36892c2f9c65326b06b4c70
> 1f630fdf0260db08541d3ca9f25f852931c19905
> 18cdc087fd5da30e2b31f3d4e81b153cd36ca844
> > 174m13.324s   a0542ed3ff700eca35f9195f743c9e28bcd50f3e
> f43778c2d19e70d4befd483b06aaf247fc65c799
> 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae
> >    this is time when killed at "NOTE: Executing Tasks" without showing
> any progress on the tasks (unlike other tests) and only one bitbake proce=
ss
> is running
> > 633m27.475s   master-next
>  fbcb89dc3dbabfc80310e9a4ebe72d919300a32e
> >    this is time when killed at (1417 from 71749) - running very slowly
> unlike other bitbake revisions where the task number changes relatively
> quickly - about 10 tasks per second
> > 89m13.992s    master-next + "Holding off tasks %s" out
> > 89m59.201s    master-next updated today
>  85fe627fdb6510f0942917964386fad9d8c479c8
> >
> > Interestingly old 1f630fdf0260db08541d3ca9f25f852931c19905 is 3 times
> > slower than recent master-next.
> >
> > I'll send -P output next.
>
>
> So 1f630fdf0260db08541d3ca9f25f852931c19905 was already "bad", because
> this commit introduced that
> logger.debug(2, "Holding off tasks %s" %
> pprint.pformat(self.holdoff_tasks))
>
> Here is -P output from it:
>
> 5min (til "Executing Tasks" message):
> profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.return.at
> .Executing.Tasks
> http://paste.ubuntu.com/p/Nw6n5hTPmF/
>
> 5hours (whole dry run):
>
> profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.whole.dry.=
run
> http://paste.ubuntu.com/p/sydFGvYTxQ/
>
> profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.worker.log=
.processed
> http://paste.ubuntu.com/p/RMGbm9DyZz/
>
> So for good old baseline I need to go few commits back, to e.g. 18d4a31f
> RP was testing before:
>
> 1f630fdf runqueue: Enable dynamic task adjustment to hash equivalency
> a0d941c7 siggen: Convert to use self.unitaskhashes
> 1f326f2c siggen: Add new unitaskhashes data variable which is cached
> b707d0cb runqueue: Improve scenequeue processing logic
> 19a6e356 cache: Add SimpleCache class
> 7bb79099 siggen: Import unihash code from OE-Core
> 7aec8632 hashserv: SQL Optimizations
> 18d4a31f fetch2/wget: avoid 'maximum recursion depth' RuntimeErrors when
> handling 403 codes
>
> 94m19.081s
>
> profile.log.processed.18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7.whole.dry.=
run
> http://paste.ubuntu.com/p/Jnvv8GJNKB/
>
> And here is profile with latest master from yesterday:
> 90mins:
>
> profile.log.processed.a5e084a266f63c2fd370122327615e49beaeb94e.whole.dry.=
run
> http://paste.ubuntu.com/p/YhMCHPmg56/
>
> So good news is that current master is a bit faster than "good old"
> 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7.
>
> But still significantly slower on my fast builder compared to world tests
> on poky + meta-oe,
> not sure if it's all just because the size of metadata in my builds (with
> 71K tasks).
>
> Even the dry running the tasks was about 10 tasks/second while RP was
> seeing around 200 tasks/second.
>
> Will try to bump BB_NUMBER_THREADS from 8 to 72.
>
> I've already disabled rm_work and PRserv, but that doesn't seem to have
> any significant impact on performance here. Other than resolving the PRse=
rv
> terminating and then warnings about lost connection.
>
> Cheers,
> >
> > >
> > > So basically the original changes showed a 25% hit but the performanc=
e
> > > of -next is dire.
> > >
> > > This is with no hash equiv server configured.
> > >
> > > It will vary depending on the target used (numbers with -sato for the
> > > above would be interesting for comparision) and how much was or is in
> > > sstate, they type of sstate mirror configured and so on.
> > >
> > > I really need to focus on getting the new code functioning correctly
> > > before we attempt to optimise but if nobody tests the new code due to
> > > performance problems we have a different issue. We also have a scalin=
g
> > > problem with the hash server itself I need to fix to stop the
> > > autobuilder throwing weird errors. I'm therefore a bit challenged on
> > > where to start with it all :/.
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
> > --
> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

--000000000000224cea05903d4137
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">&gt; Will try to bump BB_NUMBER_THREADS from 8 to 72.<div>=
<br></div><div>I&#39;ve tried to remove icecc.bbclass inherit (because it d=
oes things while parsing and RP probably doesn&#39;t have it inherited), bu=
t that didn&#39;t save much time.</div><div><br></div><div>All 3 tests were=
 with bitbake 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7</div><div>94m19.081s=
=C2=A0 8 BB_NUMBER_THREADS and icecc</div><div>82m59.574s=C2=A0 8 BB_NUMBER=
_THREADS no icecc<br></div><div>68m3.556s=C2=A0 =C2=A0 72 BB_NUMBER_THREADS=
 no icecc<br></div><div><br></div><div>Still don&#39;t know how to get to s=
ub 10min world runs RP was seeing, but at least it&#39;s as slow as it was =
before runqeueu changes (or even a bit faster in lastest master).</div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On F=
ri, Aug 16, 2019 at 12:24 PM Martin Jansa &lt;<a href=3D"mailto:martin.jans=
a@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On Thu, Aug 15, 2019 at 05:05:48PM +0200=
, Martin Jansa wrote:<br>
&gt; On Tue, Aug 13, 2019 at 10:04:08AM +0100, Richard Purdie wrote:<br>
&gt; &gt; On Mon, 2019-08-12 at 20:26 +0000, Peter Kjellerstedt wrote:<br>
&gt; &gt; &gt; Comparing that build to a corresponding do-nothing build wit=
h Thud,<br>
&gt; &gt; &gt; the time difference matches those three minutes where I have=
 no idea<br>
&gt; &gt; &gt; what bitbake is doing now that it didn=E2=80=99t need to do =
before=E2=80=A6<br>
&gt; &gt; &gt;=C2=A0 <br>
&gt; &gt; &gt; Hopefully these time degradations can be solved, because the=
 current<br>
&gt; &gt; &gt; state of bitbake is barely usable. We also need to look into=
 possible<br>
&gt; &gt; &gt; ways to improve the cooker output when it is running the set=
scene<br>
&gt; &gt; &gt; tasks so it makes some kind of sense again.<br>
&gt; &gt; <br>
&gt; &gt; We talked on irc and you pointed at the commit things started to =
go<br>
&gt; &gt; wrong. Just to summarise things for the benefit of the list, this=
 is<br>
&gt; &gt; some quick testing I did:<br>
&gt; &gt; <br>
&gt; &gt; &quot;bitbake -p; time bitbake core-image-minimal -n&quot;<br>
&gt; &gt; <br>
&gt; &gt; 30.0s 6c7c0cefd34067311144a1d4c01986fe0a4aef26<br>
&gt; &gt; 30.6s a0d941c787cf3ef030d190903279d311bc05d752<br>
&gt; &gt; 40.3s 7df31ff36892c2f9c65326b06b4c70 <br>
&gt; &gt; 42.2s a0542ed3ff700eca35f9195f743c9e28bcd50f3e <br>
&gt; &gt; 45.4s 9983b07fffd19082abded7c3f15cc77d306dd69c <br>
&gt; &gt; 76.9s master-next<br>
&gt; <br>
&gt; I know I&#39;m late to the party, but it took really long for the test=
 to finish..<br>
&gt; <br>
&gt; I&#39;m not using poky, so reproduce this testing on our builds I&#39;=
ve used<br>
&gt; bitbake revisions matching with poky revision RP was testing:<br>
&gt; <br>
&gt; + oe-core 18cdc087fd5da30e2b31f3d4e81b153cd36ca844 for older bitbake, =
because current master isn&#39;t compatible with old bitbake (bb.data_smart=
.ExpansionError: Failure expanding variable OE_IMPORTED[:=3D], expression w=
as ${@oe_import(d)} which triggered exception AttributeError: module &#39;b=
b.siggen&#39; has no attribute &#39;SignatureGeneratorUniHashMixIn&#39;)<br=
>
&gt; and oe-core 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae for newer bitbake=
 (to possibly eliminate impact of metadata changes)<br>
&gt; <br>
&gt; tested on 72core (Intel(R) Xeon(R) CPU E5-2699 v3 @ 2.30GHz) with 380G=
B RAM<br>
&gt; <br>
&gt; nothing in TMPDIR/SSTATE_DIR, no SSTATE_MIRRO, no Hash Equivalence Ser=
ver configured<br>
&gt; <br>
&gt; on a build with few more layers:<br>
&gt; Parsing of 3238 .bb files complete (0 cached, 3238 parsed). 7632 targe=
ts, 1927 skipped, 54 masked, 0 errors.<br>
&gt; <br>
&gt; but first doing just core-image-minimal like RP did:<br>
&gt; <br>
&gt; time=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 poky=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oe-core<br>
&gt; 2m8.191s=C2=A0 =C2=A0 =C2=A0 6c7c0cefd34067311144a1d4c01986fe0a4aef26=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 18cdc087fd5da30e2b31f3d4e81b153cd36ca844<br>
&gt; N/A=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0a0d941c787cf3ef030d1909032=
79d311bc05d752=C2=A0 =C2=A0 =C2=A0 =C2=A0 doesn&#39;t exist in poky/poky-co=
ntrib=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 18cdc087fd5da30e2b31f=
3d4e81b153cd36ca844<br>
&gt; 2m17.053s=C2=A0 =C2=A0 =C2=A07df31ff36892c2f9c65326b06b4c70=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1f630fdf0260db08541d3c=
a9f25f852931c19905=C2=A0 =C2=A0 =C2=A0 =C2=A0 18cdc087fd5da30e2b31f3d4e81b1=
53cd36ca844<br>
&gt; 2m18.515s=C2=A0 =C2=A0 =C2=A0a0542ed3ff700eca35f9195f743c9e28bcd50f3e=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 f43778c2d19e70d4befd483b06aaf247fc65c799=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae<br>
&gt; 2m22.220s=C2=A0 =C2=A0 =C2=A09983b07fffd19082abded7c3f15cc77d306dd69c=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 8c26b451f22193ef1c544e2017cc84515566c1b8<br>
&gt; 2m38.185s=C2=A0 =C2=A0 =C2=A0master-next=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fbcb89dc3dbabfc80310e9a4ebe72d919300a32e<br>
&gt; cache.py:446: ResourceWarning: unclosed &lt;socket.socket fd=3D10, fam=
ily=3DAddressFamily.AF_INET, type=3DSocketKind.SOCK_STREAM, proto=3D0, ladd=
r=3D(&#39;127.0.0.1&#39;, 41117)&gt;<br>
&gt;=C2=A0 =C2=A0value =3D pickled.load()<br>
&gt; started showing with this revision<br>
&gt; 2m17.991s=C2=A0 =C2=A0 =C2=A0master-next + fixups=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 f7cd14f90463957b3e4be6d3876def98b78f1424<br>
&gt; 2m9.651s=C2=A0 =C2=A0 =C2=A0 master-next + &quot;Holding off tasks %s&=
quot; out<br>
&gt; <br>
&gt; now world<br>
&gt; 253m36.637s=C2=A0 =C2=A07df31ff36892c2f9c65326b06b4c70=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1f630fdf0260db08541d3ca9f2=
5f852931c19905=C2=A0 =C2=A0 =C2=A0 =C2=A0 18cdc087fd5da30e2b31f3d4e81b153cd=
36ca844<br>
&gt; 174m13.324s=C2=A0 =C2=A0a0542ed3ff700eca35f9195f743c9e28bcd50f3e=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 f43778c2d19e70d4befd483b06aaf247fc65c799=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 23db236a054ee7a989cdbbcb42ad5c6eefd4a6ae<br>
&gt;=C2=A0 =C2=A0 this is time when killed at &quot;NOTE: Executing Tasks&q=
uot; without showing any progress on the tasks (unlike other tests) and onl=
y one bitbake process is running<br>
&gt; 633m27.475s=C2=A0 =C2=A0master-next=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0fbcb89dc3dbabfc80310e9a4ebe72d919300a32e<br>
&gt;=C2=A0 =C2=A0 this is time when killed at (1417 from 71749) - running v=
ery slowly unlike other bitbake revisions where the task number changes rel=
atively quickly - about 10 tasks per second<br>
&gt; 89m13.992s=C2=A0 =C2=A0 master-next + &quot;Holding off tasks %s&quot;=
 out<br>
&gt; 89m59.201s=C2=A0 =C2=A0 master-next updated today=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A085fe627fdb651=
0f0942917964386fad9d8c479c8<br>
&gt; <br>
&gt; Interestingly old 1f630fdf0260db08541d3ca9f25f852931c19905 is 3 times<=
br>
&gt; slower than recent master-next.<br>
&gt; <br>
&gt; I&#39;ll send -P output next.<br>
<br>
<br>
So 1f630fdf0260db08541d3ca9f25f852931c19905 was already &quot;bad&quot;, be=
cause<br>
this commit introduced that<br>
logger.debug(2, &quot;Holding off tasks %s&quot; % pprint.pformat(self.hold=
off_tasks))<br>
<br>
Here is -P output from it:<br>
<br>
5min (til &quot;Executing Tasks&quot; message):<br>
profile.log.processed.1f630fdf0260db08541d3ca9f25f85<a href=3D"http://2931c=
19905.return.at" target=3D"_blank">2931c19905.return.at</a>.Executing.Tasks=
<br>
<a href=3D"http://paste.ubuntu.com/p/Nw6n5hTPmF/" rel=3D"noreferrer" target=
=3D"_blank">http://paste.ubuntu.com/p/Nw6n5hTPmF/</a><br>
<br>
5hours (whole dry run):<br>
profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.whole.dry.ru=
n<br>
<a href=3D"http://paste.ubuntu.com/p/sydFGvYTxQ/" rel=3D"noreferrer" target=
=3D"_blank">http://paste.ubuntu.com/p/sydFGvYTxQ/</a><br>
profile.log.processed.1f630fdf0260db08541d3ca9f25f852931c19905.worker.log.p=
rocessed<br>
<a href=3D"http://paste.ubuntu.com/p/RMGbm9DyZz/" rel=3D"noreferrer" target=
=3D"_blank">http://paste.ubuntu.com/p/RMGbm9DyZz/</a><br>
<br>
So for good old baseline I need to go few commits back, to e.g. 18d4a31f RP=
 was testing before:<br>
<br>
1f630fdf runqueue: Enable dynamic task adjustment to hash equivalency<br>
a0d941c7 siggen: Convert to use self.unitaskhashes<br>
1f326f2c siggen: Add new unitaskhashes data variable which is cached<br>
b707d0cb runqueue: Improve scenequeue processing logic<br>
19a6e356 cache: Add SimpleCache class<br>
7bb79099 siggen: Import unihash code from OE-Core<br>
7aec8632 hashserv: SQL Optimizations<br>
18d4a31f fetch2/wget: avoid &#39;maximum recursion depth&#39; RuntimeErrors=
 when handling 403 codes<br>
<br>
94m19.081s<br>
profile.log.processed.18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7.whole.dry.ru=
n<br>
<a href=3D"http://paste.ubuntu.com/p/Jnvv8GJNKB/" rel=3D"noreferrer" target=
=3D"_blank">http://paste.ubuntu.com/p/Jnvv8GJNKB/</a><br>
<br>
And here is profile with latest master from yesterday:<br>
90mins:<br>
profile.log.processed.a5e084a266f63c2fd370122327615e49beaeb94e.whole.dry.ru=
n<br>
<a href=3D"http://paste.ubuntu.com/p/YhMCHPmg56/" rel=3D"noreferrer" target=
=3D"_blank">http://paste.ubuntu.com/p/YhMCHPmg56/</a><br>
<br>
So good news is that current master is a bit faster than &quot;good old&quo=
t; 18d4a31fdcec1f0e5d2199d6142f0ce833fca1a7.<br>
<br>
But still significantly slower on my fast builder compared to world tests o=
n poky + meta-oe,<br>
not sure if it&#39;s all just because the size of metadata in my builds (wi=
th 71K tasks).<br>
<br>
Even the dry running the tasks was about 10 tasks/second while RP was seein=
g around 200 tasks/second.<br>
<br>
Will try to bump BB_NUMBER_THREADS from 8 to 72.<br>
<br>
I&#39;ve already disabled rm_work and PRserv, but that doesn&#39;t seem to =
have any significant impact on performance here. Other than resolving the P=
Rserv terminating and then warnings about lost connection.<br>
<br>
Cheers,<br>
&gt; <br>
&gt; &gt; <br>
&gt; &gt; So basically the original changes showed a 25% hit but the perfor=
mance<br>
&gt; &gt; of -next is dire.<br>
&gt; &gt; <br>
&gt; &gt; This is with no hash equiv server configured.<br>
&gt; &gt; <br>
&gt; &gt; It will vary depending on the target used (numbers with -sato for=
 the<br>
&gt; &gt; above would be interesting for comparision) and how much was or i=
s in<br>
&gt; &gt; sstate, they type of sstate mirror configured and so on.<br>
&gt; &gt; <br>
&gt; &gt; I really need to focus on getting the new code functioning correc=
tly<br>
&gt; &gt; before we attempt to optimise but if nobody tests the new code du=
e to<br>
&gt; &gt; performance problems we have a different issue. We also have a sc=
aling<br>
&gt; &gt; problem with the hash server itself I need to fix to stop the<br>
&gt; &gt; autobuilder throwing weird errors. I&#39;m therefore a bit challe=
nged on<br>
&gt; &gt; where to start with it all :/.<br>
&gt; &gt; <br>
&gt; &gt; Cheers,<br>
&gt; &gt; <br>
&gt; &gt; Richard<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; -- <br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; Openembedded-core mailing list<br>
&gt; &gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; &gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openemb=
edded-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.=
org/mailman/listinfo/openembedded-core</a><br>
&gt; <br>
&gt; -- <br>
&gt; Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mail=
to:Martin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
<br>
<br>
<br>
-- <br>
Martin &#39;JaMa&#39; Jansa=C2=A0 =C2=A0 =C2=A0jabber: <a href=3D"mailto:Ma=
rtin.Jansa@gmail.com" target=3D"_blank">Martin.Jansa@gmail.com</a><br>
</blockquote></div>

--000000000000224cea05903d4137--
