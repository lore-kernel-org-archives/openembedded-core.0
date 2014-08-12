Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 502FC60EFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 15:46:51 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id eu11so13271169pac.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:46:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nbcsxC6PiwLFVL40BiDUUHxdGOcGvG+TpHzzZZrWXBQ=;
	b=WGpOn9dKBB2Fu1huCR9Sg3tZGSbUx27kuSKCqP9SkR+Vs+bdc9IydCYiODFNL3CyT2
	DiW2Stmjui2X3rZWLzwmWnm9NntcOaYKlmLMmDnur4ZFrBYeiBJnntfVZ0bEOuZspafa
	xAUtkfjScy4s/kM+4QdPoJpyG+443dIvDsr5tS6YO/VGjUQ2IACKFw8rTerM5MkOHIWo
	zfh5flo/tkmDXbEJrtiLqpXYFqwxp5Oqik4vf5kJhZE3a4gOLHmSYdBPMBQkK+MrYWj4
	BrJc4Vb7IYsanDTuZXRvFHtkOd+f2WX2gF6GBIFwbkAEV0GlnS+X1F+3OYDtN1ozKW6G
	bxoA==
X-Gm-Message-State: ALoCoQkbGp4sAmwS/MFYA0Y3UrGvfaJG6Md7UfNod0spg5WWIymmYsiqdMoIfYkiMBkn85qRfi4+
MIME-Version: 1.0
X-Received: by 10.70.88.39 with SMTP id bd7mr4991645pdb.68.1407858412818; Tue,
	12 Aug 2014 08:46:52 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.136 with HTTP; Tue, 12 Aug 2014 08:46:52 -0700 (PDT)
In-Reply-To: <CAJTo0LYEYgWqTW7mmeonf=JVbH8hXrKhtBTsy_LfSRpuVZQ_tA@mail.gmail.com>
References: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
	<CAJTo0LYEYgWqTW7mmeonf=JVbH8hXrKhtBTsy_LfSRpuVZQ_tA@mail.gmail.com>
Date: Tue, 12 Aug 2014 16:46:52 +0100
X-Google-Sender-Auth: hNMXkBWEtnXAfYI3AieSs1KJ3Dw
Message-ID: <CAOMwXhOxf8x7ty2M4fnBN6yEbmVPbpwWZCeR-1BsEsH=Z9dX+w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding cgdb to meta
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
X-List-Received-Date: Tue, 12 Aug 2014 15:47:00 -0000
Content-Type: multipart/alternative; boundary=001a11c22bea9729890500709466

--001a11c22bea9729890500709466
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 11, 2014 at 1:21 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 11 August 2014 12:35, Laszlo Papp <lpapp@kde.org> wrote:
> > So, instead of different developers maintaining this in their own layer,
> how
> > about including it in meta?
>
> I'd suggest sending a recipe to meta-oe.
>

That layer is too big. It is nearly everything that is rejected from meta;
ok there are some dedicated layers, like meta-networking, but it feels like
the last resort shelter where everything can just be thrown at.

I do not think it is just us who do not wanna pull it into their project.
Never mind, it remains to be a feature in our layer, which is closed
source, then. It is a pity, but I will move along.

--001a11c22bea9729890500709466
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, Aug 11, 2014 at 1:21 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 11 August 2014 12:35, Las=
zlo Papp &lt;<a href=3D"mailto:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<=
br>
&gt; So, instead of different developers maintaining this in their own laye=
r, how<br>
&gt; about including it in meta?<br>
<br>
</div>I&#39;d suggest sending a recipe to meta-oe.<br></blockquote><div><br=
></div><div>That layer is too big. It is nearly everything that is rejected=
 from meta; ok there are some dedicated layers, like meta-networking, but i=
t feels like the last resort shelter where everything can just be thrown at=
.</div>
<div><br></div><div>I do not think it is just us who do not wanna pull it i=
nto their project. Never mind, it remains to be a feature in our layer, whi=
ch is closed source, then. It is a pity, but I will move along.</div></div>
</div></div>

--001a11c22bea9729890500709466--
