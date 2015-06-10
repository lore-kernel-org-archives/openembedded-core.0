Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF774734D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 09:31:44 +0000 (UTC)
Received: by qcxw10 with SMTP id w10so15368597qcx.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 02:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=rEWxFLFpmQDlfgG2gslUPvPpeVoBzmaztrU38ioMfHc=;
	b=D7uWVp7u9rjuCBAh8nxtQIh2SQz3EqF/puOnwFITuCJFiL+9SP+pxFHwIkWUyOWap/
	hq6ut1xauCfcW1kyOjiBhwYpOR8bGS7nu4f6ik3cQt8WHsNPGjiPA+KqwSq5JfKpt8j5
	6KfVF+POavZNqsRrj7fzXmSMR57aTZUQflMJOOzy4Db4HGtMVJMLlQ92IoBlxI++B292
	V+2QDiCD7e9jhwDj/6JMbxNCHtEeZ/qNVcEDbIFuutudmQA5hJ7TTr8rWwD6RqKfao3S
	bMONDNOS4cGpSOYiY4yNL4NiEA4MIFC4IsEFMv3JjmDegPupBaqUVg+lN2EXTfKke5ea
	mPXw==
X-Gm-Message-State: ALoCoQlZzZGfcJHT3p/Eu4weVUkfqWNwoIS1RHEsHTcjrjMUVCukBGUH1KIBTj1cERJUR0F9CTyI
X-Received: by 10.140.89.104 with SMTP id u95mr2563868qgd.15.1433928705331;
	Wed, 10 Jun 2015 02:31:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 10 Jun 2015 02:31:24 -0700 (PDT)
In-Reply-To: <1554329.HKQRZb0eD9@peggleto-mobl.ger.corp.intel.com>
References: <CAJTo0LY2C3d6ewKs7f1V0U9k7vqMQ47kCnANetzGz1OhMtfTFg@mail.gmail.com>
	<1554329.HKQRZb0eD9@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 10 Jun 2015 10:31:24 +0100
Message-ID: <CAJTo0LaQBwi=g2HieFVjQcKfngZy2dWuw_p=kDdbGJStntm_Hw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] remove neon from oe-core
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
X-List-Received-Date: Wed, 10 Jun 2015 09:31:44 -0000
Content-Type: multipart/alternative; boundary=001a11c135f61d6a770518268b15

--001a11c135f61d6a770518268b15
Content-Type: text/plain; charset=UTF-8

On 10 June 2015 at 10:17, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> I have to be honest and say I don't like meta-oe continuing to be a dumping
> ground for old things that only a few (or no) people are using - if we must
> keep these recipes around, I'd rather they go into a different layer even
> if
> that layer's only grouping factor is "legacy items", at least then they are
> labelled appropriately. GStreamer 0.10 and BlueZ 4 were recent examples,
> perhaps I should have spoken up earlier, although I don't necessarily think
> it's too late.
>
> Martin - what do you think?
>

A meta-legacy layer does have a certain appeal as it would clearly indicate
that these recipes are unmaintained.  That won't really apply for neon
though - libmusicbrainz in meta-multimedia is still useful/in active
development and depends on neon.

Ross

--001a11c135f61d6a770518268b15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 10 June 2015 at 10:17, Paul =
Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.=
com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<=
br><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":8u=
" class=3D"a3s" style=3D"overflow:hidden">I have to be honest and say I don=
&#39;t like meta-oe continuing to be a dumping<br>
ground for old things that only a few (or no) people are using - if we must=
<br>
keep these recipes around, I&#39;d rather they go into a different layer ev=
en if<br>
that layer&#39;s only grouping factor is &quot;legacy items&quot;, at least=
 then they are<br>
labelled appropriately. GStreamer 0.10 and BlueZ 4 were recent examples,<br=
>
perhaps I should have spoken up earlier, although I don&#39;t necessarily t=
hink<br>
it&#39;s too late.<br>
<br>
Martin - what do you think?</div></blockquote><div><br></div><div>A meta-le=
gacy layer does have a certain appeal as it would clearly indicate that the=
se recipes are unmaintained.=C2=A0 That won&#39;t really apply for neon tho=
ugh - libmusicbrainz in meta-multimedia is still useful/in active developme=
nt and depends on neon.</div><div><br></div><div>Ross</div></div></div></di=
v>

--001a11c135f61d6a770518268b15--
