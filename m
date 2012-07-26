Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuOBl-00009c-Gt
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:33:13 +0200
Received: by wibhq4 with SMTP id hq4so5581812wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 06:21:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=G+AKleAFSJV4eZAKHVJFoQD8+ynHOD7V61YOs4zMW80=;
	b=T0D0oitH/4Lx6ZI0sRBWmTuTo+OLUhthgIT7s06B448ah9RXdfJLiugXIVe2Cmdv0q
	bHDJWL7JOF1JkkZIUCfQM+zGrtJETgKvipYBKLuvnR+rW0cx51o+I2iRPMdhQ/3qoXht
	Ra2ntri4PC0qQKU+ffXef3/Ocs0UZqdQCHCTMwEoMikpZQ0ezT+UHYk8eqjyZKBGDKzz
	FwzGcyb8wCfLoOvuhvj72Q7ugpWIM7Ye4U5YUyqQbkvNGlvj0P5af22p81qhqI/lOs/u
	x4F/bYysyojjJcauG0Izd/ZisGl5AjEDppQuLcor5a21rL+SHbWUH4LS3lNV50TBeIL0
	sdBA==
Received: by 10.180.97.106 with SMTP id dz10mr13435625wib.21.1343308902942;
	Thu, 26 Jul 2012 06:21:42 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id k20sm8202954wiv.11.2012.07.26.06.21.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 06:21:41 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1428646.vB6tdydMPR@helios>
Date: Thu, 26 Jul 2012 15:21:39 +0200
Message-Id: <03A607C1-3BC7-42F5-B93E-AB735D42D913@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<6492036.bctPLCmjO3@helios>
	<C722676A-6FBA-4987-9B97-849BF27AEDA4@dominion.thruhere.net>
	<1428646.vB6tdydMPR@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQkyiMBDgzhLQKXMv7uCRSzzPKNcunqzIOhR/GK32Y3Gy59dbHZ97OHVWxshMQhwSHJyXy6N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 13:33:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 15:12 heeft Paul Eggleton het volgende geschreven:

> On Thursday 26 July 2012 15:07:42 Koen Kooi wrote:
>>> Without being too concerned with implementation details, I think =
it's as
>>> simple as this: if recipe A has foo in RDEPENDS_${PN} and recipe B =
has foo
>>> in RPROVIDES_${PN} then the runtime dependency is considered =
satisfied
>>> and things will work. You don't have to specify foo in PROVIDES =
unless
>>> something else has foo in DEPENDS.
>>=20
>> If that's so, great, but please check :)
>=20
> I did, prior to sending that... :)

great, I'll shut up now :)=


