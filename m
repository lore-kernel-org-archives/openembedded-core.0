Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 278FB73E11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:38:02 +0000 (UTC)
Received: by qkbm65 with SMTP id m65so6977970qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 13:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yuhJwjxnJRBXYSr9LuvBijb2HQeJFaXJx9QPuDVq7pQ=;
	b=Auinjl3bmKtmBANIX739aVfbKVVKoLZGRC8eNU7qAW9FQc0w+fV4s43HXVtr9F7I2o
	M61rcc6t/LivEOeU7rLscb8RHgjYZzNEBqTHJ/oD8jHkOtTxCf6zm20kwI3eCRQm/dw7
	bvfxbtoQavu5+zBvN5xfKvx/+lF+sx6AJMpKc8CPh5tmRpowtoIFmsO9xBnfh7AtGxa7
	mjBuiy6pUKORObhopYfalluXPa2P1ORXQ6uTR2a6S8yJ1bRK1t++UQDtCmGIDu970CAa
	oo5GTe/yh6k1o287k7pO2ZaZuVzmjojV2BZZF9RF0+itSNxV0Sx5ARJKnMXjWMypXUlP
	xhIQ==
X-Gm-Message-State: ALoCoQlVBv4ZNvV5DVPQ8Ji2ghYqOlgWY2XT3KzmGBkaB6IbKr1/fg3LrZPOz1iNBQCzmVE/9FOy
X-Received: by 10.55.221.25 with SMTP id n25mr4166097qki.67.1440016682755;
	Wed, 19 Aug 2015 13:38:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Wed, 19 Aug 2015 13:37:43 -0700 (PDT)
In-Reply-To: <CALbNGRTnJfkUDJSyH4-v3642e_=ea3m4-JAb6znDLUbpn0w+yQ@mail.gmail.com>
References: <cover.1439991562.git.alexander.kanavin@linux.intel.com>
	<68fe672e09b44fb814b733199c4058e3cce78bf0.1439991562.git.alexander.kanavin@linux.intel.com>
	<CALbNGRTnJfkUDJSyH4-v3642e_=ea3m4-JAb6znDLUbpn0w+yQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Aug 2015 21:37:43 +0100
Message-ID: <CAJTo0LZM7CYkywWvLJJC6v2NLWxXJrm-+AZMD0KkLNfiSUpxUw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] libnotify: update to version 0.7.6
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
X-List-Received-Date: Wed, 19 Aug 2015 20:38:03 -0000
Content-Type: multipart/alternative; boundary=001a1149b5c4d8bc2c051db0023a

--001a1149b5c4d8bc2c051db0023a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 19 August 2015 at 21:23, Andreas M=C3=BCller <schnitzeltony@googlemail.c=
om>
wrote:

> What about
>
> REQUIRED_DISTRO_FEATURES =3D "x11"?
>

libnotify doesn't depend on X anymore.

Ross

--001a1149b5c4d8bc2c051db0023a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 August 2015 at 21:23, Andreas M=C3=BCller <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:schnitzeltony@googlemail.com" target=3D"_blank">schnitzeltony@=
googlemail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 id=3D":2b6" class=3D"a3s" style=3D"overflow:hidden">What about<br>
<br>
REQUIRED_DISTRO_FEATURES =3D &quot;x11&quot;?</div></blockquote></div><br>l=
ibnotify doesn&#39;t depend on X anymore.</div><div class=3D"gmail_extra"><=
br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1149b5c4d8bc2c051db0023a--
