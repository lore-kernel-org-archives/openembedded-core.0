Received: from mail-ve0-f175.google.com ([209.85.128.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1U3ZZ3-0007qm-4I
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Feb 2013 23:03:29 +0100
Received: by mail-ve0-f175.google.com with SMTP id cy12so2779808veb.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Feb 2013 13:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:x-originating-ip:in-reply-to:references
	:from:date:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=DvuR7unHEAoj+yU+KrJpvk62bk7LoOIwlmjnv2sZYMU=;
	b=FM51goj54PX7UqHSeCQ8QNOUFvBSZ35B2Q4Mja3r0cTRdsJkv3TxEP61nJe5oLwIhj
	F/XBeu0xeVQWklXe6jnXjzGspmYhL4cScDcGqs6LDq33nAny4db0YPgiUdY9pmPXohq7
	juIlMxHc2rbIyNMOiDaB+F6OcaMKcV/3t7MpT5P3fHxZ7PP6FkLWdqyJd1wHXHbQQe6Z
	GvPE5da5PmNmRYG0kmL2TvH4SeLnmMcf9It7EJfmdIKaoynHwo37/WmkMP/fS6jHdcYp
	vxXoInLJ9MqOfVJwaX2LpfgvI6z8sk6Oj/tgadesAEleZ8gSKPkVKb0CB6sVCzA+fwPX
	s24w==
X-Received: by 10.52.35.241 with SMTP id l17mr1599629vdj.7.1360247149229; Thu,
	07 Feb 2013 06:25:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.188.18 with HTTP; Thu, 7 Feb 2013 06:25:28 -0800 (PST)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <5111726D.9080806@r-finger.com>
References: <B57A220D1EE1644685BA9AD5C790D20526BE045F3A@SOUTHSIDE.devonintlgroup.com>
	<50E181AF64EF4AF9835BF9FD769D9B93@intel.com>
	<B57A220D1EE1644685BA9AD5C790D20526BE045F3B@SOUTHSIDE.devonintlgroup.com>
	<510ED7B6.1010201@linaro.org>
	<F600AD7DF50F4C5793CA585286CEE7B4@intel.com>
	<5111726D.9080806@r-finger.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 7 Feb 2013 16:25:28 +0200
Message-ID: <CAK18fxEsHxKwi5gqTsCU=v3RXbn8noEN_SXt-OTFbZP8BsLuZQ@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQmdw6tud1NgLdi+TJZKTFkkmJ454knqefMLHX0ygl/6fE0vrmpfxrTi+V5taL63TwB9EsPn
Cc: openembedded <openembedded-core@lists.openembedded.org>
Subject: Re: OpenGL as a DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Feb 2013 22:03:29 -0000
Content-Type: multipart/alternative; boundary=20cf307813e022f6ca04d523380a

--20cf307813e022f6ca04d523380a
Content-Type: text/plain; charset=ISO-8859-1

O conclusion on this topic would be great. There are a lot of people
waiting for a fix on this topic.


On Tue, Feb 5, 2013 at 10:58 PM, Tomas Frydrych <tf+lists.yocto@r-finger.com
> wrote:

> Hi Ross,
>
> On 03/02/13 23:35, Ross Burton wrote:
> > On Sunday, 3 February 2013 at 21:33, Marcin Juszkiewicz wrote:
> >> As they are different architectures you can try this:
> >>
> >> DISTRO_FEATURES_wm8950 = "here copy your default DISTRO_FEATURES
> >> but skip opengl"
> >>
> >> Replace wm8950 with MACHINE name. Ugly solution but should work.
> > That means that Qt won't be built with GLES support.
> >
> > The best approach is to probe the hardware/libraries at runtime and
> > adapt - i.e. if only GLES libraries are available use those, but a
> > lot of software doesn't support that or simple probing isn't
> > sufficient (Intel Pine Trail supports both but GL is best, Cedar
> > Trail supports both but GL is terrible).
>
> Run-time probing is not a solution at all, because (a) we are not
> talking about how to write portable GL applications, but primarily how
> to package software already written by other people, and (b) with the
> current OE set up run-time probing cannot work anyway (and does not,
> e.g. cogl), because with two 'GL' providers there is no guarantee that
> the optimal one (i.e., not the mesa software GL rasterizer), gets used.
>
> The above scenario where someone wants to maintain a distro with
> multiple target architectures is the normal thing to ask for with OE.
> The fact that current OE cannot support it cleanly, and it has to be
> worked around on distro level (whether by bbappends that make the GL
> components machine-specific as they should be, or hacks like
> DISTRO_FEATURES_my-random-machine), demonstrates that we are not doing
> it right at the moment.
>
>
> > It's not as simple as it appears and causes a rather large number of
> > packages to become machine-specific.
>
> From actual experience I think this is well overstated; I dare you to
> support this by real numbers :-)
>
> Tomas
>
> --
> http://sleepfive.com
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
*Andrei Gherzan*
m: +40.744.478.414 |  f: +40.31.816.28.12

--20cf307813e022f6ca04d523380a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">O conclusion on this topic would be great. There are a lot=
 of people waiting for a fix on this topic.</div><div class=3D"gmail_extra"=
><br><br><div class=3D"gmail_quote">On Tue, Feb 5, 2013 at 10:58 PM, Tomas =
Frydrych <span dir=3D"ltr">&lt;<a href=3D"mailto:tf+lists.yocto@r-finger.co=
m" target=3D"_blank">tf+lists.yocto@r-finger.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Ross,<br>
<div class=3D"im"><br>
On 03/02/13 23:35, Ross Burton wrote:<br>
&gt; On Sunday, 3 February 2013 at 21:33, Marcin Juszkiewicz wrote:<br>
&gt;&gt; As they are different architectures you can try this:<br>
&gt;&gt;<br>
&gt;&gt; DISTRO_FEATURES_wm8950 =3D &quot;here copy your default DISTRO_FEA=
TURES<br>
&gt;&gt; but skip opengl&quot;<br>
&gt;&gt;<br>
&gt;&gt; Replace wm8950 with MACHINE name. Ugly solution but should work.<b=
r>
&gt; That means that Qt won&#39;t be built with GLES support.<br>
&gt;<br>
&gt; The best approach is to probe the hardware/libraries at runtime and<br=
>
&gt; adapt - i.e. if only GLES libraries are available use those, but a<br>
&gt; lot of software doesn&#39;t support that or simple probing isn&#39;t<b=
r>
&gt; sufficient (Intel Pine Trail supports both but GL is best, Cedar<br>
&gt; Trail supports both but GL is terrible).<br>
<br>
</div>Run-time probing is not a solution at all, because (a) we are not<br>
talking about how to write portable GL applications, but primarily how<br>
to package software already written by other people, and (b) with the<br>
current OE set up run-time probing cannot work anyway (and does not,<br>
e.g. cogl), because with two &#39;GL&#39; providers there is no guarantee t=
hat<br>
the optimal one (i.e., not the mesa software GL rasterizer), gets used.<br>
<br>
The above scenario where someone wants to maintain a distro with<br>
multiple target architectures is the normal thing to ask for with OE.<br>
The fact that current OE cannot support it cleanly, and it has to be<br>
worked around on distro level (whether by bbappends that make the GL<br>
components machine-specific as they should be, or hacks like<br>
DISTRO_FEATURES_my-random-machine), demonstrates that we are not doing<br>
it right at the moment.<br>
<div class=3D"im"><br>
<br>
&gt; It&#39;s not as simple as it appears and causes a rather large number =
of<br>
&gt; packages to become machine-specific.<br>
<br>
</div>From actual experience I think this is well overstated; I dare you to=
<br>
support this by real numbers :-)<br>
<br>
Tomas<br>
<br>
--<br>
<a href=3D"http://sleepfive.com" target=3D"_blank">http://sleepfive.com</a>=
<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr"><div style=3D"text-align:center"></div><div style=3D"text-=
align:center"><div align=3D"left" style=3D"font-family:&#39;Times New Roman=
&#39;;font-size:medium">

<b style=3D"color:rgb(51,51,51);font-family:Arial;font-size:small;text-alig=
n:center">Andrei Gherzan</b><font face=3D"Arial" color=3D"#333333" size=3D"=
-1"><br></font><font face=3D"Arial" color=3D"#333333" size=3D"-1">m: +40.74=
4.478.414 | =A0f: +40.31.816.28.12</font><br>

</div></div></div>
</div>

--20cf307813e022f6ca04d523380a--
