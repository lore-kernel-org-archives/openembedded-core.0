Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f48.google.com (mail-it0-f48.google.com
	[209.85.214.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6754A78485
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 23:49:03 +0000 (UTC)
Received: by mail-it0-f48.google.com with SMTP id p2so3461765ite.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Sep 2017 16:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S6TvkOBtj5dyU4G/cEiNJPgTGmlCRDUjmcomwxyk5oY=;
	b=YATQ6fuugDya0Km9kNwZldC1kBSslIgErv8lzy/pujlIOySYqqgdt2z2zmyrScZ0ke
	ddAdhBHsoMoNNDXIo1d8iDd1PczexuqQqGQ0yx4AkSuzzQ+KrewqdL56EPETWViL8AaC
	sXOMjwltfbkJA0jX6pkCK7WCE03U7E4Z4pdGXWgTFSPpUAvEPibBl+amN9tqcQCmX4+Q
	0JGOgSNSls/Ww39c3K8D0tCh6KtT35pqF6Rjyhm9u1Xw3PmRsLt2LXKhcq3UXdjoB1gU
	RQgdQoo+N9QRSbzGK0iTKK6o/Qp7B/wiXmxjBvYaKry94S0AhQSZr+1PE8fxYv+e1N46
	1kmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S6TvkOBtj5dyU4G/cEiNJPgTGmlCRDUjmcomwxyk5oY=;
	b=UpDr6lDAxBpddvlby4d8zYnIhfI3zutKtGNElRfck2goyCj2UF42tYMm8LErO69nx5
	JlME4JPD42IxYKUYMVBHmtOZIkl2smoK+oHYnmofkR6ZZIaES0bswB/udQSn4uCRaO3Y
	CZccrcVGbLgJTjwedzDUUQIS3aMZWbcqd2VcMoDZXPbfsYyl8lnCm4ZV16g4J2kXAvN8
	J8D573eRCx7l4Q4A8S7DfxicMNb8lUIlmBhiEs8POW/KjGkkiPZMrXz1QpBeNNzhBWW+
	HINL7+8Thoogk/EI1hNRioCd799B2OmMSpOcXOJhBwhwtkJhwYCdF+AkU0efoxi8qR2q
	D0IQ==
X-Gm-Message-State: AHPjjUhX5IeiCrdeMpMZDqGEZOvmWQpVYKJSAk8NPhvmKp1ph/h+8rsZ
	tanozij7QsV2DrIMMFDHjJ1hl9VoHrpTtlE=
X-Google-Smtp-Source: ADKCNb6d0GFIZOarfw8LweGoWr40BFB6+Zvy6FvckzWoaqI0rqxNja1/lxWkoZaH9z+RKqQ6SaAH3y7ubq5+e8Ep24c=
X-Received: by 10.36.224.205 with SMTP id c196mr1303580ith.18.1504309745427;
	Fri, 01 Sep 2017 16:49:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.33.83 with HTTP; Fri, 1 Sep 2017 16:48:44 -0700 (PDT)
In-Reply-To: <2ca752dc-b545-6bda-a7e5-fce1fe8c935f@linux.intel.com>
References: <1502831134-27642-1-git-send-email-jose.a.lamego@linux.intel.com>
	<2ca752dc-b545-6bda-a7e5-fce1fe8c935f@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 2 Sep 2017 00:48:44 +0100
Message-ID: <CAJTo0La3pK-K+6yi-_f1W5Xo46hj_rVpU79GyFB4xViZGvQqWg@mail.gmail.com>
To: Jose Lamego <jose.a.lamego@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] packagegroup-python3: add packagegroup
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
X-List-Received-Date: Fri, 01 Sep 2017 23:49:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c19df86023ea4055829686f"

--94eb2c19df86023ea4055829686f
Content-Type: text/plain; charset="UTF-8"

On 18 August 2017 at 18:09, Jose Lamego <jose.a.lamego@linux.intel.com>
wrote:

> Please disregard this patch. The python3 recipe provides python-modules,
> which includes all of the listed packages, making a new packagegroup
> unnecessary.


Its even better than that now:

RPROVIDES_${PN}-modules = "${PN}"

Adding just "python3" to an image will pull in python3-modules, which pulls
in the lot.

Ross

--94eb2c19df86023ea4055829686f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 August 2017 at 18:09, Jose Lamego <span dir=3D"ltr">=
&lt;<a href=3D"mailto:jose.a.lamego@linux.intel.com" target=3D"_blank">jose=
.a.lamego@linux.intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extr=
a"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border=
-left-color:rgb(204,204,204);padding-left:1ex">Please disregard this patch.=
 The python3 recipe provides python-modules,<br>
which includes all of the listed packages, making a new packagegroup<br>
unnecessary.</blockquote><div><br></div><div>Its even better than that now:=
</div><div><br></div><div>RPROVIDES_${PN}-modules =3D &quot;${PN}&quot;<br>=
</div><div><br></div><div>Adding just &quot;python3&quot; to an image will =
pull in python3-modules, which pulls in the lot.</div><div><br></div><div>R=
oss</div></div></div></div>

--94eb2c19df86023ea4055829686f--
