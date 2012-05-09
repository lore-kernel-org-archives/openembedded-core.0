Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SSDug-0004ti-3z
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 22:55:10 +0200
Received: by wibhj13 with SMTP id hj13so693369wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 13:45:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=6KUetLJcitlF9g8jgkmwRGhbXMQmwtvg9LKQOuCfzGM=;
	b=JYiXTuDcCnqEjuKhsHqgjQzlIPRE5IG2ZVD22vZtrUJBBm5xQGmb2fwvn4fHwLwiYT
	+YcfFDfGZWek/kdLtIFxJxL81d4FcfwIaKv5D/hk01By+pilJSjmBpTBeHHqIIxPGpeG
	wnhPjMm/Cwr3gvBJnSKagJ8EdObAsXm8h+ARjqTvTnZLh1sG6bwY/tkENoZ6MK9HWkF2
	rSMqUqhnwG4vvEBIpDhsKqCUlgzjYgkWv521W1CA0EPaudzqlUSmVeXZo6kWPB8j7FPk
	edrYeUtPz538ZH+i59GNuF9oV3Do3sY9N8Ma+95kMJ1Fp83kktdQy97+EbeLcIT1XhdH
	q1dw==
Received: by 10.216.200.90 with SMTP id y68mr846071wen.49.1336596317090;
	Wed, 09 May 2012 13:45:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id j4sm5280516wix.5.2012.05.09.13.45.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 May 2012 13:45:15 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <583198c49fc63d31fd0f15484983032b50b2ce8a.1336593352.git.mark.hatle@windriver.com>
Date: Wed, 9 May 2012 22:45:10 +0200
Message-Id: <CD60D4EF-5A88-48AE-90CB-50B97B9FCDF9@dominion.thruhere.net>
References: <cover.1336593352.git.mark.hatle@windriver.com>
	<583198c49fc63d31fd0f15484983032b50b2ce8a.1336593352.git.mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlg68OqVWEVnZKG6c2FpSfaTLJGDKyYMK7/OMQSGo87y5MFpG7HlFNEwJDOrw9p80NGc/nA
Subject: Re: [PATCH 2/2 v2] blacklist.bbclass: Refactor, use PNBLACKLIST[pn]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 09 May 2012 20:55:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 9 mei 2012, om 22:00 heeft Mark Hatle het volgende geschreven:

> Revise the handling from ANGSTROM_BLACKLIST to PNBLACKLIST[pn].
>=20
> Refactor the code to eliminate references to the distribution and =
recipe
> name in the message.
>=20
> Change the skipPackage message message from:
>=20
> ERROR: <recipe> was skipped: <distro> DOES NOT support <recipe> =
because <reason>
>=20
> to:
>=20
> ERROR: <recipe> was skipped: Recipe is blacklisted: <reason>
>=20
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> meta/classes/blacklist.bbclass |   22 +++++++++++-----------
> 1 files changed, 11 insertions(+), 11 deletions(-)
>=20
> diff --git a/meta/classes/blacklist.bbclass =
b/meta/classes/blacklist.bbclass
> index 7bf4a73..75abd99 100644
> --- a/meta/classes/blacklist.bbclass
> +++ b/meta/classes/blacklist.bbclass
> @@ -1,20 +1,20 @@
> -# anonymous support class from angstrom
> +# anonymous support class from originally from angstrom
> #=20
> +# To use the blacklist, a distribution should include this
> +# class in the INHERIT_DISTRO

INHERIT works just fine as well



