Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuNyG-0008K8-Hr
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 15:19:16 +0200
Received: by weyr6 with SMTP id r6so1186441wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 06:07:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=pYFol4VapeVsmKu6Y5lyHgcbPgR019WMR+EbzLLUo8E=;
	b=ACH9OcoXL6tholb2d0SpuhsLxqc2O+8BRSVAC93FIoVGW9klI9XXYe2f5aRJl9nq+a
	3Om7OvgoN197JtdPWWDWbNOqUCkgQ5T8ctD/rcFjq5WYlnneHhJ3K883+6MrPVMXy7Wu
	jSv6K9Qr6Kv7T2PdAbCp12exyMpNf0lxj6fHsNsZUhdq8hcB3qWW2zcAJp2vqqWPoMQS
	ELZ8Co20hBpY8435001rsUDcGocNjzFw1i0ingExiZpRfVpxhc9Lc10YW+mhJydGlqLa
	/FW2w3JgtJ1rb2umvzwN1Ho5KJPDGhiO6e1/G5G31qNDnLKKNByw7tEuIexa7ZARj9+X
	bITw==
Received: by 10.180.98.138 with SMTP id ei10mr13443555wib.1.1343308065985;
	Thu, 26 Jul 2012 06:07:45 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id ef5sm12466248wib.3.2012.07.26.06.07.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 06:07:44 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6492036.bctPLCmjO3@helios>
Date: Thu, 26 Jul 2012 15:07:42 +0200
Message-Id: <C722676A-6FBA-4987-9B97-849BF27AEDA4@dominion.thruhere.net>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<1515360.HL1K52tqqg@helios>
	<0F8A947F-5465-4350-9700-5E0457EB1A38@dominion.thruhere.net>
	<6492036.bctPLCmjO3@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQl++ISBSX7DDnjI77PjkNbDgH1GQ5IegGjkbwynlBAwVlH6215pMWKEz/8uAVh8Y2P6ZFIH
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
X-List-Received-Date: Thu, 26 Jul 2012 13:19:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 14:56 heeft Paul Eggleton het volgende geschreven:

> On Thursday 26 July 2012 14:38:59 Koen Kooi wrote:
>> Op 26 jul. 2012, om 14:32 heeft Paul Eggleton het volgende =
geschreven:
>>> On Thursday 26 July 2012 14:29:14 Koen Kooi wrote:
>>>> Op 26 jul. 2012, om 14:00 heeft Burton, Ross het volgende =
geschreven:
>>>>> On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>>>> It would be nice if other layers that have RDEPENDS_foo =3D =
"dbus-x11"
>>>>>> keep
>>>>>> working till their maintainers get around fixing them. Note that =
you
>>>>>> might need to do a -c cleansstate on dbus first to trigger any =
errors.>
>>>>>=20
>>>>> Yes, and isn't that what the RPROVIDES is for?
>>>>=20
>>>> I'm not sure if bitbake can map RPROVIDES to PROVIDES, I vaguely =
remember
>>>> that it doesn't, but it will pick it up *after* do_package has run. =
I
>>>> broke
>>>> OE way too many times doing things like that :)
>>>=20
>>> Why would it need to if we're talking about RDEPENDS and more =
specifically
>>> RDEPENDS defined before do_package?
>>=20
>> Because AIUI RDEPENDS get resolved to build the runqueue, so you =
can't do
>> RDEPENDS_foo =3D "I-don't-exist". If that's not the case I'll shut up =
:)
>=20
> Without being too concerned with implementation details, I think it's =
as=20
> simple as this: if recipe A has foo in RDEPENDS_${PN} and recipe B has =
foo in=20
> RPROVIDES_${PN} then the runtime dependency is considered satisfied =
and things=20
> will work. You don't have to specify foo in PROVIDES unless something =
else has=20
> foo in DEPENDS.

If that's so, great, but please check :)=


