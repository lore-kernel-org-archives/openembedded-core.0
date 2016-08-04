Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 34431731E5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 14:34:12 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id b62so272515430iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 07:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=plVcVEGXqC936UWPun3br3GmEex/3qyKvKwgXyTTJ4g=;
	b=ll5S2zHq1Vhf/WbMb/V9+U3QDCA23r/IUyatixVvAXwpfLrv6MRPE0gYSHo6f2xt/7
	ZDVPn2zYxnmXPYWhfscQ1lMytajPy3WBVhRaJ9/ZmUUnBEs6DacCSvW3g8v9w2BLax0M
	3kudkL6LfZ5kC4IZunK2sbRkIKmtC91YIJEpZ0bIZgvuX0DD57fnf3PIUitJiwcba5F/
	yj+b/Lqy7yL74vjwHga6MZ4LCFK82WG6EDGgml/IN/iaJEy6KQXSEQkUtSb6iVJ1bkDV
	qaGN4IgP0hT5bterzMiiZJTbPyBNApdAbT5trgcIAPyR8zcrQFBvzytYi/TvSSq7tyoT
	xl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=plVcVEGXqC936UWPun3br3GmEex/3qyKvKwgXyTTJ4g=;
	b=U6M61dJLOr48sXLvRqaCVvQt62VyFgx2ULlRGKweNOruLX3GQTbIARlKZmAjP/m1HW
	slY8wn4E45ON/C0pev4LFaDLJD/yA5K1jb+XkBXgWb4KyYRDaXqPKVmCn1b4Yw8wJ2OQ
	eGg6Uc7pZeq6NHAuOHDMJtAGUyuQiGkBjhBYN5AbiYPGQpaGnSMD4SEO2536EB1VK69C
	DfbPLJCTt+fklOT+53OXMAcJ5cdYHURPZlmNsEoHsSMZuO6AVQICkmW8FiIHL/iJ1Bl3
	Abp8ONiQVlnrJCYsH08bAf5vWe0BAUw3AFlJAjyxHVU6nZr4kvcRC/O+4VsiJyx8XpSq
	Kfgw==
X-Gm-Message-State: AEkoousfngGH0tNRNbAsLSiL5T7ZOXUB7HpqadUFtP8ZmJyIE2CD3wBcHGkDoBakvI+ZsTydPia7zE8ofAFQy9XR
X-Received: by 10.107.135.142 with SMTP id r14mr81900272ioi.133.1470321252926; 
	Thu, 04 Aug 2016 07:34:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 4 Aug 2016 07:33:52 -0700 (PDT)
In-Reply-To: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
References: <1470317274-27771-1-git-send-email-s.mueller-klieser@phytec.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Aug 2016 15:33:52 +0100
Message-ID: <CAJTo0LZ94KkvfRVUfq5cHFJ6tUKJs_JCMHWFYJACUDUHKg11_Q@mail.gmail.com>
To: =?UTF-8?Q?Stefan_M=C3=BCller=2DKlieser?= <s.mueller-klieser@phytec.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/7] dangling patches
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
X-List-Received-Date: Thu, 04 Aug 2016 14:34:15 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcfcbd1605393fd7e0

--001a113eccbcfcbd1605393fd7e0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 August 2016 at 14:27, Stefan M=C3=BCller-Klieser <
s.mueller-klieser@phytec.de> wrote:

> There are some patches floating around with no reference to it. I guess
> one just forgot to delete them during package upgrade. They should be
> removed for consistency.
>

I dont suppose you have tooling to find these, or was it manual review?

Ross

--001a113eccbcfcbd1605393fd7e0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 August 2016 at 14:27, Stefan M=C3=BCller-Klieser <span dir=3D"ltr">&lt=
;<a href=3D"mailto:s.mueller-klieser@phytec.de" target=3D"_blank">s.mueller=
-klieser@phytec.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":5f4" class=3D"a3s aXjCH m15655c5059c0da59">There are some patch=
es floating around with no reference to it. I guess<br>
one just forgot to delete them during package upgrade. They should be<br>
removed for consistency.</div></blockquote></div><br>I dont suppose you hav=
e tooling to find these, or was it manual review?</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbcfcbd1605393fd7e0--
