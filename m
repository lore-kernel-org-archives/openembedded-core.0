Return-Path: <kad@kad.name>
Received: from mail-io0-f175.google.com (mail-io0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id D850B73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 15:23:07 +0000 (UTC)
Received: by iofh134 with SMTP id h134so64912554iof.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 08:23:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=/4DSHfLZe9WZRNZr8cKSxVkbIoFf6BCYzukGXGqCM2Y=;
	b=OTf3i6uf/j7w13akHiHvG9ItxfBalgk/ghuSXpjS5hJGXzToTQs1xVD43rElCdg9fe
	wqze6Z7kQjV4FghF5UKP6MfMGZl+8cFRgJ0C6m5D/LquxqDBp47Ppp34bsVps3JLwXWc
	qNKyAoKVllNF7TfXIGoRHcoEALnXHI+tRBD2rUsqC4dQcNSlUk7ZTwAsFTXtVWDLnmy5
	QGbsgJfcsswASCQNDRBhNtJ8IwAqORXij0HbGZwnaE3g0OsIfthigfp90hZ5hNx77y18
	GhT1hxKqu0vk6nPxV7JtbB3DokWDUViQjqP2oniCSUtcuG6Mgdb0Jg9IgQddAdkZAHxZ
	2gnw==
X-Gm-Message-State: ALoCoQnnaqHJfw4vmwJzH78xIJCLBuoUC1QM+4R91+nIZj0zBLFM5txdWDFMY8n4hyALPv2braMT
MIME-Version: 1.0
X-Received: by 10.107.25.71 with SMTP id 68mr33621969ioz.46.1441898587365;
	Thu, 10 Sep 2015 08:23:07 -0700 (PDT)
Received: by 10.107.36.196 with HTTP; Thu, 10 Sep 2015 08:23:07 -0700 (PDT)
In-Reply-To: <20150910141812.GA2387@jama>
References: <8B394616-9009-4FF4-828C-561A859D34B3@gmail.com>
	<20150901215512.GE2458@jama>
	<CAP9ODKq=HsV79hXhHeCwdhpF6uhHdCxYrhC53Kt5+Pe6Qdpf1w@mail.gmail.com>
	<255516EC-098E-457B-A2E6-2F7C953CAA8D@gmail.com>
	<CAP9ODKp9Vkw-vHNp1PMqE1eTfmW8-s5o6+0JYTv=sFEHm9nc1g@mail.gmail.com>
	<1441177787.24871.33.camel@linuxfoundation.org>
	<55EF2670.6040101@gmail.com>
	<CAMKF1sogs9sRR_07nOxZrvvOxXj_=ioqNr=_vN+hr+VFf2BO6A@mail.gmail.com>
	<20150908210642.GG2381@jama>
	<CANFkWp=w7Lj_M4hPdBjNya+EHd_9oMJ9QM-ewGO2AAsxJs-9uA@mail.gmail.com>
	<20150910141812.GA2387@jama>
Date: Thu, 10 Sep 2015 18:23:07 +0300
Message-ID: <CANFkWp=0itcR3EOSnYS2Mjttg3kCxEHqCygAyigvkVE9kuNkaA@mail.gmail.com>
From: Alexander Kanevskiy <kad@kad.name>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Patch merge process
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
X-List-Received-Date: Thu, 10 Sep 2015 15:23:08 -0000
Content-Type: multipart/alternative; boundary=001a113ff20e1a3f08051f662dbe

--001a113ff20e1a3f08051f662dbe
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2015 at 5:18 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> On Thu, Sep 10, 2015 at 05:03:25PM +0300, Alexander Kanevskiy wrote:
> > On Wed, Sep 9, 2015 at 12:06 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> > Gerrit, despite its good ability to integrate into existing
> infrastructures
> > might be not the best solution for OE, and I must admit, gerrit is not
> the
> > best tool in the world for reviews, as there are limits in it like
> missing
>
> I disagree, we can agree on that :).
>
>
ok :)


