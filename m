Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2431D610DC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:29:55 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id hq4so1343929wib.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 08:29:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=iHmF2kHNQ00v49miR846dIzsQUabGTGKBg7+vpBvMPI=;
	b=jNjh2OCj+GZ0KtPS6wQBz1DkJVoiBUmPj/YapeddUdW/pR2+H2omsVQ4xAcdoAKe4h
	H4+ZSrAz2JVRzknI4Vp7JlRCQSS7lT3rl266g1NK9E8xwc1ft6qpnE3aBu/QopGM+iin
	PPWYczE79AGZELTXo4JoktMl4Fk6TEZW3HuSb/V4jSqwos7T2ig9NoYWOlVV/9glTOuQ
	ZpkQzfJykKLNrwdVpfFFuSIX4yWeH2gDv0QM7atA+jd22RLsf0wNW9qXOCTAz6G25OWI
	FST/Lpm9xxXDuEQTewyM9Ei/zyrTkmLDW5bexQUhVvo7azqwSTm9588VDyjC8+y2uNA1
	ylbA==
X-Gm-Message-State: ALoCoQlukQPMI5vP63s13chg6GeWnp9vIB1aIYwWqz2pKG332vbZj5RhbTtLquIjEr7JgWwwCCVR
X-Received: by 10.194.77.202 with SMTP id u10mr3045792wjw.39.1386952194985;
	Fri, 13 Dec 2013 08:29:54 -0800 (PST)
Received: from ?IPv6:2001:610:612::880c:3974:d1d9:ea93?
	([2001:610:612:0:880c:3974:d1d9:ea93])
	by mx.google.com with ESMTPSA id w20sm8690761wia.5.2013.12.13.08.29.53
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 08:29:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CABcZANkdh-Ym6uS_vyMQUSBjEVmOpciwRcYLNDEV0qsSmuiWeg@mail.gmail.com>
Date: Fri, 13 Dec 2013 17:30:05 +0100
Message-Id: <EFCF4CCE-126F-4FE5-A776-80E2A8157078@dominion.thruhere.net>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
	<52AB2E16.5070905@windriver.com>
	<CABcZANkdh-Ym6uS_vyMQUSBjEVmOpciwRcYLNDEV0qsSmuiWeg@mail.gmail.com>
To: Chris Larson <clarson@kergoth.com>
X-Mailer: Apple Mail (2.1822)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 16:29:56 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 13 dec. 2013, om 17:14 heeft Chris Larson <clarson@kergoth.com> het =
volgende geschreven:

>=20
> On Fri, Dec 13, 2013 at 8:56 AM, Mark Hatle <mark.hatle@windriver.com> =
wrote:
> On 12/13/13, 8:56 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This is needed by systemd, among other useful applications. All fields =
are
> metadata driven, and initial values come from our DISTRO variables.
>=20
> I thought there was a part of the lsb-release recipe that did this =
same thing.
>=20
> It doesn't set the 'os-release' file, but the 'lsb-release' file.  =
Maybe it would make sense to consolidate this stuff into a base-file-...
>=20
> Yeah, that=92s part of why I posted this as an RFC, there=92s this =
question of whether such things should just get folded into base-files, =
or stay separate. I don=92t have a very strong opinion on it either way, =
myself.

Angstrom has both lsb_release and os-release in its 'angstrom-release' =
package. It looks like this release could provide os-release in a more =
generic way.

regards,

Koen=

