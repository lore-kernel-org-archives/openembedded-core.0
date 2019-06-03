Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
	[209.85.210.46])
	by mail.openembedded.org (Postfix) with ESMTP id 593197E320
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2019 14:12:26 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id i8so16132944oth.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Jun 2019 07:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B7kft8Ai7OjC4hcl7EjaKF0oorfVs/q49F+QdkGJs10=;
	b=EpJbi9L+bA6hiWt0/1UJAp9RgXPXWWxozg58ek2Dz7C23jYm+wHSt6CCnPuFs3EMks
	24Nh4vbSuti+bNR5TYCAImGmNfUu5ZxzgCJNA8rtK4wnLwAWxOXpNxQhh40vYDyQLUbt
	TN7XruBzNf8L/j2vvsEaVJsWcncALo8gWm82VSJzr9lcLBfawkFAOeWt6KHvTz6ztHd2
	i6cRC0WO7LZn4PUjbJbA/xFG86T/VKvGnD6odUzvQrQmDNrltoCznSeLQ6X8gD1QiiMM
	VP+Cucn1wlB+lCsKbx990zkkD1Lx47BGWCs5wVwz5EzuvbwpozLGtiUIwvMJshUzzexv
	HpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B7kft8Ai7OjC4hcl7EjaKF0oorfVs/q49F+QdkGJs10=;
	b=Ei2np5JEnffkShyUBW3+Ml20ejKWXkqbXeOjgmxs9Dnkg0tPD/kgLQVUxQoRz7aZTC
	CvXB1Rwecz/czkKcA1f2uVHEOSWEi+yF0m8jS7KW/5MxyiCarNefNeEGx1hl4HckXR2d
	EpmuWenhXPtW2o5/BEajyL8v4hGaTpFn7QNdfDWiO4ODJ6v7sT+7SV5rOOUbN96lCFrS
	n7B+oF15qoQhJ6cv2eFA64/oW0V57by4OG98ki2lMx24vWnCFTMy3c6JzO74CcRqpGH4
	Vzhk1qrxomFap04vrZJKs2zT7xFI5EvM6lCs7Tjdh6tr5RyIREn2OFnh7smg/9HJ6uA3
	slIQ==
X-Gm-Message-State: APjAAAVMCOEOh4pwsSEvYjEBcU7da/1pH6Z7OcGYl5Pb1HsUYHbgvYVc
	2fvVXGxPZCpGzhp518c51KTGMz/zZZ8vcXv62ayy8Io1a48=
X-Google-Smtp-Source: APXvYqwU7b7raLAaW/9yaQTZK1MWkHoLzPgDT3msX2tn/kC39PabGxyqKpbs+Z8+/ZI5C8voEMgvuP4hfvquCsrhfuc=
X-Received: by 2002:a05:6830:2041:: with SMTP id
	f1mr23106otp.167.1559571147186; 
	Mon, 03 Jun 2019 07:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <c716be4355dd149975d466b2d9b4c47ea38f0002.camel@igalia.com>
In-Reply-To: <c716be4355dd149975d466b2d9b4c47ea38f0002.camel@igalia.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 3 Jun 2019 16:12:14 +0200
Message-ID: <CANNYZj_ZnrJXTUPRVZRvb=LToMw27bENctdGARAFncn7WX4UDA@mail.gmail.com>
To: Philippe Normand <philn@igalia.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GStreamer recipes migration to Meson and _git.bb recipes?
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
X-List-Received-Date: Mon, 03 Jun 2019 14:12:26 -0000
Content-Type: multipart/alternative; boundary="0000000000003aeaea058a6bf491"

--0000000000003aeaea058a6bf491
Content-Type: text/plain; charset="UTF-8"

Generally things acceptable to oe-core must be
a) broadly useful to many people
b) regularly tested on the autobuilder.
I don't think AUTOREV recipes would fulfil either. Besides, if gstreamer is
ok for AUTOREV, then why not other components?

But you can easily have such AUTOREV recipes in a separate layer. In fact,
right here:
https://github.com/OSSystems/meta-gstreamer1.0/tree/master/recipes-multimedia/gstreamer

Meson conversion is very welcome, right now is the best time (as later on
there will be a feature freeze). You don't have to convert them all at once.

Alex

On Mon, 3 Jun 2019 at 15:47, Philippe Normand <philn@igalia.com> wrote:

> Hi folks,
>
> It would be convenient to have _git.bb GStreamer recipes, for
> development purposes. There were some in the past but they were not
> very well maintained and they had outdated SRCREVs. Would it be
> acceptable to include _git.bb recipes relying on ${AUTOREV} in the
> tree?
>
> We also plan to migrate the recipes to Meson, especially because the
> autotools build will be removed from GStreamer upstream, most probably
> before the 1.18 stable release.
>
> Philippe
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000003aeaea058a6bf491
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Generally things acceptable to oe-core must be</div><=
div>a) broadly useful to many people</div><div>b) regularly tested on the a=
utobuilder.</div><div>I don&#39;t think AUTOREV recipes would fulfil either=
. Besides, if gstreamer is ok for AUTOREV, then why not other components?<b=
r></div><div><br></div><div>But you can easily have such AUTOREV recipes in=
 a separate layer. In fact, right here:</div><div><a href=3D"https://github=
.com/OSSystems/meta-gstreamer1.0/tree/master/recipes-multimedia/gstreamer">=
https://github.com/OSSystems/meta-gstreamer1.0/tree/master/recipes-multimed=
ia/gstreamer</a></div><div><br></div><div>Meson conversion is very welcome,=
 right now is the best time (as later on there will be a feature freeze). Y=
ou don&#39;t have to convert them all at once.<br></div><div><br></div><div=
>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, 3 Jun 2019 at 15:47, Philippe Normand &lt;<a href=
=3D"mailto:philn@igalia.com">philn@igalia.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">Hi folks,<br>
<br>
It would be convenient to have _<a href=3D"http://git.bb" rel=3D"noreferrer=
" target=3D"_blank">git.bb</a> GStreamer recipes, for<br>
development purposes. There were some in the past but they were not<br>
very well maintained and they had outdated SRCREVs. Would it be<br>
acceptable to include _<a href=3D"http://git.bb" rel=3D"noreferrer" target=
=3D"_blank">git.bb</a> recipes relying on ${AUTOREV} in the<br>
tree?<br>
<br>
We also plan to migrate the recipes to Meson, especially because the<br>
autotools build will be removed from GStreamer upstream, most probably<br>
before the 1.18 stable release.<br>
<br>
Philippe<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--0000000000003aeaea058a6bf491--
