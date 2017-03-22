Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 40ADB77A88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 12:33:17 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id y76so156108566qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 05:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oY5y+5CFKxXTIMHgR9DnVp8b4+letwzkfVFZrO4NMxQ=;
	b=hyMJZ+IcG8VGk+bmIds8z7wGyz4/hm8DBQqkq94DcYgiBH9XpYjd5od+C7N1sZVP9i
	PoT+5pcI8uNunG5BL62FJGEDdOuei4xB6Xl8mt1WVnneHElRhiYkw44EBDA8il6wIcPB
	3Nu1/tI4wND2RBunGHQMxTBb2H51mthJkxnVImNQOPYUO6mDBs7ufoDercn9b9lfMtem
	XgsPr3rTYPxfjE+SAjXjDLmjfU8AHqxGwrFPzjE0d8j7jPSQapRyRX5i4yhxhjraRLHO
	ujUzfrPEXCJXH6AMMF9EXOLSP+D+EVuTZTesJEJXCe7Lnt+HYwmsOgBstfzed5NkjRdq
	cIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oY5y+5CFKxXTIMHgR9DnVp8b4+letwzkfVFZrO4NMxQ=;
	b=rs8BEcPF0qeXvYJHbzZgHZITLgKV+vgdWxBlOEwjd1lI0t1RGLCfRnhX7lfaASWDJc
	EKw0pby3qCNxVy3m+f0fIWgquXNStYKqbu9qmwu5EuNhxwh1q+R3C7spG2h5oQbzL/6i
	EkHtJSgpBuOCxVRplC7lhTZ8fU2PR1fNu9ezgYalnOxVipZLApctaXMoREurxzPrJUNK
	YFYicGtttKLtNTUgvUUmfQfOohboI0NVIkuPkaoaubrnHvC1wC1584QxmgCbDrOjk8FY
	MHQ2fp19t1dt9TuhtgLbdCduzbdtktm+9MK3y910prHYFZJQmP3WLtUgPymkKNHlxys4
	92OA==
X-Gm-Message-State: AFeK/H11C+QHYtW5WoI8SySDKGDj9ijFwegFzPOCOk3VYqWd2w6f4LKeJCgnetam4l4GH3pF4qdaYxp2Qrd/1w==
X-Received: by 10.55.8.1 with SMTP id 1mr18237861qki.254.1490185998274; Wed,
	22 Mar 2017 05:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.163.69 with HTTP; Wed, 22 Mar 2017 05:33:17 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
	<CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
	<alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 22 Mar 2017 08:33:17 -0400
Message-ID: <CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 12:33:18 -0000
Content-Type: multipart/alternative; boundary=001a114d6d00139a2c054b50f73f

--001a114d6d00139a2c054b50f73f
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 22, 2017 at 8:24 AM, Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

>
>   proper attributions seem to have been totally lost here ...
>
> On Wed, 22 Mar 2017, Bruce Ashfield wrote:
>
> > On Wed, Mar 22, 2017 at 8:02 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >
> >       On 22 March 2017 at 11:57, Bruce Ashfield <
> bruce.ashfield@gmail.com> wrote:
> >             So where are they supposed to be specified ? Surely not a
> separate distro .conf ? and most
> > certainly not in local.conf ... I've always been unsure of where the
> right place to specify
> > versions like that.
> >
> > If it were my layer I'd have an .inc file that set all the preferred
> > versions where the defaults don't work, that the user would have to
> > include in their distro.
> >
> > Aha. Kind of like the old versions file that used to float around.
> >
> > Seems reasonable (if a bit less automatic than someone like me who
> > wants .. to use the layer like a black box)
> >
> > Luckily I have push access to that layer, so I can make a change
> > like that ;)
> >
> > One final question, is it considered a design option to set those
> > versions triggered off an IMAGE or DISTRO feature ? i.e. in
> > anonymous python .. or is that already too late in the
> > parsing/resolution process ?
> >
> > Bruce
>
>   sorry, didn't mean to start something this early in the morning ...
> ok, i did. :-)
>
>   in any event, can we agree that:
>
> 1) it's bad layer design if the simple act of including a layer in
> bblayers.conf suddenly causes weird things to happen like the above?
>
> 2) regardless of how the developer eventually does it, picking up
> those PREFERRED VERSIONS from meta-openstack should require *some*
> kind of explicit selection?
>


Honestly .. I disagree on #2.

The packages within the openstack layer *will not work* with other versions
of those
packages.

So if someone actually wants to use the functionality provided by the
layer, they are
not optional. And the errors/issues that you get are extremely obtuse and
hard to
debug. That's the design point of the layer .. it doesn't let that happen.

