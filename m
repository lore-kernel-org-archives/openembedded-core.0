Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DB336C44A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 08:43:18 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id u11so8839805otq.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 01:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TbDDz+LPZ2BQ0bCo3ejbpkQMlUs2SKLCOQbOIh5ARNQ=;
	b=nHoANER6dSyDq1jD9OLdYxf1K4Nd3rt/VDVzRMkREZcf9K2hM9KaNa8I1owJ/OMWK+
	NkvRK30H0uxlG5Y1scKPbERArzuMNvevwWmCYmNMYPK2bqb5jpzU4QSQReqj91gm0aI4
	W3dKq99uad5tdM+7A2ufnlUnOe89ddXVKSHLXs8DD0RDPIeh9/lGtgF3Dry/T1Qq8flU
	K9uLNhTv+TU9uMwtVSNITfdIyXAsGC77slFJpRoUdHRWiyNsfdLI5k4Uqsx6ukBje8LQ
	PhDUUYcYpyQ7sUQ4QD7leHjPn2T4vDH4wDCuFgustAsERIE8Nxk35yGujkB9pTtUXydb
	Jijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TbDDz+LPZ2BQ0bCo3ejbpkQMlUs2SKLCOQbOIh5ARNQ=;
	b=PKG5ggE7g6/FhhaxqLth3QlKyGWKVtGadkL9zRQc7+TRfGgerESykAMJwzoI56QS+J
	sgV1liYD2tWY4mTLFNmIL3+KP3IsLm9newTL2+nsCjl89rlV638dqa6UoEYHnXlfKcks
	NG0/806CN/QAq0UZHGn07UqC5rmuFcj5KzzEzarpyqk6+k5lW1/PUT/oEEakPxDbPRKx
	nzmZLHVZNDYozD0OjM4dSVpDcMoCgX3GZakSdP9TFMoMLwi9uYv06NX+4RKJ62Nsa+zi
	rjMXMeIfKM1bjVa36TNurTz0H8VElqJu+h0RLeWuJ/uPb2H8MsYy0ZiKXuKwnkfvmq8S
	IX9g==
X-Gm-Message-State: APjAAAXUS54MmebevoykteEpmnRfh0sI5PNmhe/iqPA8pMTeGUM7gW/f
	1ixt0Yzh0HqCUTJpR+9fYQPCjyC01GqaHM1X0Dg=
X-Google-Smtp-Source: APXvYqwocoD6L7C9gn7F25z3jy2L55jkmYCuFEr2Tsxd2yG01b8EwvsgbDF+RE/tjua7sZBPloM27UqvBGd9dKvTBMU=
X-Received: by 2002:a05:6830:1541:: with SMTP id
	l1mr8372644otp.350.1558168999776; 
	Sat, 18 May 2019 01:43:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-33-alex.kanavin@gmail.com>
	<20190517214315.GB1047@localhost>
In-Reply-To: <20190517214315.GB1047@localhost>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 18 May 2019 10:43:08 +0200
Message-ID: <CANNYZj-0bRGvxnOGEPO64gsf+dwtUnvQ+iXxNrHA04Bu_vjeUw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>, Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 33/37] gst-examples: upgrade to latest revision
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
X-List-Received-Date: Sat, 18 May 2019 08:43:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 May 2019 at 23:43, Adrian Bunk <bunk@stusta.de> wrote:
> > -SRCREV = "2b3fc175c252cd5a537e4b2864b572a8372473d6"
> > +SRCREV = "3f51023aca06d28ccfb1d5383d99ca7fbfb287c8"
> >  PV = "0.0.1+git${SRCPV}"
> >  UPSTREAM_CHECK_COMMITS = "1"
>
> Upstream git contains a tagged 1.16.0 release.

Right, this is the first time they tagged a release. Then discard this
patch; gst-examples should be updated together with the rest of
gstreamer from now on. UPSTREAM_CHECK_COMMITS should be dropped.

Alex

