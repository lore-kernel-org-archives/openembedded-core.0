Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id F3E7865D3C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Nov 2014 20:43:58 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id m20so3195670qcx.16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Nov 2014 12:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=M/sf41PuqZi3I1Gd8PzGKqmmv4O/L7ME82Mn8J9Oka0=;
	b=A5iQk7glxkJwsOBfCDU/i3Yo+6SPhMO6UcnSxjBl+rk1Gq8oyboFXZ2Y6DpvQod7U1
	Z2uDWHXLztnAK+03uRc2ePQRu/JIKkWqMhMavRUhNnEoP8q11wVDhcEa2V1DISGcEWfk
	CGhJqnLeHtFuweekwIhEdILRj0VAi9vVwKnaK0iqahXNiA96EL/a+YaEFuB1vM9jDpE0
	fHs8vZZhzT/5flerxAWzx35BGjwRtUsLmTtxQ8ERiKF/tHxwN7vueA6dlX7x0rSDmO0G
	ICtv7rLfuhPxTzMzAaO7ugaNZmr7QMzKWCQ5Mc9V/m6NrX38NNfxIBMk0FfqGPj2kHZe
	2gIg==
X-Gm-Message-State: ALoCoQm3h7+zpkr6v6/wTJpym2G5p3CwkSiMJYy2yjRTwpwV3Bml5qeYvBWs0dLzIett3++jnjQR
X-Received: by 10.229.252.201 with SMTP id mx9mr16476214qcb.4.1415393039003;
	Fri, 07 Nov 2014 12:43:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Fri, 7 Nov 2014 12:43:38 -0800 (PST)
In-Reply-To: <20141107194159.GD9512@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
	<CAJTo0Law3iWz=+A1vA7QsikNozeVP7U49=+T9fkT7YgLzJ_hcA@mail.gmail.com>
	<20141107194159.GD9512@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 7 Nov 2014 20:43:38 +0000
Message-ID: <CAJTo0LYLh9A8zYJDMtyCBw2r1pX8KxNjv=mq5MBX=B8BZvRObw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Fri, 07 Nov 2014 20:44:04 -0000
Content-Type: multipart/alternative; boundary=001a11c2ef944ecb4005074adf8f

--001a11c2ef944ecb4005074adf8f
Content-Type: text/plain; charset=UTF-8

On 7 November 2014 19:41, Denys Dmytriyenko <denis@denix.org> wrote:

> > | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax error: word
> > unexpected (expecting ")")
> >
> > I suspect the real problem is:
> >
> > $ file fixdep
> > fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically
> > linked (uses shared libs), for GNU/Linux 2.6.32,
> > BuildID[sha1]=0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripped
> >
> > It appears to have been built using the target compiler, not the host.
>
> Ross,
>
> I'm a bit lost here - as you said above, this is a target build and yet you
> say it shouldn't use the target compiler. Can you please explain what you
> mean?


Yes, it's building a binary (fixdep) and then executing it.  That binary
needs to be built with the host compiler (BUILD_CC).

Easily replicated for me with "MACHINE=qemuarm bitbake u-boot-mkimage".

Ross

--001a11c2ef944ecb4005074adf8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2014 19:41, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denis@denix.org" target=3D"_blank">denis@denix.org</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div c=
lass=3D"">&gt; | scripts/basic/fixdep: 1: scripts/basic/fixdep: Syntax erro=
r: word<br>
&gt; unexpected (expecting &quot;)&quot;)<br>
&gt;<br>
&gt; I suspect the real problem is:<br>
&gt;<br>
&gt; $ file fixdep<br>
&gt; fixdep: ELF 32-bit LSB executable, ARM, version 1 (SYSV), dynamically<=
br>
&gt; linked (uses shared libs), for GNU/Linux 2.6.32,<br>
&gt; BuildID[sha1]=3D0xb4ea84a189f10b4f3e08fb10f8e490135e2b920c, not stripp=
ed<br>
&gt;<br>
&gt; It appears to have been built using the target compiler, not the host.=
<br>
<br>
</div></div>Ross,<br>
<br>
I&#39;m a bit lost here - as you said above, this is a target build and yet=
 you<br>
say it shouldn&#39;t use the target compiler. Can you please explain what y=
ou<br>
mean?</blockquote></div><br>Yes, it&#39;s building a binary (fixdep) and th=
en executing it.=C2=A0 That binary needs to be built with the host compiler=
 (BUILD_CC).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Easily replicated for me with &quot;MACHINE=3Dqemuarm bitbake u-boot=
-mkimage&quot;.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a11c2ef944ecb4005074adf8f--
