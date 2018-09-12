Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id 11E537964D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 09:26:12 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m11-v6so2377448oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 02:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jGbpqF/WvQL0xdMbopNmOFMmtysLxYu/yokH4g0gaXQ=;
	b=aBdRMMWgWhwcLvdrOi4LiX8QKWGhmAZBK0jz/AhlyhyLpXt30k27I0HZqelLeAKxBF
	s/M0tplIrrM3dEfJOjBI3A5o5lirXO3IKFhfQkWqwmuie+y1uQ4s7HtTyeG5kww3kzTX
	Baava+Y158LjwkNES4c71Z6SB9oVXyZ7g9FlDpx2xGPgR35dQDM/HT11CPln0LRIfDpD
	P1o9Dg3BRo3IO+CXkO7eDYYSTkM0/wrIi651dv3IK0ixR2DGdokIN9JBTs9L7ksaQniy
	q5tI3LcD2s4T5rQXpVV92SPBpd4HlgdhdefKw8G/q0LlNs7WN/jXR5kTNHSUl6Qsn9CD
	9TQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jGbpqF/WvQL0xdMbopNmOFMmtysLxYu/yokH4g0gaXQ=;
	b=snSm58UfJNlh+Ov8QqwGbvXj6ep3xDD8RxTziwA0GJfsR/k2VvnSPi/PHOpkA+dsRc
	Cag6MePD2eHO590nPxI8YmqRFNRde77SYHe1EF7c9s2R36LPtdjwVwCvI2BfVcGlp6h5
	9R8Kxffqzg2JrWzHYCWsCSszJpXVoI4NEXja1eXwt5oqPuamJmtmgOOlknujR2fLehkG
	7fMX3sjs0ekoHa6lvH971QCGFpEiO9JEvhpcQkP7ZvpvEOiPNDRDxOOZ+lZKMIlefl8a
	/kWmYekntm4n0eBxxzr6bBL5qcPn76uDhV4+WsEygR/cEyszBgfnJItk1BAQCRK1KDwt
	3eMQ==
X-Gm-Message-State: APzg51Ac/S1eKN/VqEmmBkuDIkPOnzfZiRtkoyxEe/Upc0NPRN1krkBD
	jl2sYze7g/C27SqLXN6IWV64JzUD3UJ6nMUxEnU=
X-Google-Smtp-Source: ANB0VdZZXjjyEHME0CqOOzltSXqqsotUVZSZQErDfuF/okbH7BfmBzloAulcTJRoiSt8OAIsO3IZCDSVRro7uNm07FA=
X-Received: by 2002:aca:ba83:: with SMTP id
	k125-v6mr990585oif.226.1536744374103; 
	Wed, 12 Sep 2018 02:26:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:b48b:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 02:26:13
	-0700 (PDT)
In-Reply-To: <41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
References: <1536656353-30689-1-git-send-email-hongxu.jia@windriver.com>
	<CANNYZj8SRYoj3QXZ7_bCLe6qrJq1TBq-WOsHMOLVLpveh151bA@mail.gmail.com>
	<41457254-4083-3d7c-4e93-95b320fe7dbb@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 12 Sep 2018 11:26:13 +0200
Message-ID: <CANNYZj9EZF5u2R55LBnBooyPpAhi7O69kVtWsvZesXZ3H7qxOQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssh: build support openssl 1.1
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
X-List-Received-Date: Wed, 12 Sep 2018 09:26:13 -0000
Content-Type: text/plain; charset="UTF-8"

2018-09-11 17:18 GMT+02:00 Hongxu Jia <hongxu.jia@windriver.com>:
> Here are my suggestions
>
> 1: Replace dependence openssl10  -> openssl, such as this fix, and drop
> recipe openssl10 finally;
>     1 (openssh) in oe-core, 3 (umip, ipsec-tools, mailx) in oe, 3
> (openssl-tpm-engine,
>     tpm-tools, trousers) in meta-secure-core
>
> Or 2: Unify openssl,openssl10 and libressl to provide one ssl,
>         we could add PROVIDER = 'virtual/ssl' to above recipe, any recipe
>         depends on `openssl' will be replced with `virtual/ssl', the recipe
>        depends on `openssl10' will not be changed.
>
>        Set PREFERRED_PROVIDER_virtual//ssl = "openssl | openssl10 |
> libressl" in conf
>
> Or 3: Revert previously patch, rename recipe openssl10 -> openssl 1.0, and
> set
>       PREFERRED_VERSION

Option 1 creates a maintainability issue for openssh. You add the big
patch that no one understands, then someone else has to rebase it
later. Of course over time we need to move everything to 1.1 across
all layers, but at the moment it is not feasible for openssh
specifically.

Option 2 implies that openssl, openssl10 and libressl are all drop-in
replacements for each other which is not true. openssl 1.1 API is
significantly different, and choosing one or the other option will
cause significant build breakage. Especially as upstream components
begin to drop 1.0 support.

Option 3 has the same issue.

Can I suggest option 4? As openssh is already patched in meta-selinux,
and the problem is specific to that layer, you can add the 1.1 support
patch there, and replace the openssl10 dependency with openssl (1.1).
If, over time, that patch can be rebased to new versions of openssh
without too much trouble, and upstream still hasn't taken it, we can
re-consider adding it to oe-core.

Alex

