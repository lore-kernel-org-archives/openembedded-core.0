Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 52CF46F1E0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 06:52:03 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id bs8so1406685wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 22:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=yHgYP+/JTHwtzkV5nHREhFhEj/rYzrDazM0k4z5MEoY=;
	b=gPC2/sNdOEMMb6yNlAfaB/7YUKacbh8Zh7m62vzjazBtZb26ZBTwQtKmyJbpHbkgnL
	bepbmne+qEKLHDL9clDIuAFiDkRC75dve/meB7Z8KFj0S5CGnIxpDxAcI/n4KHSQkE5m
	wpIBV7/gAGo/TkY/IfAWBOIu7OMM4vErxuCxlLeRmi/1X3UDD/YhFV4foFbm1QVQGaDe
	GwTcjQImOnBZk7bGBD/aUMU0UeEU0jd1kOuos77KMxNAQRhh2oSb/D52YnCRjuk4Dqhb
	/+RF/KYjMrVp/7gCg7T70Wfkyp/elFpKuOpMePmm/m/wtRwv2alLvgmwdWtiXGYzfZKG
	YJ3w==
X-Gm-Message-State: ALoCoQkyLLUZM1RyZ+idDqMcKr2UnrX8OMHAmI+3jibE7VphSGQhjJCv+pr4zVxzZrZP0eOgL0Uu
X-Received: by 10.194.57.239 with SMTP id l15mr189618wjq.40.1392879123784;
	Wed, 19 Feb 2014 22:52:03 -0800 (PST)
Received: from ?IPv6:2001:610:612::c69:26e9:6518:4aa6?
	([2001:610:612:0:c69:26e9:6518:4aa6])
	by mx.google.com with ESMTPSA id j9sm6463061wjz.13.2014.02.19.22.52.02
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Feb 2014 22:52:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1392824832.14081.274.camel@ted>
Date: Thu, 20 Feb 2014 07:52:02 +0100
Message-Id: <1D616F12-2D64-4760-A6D5-18996376F326@dominion.thruhere.net>
References: <1392807290.14081.267.camel@ted> <20140219112630.GC3854@jama>
	<20140219113705.GA9147@ad.chargestorm.se>
	<1392824832.14081.274.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1827)
Cc: Anders Darander <anders@chargestorm.se>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd version - release or git?
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
X-List-Received-Date: Thu, 20 Feb 2014 06:52:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 feb. 2014, om 16:47 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Wed, 2014-02-19 at 12:37 +0100, Anders Darander wrote:
>> * Martin Jansa <martin.jansa@gmail.com> [140219 12:26]:
>>> On Wed, Feb 19, 2014 at 10:54:50AM +0000, Richard Purdie wrote:
>>>> Any objections to defaulting to a git version?
>>=20
>>> I think we can wait few more days for new release:
>>> =
https://www.mail-archive.com/systemd-devel@lists.freedesktop.org/msg16738.=
html
>>=20
>> I was just about to reply with the same e-mail link...
>=20
> I asked about this a few days ago and scanned the archives and didn't
> find it. Typically, they sent it out after I did that :)

And it has been released!

>=20
>>> but otherwise I don't have strong objections for switching to git
>>> version temporary (if it really makes QA test results better).
>>=20
>> Otherwise, I don't have any strong feelings against a git version. =
Not
>> as long as it works as it should.
>>=20
>> One objection might be that it's easier for someone to update it to a
>> strange version in between the regular releases. As long as we try to
>> avoid making a release where systemd is too far of from a regular
>> release, that shouldn't be any issue, though.
>=20
> I agree its worth waiting for the release if it really is than =
imminent.
> I'd previously not been able to find a commitment or schedule.
>=20
> It might be useful to have a git based recipe anyway for
> debugging/testing...
>=20
> Cheers,
>=20
> Richard
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


