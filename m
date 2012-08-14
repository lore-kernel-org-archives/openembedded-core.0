Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1I3k-00067G-Pl
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 16:25:28 +0200
Received: by eaad12 with SMTP id d12so141111eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2012 07:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=WZaxZtpU8ZDeByEXu6273OO7p+4ob2o7q5FE63DjLco=;
	b=ZgBJ6Cze9rQ8drz6cSoqhOE0hmy7UpMBoGGdhJy3u1UMd+Vm5M1tS5FBk1ZuJplD68
	U0gFw7m7ASLbClxAjzAUqRYj4CqnAFYaQsDII7WfsVvQs5x+XDGgiYGZAqky0VPK8tiW
	wC/EM8fUb/CR7OMhqdTQRi9pZBoISY7QnkedJdTtJhxtVzqVgl89mlHwgrZBT7WG16Lz
	HhRJ03LHhdGdntqaoqqSRju3NX+zj0svPI1CJlaZUAQm1/PrPsE+v2sCp+LHAymiraHO
	uQWlxO3vZEJYUNU4R5AFifiLOlI8bMU2DN6ZZP59oIDEgyXX5dHilCaqYoswr/2sZxNO
	WUEg==
Received: by 10.14.212.72 with SMTP id x48mr19411944eeo.40.1344953613913;
	Tue, 14 Aug 2012 07:13:33 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id m45sm7191443eep.16.2012.08.14.07.13.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 14 Aug 2012 07:13:33 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120814135946.GA5597@mi.fu-berlin.de>
Date: Tue, 14 Aug 2012 16:13:31 +0200
Message-Id: <3873D957-9816-4F94-B331-C3B7CB68FF37@dominion.thruhere.net>
References: <502A3A26.5090008@mlbassoc.com>
	<1344944787.23275.384.camel@phil-desktop>
	<502A3C00.6010609@mlbassoc.com>
	<20120814135946.GA5597@mi.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQny45RcJJb5D8+VA25Anr16COyy2U6jRcqsP+WJplFYCsjx5DoLyqDnactT33l1/QYnzvEB
Subject: Re: wpa-supplicant & EAP-TLS
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
X-List-Received-Date: Tue, 14 Aug 2012 14:25:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 14 aug. 2012, om 15:59 heeft Henning Heinold =
<heinold@inf.fu-berlin.de> het volgende geschreven:

> On Tue, Aug 14, 2012 at 05:52:32AM -0600, Gary Thomas wrote:
>> On 2012-08-14 05:46, Phil Blundell wrote:
>>> On Tue, 2012-08-14 at 05:44 -0600, Gary Thomas wrote:
>>>> Does anyone know why the recipe for wpa_supplicant is using gnutls
>>>> and not the default OpenSSH for TLS services?  It seems that gnutls
>>>> is somehow broken and EAP-TLS does not work with this =
configuration.
>>>> Changing wpa_supplicant to use the OpenSSH libraries makes EAP-TLS
>>>> work fine.
>>>>=20
>>>> Would a patch to make this change be entertained?  or should I just
>>>> keep it in my own layer?
>>>=20
>>> I don't think a patch to just flip the default would be a good idea. =
 A
>>> patch to make it be a DISTRO_FEATURE, on the other hand, would be
>>> excellent.
>>=20
>> Thanks, I'll see about working one up.
>=20
> Btw. You mean openssl not openssh, which uses openssl too.
>=20
> And a problem with using openssl for wpa_supplicant was license =
incompatibilities.

I think wpa_supplicant has the openssl exception in its license =
nowadays, but it's best to double check=


