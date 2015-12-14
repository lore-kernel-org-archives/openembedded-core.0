Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1565D6FFC7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 10:40:35 +0000 (UTC)
Received: by lbpu9 with SMTP id u9so96668386lbp.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 02:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:organization:user-agent;
	bh=eiVQVL7WuXtTRgJeqor6O38oJdEp5XD05Q/zL6gjvwQ=;
	b=Xk2ghpgDsF3jFgyZ4/s5Rlm1aOQNyIUPrKy096rmVE+/PP0LX0FcVb8D7qP/jASVWU
	fYI3sM9vhF8B2zDb4wk+cK3HIAfy9xJJ2MNUbwY3qe1LKHo5w1SVa8VzCidOtup9X0x+
	uJZXUxIrIFBAiiKqs7rOtHp+5vjQrGwkfbTFk7CeMm2mm/TBH9SulVPxZI0gKLugXq7L
	W2TyMITKVO8G81V1dO/F13RVAevz1AjrczbkQKJT6bOMrXUpqyxcBjaWtqMLUV25S+7t
	idKuSVfSE6oq+bIZe4ECoimZicGhcGjYB0cx00uJ3D3EwKMAh03ZAI4sdpXRjKk7Fs7P
	+RIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:content-transfer-encoding:in-reply-to
	:organization:user-agent;
	bh=eiVQVL7WuXtTRgJeqor6O38oJdEp5XD05Q/zL6gjvwQ=;
	b=GFBx0KRICxjjqao9KKpUse1QwLRfapezdg7yTJmAW2mpe78bGqbHmDnPtXV8EgcZPY
	9rT02M9lP7rwN6iYmIqQ2KggjWV4V1uZMEqP2QhKWJCnP5lSDITzii+x1pfwNN40TAVG
	QY9s2nfljD+bXpwfwGZlweXvm5KwOGMuQMIMom21pyekHL2Tqvj45scmqchAmDM5ZLLs
	cJ5eGVB0ryB0KdckhAYMrn+SKRd39GKzvtpu8PlIFyDZJkC12oV183PhequGoqGzm3Pn
	VkvKEPJkn5jUGNjQMoDQpY9WeXZ8DIzHVSn9Yn9giQNlRpzDUFa/IBVOS5d/qL4BHQYL
	sccA==
X-Gm-Message-State: ALoCoQnj2tNuR7FLqznvtmJSErtaxKcCQQM23/TO6HLQHSL3HESIaRSHod82wC8AInj8nNHyaozWU8Atocdn4TDEmsygzr2tQg==
X-Received: by 10.112.11.169 with SMTP id r9mr13192250lbb.8.1450089635560;
	Mon, 14 Dec 2015 02:40:35 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84]) by smtp.gmail.com with ESMTPSA id
	t82sm5477104lfe.14.2015.12.14.02.40.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Dec 2015 02:40:34 -0800 (PST)
Date: Mon, 14 Dec 2015 11:40:27 +0100
From: Anders Darander <anders@chargestorm.se>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20151214104027.GA31532@ad.chargestorm.se>
Mail-Followup-To: akuster808 <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
	<1449539278-20070-4-git-send-email-akuster808@gmail.com>
	<20151208074923.GB8707@ad.chargestorm.se> <566C8E4C.102@gmail.com>
MIME-Version: 1.0
In-Reply-To: <566C8E4C.102@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [jethro][fido][PATCH 4/4] openssl: three CVE fixes
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
X-List-Received-Date: Mon, 14 Dec 2015 10:40:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* akuster808 <akuster808@gmail.com> [151212 22:14]:
> On 12/07/2015 11:49 PM, Anders Darander wrote:
> > Hi,

> > * Armin Kuster <akuster808@gmail.com> [151208 02:49]:

> >>  meta/recipes-connectivity/openssl/openssl_1.0.2d.bb | 4 ++++
> >>  1 file changed, 4 insertions(+)

> > I'm just a little curious about this serious, and a few others that I've
> > seen recently. They all add a number of CVE-patches, with one commit per
> > patch, and as the last commit, they all get added to SRC_URI in a single
> > patch.

> > What's the reason to do it like this? i

> Each CVE patch can be leveraged independently so back porting to other
> branches is simpler and less work.  The recipe file is  where merge
> conflicts will occur. Not all CVE's are weighted the same so someone who
> has a product in the field can easily cherry pick the CVE's they want or
> need. This was talked about on IRC a few weeks ago.

Well, you have the obviuos risk of backporting a fix, and assuming that
it gets applied.

The confligt will anyway appear on in the recipe, so there's no real
issue. Handling that conflict (which is easy to spot and solve) will
also ensure that you're aware of the fact that you have a difference
between your local branch and upstream.=20

> > I'd personally prefer to have each CVE-path also add the patch to
> > SRC_URI, as that make cherry-picking more straightforward. And it also
> > ensures that if we have a need to bisect some issue, that'll work. At
> > the same time that will make the meta-data consistent, i.e. no dead
> > patches.

> > I'd personally even prefer that whole series squashed to one commit,
> > compared to this adding a lot of un-applied patches.

> That would add more overhead to the work I do internally as I need them
> in the format you have seen here.

Sure, I don=CD=84't want the squashed patch either, but I want commit that
introduces a patch to also apply it.

> Are this patches not in the preferred method as described on wiki?

In my opinion, the patches should be applied by the commit adding them.
Otherwise, we've got commits that just adds dead weight to the
meta-data.  Just as we prefer a commit that removes a patch from SRC_URI
to also remove the actual patch itself.

Cheers,
Anders

--=20
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

