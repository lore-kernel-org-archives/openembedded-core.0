Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D2A656E666
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 22:11:34 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id q188so3789966iod.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jan 2018 14:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=babxUht4/VzblQbbBVIcqKYRF1kpbWjIIVJCZiFlYxg=;
	b=m51gZnnFpq+7sypSOdxTzDi4l8g+y6W+hZBMTm5VTFssyOlYQikxovxlEvNIat7RZF
	py+66o9d4MkXmcdVryusLdk72UVib/VqgAz92WGcQc8lfUHhp1eK5MiqIJCVCwjGJ6Wo
	rR/cK+tnY9pzGfP4IDWaDKwn8ITLIDQHqh4G13t3V+t5y1ZXmHMSJzPXcOCVO8gtYUyF
	cdli3WUCgVCgNpkZc7HMm+kTgjdeXAYQHoZ2wYno/CG/UGK71AT3WuP+sN7BDW4J0/s8
	gBRlFflRVJxeiSshzFmm/bsQE5KlQEM7N6BeDTVSZhYC/34KfKN71hpZHcqSDAV4J9Ml
	urHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=babxUht4/VzblQbbBVIcqKYRF1kpbWjIIVJCZiFlYxg=;
	b=addfuU/VPBy39w4Raby7kbiEzR//67bOVIp37LIScnQE/nYI3KubX6+/uFR977JD+D
	ZWYASC7vh2dTScxVho+fZka4A3OnC1ND+prLswkGFGnjw8T6cXroc1i0jS7eVOXOA03Z
	hgWmU7SJQJlx7Scsnzxhr2HbgL6lMaTaX9GH1jOy6Fzk83tYE++EI8p8x7t9UkQY0EJ6
	eYoiBzGzFx6dzSA1c3h+c8XHo+O9zMDnkgztOimLh0vzo0hr2+/w5enziLtEMrsNupyC
	0l8ciNUksZVyXTMU2hWSPmy+lQucZAgf2Xe+tExr//kk6xqWmU1v+FfWtX9yj+VJ7mYb
	HFvQ==
X-Gm-Message-State: AKGB3mJTAci+yoIFpL30gZ0lo/4mBKiQtfTHpaCuILZ1AR2K5PduOjpO
	Kg5WvqpJ/vlFs57KRwmsST8=
X-Google-Smtp-Source: ACJfBovDcQeCDB5eJHQVNAgBDY8nSyENpvcXpD6u4Dq9o3Uu4mm6lF4Gn3letSp1Sz0JX/XltuAxWg==
X-Received: by 10.107.88.10 with SMTP id m10mr1242538iob.71.1515103895875;
	Thu, 04 Jan 2018 14:11:35 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	y35sm2607143ita.20.2018.01.04.14.11.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 04 Jan 2018 14:11:35 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1515103894.665.22.camel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 04 Jan 2018 16:11:34 -0600
In-Reply-To: <1515103250.30291.7.camel@linuxfoundation.org>
References: <1515096936.665.19.camel@gmail.com>
	<1515103250.30291.7.camel@linuxfoundation.org>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Subject: Re: Uninative and sstate
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
X-List-Received-Date: Thu, 04 Jan 2018 22:11:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-01-04 at 22:00 +0000, Richard Purdie wrote:
> On Thu, 2018-01-04 at 14:15 -0600, Joshua Watt wrote:
> > We've run into a strange issued that turned out to be cased by
> > missing
> > iconv conversion libraries in our uninative tarball, but is sparked
> > a
> > larger question that I was hoping someone here could answer.
> > 
> > The problem was particularly baffling. We were attempting to use
> > Doxygen in a recipe which required some missing iconv conversion
> > files.
> > If we built doxygen locally, it worked just fine, but if we choose
> > to
> > allow bitbake to pull doxygen down from a sstate it would fail.
> > Even
> > more baffling, if we manually extracted the sstate
> > do_populate_sysroot
> > tarball for doxygen and used the executable there, everything
> > worked.
> > We surmised that bitbake was modifying the the doxygen executable
> > after
> > it extracted from the sstate tarball, which was confirmed by
> > comparing
> > checksums. After some digging, the cause of the change was tracked
> > down
> > to uninative_changeinterp() running after the sstate tarball was
> > extracted, changing the program interpreter to the one in the
> > uninative
> > tarball.
> > 
> > My question is: Why is this coercion of the program interpreter
> > *only*
> > done when the sysroot is populate from sstate? For consistency, it
> > would seem appropriate to also coerce the interpreter when doing
> > do_populate_sysroot from an actual build. If this had been done, we
> > would have noticed the missing library when building locally, and
> > the
> > sstate cache would not have caused "random" build breakage.
> > 
> > Does anyone have any insight as to why this isn't done?
> 
> Which release are you using?
> 
> There used to be an optimisation we made where we only did it when we
> needed to (using sstate). The move to RSS meant that we now always
> have
> to do it. I'd therefore guess you're using morty or older? On more
> recent versions you'll see it always relocating. There are pros and
> cons both ways.

Yes we are using morty. I suppose that at least explains the behavior.

Thanks for clarifying,
Joshua Watt

> 
> Cheers,
> 
> Richard

