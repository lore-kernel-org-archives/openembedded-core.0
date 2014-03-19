Return-Path: <alexandru.damian@intel.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4A7586B5D0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 09:34:27 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wo20so7567935obc.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 02:34:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Xqeu0oE3iW16uyUcRRKfO89uHN/2MMjz4gi9/rtWOM4=;
	b=GdP/dfyGe/bzPTcdsV45Q58wKAlCs9bD3Sc1ls3OlQ01cAarRXZdsfkavEAUFrZ8EA
	9HkEVZ4BP882Dot7G09i/n3w9jr4mpZBeYXqA39w1SSLS7kkBCDH1lGqc9+gSVxrZPaR
	+3jzuUWltQyhpLlqZCX6/AYt5RZNubtj1j3UTqfZUJ+HX2KBcZoCcYsMANzivpXE3Wip
	L7eY/dZkocMiC0m4Ur/C5WdH4efFn1FQMilbgvvK3bDU2rJnm5iwrgN9v7MgFXlO58Ho
	xxim+UBC+wsX9UcuTkct7FZe9WIf+2diovr0DvU6PAfeoheH4kxqtY1TYZ1QlulxLKj9
	dCEA==
X-Gm-Message-State: ALoCoQnp75AZdHkVRtWESJhVsRVjnroBl8dY97FhbXJMhBBxG+KGL7EwzptQmfuCfhmP7ilHuXxI
X-Received: by 10.60.116.166 with SMTP id jx6mr31749543oeb.22.1395221668475;
	Wed, 19 Mar 2014 02:34:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.11.165 with HTTP; Wed, 19 Mar 2014 02:34:08 -0700 (PDT)
In-Reply-To: <1395184511.3808.101.camel@ted>
References: <b01b97b0f8a67d3aeae9ed01e24c5e6bace8e43b.1395068545.git.alexandru.damian@intel.com>
	<6f3acb92219b832f847d4e59342c8c4582ac5b78.1395068545.git.alexandru.damian@intel.com>
	<5328C8A0.1010100@linux.intel.com> <1395184511.3808.101.camel@ted>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Wed, 19 Mar 2014 09:34:08 +0000
Message-ID: <CAJ2CSBuf-4qYo61s=nj40OJBe5uebjfb2xDxuLPh6NUCnH5e=g@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] buildstats: use TaskBase time for elapsed time
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
X-List-Received-Date: Wed, 19 Mar 2014 09:34:32 -0000
Content-Type: multipart/alternative; boundary=089e0129534eeecd3404f4f25bc9

--089e0129534eeecd3404f4f25bc9
Content-Type: text/plain; charset=UTF-8

Yep, there is a counterpart change submitted to bitbake.

Alex


On Tue, Mar 18, 2014 at 11:15 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2014-03-18 at 15:28 -0700, Saul Wold wrote:
> > On 03/17/2014 08:04 AM, Alex DAMIAN wrote:
> > > From: Marius Avram <marius.avram@intel.com>
> > >
> > > To avoid any further inconsistencies between buildstats and
> buildinfohelper
> > > from toaster, buildstats will measure task duration using the time
> field
> > > from within the TaskBase events: TaskStarted and
> TaskSucceeded/TaskFailed.
> > >
> >
> > This patch seems to be causing some problems:
>
> I suspect this is dependent on a bitbake change...
>
> Cheers,
>
> Richard
>
>


-- 
Alex Damian
Yocto Project
SSG / OTC

--089e0129534eeecd3404f4f25bc9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif">Yep, there is a counterpart change submitted to bitbake.<br><br>=
Alex<br></div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_=
quote">

On Tue, Mar 18, 2014 at 11:15 PM, Richard Purdie <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard=
.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

<div class=3D"">On Tue, 2014-03-18 at 15:28 -0700, Saul Wold wrote:<br>
&gt; On 03/17/2014 08:04 AM, Alex DAMIAN wrote:<br>
&gt; &gt; From: Marius Avram &lt;<a href=3D"mailto:marius.avram@intel.com">=
marius.avram@intel.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; To avoid any further inconsistencies between buildstats and build=
infohelper<br>
&gt; &gt; from toaster, buildstats will measure task duration using the tim=
e field<br>
&gt; &gt; from within the TaskBase events: TaskStarted and TaskSucceeded/Ta=
skFailed.<br>
&gt; &gt;<br>
&gt;<br>
&gt; This patch seems to be causing some problems:<br>
<br>
</div>I suspect this is dependent on a bitbake change...<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Alex D=
amian<div>Yocto Project<br></div><div>SSG / OTC=C2=A0</div></div>
</div>

--089e0129534eeecd3404f4f25bc9--
