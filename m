Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id B8F987C218
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 09:50:49 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id d15so6636267wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 01:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=eFIp68jEmB1MGFg0JZ46aD2GN95Vd8Iq6e8SXKourco=;
	b=HKDeKJrOhra93z/n0dDxjiHclixDHOe1fWNjqAZgx3V8Lvp6A7XEuVF85t6wzoVeN6
	biQGxLL5zkwFGUexfFxQQkWyWlta1P0nwSoOr+gOUV7dizd006Bd3Qg/G7MnYP/YWeep
	CWFNjVO9C9i5ULs6tD0AkooOc9aQkWh2W8u2M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=eFIp68jEmB1MGFg0JZ46aD2GN95Vd8Iq6e8SXKourco=;
	b=BVErbqoEgOOA65Kqi0eDplahZbnoqgndgD378owr0CKn4/dSOrP3u17YRLTPre8alR
	iPsPTsrqsqfcZiCr/l3CvcIEPynBQTQB/ON+vaD7pwTPDhCRHIsvSOIqvRu+3D6b7BqS
	3Yy8D0N6C2jZFF0zwfycypbDL3+AGYFg7I1B768QFylfgdaExQBBToHpWH5pqwHd4v86
	enGiRj1ldiWHXQEXucphiL9S88xKdFVovfYoiaNSvaJY/iKEBmD2GFzBvocA5YmlT8NU
	MRrglQefxpzulCiBvb5B14QwiQc1tp96pmCAsmIAE0fickqlHkIXpnbJPmPmuTnzZoew
	2TxQ==
X-Gm-Message-State: AJcUukdf2frNaXLqjE9TbeX5Uq1fTY9LnwRPI3Ufr3gP2N9YXNL9t3Lr
	ODGf/64jWxImCcZ9/Sio11kCJw==
X-Google-Smtp-Source: ALg8bN6eyJ16+daOIBlE5Q9ejAHklJNElDA+JkNsvbOrHCEtM7FBCGuFdshC0IoG8rhOSGZH+kDtRw==
X-Received: by 2002:a1c:7511:: with SMTP id o17mr18106156wmc.42.1547891450066; 
	Sat, 19 Jan 2019 01:50:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q12sm75321008wrx.31.2019.01.19.01.50.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 Jan 2019 01:50:49 -0800 (PST)
Message-ID: <2bc6cf65c59001094152fb6651aa7b7947de7ba2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Marek Vasut <marek.vasut@gmail.com>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Date: Sat, 19 Jan 2019 09:50:47 +0000
In-Reply-To: <37865567-ce21-bd52-2ea6-9f478377f5e3@gmail.com>
References: <20190117104456.E6876440001@auh.yoctoproject.org>
	<5a8d0f4a-2b06-cd9c-b571-ce3bff62f86c@gmail.com>
	<CANNYZj_cKj2+RwqyaCYjSfERWeGugBrhmgKoYVrwxof4c8Vpkg@mail.gmail.com>
	<37865567-ce21-bd52-2ea6-9f478377f5e3@gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot: upgrading to 2019.01 FAILED
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
X-List-Received-Date: Sat, 19 Jan 2019 09:50:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-01-19 at 08:01 +0100, Marek Vasut wrote:
> On 1/18/19 10:39 AM, Alexander Kanavin wrote:
> > On Fri, 18 Jan 2019 at 08:10, Marek Vasut <marek.vasut@gmail.com> wrote:
> > 
> > > > Next steps:
> > > >     - apply the patch: git am 0001-u-boot-upgrade-2018.11-2019.01.patch
> > > >     - check the changes to upstream patches and summarize them in the commit message,
> > > >     - compile an image that contains the package
> > > >     - perform some basic sanity tests
> > > >     - amend the patch and sign it off: git commit -s --reset-author --amend
> > > >     - send it to the appropriate mailing list
> > > > 
> > > > Alternatively, if you believe the recipe should not be upgraded at this time,
> > > > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> > > > automatic upgrades would no longer be attempted.
> > > > 
> > > > Please review the attached files for further information and build/update failures.
> > > > Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
> > > 
> > > Can AUH be fixed please ?
> > 
> > We have previously discussed this: fixing devtool to upgrade several
> > recipes in a single transaction is non-trivial as it operates on one
> > recipe at a time.
> 
> Can you elaborate what needs to be done to fix this ?
> 
> > Please try to accept that AUH is not perfect and
> > take these emails as a reminder to do the version update (which you
> > should, as the listed maintainer).
> 
> This kind of automated update seems like a perfect simple manual task
> for a computer to do, so I'd prefer not to waste my time on it. I'm not
> happy with "accepting that tooling is sub-par and thus do stuff
> manually", I'd much rather see the tooling fixed so it can be useful.

The nice thing here is the tooling is all open source. Patches to
improve it to handle this case would be very welcome!

Cheers,

Richard


