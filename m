Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF45C7F32F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 12:04:05 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id o19so18723924vkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 05:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=686BpN2blMRXD22x7YhwmjECil8YaUjFNW5sRQKE4aI=;
	b=lULV1GW1dV8pRNSa8CcfVyCTGY9HcSD+UROwZWArMqhamsGv9bNcHzLgy9JFNu1iM8
	h4TV84H5zdZ+cXfEWy5o0h+t1o3Uvh9gKl8GAl3zljv3JcASmH/yw1cfEHn6sepAP5Db
	Wrl3bee1pit5R1RGSnmVx0CZWDdFhGk6tNUEfaxJQHTYoLuiW+Q1EdMMilHEXoAYDvFk
	SpluBbnMLLR9PsJNCIZdOUE9f1ZTOADL/7KRyEyyUd4964IAV50fEKHj3WCjPnyjnlAT
	xNYIvA+hXCLzcUnV8rbCzXWY+OE+83RRFO1NEQWYOs5FKI49n9VdM9Uz1rCdJRzROEjo
	NXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=686BpN2blMRXD22x7YhwmjECil8YaUjFNW5sRQKE4aI=;
	b=FvXAeCJlWcvMMXzPLvKPUFR5pE7i/c7xbDZK7dXMMwdrh40r5YXhWu16P3E6g1Y6gA
	g5nD5AYFb1hm4u1CxaS2TScw/kHvb/nKlyL8t29wksbm9NtZ/lVSNaVoEvTlVQ9lFALa
	Qlx8/WgOega3c4ADxIE0S9aRpzd5aPwGVkmIM8uskXKSnq884myxDGrfsQJeJ+c9Nlay
	GcM4XlJaLmb9+BQOrc59C6EXJjsQ/hRVndFpiV0Ic+/b9/QFyGfuB2eNppVH1ZQAnBY9
	cnSYlwXEdLXAX8xTm362GjHUUQWoIHaZA4qA1D+kODsv4rjxj7zBg4UK7nJzX9Rrftev
	ry3A==
X-Gm-Message-State: APjAAAUS8q38EkK3fE0yscBEDixRtieN686fx0NJkhHNgHk/6cV+OFeS
	QfYhdgyRVEygQmv4Y1Hp8HVp313GPJaGX68y8Lo=
X-Google-Smtp-Source: APXvYqzMzyc6CJyVDo6ZyC+aw7Oq5ipYi6876TRUnFMMmTAswlDEOXBrDJpe2biBI6i7ZPbrhooZS10SjT1caH0iRSo=
X-Received: by 2002:ac5:cc4d:: with SMTP id l13mr5565107vkm.72.1565265846502; 
	Thu, 08 Aug 2019 05:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190805105232.16148-1-luca.boccassi@gmail.com>
	<20190808114701.20464-1-luca.boccassi@gmail.com>
In-Reply-To: <20190808114701.20464-1-luca.boccassi@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 8 Aug 2019 14:03:55 +0200
Message-ID: <CANNYZj9NOARrMH8Vm1QXMwXzVUu7yTisK2X25jta_3xDCO0HeA@mail.gmail.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3-pygobject: move python3-setuptools from RDEPENDS to DEPENDS
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
X-List-Received-Date: Thu, 08 Aug 2019 12:04:06 -0000
Content-Type: multipart/alternative; boundary="000000000000c287a4058f99da82"

--000000000000c287a4058f99da82
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2019 at 13:47, <luca.boccassi@gmail.com> wrote:

> -DEPENDS += "python3 glib-2.0"
> +DEPENDS += "python3 python3-setuptools-native glib-2.0"
>

If this is required, then the build should fail, and it doesn't (neither on
the autobuilder, nor in my local setup). Is this really needed? Does the
build fail for you?

Alex

--000000000000c287a4058f99da82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 8 Aug 2019 at 13:47, &lt;<a href=
=3D"mailto:luca.boccassi@gmail.com">luca.boccassi@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">-DEPENDS +=3D &quot;python3 glib-2.0&quot;<br>
+DEPENDS +=3D &quot;python3 python3-setuptools-native glib-2.0&quot;<br></b=
lockquote><div><br></div><div>If this is required, then the build should fa=
il, and it doesn&#39;t (neither on the autobuilder, nor in my local setup).=
 Is this really needed? Does the build fail for you?<br></div><div><br></di=
v><div>Alex<br></div></div></div>

--000000000000c287a4058f99da82--
