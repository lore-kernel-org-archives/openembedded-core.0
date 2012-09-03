Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T8Zey-0000n8-91
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 18:38:00 +0200
Received: by wibhq4 with SMTP id hq4so3591499wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 09:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=dQ3M9cwG8KsQNEaP/2HjJLRkRo3pd0BRuy09g1lZyD0=;
	b=imppXd1onOXaw3QzTK8enYF99TpSB5EKrdafRewOK3CWjdeqBKEdcYArOZ2HWUV8Ji
	aORIdtdbS9ound6fcOK93NX2hpdgmgtWY5VJDIyhp0ys5aRAvlHTJSk9M0HFbH4HQN56
	2AGOujxP6OZBNrTKocQkzT0irJcRugP91FdvILxBCAZB+hmsNm//umQmMlNBRvRWOjmN
	3v6sz6MVg3p18G4fU+6B0dIeiwCRra2s3r3leT+ZnQFh7PKML59P7hxnSnc0G2ftnA7D
	WU9NsoG8xyrmH8Q7po3a6+pTmYIMyOXigsJHngmuOIRs4YfpzlYUM6+HCtKaiiqNxQ7+
	rx1w==
Received: by 10.180.94.164 with SMTP id dd4mr24488648wib.1.1346689539562;
	Mon, 03 Sep 2012 09:25:39 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id do5sm29051104wib.10.2012.09.03.09.25.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 09:25:37 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1554049.jPb4PTGYOQ@helios>
Date: Mon, 3 Sep 2012 18:25:35 +0200
Message-Id: <0FE91CED-1C7F-46B8-953C-D2D7DD7B7D4B@dominion.thruhere.net>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
	<2466289.CAG9RzjSbc@helios>
	<1346669402.2673.122.camel@phil-desktop>
	<1554049.jPb4PTGYOQ@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQn5podpj83kGCEpD879FO4dLl1vmW9x28d6JryuonelWqC2DWwddOyuLTDZPCAI+0Dt/Ohb
Cc: Phil Blundell <philb@gnu.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 15/28] packagegroup-base: remove openswan from packagegroup-base-ipsec
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 16:38:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 12:54 heeft Paul Eggleton =
<paul.eggleton@linux.intel.com> het volgende geschreven:

> On Monday 03 September 2012 11:50:01 Phil Blundell wrote:
>> On Mon, 2012-09-03 at 11:37 +0100, Paul Eggleton wrote:
>>> On Monday 03 September 2012 11:35:24 Phil Blundell wrote:
>>>> On Mon, 2012-09-03 at 11:30 +0100, Paul Eggleton wrote:
>>>>> openswan was only ever provided in unmaintained form in =
meta-demoapps
>>>>> which has been removed, so we never really provided it in OE-Core.
>>>>=20
>>>> Isn't packagegroup-base-ipsec rather useless without it?
>>>=20
>>> If you ignore the RRECOMMENDS line that follows, yes.
>>=20
>> Is there a meaningful use-case where installing kernel-module-ipsec
>> without any user-space support is a desirable thing to do?  And, even =
if
>> the answer is yes, is it really valuable to have a
>> packagegroup-base-ipsec which just recommends a single other package
>> without doing anything else?
>=20
> The idea is supposed to be that just having "ipsec" in DISTRO_FEATURES =
brings=20
> in what we can to support IPsec, assuming your image uses =
packagegroup-base=20
> that is.

Isn't that an IMAGE_FEATURE?=


