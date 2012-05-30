Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZjT8-000709-MV
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:01:50 +0200
Received: by eekd49 with SMTP id d49so1795752eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 06:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=OJ7qcEx3f9uMbC6L+EOywg+Bc4z5RzxYpgIK1KhKKFI=;
	b=H1MxOOpvFGf6UN2leyRtQcs1LetoA9EG36Rtyp0O3n7nrpRz5GEeCy55eq5Ly7USyi
	e/6Xn/xKdCSEkwS+6nUHtibDgTbgGIrt6myliZxNHKUo/a6jvfX+NDjk/72qip4gKlMO
	207JfoEWONNW5KvGKNRjl1lzIIx4IEx/drV/9M3hAdEXC80dt+rF0RNUrAapPzukiWpr
	JMpvwnnwZPQ9foNOb9++GLAYulSkSoF3eyA7uqg+IaFdvx9fE2maW5uOP2ZaqOTEvovn
	9h2acZKtQkG0TmbiPWOcNglqSz+0dsdxwLTVQEosnP27fmyak2adFTjbzb8Sc4XZI3Vm
	GrqQ==
MIME-Version: 1.0
Received: by 10.14.100.194 with SMTP id z42mr7086944eef.146.1338385888192;
	Wed, 30 May 2012 06:51:28 -0700 (PDT)
Received: by 10.14.188.11 with HTTP; Wed, 30 May 2012 06:51:28 -0700 (PDT)
In-Reply-To: <CAGiJk9dpiGdkDHeGkV=pVFu5joeJzqYZw338kJ3Wy2uKKYMEDw@mail.gmail.com>
References: <1337777200-8672-1-git-send-email-s.stirtzel@googlemail.com>
	<1FEF30F9-919D-4565-8381-29FF7C2D0B87@dominion.thruhere.net>
	<CAGiJk9d8nyD9gDHFox_b4tpnzS=5M1squi03mkbyCW7N3OLabQ@mail.gmail.com>
	<20120529200740.GC5528@sakrah.homelinux.org>
	<CAGiJk9fpbHXd1Oe4ZkHpWvSONY3y3KhOVKGuYDgAaOjziFF=kw@mail.gmail.com>
	<CAMKF1soEBM3JUdDt7FEs_F8rX+_Fm962ruuR4GE4rjvSPL+2UQ@mail.gmail.com>
	<CAGiJk9dpiGdkDHeGkV=pVFu5joeJzqYZw338kJ3Wy2uKKYMEDw@mail.gmail.com>
Date: Wed, 30 May 2012 06:51:28 -0700
Message-ID: <CAMKF1sq9qgmeWipuxSuRpPtkqKz7nHHtsoh0=+tZQj9J0v6fRA@mail.gmail.com>
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
X-List-Received-Date: Wed, 30 May 2012 14:01:56 -0000
Content-Type: multipart/alternative; boundary=bcaec521556b702a5104c1413f84

--bcaec521556b702a5104c1413f84
Content-Type: text/plain; charset=UTF-8

On Wednesday, May 30, 2012, Samuel Stirtzel wrote:

> 2012/5/30 Khem Raj <raj.khem@gmail.com <javascript:;>>:
> >
> >
> > On Wednesday, May 30, 2012, Samuel Stirtzel wrote:
> >>
> >> 2012/5/29 Khem Raj <raj.khem@gmail.com <javascript:;>>:
> >> >>
> >> >> At some extend yes, the configuration checks the host, the default
> >> >> string passed is "arm" but the configure.in checks for:
> >> >>
> >> >> case "${host_cpu}" in
> >> >> ...
> >> >>      armv7*)
> >> >>       AC_MSG_RESULT([ok (${host_cpu})])
> >> >>       ARCH_MAX="arm"
> >> >>
> >> >
> >> > in OE we know that compiler is configured to generate code for armv7
> >> > therefore you can safely change armv7* above in configure.in to be
> arm*
> >> >
> >>
> >> On this change I don't have a strong opinion (looks rather
> cosmetically).
> >> But sure I can send a follow up patch like you suggested.
> >
> >
> > It is not cosmetic if you see it also enables it for non armv7 archs
>
> Maybe it is a misunderstanding?
> Do you also want me to change:
>
> COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64).*-linux'
> COMPATIBLE_HOST_armv7a = 'arm.*-linux'
>
> to: COMPATIBLE_HOST = '(i.86|x86_64|powerpc|powerpc64||arm).*-linux'
>
> Else it would be only a cosmetic change, because the recipe is
> preventing non armv7 arch.
> Or am I mistaken?
>
>
Recipe and package itself are two different things I was commenting on
package itself how it's baked in OE is a different thing

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

--bcaec521556b702a5104c1413f84
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Wednesday, May 30, 2012, Samuel Stirtzel  wrote:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">2012/5/30 Khem Raj &lt;<a href=3D"javascript:;" onclick=
=3D"_e(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail=
.com</a>&gt;:<br>

&gt;<br>
&gt;<br>
&gt; On Wednesday, May 30, 2012, Samuel Stirtzel wrote:<br>
&gt;&gt;<br>
&gt;&gt; 2012/5/29 Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e(even=
t, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</a>&gt=
;:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; At some extend yes, the configuration checks the host, th=
e default<br>
&gt;&gt; &gt;&gt; string passed is &quot;arm&quot; but the <a href=3D"http:=
//configure.in" target=3D"_blank">configure.in</a> checks for:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; case &quot;${host_cpu}&quot; in<br>
&gt;&gt; &gt;&gt; ...<br>
&gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0armv7*)<br>
&gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 AC_MSG_RESULT([ok (${host_cpu})])<br=
>
&gt;&gt; &gt;&gt; =C2=A0 =C2=A0 =C2=A0 ARCH_MAX=3D&quot;arm&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; in OE we know that compiler is configured to generate code fo=
r armv7<br>
&gt;&gt; &gt; therefore you can safely change armv7* above in <a href=3D"ht=
tp://configure.in" target=3D"_blank">configure.in</a> to be arm*<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; On this change I don&#39;t have a strong opinion (looks rather cos=
metically).<br>
&gt;&gt; But sure I can send a follow up patch like you suggested.<br>
&gt;<br>
&gt;<br>
&gt; It is not cosmetic if you see it also enables it for non armv7 archs<b=
r>
<br>
Maybe it is a misunderstanding?<br>
Do you also want me to change:<br>
<br>
COMPATIBLE_HOST =3D &#39;(i.86|x86_64|powerpc|powerpc64).*-linux&#39;<br>
COMPATIBLE_HOST_armv7a =3D &#39;arm.*-linux&#39;<br>
<br>
to: COMPATIBLE_HOST =3D &#39;(i.86|x86_64|powerpc|powerpc64||arm).*-linux&#=
39;<br>
<br>
Else it would be only a cosmetic change, because the recipe is<br>
preventing non armv7 arch.<br>
Or am I mistaken?<br>
<br></blockquote><div><br></div><div>Recipe and package itself are two diff=
erent things I was commenting on package itself how it&#39;s baked in OE is=
 a different thing=C2=A0<span></span></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

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

--bcaec521556b702a5104c1413f84--
