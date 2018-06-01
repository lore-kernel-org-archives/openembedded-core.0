Return-Path: <twoerner@gmail.com>
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 44CF074897
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 14:58:06 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id j13-v6so10827913lfb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jun 2018 07:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1jNMp/havQ7/k2t1sAgHTwbli3+1S1d81t98VqO0l44=;
	b=DFnF6Mhg4SKiXxTZ8UJxz7k7vB8MlmyHKBkfK2Sgr78qrvSZE3tCR1mOdd/58A98mV
	8DrtLdS7KDHwQUc9RO9sJCR2Ab1kpeNifZWIO9svCW3r7PhaVMQZYg4KzVOPjqAc4md0
	HhFLHhjoFwWMMgUZ/43luAloUr5Wy79OdtKA4O89ZTeh4lE1Q49/OEB0iTqzYv8ff65c
	oMwT5jJpgQb1td5cqZ8dcbawn6NmDOie3XLrKWX2dzNqBJa/LstuDwj3qG5K4hfdWnUR
	rtdlyDG1UvA6uoumdGvZuhO79PxCLJQPjJn5GPugWiVnYLAkWMCY9F15AYk7zCE4IywF
	NTEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1jNMp/havQ7/k2t1sAgHTwbli3+1S1d81t98VqO0l44=;
	b=jPpOLzuL+6BQoThFe7twuRltoq6N4+RT43Jvr0gdiKyM8/HDa+TOw6JtyhXml45jo6
	eqA39xRSrpU8I0uveYIbQUjIn1uDgg/FZ+VGIhnVf7bAweUuPotqS6ZodJ5tjuNxwiXp
	AKxTL1Td5/aibFcKWITwbTZSwnruKnXXmBydjzTPaGEgcqkRoVEw5uc4uAqW4jWl/el3
	rCJ2SRxTYygbgr6UYusAIZ0SCmRu27B8Yim5sKewNOIupEf8/shFLkmamlwrbmBV0bfR
	s2bI1rXbT5O6p1z+zn6AeZZRAOe1Zz7j6Jsvic0d0/TxH40ylHmY7GgEq0WAWoZtJEF9
	9y1g==
X-Gm-Message-State: APt69E1rTMRnhmQu4vP0r3rFE6hmbGP4eZP3I/UqzYCsi5AcDGk2IAjs
	WI5fLQSaKFet4u7jyNI2oKt258Q3hHh5F7v5rUg=
X-Google-Smtp-Source: ADUXVKI2kLh68904Mc2aArSSpDkt23AvrZHiAEUIuO2Tcqq4u4hYkbpfAjG1MlyO91Y+DNQVx8RfNFH8lbF6YzyE7Sc=
X-Received: by 2002:a19:2101:: with SMTP id
	h1-v6mr2262044lfh.135.1527865087523; 
	Fri, 01 Jun 2018 07:58:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:cb07:0:0:0:0:0 with HTTP;
	Fri, 1 Jun 2018 07:58:06 -0700 (PDT)
In-Reply-To: <CAJ86T=W3ju53TA-za4LMYXKtEqvLvj9B=DjMO+Tu=nsnG7Jehg@mail.gmail.com>
References: <20180531200659.28877-1-twoerner@gmail.com>
	<CAJ86T=XTDOZYzdUTBLSO39XeBu6QhV0U5+U=iGd_hM0OwBXH_Q@mail.gmail.com>
	<CAHUNapRaJVnECsz3rU2CV265xOJLMPUARfsHZGn-CnY_Kn4j3Q@mail.gmail.com>
	<CAJ86T=W3ju53TA-za4LMYXKtEqvLvj9B=DjMO+Tu=nsnG7Jehg@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Fri, 1 Jun 2018 10:58:06 -0400
Message-ID: <CAHUNapRpokvfA2v+xJKYXzHLE3gSR+3oLQ32_2-+u=t0jHiPJA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [devtool][PATCH] devtool deploy-target: optionally specify package
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
X-List-Received-Date: Fri, 01 Jun 2018 14:58:07 -0000
Content-Type: multipart/alternative; boundary="000000000000ce834c056d95cfcb"

--000000000000ce834c056d95cfcb
Content-Type: text/plain; charset="UTF-8"

On Thu, May 31, 2018 at 11:07 PM, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, May 31, 2018 at 7:23 PM, Trevor Woerner <twoerner@gmail.com>
> wrote:
>
> I wonder whether the default behaviour should just be to not deploy
> files from the -dev package?
>
>
That would certainly be an improvement. But it still wouldn't make sense to
copy over the -staticdev or -doc packages either. Maybe a better default
behaviour would be to not copy over the -dev, -staticdev, -doc, -dbg, and
-locale packages? Or better yet: just copy over the core packages, not any
of the core-<something> packages? I'm guessing bitbake has a list somewhere
of these -somethings?

I wouldn't be surprised if the current behaviour exists simply because ${D}
is already there and ready to go. My tweak extends the behaviour to send
another already-there directory: ${PKGDEST} + <package>.

If we were to go this route (i.e. being more selective about which packages
are sent) do you think this should be the new default behaviour, or should
the existing default behaviour be preserved and a flag used for this tweak?




