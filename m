Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Sz6w0-00046s-2L
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 16:08:28 +0200
Received: by eaad12 with SMTP id d12so200861eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 06:56:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Ndq9OU52KXXrgYCu7AKnZXwSIL5yvucooMntfHtQ/l8=;
	b=D8xnJ+ovDVcTIs6FRV2I9evppbHnKdopeYv3PCA5sFCjjNOkUPxJS3HIaUZu9MNLOT
	w5DaFZT5D1mtjZqj9oqQAQFaQXCx/qAqA2/8haFMQGzXKqn7NmEgSV9Xpmaa/8302Frw
	sWusuE8W/lYLcKJhcMqpYRYh8bTX8pAteLJJOEiSL8omFzO2OkN8qnBpgkqPpVdvTc38
	RRY6tMVtM4o3sJyf1liBnNlJY5AFClJyMfEySKGumPyd6XvuvVv+7/TuUKXkgdebyvqF
	h/A9E38fgUJI/41qRMDgloj+/z0y2323P/v/QlMiX6EPegpv+sVBMgNI06GYZ4ZZ4a7o
	vkbA==
Received: by 10.14.206.200 with SMTP id l48mr22279619eeo.41.1344434200886;
	Wed, 08 Aug 2012 06:56:40 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id v5sm64942095eel.6.2012.08.08.06.56.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Aug 2012 06:56:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120808123637.GA2854@jama.jama.net>
Date: Wed, 8 Aug 2012 15:56:33 +0200
Message-Id: <03E931F8-12B9-430C-826B-46211FC3EC90@dominion.thruhere.net>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<5995DE95-9135-4B8E-82BA-F0938B2D755F@dominion.thruhere.net>
	<1344428588.9756.333.camel@ted>
	<20120808123637.GA2854@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQkomca+KXBHwjp5qMbEHRwT+GoSIe1vwlcSGWp3eveIury12lT7APueyxfI7ehZ0/msw35x
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 14:08:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 aug. 2012, om 14:36 heeft Martin Jansa <martin.jansa@gmail.com> het =
volgende geschreven:

> On Wed, Aug 08, 2012 at 01:23:08PM +0100, Richard Purdie wrote:
>> On Wed, 2012-08-08 at 12:01 +0200, Koen Kooi wrote:
>>> Op 8 aug. 2012, om 10:41 heeft "Burton, Ross" =
<ross.burton@intel.com> het volgende geschreven:
>>>=20
>>>> Hi,
>>>>=20
>>>> As everyone who's used it can attest, Web (the optional browser in
>>>> Sato) is pretty rough.  Part of my plans about replacing Sato with =
a
>>>> leaner environment involves replacing it with Midori, and if there
>>>> isn't any disagreements I'll work on a submission to merge Midori =
into
>>>> Sato now for everyone who expects the Sato web browser to be =
useful.
>>>>=20
>>>> This will involve pulling a few projects from meta-oe to oe-core:
>>>> ca-certificates, python-docutils and vala specifically (although =
its
>>>> possible that we can drop the vala dependency).
>>>=20
>>> Adding more stuff to oe-core is a bad idea. You should take this
>>> opportunity to split all the sato stuff into its own layer.
>>=20
>> I feel very strongly that having a core layer with no way of
>> demonstrating and testing it is a very bad idea. I haven't changed my
>> mind about this and am very unlikely to. "How do you know it works?" =
is
>> the question you ask about package upgrades for example.
>=20
> And does it need to be in the same layer?
>=20
> Why not test webkit-gtk from oe-core with midori from meta-oe layer?=20=

> Or meta-browser layer if meta-oe is too big for testing webkit-gtk.

Exactly, you can't make an argument against extra layers with a straight =
face, since oe-core is all about layers. There are a ton of recipes in =
oe-core that need extra layers to get properly tested (QT comes to =
mind), so I don't get why webkit (or by extension sato) should be so =
different.=


