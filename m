Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3AB1E7825B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:02:31 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id z187so1798921ioz.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 06:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XkWyjjsvxktsXJFFp70Hv0Cr8jXZPW43blgBLpa3gKc=;
	b=WP7mKxbys51H2IHt9aZIxu7tLy94wBL4+06n746axjqjzAoG+kI7LzDQ7XTHIgPZru
	3SIKyQymHTFkTZriyOMeI1uR1dXXdwHFFR6HAUfqcZ6yazyjlokQUDoQsrkT26U7061c
	Ik0+0j7nOVSuGWv3/JEEZIa0+LLvXoBZooInM5S4eu08JPs4YhKw8mfOj0Vm445FHtHz
	cQy3Ru+xS7mfEGWRizqqedLbWF5MeW+hx4uJgjfKqUVNzd9dUvSq+olwDk+kEclLBB8l
	JlH/0PfERRRRJsgp3rssLQo9wdwSNVZIGMEQ6OMc0wLjmvVztLy7/13ORI1gio0FTEAW
	8PMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XkWyjjsvxktsXJFFp70Hv0Cr8jXZPW43blgBLpa3gKc=;
	b=EAaUMArikEIKamh2zxYe4Q4gyup+qTIgImeFVw5Y/O7G4Tzvcd/K4retumkAjrJlr+
	1SR4H3UE7cWzs/WT1a8CKQ0fgZCGlkmqloCRc1RSVFYjFxdO7rMSfOau8llbbFzmw3X9
	ZEwM7TE9WYwDZMjm9+QvuDWu6GnG7kZwSNcynD3Z/FBsdF2OoN3sDDeFsDaeM8LaRwH9
	rkHEOb50vkrJZZISOC+gqK54/dA3Bq6Ha9YilgV6h2QPueCPkhtF1gckDb327xxZU92P
	9iYzwUVAgjHvU82XdQgQY65dBnMYA81HYNlGqqbQirmdqk8I2/GZ9SeQ39/gkNdRyWWk
	dc2w==
X-Gm-Message-State: AHPjjUjg8GENNkTO6WLnDRgAOTbgE56G0emTYMOPn4Jvk6qSMEcUpsi7
	CcVhTA/bqXUd4SXHP1u7v85x9f0e+TSAOs7gPyfpjQ==
X-Google-Smtp-Source: AOwi7QBR/jETAXJrokiI2wnIIPgjhONPV+LM4tfnU5bYvsqIvK8sln/U0YAspTr046qA0pNzLZYJbN14WYvFl8+W7NI=
X-Received: by 10.107.32.70 with SMTP id g67mr20711725iog.77.1505739753135;
	Mon, 18 Sep 2017 06:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 06:02:12 -0700 (PDT)
In-Reply-To: <20170918122202.21008-1-adrian.ratiu@ni.com>
References: <20170918122202.21008-1-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 14:02:12 +0100
Message-ID: <CAJTo0LaVOHBWUANmdXtEXXmBYjcvCDemiWYq=Yg+y4V9ds2BDA@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux: package switch_root separately
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
X-List-Received-Date: Mon, 18 Sep 2017 13:02:32 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c1c3b400559765b30"

--001a1140ae2c1c3b400559765b30
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 13:22, Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
wrote:

> Having only this utility is useful for tiny initramfs'es which don't
> need the whole util-linux package (and neither the busybox binary
> which is much bigger than switch_root) to do operations like decrypt
> a rootfs & switch to it in the init file.
>

At what point do we admit defeat and programatically split util-linux into
a package for every binary?

Ross

--001a1140ae2c1c3b400559765b30
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 13:22, Ioan-Adrian Ratiu <span dir=
=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu@ni.com" target=3D"_blank">adria=
n.ratiu@ni.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Having only this utility =
is useful for tiny initramfs&#39;es which don&#39;t<br>
need the whole util-linux package (and neither the busybox binary<br>
which is much bigger than switch_root) to do operations like decrypt<br>
a rootfs &amp; switch to it in the init file.<br></blockquote><div><br></di=
v><div>At what point do we admit defeat and programatically split util-linu=
x into a package for every binary?</div><div><br></div><div>Ross=C2=A0</div=
></div></div></div>

--001a1140ae2c1c3b400559765b30--
