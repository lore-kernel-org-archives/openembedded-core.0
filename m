Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 98F417198D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 17:50:15 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id i127so3979998oia.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 10:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=NKx7YstL3ddtNw1gAG3jjZZISoNLL6+zLZd3ut+z8M8=;
	b=WM6apUm3Wnqu+DDYqq0HoHzSPjxs+DopkaVzXswPoRUuQ34ywgKuRWBYOGHLVA+o6I
	2tgJJRj+QXFVZ66kXglFTcgIJu0S/7ErTszKLjA7yjRgGmr74Szrug19yGldoGiTymq1
	sp+v8VoF0qammsM25/yhQIl+At7qiQJV6tPXs5mcnTm4G8hGPIfol3iMmFKhLO0qqB2d
	UseJ3LOwTLJIfuE0g9dkcbXqvp5d/w1VbKe2u8HuyBG4QaLC1moFK2DVu17v8XaIH+AM
	IMsPUL11+9jFW1K89s+jZkShqcpfhcNnF1fYAkEWl16wwSJn4LYTtAy7ycthdlPhlTNv
	wTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=NKx7YstL3ddtNw1gAG3jjZZISoNLL6+zLZd3ut+z8M8=;
	b=bQaVGAouNA+hwrmoVUi6goRI2+SWJvE3wJZR26Nd/fH8WYh+5ru3IxSS94x+ehI8Ae
	2l3Sy9bCqMAdDJcI9+S/A+FUrW9+f0e7Ss+FtGbLjtjxW069GHmAzCtuXwEDZbrZrVUh
	y2Ki/0IKVpgUvjk9maynbiwyMOymuzocQsLGZKsjqpRg5BPdi4NOFUb7kSsIz7lqPkb0
	5gEbzeGNYxEOnh0f3KeA107lcN1RMc2qk/p1gFcSVqeMRM2OhRjWR0qmGALSgYrHEIjU
	w5fFOavpRH03HTyZSs3D9mwY/oCJTM7UflXwjp3b+fH8iF+yLCZAWbBbYoUApg2/OpuD
	RI1w==
X-Gm-Message-State: AA6/9Rm+jEr48VFu2az/mWyJfMhSEZ6Z0b7ysbwXjGz+seOGeD/ueLOv2nwKKSzeqglG7+D6KWVRaTWv6mooBQ==
X-Received: by 10.157.7.46 with SMTP id 43mr1105388ote.176.1476294616959; Wed,
	12 Oct 2016 10:50:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Wed, 12 Oct 2016 10:49:56 -0700 (PDT)
In-Reply-To: <f31d192a-c54f-6aa2-be9b-beeb4bdd4462@opendreambox.org>
References: <1476120925-26574-1-git-send-email-jkrishnanjanappa@mvista.com>
	<defce586-6033-baed-bf70-bdbe1659922c@opendreambox.org>
	<CAD3vsf5zv87RLAN70WF06Jxr1qq2=5-ctDekdA_0o1Cr1nmBhQ@mail.gmail.com>
	<CABcZANkt+TbuEkTCGmqEQZG+Nw+MardZR4Jj+9FNDXFHbZysEg@mail.gmail.com>
	<CAD3vsf6muVV_NNP=rTGNo-4gMz_Q0SNojJ-qJui8_j9eW-gmZQ@mail.gmail.com>
	<CABcZANnDjD7MAU-8EU1CmRxZKDAZtB3E6JHiPCwo1q77oNjc1A@mail.gmail.com>
	<f31d192a-c54f-6aa2-be9b-beeb4bdd4462@opendreambox.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 12 Oct 2016 10:49:56 -0700
X-Google-Sender-Auth: uBNlGpjRH6xRueTaikuUnyap3W0
Message-ID: <CABcZANmMW9wg4frZG4amYJ6_TmZ+pM-oAKFWKUTdQT-DOWurXA@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman: get the correct network interface name from dmesg during NFS booting
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
X-List-Received-Date: Wed, 12 Oct 2016 17:50:17 -0000
Content-Type: multipart/alternative; boundary=001a1139a6863a5306053eaea0f9

--001a1139a6863a5306053eaea0f9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 12, 2016 at 12:30 AM, Andreas Oberritter <obi@opendreambox.org>
wrote:

