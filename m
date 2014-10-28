Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 83600601F6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 15:49:44 +0000 (UTC)
Received: by mail-wg0-f44.google.com with SMTP id y10so1185378wgg.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Oct 2014 08:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=hp7jIDvt+WY7uXMC0Gfvud9sQRxa8bUarlV08aMXqFA=;
	b=jUdKQZ4sUl9A3GbEGsWEazN76LuV01qWzVI/aBZqOz1pMzESQImduq32zGDmpX4gP6
	OaYlJ7VJ3TPb8k9aMP6k7a4mD7Z3FELPxTgCNAwyVCnlNfmloo/FzF/trL1VNfsTVKrT
	7ZpHVVkVgYc23s2fq9WQCN8abP2fSqbSlc2wF8b/IrcfLDYgJbF3G2q/8PISlqtDaB95
	y1NYFLgXPDh3+j7ApMB5HElcttCx70FEr3zIam29JFaxoFjYDEMaGtZza8ACfhXf/Kp0
	qejfycz/GcpkTpz1zPRswt80bAEgU6AboIpGQDgfMXZ5e2B+XTWMeblsPKWYCU6t5oST
	+E9w==
X-Gm-Message-State: ALoCoQnS4rdiU9YRvQ/kmoqMbNECpDxu2TKdAlKyIgw5+rPq9kWCRk7JsXKlt5+fUkKOQiQrEixu
X-Received: by 10.180.103.33 with SMTP id ft1mr28726580wib.71.1414511384680;
	Tue, 28 Oct 2014 08:49:44 -0700 (PDT)
Received: from ?IPv6:2001:610:612::9179:c244:411:b2a4?
	([2001:610:612:0:9179:c244:411:b2a4])
	by mx.google.com with ESMTPSA id cw6sm2265869wjb.18.2014.10.28.08.49.43
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 28 Oct 2014 08:49:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1414505359-1271-1-git-send-email-alexandru.damian@intel.com>
Date: Tue, 28 Oct 2014 16:49:42 +0100
Message-Id: <5ACFEF8D-2923-401F-B691-3CCDCA5A0608@dominion.thruhere.net>
References: <1414505359-1271-1-git-send-email-alexandru.damian@intel.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Mailer: Apple Mail (2.1990.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/27] toaster: add toaster layer configuration file
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
X-List-Received-Date: Tue, 28 Oct 2014 15:49:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 28 okt. 2014, om 15:09 heeft Alex DAMIAN =
<alexandru.damian@intel.com> het volgende geschreven:
>=20
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>=20
> In managed mode, Toaster tries to discover layers
> that are being checked-out on disk.
>=20
> In base layers, the toasterconf.json file
> describes basic configuration file for builds based
> on that layer, like default configuration variable
> settings, toaster-compatible branches, and the
> layerindex URL where the base layer and
> compatible layers are listed.
>=20
> This patch adds toasterconf.json file to the oe core layer.
>=20
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
> ---
> meta/conf/toasterconf.json | 71 =
++++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 71 insertions(+)
> create mode 100644 meta/conf/toasterconf.json
>=20
> diff --git a/meta/conf/toasterconf.json b/meta/conf/toasterconf.json
> new file mode 100644
> index 0000000..cdc7564
> --- /dev/null
> +++ b/meta/conf/toasterconf.json
> @@ -0,0 +1,71 @@
> +{
> +    "config": {"MACHINE": "qemux86", "DISTRO": "poky"},


This seems to be very inappropriate for OE-core, maybe you meant to send =
it to meta-poky?=

