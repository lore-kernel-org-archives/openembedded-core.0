Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 01DBF6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 14:34:05 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id o3so17294392ita.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 07:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FlmQUxLf8UUDF5fcvK9TeKjzG8ktLJhLzTTRtbP8AoQ=;
	b=NQZ1TbbfgD5uEMrRv+PBuLtaCJhQnMANz9z3LI2hc4hweIIWJqD2Y1+PaOJmcTvIJi
	AqfqAKno4xXFvc3zXr4yX84gzCrrNujVBYHhPDvJ6poYjPxTCiQnkliI18wrhwDJr8vE
	ORPxWnAfuY9Wnxxyc3O3rQ/yBHJthBqVASgBV3fX76LVWNlEkatpTFsro4HjbTze01U/
	XyD2XDYnN9zU8pMwvuCG+3tlJL8/L5ShbQXieUIK10IT2oO0UgSv6YuzdIG+6Pie4TpY
	zGTQ0KJ11mD468U0HcH9ypJA99b7cV24MfYmJozjBs/CRPQ5z097HJOv6Q2Z5gLrQFya
	xFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FlmQUxLf8UUDF5fcvK9TeKjzG8ktLJhLzTTRtbP8AoQ=;
	b=bich4vxizVWQq+BzKiGroSJfs+9uM/IevhnDA544e63nMXbDn5eAYGhEXcjXX/pqNK
	mdzs3w9lpFyoTvRdjQ5FBW+nUja55KDwvwCF0+Yo1/DCgN3UDov/kmHN8ava0+P52BEi
	Dil+C3jshdKp2oGsBZm5qSqhuF7EcYwHd8S+6ZkP8L1VASEyMrMHYqaka852N9BwE8m0
	mLKRK2ixQTy2O/0ec5tCtnCNY99fuTKMAJaviw4MjeMHXEUfcFUWkvYbE1/glBmR+JPz
	FCX+Wkgl44h/OjD03YHQfbFIiR1nElge9b1BTs4zUdf4KQ7/6pJ7+W2v7saRhtXwkfXd
	Y1qA==
X-Gm-Message-State: AE9vXwOU6N7txANXFUPvU1tSKqGKXhYbA1neqz8/9+lwN1bM4W6HULoh/TU4T8gMMF00k3Hr0kn3WFyLk7WLf2Gg
X-Received: by 10.36.246.68 with SMTP id u65mr5956491ith.104.1474036445915;
	Fri, 16 Sep 2016 07:34:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.27 with HTTP; Fri, 16 Sep 2016 07:33:45 -0700 (PDT)
In-Reply-To: <20160916143156.6210-1-git@andred.net>
References: <20160916143021.5764-1-git@andred.net>
	<20160916143156.6210-1-git@andred.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Sep 2016 15:33:45 +0100
Message-ID: <CAJTo0LYKsL8GCdoUMFb_E7P0TwPDu4f2tvizte0j30kuVevkBQ@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] gawk-3.1.5: fix non-glibc & gcc >= v4 builds
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
X-List-Received-Date: Fri, 16 Sep 2016 14:34:09 -0000
Content-Type: multipart/alternative; boundary=94eb2c0349fabed67e053ca0da75

--94eb2c0349fabed67e053ca0da75
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 16 September 2016 at 15:31, Andr=C3=A9 Draszik <git@andred.net> wrote:

> See commit message of patch added
>
> Upstream-Status: Inappropriate [required for gawk 3.1.5 (GPLv2) recipe
> only]
>

This bit should only be in the patch, no need to be in the commit message.


> Signed-off-by: Andr=C3=A9 Draszik <git@andred.net>


The patch also needs one of these though alongside your Upstream-Status.

Ross

--94eb2c0349fabed67e053ca0da75
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 September 2016 at 15:31, Andr=C3=A9 Draszik <span dir=3D"ltr">&lt;<a =
href=3D"mailto:git@andred.net" target=3D"_blank">git@andred.net</a>&gt;</sp=
an> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">See commit me=
ssage of patch added<br>
<br>
Upstream-Status: Inappropriate [required for gawk 3.1.5 (GPLv2) recipe only=
]<br></span></blockquote><div><br></div><div>This bit should only be in the=
 patch, no need to be in the commit message.</div><div>=C2=A0</div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex"><span class=3D"">
</span>Signed-off-by: Andr=C3=A9 Draszik &lt;<a href=3D"mailto:git@andred.n=
et">git@andred.net</a>&gt;</blockquote></div><br>The patch also needs one o=
f these though alongside your Upstream-Status.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0349fabed67e053ca0da75--
