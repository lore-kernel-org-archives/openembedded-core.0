Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id D104B77157
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 20:59:54 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id m17so4091747ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 13:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7TCMj8kYN5y4iNxjzFsEel9tlLxVlEzMqbmYORrx2to=;
	b=wPwYR4lqY2W7Se8PNkwmzVcRD/8657ej1+NMfTNYj2p8MNGGOglNBYG5InAD5apiCU
	NLCPy37xcVSfJvEIEB5KgjV+v2mDzEFJx1ERzL3lGJZv7j8EUOuUM6RviGH47Bu4P9zZ
	1Vmkl47p+zm/igqO41vyKbanY6Goys7guNHheTUBhKUoa7UDOIGxKK5rBAsad2dYACJm
	xxNg1pHmirV79+ibC8vam75e5rwbD3ZZF+0cWsm0IPzdjunH28BaPcg1B0MBpHUvHZbF
	ejul4le7ur+5slNHl8GuDIc3/qP0wAuXL6FYsUPq6IUBlArIgkraBZ/KPpsfOz0NmmsC
	7S2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=7TCMj8kYN5y4iNxjzFsEel9tlLxVlEzMqbmYORrx2to=;
	b=hqT0y3es7Z5ueB74Ax/B4G4Qn9Wzrnh9RzaANPAoJeUKUOzWjY54A1LC/bKxjq1az5
	Mhz45alDvOyWFechmz96ay6QfvJy/XBdCoCRz1yJJlCwuq3tm9lfX+kL0ewIeHPpyNey
	rMbqnb0UixcENdi6agkFd5UrzJ0+m3aWa5WnwfcPt8Q5scu60+HNIs6AjXUBb3n8bIKL
	30Yges0p9MzfPEHwctjbs7uG9iUoO8KszC6ishlfSnTDWrJo9hSic5g6T2koxwmspFPX
	3dBPyJPwjnUwHOHkdYATiTKyiItf88UsO8bqyyqKMaDoasfbyOXjUCY873lU4KPlkw8V
	clgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=7TCMj8kYN5y4iNxjzFsEel9tlLxVlEzMqbmYORrx2to=;
	b=dkucJbZNc9KFYZaUBV9ls1J7fwBzteSxVD9Pi6RmVdWKDBM5IxTudgqeYQn0XQVGhH
	EGxOgZZzq2Fjxl3jNBs0N2JQZ70gyzslaxZ37P+s2WkkJwT28Eh+aYS9VVVZtjzSR1vJ
	6hKGXL7yETccRWPIFmKUIKCIdkg75cdkzw0Tb8HBio3cS9guxiczjZaz34fxzRvnuBjG
	/FRTgYqy4JF9w/ejSAx5teO/0Gs1EPtdaOLdsaGwhCGN7oscQcJrz0CCTi1DXcXrtUl3
	3uC/Qe4mlwuo8O5HqLlXyK5f7Xpgc+IGUVSShq2pm7xxx8edJJmY1YPVggAUu3Hx8rGz
	BHxw==
X-Gm-Message-State: ALyK8tIccDi2UwBkOQ2ckn725qo53K8DRgXiunDpPt+pk35WEL//1b6cuLvdpytEq2i/ffC9B2eTkJqBHJtqww==
X-Received: by 10.107.140.132 with SMTP id o126mr7032653iod.70.1464814794802; 
	Wed, 01 Jun 2016 13:59:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 1 Jun 2016 13:59:35 -0700 (PDT)
In-Reply-To: <1464814678.9588.3.camel@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CABcZANkmNG1MvPsYf-KJs2gmPMGjR+CjwLGjxc9k5-MRhgHuiw@mail.gmail.com>
	<1464814678.9588.3.camel@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 1 Jun 2016 13:59:35 -0700
X-Google-Sender-Auth: p3WQ6RE4vlTuE2qbi-8iuGpMQIU
Message-ID: <CABcZANk5W9ybE5cKs54RS+f_Z2vndY-1Q3HWm92F9Rkmo68jiQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/22] oe-buildenv-internal: Update to python3
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
X-List-Received-Date: Wed, 01 Jun 2016 20:59:55 -0000
Content-Type: multipart/alternative; boundary=94eb2c05aea281901e05343dc56b

--94eb2c05aea281901e05343dc56b
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 1:57 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2016-06-01 at 08:35 -0700, Christopher Larson wrote:
> >
> > On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <
> > richard.purdie@linuxfoundation.org> wrote:
> > > Check that 'python' is a python v2 since that is what we assume
> > > everywhere
> > > and upstream python devs recommend. We can need both python2 and
> > > python3
> > > available since we don't control the software we might download and
> > > run.
> > >
> > > Also check that python 3 is >= 3.4.0, our minimum version for
> > > bitbake.
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >
> > I'm curious, why don't we just have a bit of logic to figure out what
> > the names are of the binaries, create a subdir and prepend it to the
> > path, and add symlinks or wrapper scripts there to the real binaries
> > on the system?
>
> We could do this I guess, I'm kind of hoping we don't have to as it
> just adds more complexity.
>
> Tempted to leave the patch as it stands for initial merging and then we
> can see how many people have issues...


That's reasonable. I think the main distro that'll run into this is arch,
and arch users should be used to having to hack around 'python' not being
python 2 for other projects by now :)
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05aea281901e05343dc56b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 1, 2016 at 1:57 PM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><span class=3D"">On Wed, 2016-06-01 at 08:35 -0700, Christopher Lars=
on wrote:<br>
&gt;<br>
&gt; On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie &lt;<br>
&gt; <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@l=
inuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; Check that &#39;python&#39; is a python v2 since that is what we =
assume<br>
&gt; &gt; everywhere<br>
&gt; &gt; and upstream python devs recommend. We can need both python2 and<=
br>
&gt; &gt; python3<br>
&gt; &gt; available since we don&#39;t control the software we might downlo=
ad and<br>
&gt; &gt; run.<br>
&gt; &gt;<br>
&gt; &gt; Also check that python 3 is &gt;=3D 3.4.0, our minimum version fo=
r<br>
&gt; &gt; <span class=3D"il">bitbake</span>.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt;<br>
&gt; &gt;<br>
&gt; I&#39;m curious, why don&#39;t we just have a <span class=3D"il">bit</=
span> of logic to figure out what<br>
&gt; the names are of the binaries, create a subdir and prepend it to the<b=
r>
&gt; path, and add symlinks or wrapper scripts there to the real binaries<b=
r>
&gt; on the system?<br>
<br>
</span>We could do this I guess, I&#39;m kind of hoping we don&#39;t have t=
o as it<br>
just adds more complexity.<br>
<br>
Tempted to leave the patch as it stands for initial merging and then we<br>
can see how many people have issues...</blockquote></div><br>That&#39;s rea=
sonable. I think the main distro that&#39;ll run into this is arch, and arc=
h users should be used to having to hack around &#39;python&#39; not being =
python 2 for other projects by now :)<br>-- <br><div class=3D"gmail_signatu=
re" data-smartmail=3D"gmail_signature">Christopher Larson<br>clarson at ker=
goth dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer -=
 Tslib<br>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c05aea281901e05343dc56b--