> On 11.10.2016 21:34, Christopher Larson wrote:
> >
> > On Tue, Oct 11, 2016 at 12:03 PM, Jagadeesh Krishnanjanappa
> > <jkrishnanjanappa@mvista.com <mailto:jkrishnanjanappa@mvista.com>>
> wrote:
> >
> >     On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson
> >     <clarson@kergoth.com <mailto:clarson@kergoth.com>> wrote:
> >
> >
> >         On Tue, Oct 11, 2016 at 5:11 AM, Jagadeesh Krishnanjanappa
> >         <jkrishnanjanappa@mvista.com
> >         <mailto:jkrishnanjanappa@mvista.com>> wrote:
> >
> >             Thanks for reviewing the patch.
> >
> >
> >                 I think this is too fragile to land in OE-Core. What
> >                 happens if a
> >                 network driver prints "device=3Deth0"? Or if other kern=
el
> >                 messages make
> >                 the string disappear from dmesg and connman gets
> >                 restarted later?
> >
> >
> >             True. If device=3Deth0 gets disappeared/corrupted, then we =
may
> >             have problem.
> >
> >
> >                 FWIW, I'm attaching my current wrapper script for
> >                 connmand. I don't
> >                 think it's perfect, but at least it doesn't depend on
> >                 any init manager
> >                 and works across restarts.
> >
> >             The wrapper script attached by you, takes care of the
> >             missing scenarios. Seems to be more complete.
> >
> >
> >
> >                 Add these lines to connman's do_install, in case you'd
> >                 like to test
> >                 and/or submit it:
> >
> >                 mv ${D}${sbindir}/connmand ${D}${sbindir}/connmand.real
> >                 install -m 755 ${WORKDIR}/connmand-nfsroot.in
> >                 <http://connmand-nfsroot.in> ${D}${sbindir}/connmand
> >                 sed -e 's,@sbindir@,${sbindir},g' -i
> ${D}${sbindir}/connmand
> >
> >             I think it would be good idea to integrate your changes int=
o
> >             the already existing OE-core's connman script, instead of a
> >             calling original connman script from the wrapper script.
> >
> >
> >         I threw
> >         together https://github.com/openembedde
> d/openembedded-core/compare/master...kergoth:connman-systemd-nfs
> >         <https://github.com/openembedded/openembedded-core/compare/
> master...kergoth:connman-systemd-nfs> last
> >         night, only limited testing. I think using a script in
> >         libexecdir is rather cleaner than wrapping connmand in place,
> >         for something like this, personally.
> >
> >
> >     In the above commit,  the last line of connman/connman/start-connma=
n
> >     file, should be exec @SBINDIR@/connmand "$@" instead of exec
> >     @SBINDIR@/connman "$@" ; as the actual binary file name is connmand=
.
> >
> >
> > Thanks, didn=E2=80=99t notice that. Obviously it needs polish and testi=
ng before
> > submission, I mainly linked it to solicit thoughts on the approach :)
>
> your proposal adds some complexity to the recipe, which I tried to
> avoid, because this wrapper script is something we'll probably have to
> maintain forever.
>
> For example, your recipe might break without notice if upstream is going
> to ship another binary as ${sbindir}/connmand-something in the future;
> or if upstream decides to change the systemd unit to use a variable
> instead of a hardcoded path to connmand.
>
> Besides that, I don't have a strong opinion on the location of the
> wrapper script.


Good points. I think the future-proofing could be addressed with something
like sed -i -e "s#^ExecStart=3D.*#ExecStart=3D$wrapperpath#"
${D}${systemd_unitdir}/system/connman.service, and then switch away from
that weak start-connman script in favor of yours, but keep it in libexec
for cleanliness.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1139a6863a5306053eaea0f9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Oct 12, 2016 at 12:30 AM, Andreas Oberritter <span dir=3D"ltr">&lt;=
<a href=3D"mailto:obi@opendreambox.org" target=3D"_blank">obi@opendreambox.=
org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,2=
04);border-left-style:solid;padding-left:1ex"><span class=3D"gmail-m_-17625=
81467229495523gmail-">On 11.10.2016 21:34, Christopher Larson wrote:<br>
&gt;<br>
&gt; On Tue, Oct 11, 2016 at 12:03 PM, Jagadeesh Krishnanjanappa<br>
</span><span class=3D"gmail-m_-1762581467229495523gmail-">&gt; &lt;<a href=
=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanappa@=
mvista.com</a> &lt;mailto:<a href=3D"mailto:jkrishnanjanappa@mvista.com" ta=
rget=3D"_blank">jkrishnanjanappa@mvist<wbr>a.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On Tue, Oct 11, 2016 at 9:06 PM, Christopher Larson=
<br>
</span><span class=3D"gmail-m_-1762581467229495523gmail-">&gt;=C2=A0 =C2=A0=
 =C2=A0&lt;<a href=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson=
