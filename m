Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com
	[209.85.213.47])
	by mail.openembedded.org (Postfix) with ESMTP id 974FA6072C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 13:24:18 +0000 (UTC)
Received: by mail-vk0-f47.google.com with SMTP id n1so4480350vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 05:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZDmoBTLOk9mh4jC69iICfyA+75MQlT7Xn6OEwrheQd0=;
	b=V8fxU46pyjfsw6ABa35VWHie9vxh1gVZUDjApAbQlhGaoLcrGrURTosUcejQZWf/ME
	eNz0Ox+uoIGNBxaQM1dzvvfGAnt8TwRTeihyo+XTWmcFW7Y7EDKc2I65eloCkBqbA9UE
	ce5ZS4HwheZBYkCvj2pvDGGLvVCpAQLqFWbQa3XxaKUqG74Ge4DCD7MBVLryBWEcrNaK
	AdwX7u4Bqio3XBZwx42gTFDz2IU3RZPfLLmg5SdmBVwjIfimgSgqPasl5YHU/50RIiaY
	akcxYVnj4PJAVVMzqwKL7BE+boJ8C8n63BZuGDT2D4yh2NCqBrprP8j1NJYNbpwyxOw6
	C/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=ZDmoBTLOk9mh4jC69iICfyA+75MQlT7Xn6OEwrheQd0=;
	b=heCTCjvRF36qKOSkg4a0Bka1UtgYQAj2MUsaCah226rALQSF8rLHONZ89Y3GiF6ZKz
	GNyroaBdvKF2X9W1vSd/IXEWqa+3lGm6kaeqojSNgCUBzpPptIY2AXlxELq9zPN5zs2V
	SUswYOSZAYzd7JalxaDmxciVifkNKJB+3WLALwkjFG6L5DTqa196thf3wd8MHSSbzcc5
	7R3LRZH0ipg7LlqYDCzOoQLwyHkBHkTzI35WvqcCbIUaYMk6N5LHT3JFhyYRIniXs8Um
	mVulU6nP5a/6PNtJoxxFBc4sKxTjo8kKDmMUojJBblh78wFQ09A0GHdPPMFephPxIMUa
	L8Fg==
X-Gm-Message-State: ALoCoQmppf3F5+5nvKNSpZ2Rls0ocVkbobxw+SM1Pm1Z5GPVu6SvIP/aRe1fmCrwQhNBsDY9vKljPSZtEy+8sENofP8zoTu0sg==
MIME-Version: 1.0
X-Received: by 10.31.148.144 with SMTP id w138mr22675146vkd.44.1453296258768; 
	Wed, 20 Jan 2016 05:24:18 -0800 (PST)
Received: by 10.31.202.196 with HTTP; Wed, 20 Jan 2016 05:24:18 -0800 (PST)
In-Reply-To: <1453276340.27999.141.camel@linuxfoundation.org>
References: <1453267659-18756-1-git-send-email-jian.liu@windriver.com>
	<1453276340.27999.141.camel@linuxfoundation.org>
Date: Wed, 20 Jan 2016 08:24:18 -0500
Message-ID: <CADkTA4OrzsLFqBPk87jr2U8C0YA9+kU5WJZDobYWeQ_RjApcug@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Fix backward compaibilty
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
X-List-Received-Date: Wed, 20 Jan 2016 13:24:18 -0000
Content-Type: multipart/alternative; boundary=001a11408c4441e36a0529c3e74f

--001a11408c4441e36a0529c3e74f
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 20, 2016 at 2:52 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2016-01-20 at 13:27 +0800, Jian Liu wrote:
> > kernel-dev is replaced by kernel-devsrc
>
> No, its not.
>
> > , which breaks
> > backward compaibilty.
> >  -- add alias for kernel-devsrc
> >  -- kernel-devsrc provides the kernel-dev.
> >  -- remove kernel-dev from the sub-packages of linux-windriver
>
> kernel-dev is useful for things like profiling tools where you need
> things like system.Map or the kernel configuration without source code.
>
> If you need the "full" source, you can use kernel-devsrc.
>
> I'm not sure we want to remove kernel-dev given it does have a use?
>

And I have an open bugzilla to validate (and likely fix)
kernel-dev/kernel-devsrc
against out of tree module builds, ensure that they can both the be
installed
on the target at the same time, and also so document how they map to the
packaging breakdown of kernel source in other distros.

Strangely, I was just hacking on that yesterday while working with Saul on
udev
problems.

So for the short term, leaving everything as-is makes the most sense to me.

Bruce


>
> Cheers,
>
> Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11408c4441e36a0529c3e74f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Jan 20, 2016 at 2:52 AM, Richard Purdie <span dir=3D"ltr">&lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">rich=
ard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On Wed, 2016-01-20 at 13:27 +0800, Jian Liu wrote:<br>
&gt; kernel-dev is replaced by kernel-devsrc<br>
<br>
No, its not.<br>
<span class=3D""><br>
&gt; , which breaks<br>
&gt; backward compaibilty.<br>
&gt;=C2=A0 -- add alias for kernel-devsrc<br>
&gt;=C2=A0 -- kernel-devsrc provides the kernel-dev.<br>
&gt;=C2=A0 -- remove kernel-dev from the sub-packages of linux-windriver<br=
>
<br>
</span>kernel-dev is useful for things like profiling tools where you need<=
br>
things like system.Map or the kernel configuration without source code.<br>
<br>
If you need the &quot;full&quot; source, you can use kernel-devsrc.<br>
<br>
I&#39;m not sure we want to remove kernel-dev given it does have a use?<br>=
</blockquote><div><br></div><div>And I have an open bugzilla to validate (a=
nd likely fix) kernel-dev/kernel-devsrc<br></div><div>against out of tree m=
odule builds, ensure that they can both the be installed<br></div><div>on t=
he target at the same time, and also so document how they map to the<br></d=
iv><div>packaging breakdown of kernel source in other distros.<br><br></div=
><div>Strangely, I was just hacking on that yesterday while working with Sa=
ul on udev<br></div><div>problems.<br></div><div><br></div><div>So for the =
short term, leaving everything as-is makes the most sense to me.<br><br></d=
iv><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a11408c4441e36a0529c3e74f--
