Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8CB60731D9;
	Fri, 11 Mar 2016 15:52:14 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id k1so138986138vkb.0;
	Fri, 11 Mar 2016 07:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=6chv0NEY5rbLTfFbHgWQZ9TwZo90GCsX0s1tL860sZU=;
	b=Z0R0ODEx1j8aoPqyymCW09vJV+x1LyqTUxOZD1xOJNfoA7IBK/kSBU/DJl1ZCjdHNO
	sAJQr4j9cjzPKTblLVabrwyzArqyzEO5QWonb380ANjPiv/r3LX1AYJOaFPn4CNSDXcC
	z0JLiFkYtux23Nfvnq7yCJ5LlQ5MPB1pvDtn4O+8xV5DoL7LUeUfJ2jTLDDIhNEKYJl+
	3/ImK2/CmyIFUR9qdxubwraigoOJqWE4xphnk4FZdoYF7T+nLHiOZEXJ+YdL9Z+dLhrF
	Q6mvm8D47qSSTqOAmLO48PhChojEvecKVrx8hdCHgM8YBr2kvgL21Jgyiezbjadoz4vm
	wqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=6chv0NEY5rbLTfFbHgWQZ9TwZo90GCsX0s1tL860sZU=;
	b=ChmEE1xdEJ2RwbxuhGYefSDE9OvracEbBjkwZUPVdABZ16TXLdFSn1impizf9DYOn+
	PT6751hvKBg8MoUaV5no08h+vk3zwPvQIl6aNcZRwkcIsDo2fN/Vs0PxhkvoLqXdKvwh
	3fUCpXF3GBflRycWVlINl+XEZ4o+1CNXmCEmj2dJEceUTiy+UWhmq5Amhpy6ql/T+wha
	y2oW2/lnoVWDtM+0TFG0nG24RU6PgAjJXn2DZwKXNpXj1G9IU1Po7SB/lGEkDQV+glUm
	Q8D58Oem0cOw+0+j2yJWXfkvXtxzhgAB2YFEs4J6T3qdqVKrAQMhZrjxYXoHlNaUaSQB
	wsEg==
X-Gm-Message-State: AD7BkJK12AF9KMbD3IwCAFLVinWw+r+FgJ7Cc2/iYV3RHZ+u79gqewiyBVBKSqLfunwzhAL9m/GalNKwF3dEWg==
MIME-Version: 1.0
X-Received: by 10.31.167.195 with SMTP id q186mr10313679vke.113.1457711534671; 
	Fri, 11 Mar 2016 07:52:14 -0800 (PST)
Received: by 10.176.6.42 with HTTP; Fri, 11 Mar 2016 07:52:14 -0800 (PST)
In-Reply-To: <56E2E731.1040005@windriver.com>
References: <20160310115301.GC2573@jama>
	<56E2E731.1040005@windriver.com>
Date: Fri, 11 Mar 2016 10:52:14 -0500
Message-ID: <CADkTA4N43Zi=oLVRe99eEvvPjgYethKFNKH3J90Bss_AzqovVg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2016-03-09
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
X-List-Received-Date: Fri, 11 Mar 2016 15:52:19 -0000
Content-Type: multipart/alternative; boundary=001a11425fba358e59052dc7ea71

--001a11425fba358e59052dc7ea71
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 11, 2016 at 10:41 AM, Mark Hatle <mark.hatle@windriver.com>
wrote:

> On 3/10/16 5:53 AM, Martin Jansa wrote:
> > Aggressive PNBLACKLISTing continues. But linux-yocto (and modules
> depending on it)
> > are still broken :/.
> >
> > I'll look at cef3 and chromium issue, my recent patch for meta-browser
> > fixed the build for armv7a MACHINEs, so it probably needs to be extended
> > a bit to cover warnings in x86 and then duplicate the same to cef3.
> > This issue is there for so long, slowing down the builds significantly
> > (and causing logs to be much bigger) - I don't use these recipes but I
> > hate the failures even more.
> >
>
> Is see the reported log failure, but I've been building with the oe-core
> and
> poky linux-yocto head of master for the last couple weeks, all arches
> includes
> qemux86.
>


I don't know what to say about those failures either. I've been chasing
perf build
races for the past week, and that includes building linux-yocto hundreds of
times,
and I've never seen the uapi headers not be in place like the logs show.

The Yocto AB is also not showing it to me.

Unless I can get access to a broken build, I'm at a loss to actually debug
and
fix it.

Bruce


>
> I don't see the error on my builder.  Is something changing the default
> recipe/kernel configuration triggering the fault?
>
> --Mark
>
> > === qemux86 (2) ===
> >     * /meta-openembedded/meta-python/recipes-devtools/python/
> python-m2crypto_0.23.0.bb, do_compile
> >     * /openembedded-core/meta/recipes-kernel/linux/linux-yocto_4.4.bb,
> do_compile
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11425fba358e59052dc7ea71
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Mar 11, 2016 at 10:41 AM, Mark Hatle <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"">On 3/10/16 5:53 AM, Martin Jansa wrote:<br>
&gt; Aggressive PNBLACKLISTing continues. But linux-yocto (and modules depe=
nding on it)<br>
&gt; are still broken :/.<br>
&gt;<br>
&gt; I&#39;ll look at cef3 and chromium issue, my recent patch for meta-bro=
wser<br>
&gt; fixed the build for armv7a MACHINEs, so it probably needs to be extend=
ed<br>
&gt; a bit to cover warnings in x86 and then duplicate the same to cef3.<br=
>
&gt; This issue is there for so long, slowing down the builds significantly=
<br>
&gt; (and causing logs to be much bigger) - I don&#39;t use these recipes b=
ut I<br>
&gt; hate the failures even more.<br>
&gt;<br>
<br>
</span>Is see the reported log failure, but I&#39;ve been building with the=
 oe-core and<br>
poky linux-yocto head of master for the last couple weeks, all arches inclu=
des<br>
qemux86.<br></blockquote><div><br><br></div><div>I don&#39;t know what to s=
ay about those failures either. I&#39;ve been chasing perf build<br></div><=
div>races for the past week, and that includes building linux-yocto hundred=
s of times,<br></div><div>and I&#39;ve never seen the uapi headers not be i=
n place like the logs show.<br><br></div><div>The Yocto AB is also not show=
ing it to me.<br><br></div><div>Unless I can get access to a broken build, =
I&#39;m at a loss to actually debug and<br></div><div>fix it.<br><br></div>=
<div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I don&#39;t see the error on my builder.=C2=A0 Is something changing the de=
fault<br>
recipe/kernel configuration triggering the fault?<br>
<br>
--Mark<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; =3D=3D=3D qemux86 (2) =3D=3D=3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0* /meta-openembedded/meta-python/recipes-devtools/p=
ython/<a href=3D"http://python-m2crypto_0.23.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python-m2crypto_0.23.0.bb</a>, do_compile<br>
&gt;=C2=A0 =C2=A0 =C2=A0* /openembedded-core/meta/recipes-kernel/linux/<a h=
ref=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" target=3D"_blank">linu=
x-yocto_4.4.bb</a>, do_compile<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for cha=
os and madness await thee at its end&quot;</div>
</div></div>

--001a11425fba358e59052dc7ea71--
