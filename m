Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3FA1860123
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:57:58 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id x23so14706832pgx.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2016 17:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lDP4BuNjfhNTjYHAWPmb9LkHrgdJ3dNhsXAGqrf4t1Q=;
	b=bfTcphwmYxCdmGGOF7Y5CyI6g+zrQYJMbgWTCSd27EM94Qr6ffTbiAdd2G7VaHFO/g
	p0Xvic5JXKvgaNAq0X5GiR2ekH/1mWLnhGbzEz7zQb1q36g6/C8cHLNGO7Nqx0Kq9cLZ
	iehnvQPlJEeXtKuM+1ss47chyyf2ArNl+uTriROVbcy4KajpXd8z26/LG+EJMnh6ghdt
	RMWl6bUI4XhnxHEgJYyE9ZD8fQ3wdSpIJW8X53GfWms3ecjQUYbt3H6d6QMjA9T+sA6W
	cJqpQBO0PqZZHFpQOuGi/QvuN/b4uwDIcr6+Q2+gz/VFMT80ydTRzdjcheVBDW808aa8
	jOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=lDP4BuNjfhNTjYHAWPmb9LkHrgdJ3dNhsXAGqrf4t1Q=;
	b=ZtsfEA5aBdkZYji35Qjok2ulDEyj66a6Y1Jw9JYKk8cqGuYCgiQkcMVe1Q5RxA8ArY
	wpQ3kIGX9Klj2U6d1/SNUMxZVqnMqg1IOylh9ORUYpNKUTW8eKMPPbQUen3Ga6STaK5w
	kU8VyvpcKXHXJdeS+f5a5+qvQ+SiNJln4TNKp0szHLd03m0pdj18AwR40XI7e+QUVFrG
	lJFl5k34fVT2dbB/aLw+cevNZqsORbCLc5XCiXtFjc7wdWUfZ2pxOMNR2mNPfbfd7zpw
	Bm6gs62q1wSLksSwiSEtLfneMDVMFgi7PXAXg+tnLlFStjoUyW9mMFrq4+St3r71bUaX
	fYmw==
X-Gm-Message-State: AKaTC00W/hIVQKWSw6eL02CegI2yoWQ4EslSJ8zdJ646fYFGTFBklY7kyrv2tz7dkdJ94w==
X-Received: by 10.98.88.4 with SMTP id m4mr24991351pfb.81.1480384679796;
	Mon, 28 Nov 2016 17:57:59 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:f08c:19b4:e718:7b0b?
	([2601:646:8882:b8c:f08c:19b4:e718:7b0b])
	by smtp.gmail.com with ESMTPSA id
	a68sm72227609pgc.31.2016.11.28.17.57.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Nov 2016 17:57:59 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5251131.puhPuqrAHf@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 28 Nov 2016 17:57:58 -0800
Message-Id: <43EF9731-230A-4FEE-8D1F-D81BEB193D24@gmail.com>
References: <cover.1479871728.git.liezhi.yang@windriver.com>
	<27dbd493-5b76-657f-8a1d-57eabe9eebed@windriver.com>
	<1479973589.6873.15.camel@intel.com>
	<5251131.puhPuqrAHf@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] base-passwd: set root's default password to 'root'
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
X-List-Received-Date: Tue, 29 Nov 2016 01:57:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 24, 2016, at 10:59 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> On Thu, 24 Nov 2016 08:46:29 Patrick Ohly wrote:
>> On Thu, 2016-11-24 at 11:38 +0800, Robert Yang wrote:
>>> Currently, debug-tweaks is in EXTRA_IMAGE_FEATURES by default for =
poky,
>>> and
>>> there is no passwd, so that user can login easily without a passwd, =
I
>>> think
>>> that current status is more unsafe ?
>>=20
>> Both well-known password and no password are unsafe. User "root" with
>> password "root" is not even "more" safe already now, because tools =
that
>> brute-force logins try that. Choosing something else would be a bit
>> safer for a short while until the tools add it to their dictionary.
>>=20
>> Poky is also targeting a different audience than OE-core. Poky can
>> assume to be used in a secure environment, OE-core can't (because it
>> might be used for all kinds of devices).
>=20
> I don't think that's part of the design goals on either side, it's =
simply=20
> about making development easier. The feature is clearly labelled =
"debug-
> tweaks" because it's for debugging not for production. It could be =
that we=20
> should make it do other things like append a notice to /etc/issue to =
avoid=20
> people leaving it on for production, if that is a concern.
>=20

Sometimes such goals can lead to problems. Making development easier by
all means if you can ensure a hard error on production e.g. debug-tweaks =
can
then never be part of production images. Otherwise someone will forget =
it
and it will be discovered on millions of devices in field along with the =
user
project will be red-faced.=

