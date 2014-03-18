Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 89BEF6F902
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 14:19:36 +0000 (UTC)
Received: by mail-ie0-f177.google.com with SMTP id rl12so7178684iec.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=9yPxz10udqlsnzkPrJYEgF3i8O6zH0vtDLq8ivrVy3A=;
	b=oG2M0LuISIhwYzmz25fEI4puYasjHwtZFaTcUri5DJCuodeXNYmUcbXXb42op2ueAr
	mYmFmjQJOHq+I/I5tghJK4Wev/N8w0ajRC2kSOqeJHdMNAo7c36lBrdIF7HIsFF3faCi
	+o2R9vnD9rp/N+dqB9TwWlO/R5bYsiVFDmvNemQUA6OhniHbSjcEFiobQjrBxEsDuGdp
	IF92lEyzhkkUov/EpF6J9/GLpFYkoMlXyDJN9JENTZsLOT19DSjC5Vn26wdlUNmSjuMA
	oNtA/rJ6xAS6xd1U7UgvcHL7Ur7oKKr3nbVCuUPdVIIaa6gjJDEGSEnLPQ6OUDEWN98h
	ayhQ==
MIME-Version: 1.0
X-Received: by 10.43.141.81 with SMTP id jd17mr23744519icc.39.1395152375927;
	Tue, 18 Mar 2014 07:19:35 -0700 (PDT)
Received: by 10.50.224.136 with HTTP; Tue, 18 Mar 2014 07:19:35 -0700 (PDT)
In-Reply-To: <CAJTo0La2Xtib5BrN3hpZbKZdXT8zqGdObQ1kjXni2MYM1Ly+UQ@mail.gmail.com>
References: <cover.1394948105.git.raj.khem@gmail.com>
	<4fe38ebdc644fa0880bd83bcf3325fd34070a73e.1394948105.git.raj.khem@gmail.com>
	<CAJTo0La2Xtib5BrN3hpZbKZdXT8zqGdObQ1kjXni2MYM1Ly+UQ@mail.gmail.com>
Date: Tue, 18 Mar 2014 07:19:35 -0700
Message-ID: <CAMKF1sr-Doht2jZtD7-aFMRcvPKGNRc7sYsi282gnUMq8PNGyg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] glib-2.0: Fix localedir expectations for uclibc
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
X-List-Received-Date: Tue, 18 Mar 2014 14:19:36 -0000
Content-Type: multipart/alternative; boundary=001a11c2d9c0c659dd04f4e2390b

--001a11c2d9c0c659dd04f4e2390b
Content-Type: text/plain; charset=UTF-8

On Tuesday, March 18, 2014, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 March 2014 05:42, Khem Raj <raj.khem@gmail.com <javascript:;>>
> wrote:
> > ++          *-*-openbsd* | *-*-linux-uclibc*)
>
> Does uclibc have the same file naming as bsd?  eglibc uses .gmo.
>
>
It uses .mo


> Ross
>

--001a11c2d9c0c659dd04f4e2390b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Tuesday, March 18, 2014, Burton, Ross &lt;<a href=3D"mailto:ross=
.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
On 16 March 2014 05:42, Khem Raj &lt;<a href=3D"javascript:;" onclick=3D"_e=
(event, &#39;cvml&#39;, &#39;raj.khem@gmail.com&#39;)">raj.khem@gmail.com</=
a>&gt; wrote:<br>
&gt; ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*-*-openbsd* | *-*-linux-uclibc*)=
<br>
<br>
Does uclibc have the same file naming as bsd? =C2=A0eglibc uses .gmo.<br>
<br></blockquote><div><br></div><div>It uses .mo</div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">
Ross<br>
</blockquote>

--001a11c2d9c0c659dd04f4e2390b--
