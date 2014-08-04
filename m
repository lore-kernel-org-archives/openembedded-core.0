Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 59A3D60DF7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 11:06:50 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id l18so7476627wgh.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 04:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=b6xnHuuoV8HDGndchhKPnLt4ngAf/+1fbLf0KVnCKyI=;
	b=h7S9J362yr3T0hNjllt1sza2CugqwAz3qciSfrhsuwHnKQIC9JJcvnPalK+GkiajFG
	iSdsgFkfjKseFZtY/RFuhpFqkZA3CnoeEUw2alD8mJUHm5O1D7tE1FF7Eh/PWhuxI0t2
	C/rzldnWGPjkOnQRDHQ9Xgnrfeoaaj8jkKwRUUqU0l81VKEFCVaBhpyaQVOr1IdDHvBg
	OztpO+jsQ2VBgb4m+ys40o5oi4IdElQoqQUt02A+sguiRllV4EzWid8s4KS/e0P1NdAX
	+MHZovcVvJZBiXzZKuldWf86V0SpyIl8EUslc3oy3SHUvr0cUHzLy34HKEmEsZClguu6
	o6Fg==
X-Gm-Message-State: ALoCoQlZfyBgyRPaH+1ysL9htg+qOCyf5t94Avwv2RHRs9wBiY6qh9mqPfHo0RTn8x10n4Xc06h5
X-Received: by 10.180.205.168 with SMTP id lh8mr13082916wic.33.1407150408033; 
	Mon, 04 Aug 2014 04:06:48 -0700 (PDT)
Received: from ?IPv6:2001:610:612::8185:a1a:1d8f:6e6f?
	([2001:610:612:0:8185:a1a:1d8f:6e6f])
	by mx.google.com with ESMTPSA id
	bv16sm18122610wib.2.2014.08.04.04.06.46 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 04 Aug 2014 04:06:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1407145613.6981.48.camel@ted>
Date: Mon, 4 Aug 2014 13:06:43 +0200
Message-Id: <9C5E572F-8045-4873-8ADD-DACA523DABC9@dominion.thruhere.net>
References: <1406891040-8738-1-git-send-email-koen@dominion.thruhere.net>
	<1407145613.6981.48.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cups: fix host contamination issue
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
X-List-Received-Date: Mon, 04 Aug 2014 11:06:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 aug. 2014, om 11:46 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2014-08-01 at 13:04 +0200, Koen Kooi wrote:
>> -I/usr/include would end up in CFLAGS if /usr/bin/gcrypt-config is
>> present on the host systemd.
>>=20
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> ...crypt-config-from-the-host-it-leads-to-SS.patch | 28 =
++++++++++++++++++++++
>> meta/recipes-extended/cups/cups_1.7.4.bb           |  1 +
>> 2 files changed, 29 insertions(+)
>> create mode 100644 =
meta/recipes-extended/cups/cups/0001-don-t-use-gcrypt-config-from-the-host=
-it-leads-to-SS.patch
>=20
> Does the patch "cups: regen configure so cups-no-gcrypt.patch has an
> effect" obsolete the need for this change?

I haven't tested that patch, but it does look that way.

regards,

Koen=

