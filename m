Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZiwk-0005Nt-FX
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 15:28:19 +0200
Received: by eekd49 with SMTP id d49so1779946eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=ETyG3wG+cuRoo7vo5k/VKmIJU+AySbA7DKhOPdWRDrw=;
	b=WRENzibourxqL/7npsw7w/727pcmEJY+8ZCyFFhQHA02wTRHqs6pCZetQm8R7W0oR5
	QrpHgmEcATPdw2AgjJg/nIazyRWSiUY6JM1hzp5NGKJpT+cg6xFKzobiIJV8X4OrHarF
	NgJRvjYfJU2CbrryRGU7KJvzJJgGkYOI6psS0felKakQZd2tIl0Cix4kszfgxrAsvcTA
	L7jcPOPFlDIJTuJFWpa8tZFb6uM9cQri+L4hmAZBUyi446Q87+X4OA89uia3tVaxoqrJ
	BXWQO0S8kKwiMe2zbXp0q6+GiZ3bjSBCmXTWL9sXQhHSjYKH/LQtqEV4y0pedLFh1f/D
	5PLw==
MIME-Version: 1.0
Received: by 10.14.188.140 with SMTP id a12mr5528722een.25.1338383879623; Wed,
	30 May 2012 06:17:59 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 06:17:59 -0700 (PDT)
In-Reply-To: <CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
	<20120529200740.GC5528@sakrah.homelinux.org>
	<CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
Date: Wed, 30 May 2012 06:17:59 -0700
Message-ID: <CAMKF1soEBM3JUdDt7FEs_F8rX+_Fm962ruuR4GE4rjvSPL+2UQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] valgrind: Enable valgrind for armv7
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 May 2012 13:28:19 -0000
Content-Type: multipart/alternative; boundary=bcaec52be543b7d2d204c140c7dc

--bcaec52be543b7d2d204c140c7dc
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 30, 2012, Samuel Stirtzel wrote:

> 2012/5/29 Khem Raj <raj.khem@gmail.com <javascript:;>>:
> >>
> >> At some extend yes, the configuration checks the host, the default
> >> string passed is "arm" but the configure.in checks for:
> >>
> >> case "${host_cpu}" in
> >> ...
> >>      armv7*)
> >>       AC_MSG_RESULT([ok (${host_cpu})])
> >>       ARCH_MAX="arm"
> >>
> >
> > in OE we know that compiler is configured to generate code for armv7
> > therefore you can safely change armv7* above in configure.in to be arm*
> >
>
> On this change I don't have a strong opinion (looks rather cosmetically).
> But sure I can send a follow up patch like you suggested.


It is not cosmetic if you see it also enables it for non armv7 archs

>
>
> --
> Regards
> Samuel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org <javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--bcaec52be543b7d2d204c140c7dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 30, 2012, Samuel Stirtzel  wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">2012/5/29 Khem Raj &lt;<a href=3D"javascript:;" onclick=
=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail=
.com</a>&gt;:<br>

&gt;&gt;<br>
&gt;&gt; At some extend yes, the configuration checks the host, the default=
<br>
&gt;&gt; string passed is &quot;arm&quot; but the <a href=3D"http://configu=
re.in" target=3D"_blank">configure.in</a> checks for:<br>
&gt;&gt;<br>
&gt;&gt; case &quot;${host_cpu}&quot; in<br>
&gt;&gt; ...<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0armv7*)<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok (${host_cpu})])<br>
&gt;&gt; =C2=A0 =C2=A0 =C2=A0 ARCH_MAX=3D&quot;arm&quot;<br>
&gt;&gt;<br>
&gt;<br>
&gt; in OE we know that compiler is configured to generate code for armv7<b=
r>
&gt; therefore you can safely change armv7* above in <a href=3D"http://conf=
igure.in" target=3D"_blank">configure.in</a> to be arm*<br>
&gt;<br>
<br>
On this change I don&#39;t have a strong opinion (looks rather cosmetically=
).<br>
But sure I can send a follow up patch like you suggested.</blockquote><div>=
<br></div><div>It is not cosmetic if you see it also enables it for non arm=
v7 archs=C2=A0<span></span></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<br>
<br>
--<br>
Regards<br>
Samuel<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"javascript:;" onclick=3D"_e(event, &#39;cvml&#39;, &#39;Openembe=
dded-core@lists.openembedded.org&#39;)">Openembedded-core@lists.openembedde=
d.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</blockquote>

--bcaec52be543b7d2d204c140c7dc--