> >> Are the going to be problems if users want to deploy more than one
> >> package (or switch between a full deploy and a package) and don't
> >> deploy and undeploy in the right order?
> >
> >
> > In my patch I added a --package option to "devtool deploy-target" but
> not to
> > "devtool undeploy-target". devtool keeps track of what files were
> uploaded
> > by creating a per-package list on the target itself (in /.devtool). When
> you
> > undeploy a recipe, it simply looks for this recipe file on the target,
> reads
> > the files listed there, and undeploys each of the files in that list.
> >
> > Therefore, mixing and matching deploys and undeploys amongst recipes
> don't
> > interfere with each other.
> >
> > I checked at the time, but I'm not 100% sure now, but I believe if one
> > deploys two packages from one recipe, the on-target file gets appended.
> But
> > now I'm not 100% sure, so I'll verify this tomorrow (thanks for the
> > reminder). As such, under my scheme, you can deploy recipes and packages
> at
> > will, but then only undeploy the whole kit and caboodle in one go; given
> a
> > recipe name to undeploy, whatever it finds in the on-target record will
> get
> > undeployed.
> >
> > I think any developer will find this reasonable behaviour (but maybe
> not?).
>
> If that's how it works then it seems reasonable to me.
>
>
Unfortunately this morning's investigation shows this is not the case. When
a recipe is deployed to the target, the on-target script looks for evidence
of this recipe having already been deployed. If that is the case, it
undeploys the previous deploy before deploying this deploy. That is very
good behaviour since it catches the cases where the file list might change
between deployments. But with my tweak as-is, if the user deploys two
packages from the same recipe, the first one will be undeployed and only
the second one will remain deployed; this is not reasonable.

Therefore a v2 will be necessary. The question is, which route do I take?

--000000000000ce834c056d95cfcb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, May 31, 2018 at 11:07 PM, Andre McCurdy <span dir=3D"ltr">&lt;<=
a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Thu, May 31, 2018 at 7:23 PM, Trevor Woerner &lt;<a href=3D"mailto:twoern=
er@gmail.com">twoerner@gmail.com</a>&gt; wrote:<br></span><br>
I wonder whether the default behaviour should just be to not deploy<br>
files from the -dev package?<br>
<span class=3D""><br></span></blockquote><div><br></div><div>That would cer=
tainly be an improvement. But it still wouldn&#39;t make sense to copy over=
 the -staticdev or -doc packages either. Maybe a better default behaviour w=
ould be to not copy over the -dev, -staticdev, -doc, -dbg, and -locale pack=
ages? Or better yet: just copy over the core packages, not any of the core-=
&lt;something&gt; packages? I&#39;m guessing bitbake has a list somewhere o=
f these -somethings?<br></div><div><br></div><div>I wouldn&#39;t be surpris=
ed if the current behaviour exists simply because ${D} is already there and=
 ready to go. My tweak extends the behaviour to send another already-there =
directory: ${PKGDEST} + &lt;package&gt;.</div><div><br></div><div>If we wer=
e to go this route (i.e. being more selective about which packages are sent=
) do you think this should be the new default behaviour, or should the exis=
ting default behaviour be preserved and a flag used for this tweak?<br></di=
v><div><br></div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><span class=3D"">
&gt;&gt; Are the going to be problems if users want to deploy more than one=
<br>
&gt;&gt; package (or switch between a full deploy and a package) and don&#3=
9;t<br>
&gt;&gt; deploy and undeploy in the right order?<br>
&gt;<br>
&gt;<br>
&gt; In my patch I added a --package option to &quot;devtool deploy-target&=
quot; but not to<br>
&gt; &quot;devtool undeploy-target&quot;. devtool keeps track of what files=
 were uploaded<br>
&gt; by creating a per-package list on the target itself (in /.devtool). Wh=
en you<br>
&gt; undeploy a recipe, it simply looks for this recipe file on the target,=
 reads<br>
&gt; the files listed there, and undeploys each of the files in that list.<=
br>
&gt;<br>
&gt; Therefore, mixing and matching deploys and undeploys amongst recipes d=
on&#39;t<br>
&gt; interfere with each other.<br>
&gt;<br>
&gt; I checked at the time, but I&#39;m not 100% sure now, but I believe if=
 one<br>
&gt; deploys two packages from one recipe, the on-target file gets appended=
. But<br>
&gt; now I&#39;m not 100% sure, so I&#39;ll verify this tomorrow (thanks fo=
r the<br>
&gt; reminder). As such, under my scheme, you can deploy recipes and packag=
es at<br>
&gt; will, but then only undeploy the whole kit and caboodle in one go; giv=
en a<br>
&gt; recipe name to undeploy, whatever it finds in the on-target record wil=
l get<br>
&gt; undeployed.<br>
&gt;<br>
&gt; I think any developer will find this reasonable behaviour (but maybe n=
ot?).<br>
<br>
</span>If that&#39;s how it works then it seems reasonable to me.<br><br></=
blockquote><div><br></div><div>Unfortunately this morning&#39;s investigati=
on shows this is not the case. When a recipe is deployed to the target, the=
 on-target script looks for evidence of this recipe having already been dep=
loyed. If that is the case, it undeploys the previous deploy before deployi=
ng this deploy. That is very good behaviour since it catches the cases wher=
e the file list might change between deployments. But with my tweak as-is, =
if the user deploys two packages from the same recipe, the first one will b=
e undeployed and only the second one will remain deployed; this is not reas=
onable.</div><div><br></div><div>Therefore a v2 will be necessary. The ques=
tion is, which route do I take?<br></div></div></div></div>

--000000000000ce834c056d95cfcb--