Hence making it something they must do as an extra step .. really is a bad
idea.

It gets in the way of people picking packages out of that layer if they
don't want to
actually build openstack, that's the crux of the problem. But to answer
that issue,
that's why meta-cloud-services exists, that doesn't' force versions and
holds the
generally useful "cloud" packages.

Cheers,

Bruce


>
>   thank you kindly.
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
>
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114d6d00139a2c054b50f73f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Mar 22, 2017 at 8:24 AM, Robert P. J. Day <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcou=
rse.ca</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
=C2=A0 proper attributions seem to have been totally lost here ...<br>
<span class=3D""><br>
On Wed, 22 Mar 2017, Bruce Ashfield wrote:<br>
<br>
&gt; On Wed, Mar 22, 2017 at 8:02 AM, Burton, Ross &lt;<a href=3D"mailto:ro=
ss.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0On 22 March 2017 at 11:57, Bruce Ashfield &l=
t;<a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&=
gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So where are they suppo=
sed to be specified ? Surely not a separate distro .conf ? and most<br>
&gt; certainly not in local.conf ... I&#39;ve always been unsure of where t=
he right place to specify=C2=A0<br>
&gt; versions like that.<br>
&gt;<br>
&gt; If it were my layer I&#39;d have an .inc file that set all the preferr=
ed<br>
&gt; versions where the defaults don&#39;t work, that the user would have t=
o<br>
&gt; include in their distro.<br>
&gt;<br>
&gt; Aha. Kind of like the old versions file that used to float around.<br>
&gt;<br>
&gt; Seems reasonable (if a bit less automatic than someone like me who<br>
&gt; wants .. to use the layer like a black box)<br>
&gt;<br>
&gt; Luckily I have push access to that layer, so I can make a change<br>
&gt; like that ;)<br>
&gt;<br>
&gt; One final question, is it considered a design option to set those<br>
&gt; versions triggered off an IMAGE or DISTRO feature ? i.e. in<br>
&gt; anonymous python .. or is that already too late in the<br>
&gt; parsing/resolution process ?<br>
&gt;<br>
&gt; Bruce<br>
<br>
</span>=C2=A0 sorry, didn&#39;t mean to start something this early in the m=
orning ...<br>
ok, i did. :-)<br>
<br>
=C2=A0 in any event, can we agree that:<br>
<br>
1) it&#39;s bad layer design if the simple act of including a layer in<br>
bblayers.conf suddenly causes weird things to happen like the above?<br>
<br>
2) regardless of how the developer eventually does it, picking up<br>
those PREFERRED VERSIONS from meta-openstack should require *some*<br>
kind of explicit selection?<br></blockquote><div><br></div><div><br></div><=
div>Honestly .. I disagree on #2.</div><div><br></div><div>The packages wit=
hin the openstack layer *will not work* with other versions of those</div><=
div>packages.=C2=A0</div><div><br></div><div>So if someone actually wants t=
o use the functionality provided by the layer, they are</div><div>not optio=
nal. And the errors/issues that you get are extremely obtuse and hard to</d=
iv><div>debug. That&#39;s the design point of the layer .. it doesn&#39;t l=
et that happen.</div><div><br></div><div>Hence making it something they mus=
t do as an extra step .. really is a bad idea.</div><div><br></div><div>It =
gets in the way of people picking packages out of that layer if they don&#3=
9;t want to=C2=A0</div><div>actually build openstack, that&#39;s the crux o=
f the problem. But to answer that issue,</div><div>that&#39;s why meta-clou=
d-services exists, that doesn&#39;t&#39; force versions and holds the</div>=
<div>generally useful &quot;cloud&quot; packages.</div><div><br></div><div>=
Cheers,</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">
<br>
=C2=A0 thank you kindly.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
rday<br>
<br>
--<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D<br>
Robert P. J. Day=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ottawa, Ontario,=
 CANADA<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://crashcourse.ca" rel=3D"noreferrer" target=3D"_=
blank">http://crashcourse.ca</a><br>
<br>
Twitter:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a=
 href=3D"http://twitter.com/rpjday" rel=3D"noreferrer" target=3D"_blank">ht=
tp://twitter.com/rpjday</a><br>
LinkedIn:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://ca.linkedin.=
com/in/rpjday" rel=3D"noreferrer" target=3D"_blank">http://ca.linkedin.com/=
in/<wbr>rpjday</a><br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<wbr>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <=
br><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;=
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end&quot;</div>
</div></div>

--001a114d6d00139a2c054b50f73f--