> > ability to review properly series of patches.
>
> It allows to review series of patches very well, newer versions also
> show chains of reviews in better UI than older versions did.
>
> Worse problem is that such series need to be uploaded as series not as
> individual patches, because gerrit cannot automagically discover such
> dependencies between patches and cherry-pick them to single branch and
> resolve conflicts if there are, but if you push whole series of patches
> it will show it as chain and all works correctly.
>
>
might be. I haven't checked latest versions 2.10+, but versions below were
not up to the shape compared to e.g. pull-request workflow in GitHub.



> > However, for people who don't like Gerrit, there is also always a
> > possibility to use GitHub or something similar, like locally hosted
> GitLab
> > if OE don't want to be dependant on external service.
>
> I want to use it to share status of the meta-oe patches with contributors,
> running my own GitLab locally won't help with this.
>
>
GitHub's model is to fork repository, do any amount of modification in your
own copy and then open "pull-request" for review where you just specify
source/destination repositories and branches with set of changes.

Gitlab comment was practically to have similar to GitHub workflow, but
instead of public's GitHub service to have instance on openembedded.org
infrastructure, and thus requiring users to register accounts there.


-- 
br, Alexander Kanevskiy

--001a113ff20e1a3f08051f662dbe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 10, 2015 at 5:18 PM, Martin Jansa <span dir=3D"ltr">&lt;<a =
href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"=
HOEnZb"><div class=3D"h5">On Thu, Sep 10, 2015 at 05:03:25PM +0300, Alexand=
er Kanevskiy wrote:<br>
&gt; On Wed, Sep 9, 2015 at 12:06 AM, Martin Jansa &lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;<br>
&gt; wrote:<br>&gt; Gerrit, despite its good ability to integrate into exis=
ting infrastructures<br>
&gt; might be not the best solution for OE, and I must admit, gerrit is not=
 the<br>
&gt; best tool in the world for reviews, as there are limits in it like mis=
sing<br>
<br>
</div></div>I disagree, we can agree on that :).<br>
<span class=3D""><br></span></blockquote><div><br></div><div>ok :)</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
&gt; ability to review properly series of patches.<br>
<br>
</span>It allows to review series of patches very well, newer versions also=
<br>
show chains of reviews in better UI than older versions did.<br>
<br>
Worse problem is that such series need to be uploaded as series not as<br>
individual patches, because gerrit cannot automagically discover such<br>
dependencies between patches and cherry-pick them to single branch and<br>
resolve conflicts if there are, but if you push whole series of patches<br>
it will show it as chain and all works correctly.<br>
<span class=3D""><br></span></blockquote><div><br></div><div>might be. I ha=
ven&#39;t checked latest versions 2.10+, but versions below were not up to =
the shape compared to e.g. pull-request workflow in GitHub.</div><div><br><=
/div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">
&gt; However, for people who don&#39;t like Gerrit, there is also always a<=
br>
&gt; possibility to use GitHub or something similar, like locally hosted Gi=
tLab<br>
&gt; if OE don&#39;t want to be dependant on external service.<br>
<br>
</span>I want to use it to share status of the meta-oe patches with contrib=
utors,<br>
running my own GitLab locally won&#39;t help with this.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote></div>=
<div><br></div><div>GitHub&#39;s model is to fork repository, do any amount=
 of modification in your own copy and then open &quot;pull-request&quot; fo=
r review where you just specify source/destination repositories and branche=
s with set of changes.</div><div><br></div><div>Gitlab comment was practica=
lly to have similar to GitHub workflow, but instead of public&#39;s GitHub =
service to have instance on <a href=3D"http://openembedded.org">openembedde=
d.org</a> infrastructure, and thus requiring users to register accounts the=
re.</div><div><br></div><div><br></div>-- <br><div class=3D"gmail_signature=
">br, Alexander Kanevskiy</div>
</div></div>

--001a113ff20e1a3f08051f662dbe--
