Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1R66KK-0008Sx-Us
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 21:49:57 +0200
Received: by wwf27 with SMTP id 27so1059000wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2011 12:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=3mzj64dskKxxlBMiSAT2desVL9sg+rSGS7UeO4YSIbw=;
	b=j4PNxwFV5/x7FTnCHwHO9OEG+HVg7/mgs/hBNG3SQL9CDlhqAhwnX/qNFgw4KRbg//
	HmFBODIvgVl4SUx0JM7V5np4xONyT5MmwI+v+xNS0OnCamKJmqVepVVOThNqWtCtDNwc
	x7teyQ5hNLoXy10cZg5TtjkyLDqJ5F3wWPPwk=
Received: by 10.216.154.145 with SMTP id h17mr1352835wek.39.1316547879253;
	Tue, 20 Sep 2011 12:44:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.184.7 with HTTP; Tue, 20 Sep 2011 12:42:12 -0700 (PDT)
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F011EC4@NAEMMAIL01.na.leapfrog.com>
References: <E7A9054A5ACABE48B0E540E46E862B0F011EC4@NAEMMAIL01.na.leapfrog.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 20 Sep 2011 12:42:12 -0700
X-Google-Sender-Auth: qxHTZBbaXKpVmc7TPiEicksi8gU
Message-ID: <CABcZANk982azSBMqpyFNKwjD8Y584K4LtK=6iOErJM_ArRP5bA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Correct way of having the PN package depend on the other packages?
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
X-List-Received-Date: Tue, 20 Sep 2011 19:49:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 20, 2011 at 12:03 PM, Daniel Lazzari <dlazzari@leapfrog.com> wr=
ote:
> I noticed a problem with the alsa-utils package where the alsa-utils pack=
age does not depend on all of the little extra packages it's supposed to pu=
ll in. I'm not sure what the best way to fix this is though. Can anyone giv=
e me a little guidance or point me at a recipe that does this correctly alr=
eady?

I don't see why this is a problem, personally. If someone wants a
recipe's main package to depend on the other packages it emits,
they're free to make the recipe do so. But the ${PN} package is not
defined to include everything from the recipe, it never has been.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