@kergoth.com</a> &lt;mailto:<a href=3D"mailto:clarson@kergoth.com" target=
=3D"_blank">clarson@kergoth.com</a>&gt;&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On Tue, Oct 11, 2016 at 5:11 AM, Jaga=
deesh Krishnanjanappa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:jkrishnanjanapp=
a@mvista.com" target=3D"_blank">jkrishnanjanappa@mvista.com</a><br>
</span><span class=3D"gmail-m_-1762581467229495523gmail-">&gt;=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:jkrishnanjanappa@mvista.c=
om" target=3D"_blank">jkrishnanjanappa@mvis<wbr>ta.com</a>&gt;&gt; wrote:<b=
r>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanks for reviewing th=
e patch.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I think t=
his is too fragile to land in OE-Core. What<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0happens i=
f a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0network d=
river prints &quot;device=3Deth0&quot;? Or if other kernel<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0messages =
make<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the strin=
g disappear from dmesg and connman gets<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0restarted=
 later?<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0True. If device=3Deth0 =
gets disappeared/corrupted, then we may<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0have problem.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FWIW, I&#=
39;m attaching my current wrapper script for<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0connmand.=
 I don&#39;t<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0think it&=
#39;s perfect, but at least it doesn&#39;t depend on<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0any init =
manager<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and works=
 across restarts.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0The wrapper script atta=
ched by you, takes care of the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0missing scenarios. Seem=
s to be more complete.<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Add these=
 lines to connman&#39;s do_install, in case you&#39;d<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0like to t=
est<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0and/or su=
bmit it:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${=
sbindir}/connmand ${D}${sbindir}/connmand.real<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0install -=
m 755 ${WORKDIR}/<a href=3D"http://connmand-nfsroot.in" rel=3D"noreferrer" =
target=3D"_blank">connmand-nfsroot.in</a><br>
</span>&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&l=
t;<a href=3D"http://connmand-nfsroot.in" rel=3D"noreferrer" target=3D"_blan=
k">http://connmand-nfsroot.in</a>&gt; ${D}${sbindir}/connmand<br>
<span class=3D"gmail-m_-1762581467229495523gmail-">&gt;=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -e &#39;s,@sbindir@,${sbindir=
},g&#39; -i ${D}${sbindir}/connmand<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I think it would be goo=
d idea to integrate your changes into<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the already existing OE=
-core&#39;s connman script, instead of a<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0calling original connma=
n script from the wrapper script.<br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I threw<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0together <a href=3D"https://github.co=
m/openembedded/openembedded-core/compare/master...kergoth:connman-systemd-n=
fs" rel=3D"noreferrer" target=3D"_blank">https://github.com/openembedde<wbr=
>d/openembedded-core/compare/<wbr>master...kergoth:connman-<wbr>systemd-nfs=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://github.com/ope=
nembedded/openembedded-core/compare/master...kergoth:connman-systemd-nfs" r=
el=3D"noreferrer" target=3D"_blank">https://github.com/openembed<wbr>ded/op=
enembedded-core/compare/<wbr>master...kergoth:connman-<wbr>systemd-nfs</a>&=
gt; last<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0night, only limited testing. I think =
using a script in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libexecdir is rather cleaner than wra=
pping connmand in place,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for something like this, personally.<=
br>
&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0In the above commit,=C2=A0 the last line of connman=
/connman/start-connman<br>
&gt;=C2=A0 =C2=A0 =C2=A0file, should be exec @SBINDIR@/connmand &quot;$@&qu=
ot; instead of exec<br>
&gt;=C2=A0 =C2=A0 =C2=A0@SBINDIR@/connman &quot;$@&quot; ; as the actual bi=
nary file name is connmand.<br>
&gt;<br>
&gt;<br>
&gt; Thanks, didn=E2=80=99t notice that. Obviously it needs polish and test=
ing before<br>
&gt; submission, I mainly linked it to solicit thoughts on the approach :)<=
br>
<br>
</span>your proposal adds some complexity to the recipe, which I tried to<b=
r>
avoid, because this wrapper script is something we&#39;ll probably have to<=
br>
maintain forever.<br>
<br>
For example, your recipe might break without notice if upstream is going<br=
>
to ship another binary as ${sbindir}/connmand-something in the future;<br>
or if upstream decides to change the systemd unit to use a variable<br>
instead of a hardcoded path to connmand.<br>
<br>
Besides that, I don&#39;t have a strong opinion on the location of the<br>
wrapper script.</blockquote><div><br></div><div>Good points. I think the fu=
ture-proofing could be addressed with something like sed -i -e &quot;s#^Exe=
cStart=3D.*#ExecStart=3D$wrapperpath#&quot; ${D}${systemd_unitdir}/system/c=
onnman.service, and then switch away from that weak start-connman script in=
 favor of yours, but keep it in libexec for cleanliness.</div></div>-- <br>=
<div class=3D"gmail-m_-1762581467229495523gmail_signature">Christopher Lars=
on<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded, OpenZa=
urus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Graphics</di=
v>
</div></div>

--001a1139a6863a5306053eaea0f9--
