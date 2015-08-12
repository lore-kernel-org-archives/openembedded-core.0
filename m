Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id C4289767DE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 01:10:33 +0000 (UTC)
Received: by ioeg141 with SMTP id g141so5433063ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:10:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=MzSwe34E7he83bAWFNwCM9oHmtzoy8CEe8Hy+AO7fSk=;
	b=GDrSSJgxAn0DV+6M4q9gyUFqNu4imuGMpZaVrjVJHX+0vRL66KueEniQA2pu8elQ4s
	JhNR7+HK/BiHqQICf3wSSeBbq+MpUkOmre4aFfXXosMh/9EtHu57kd50MIuboJNapGbL
	I5akUyDdnMfd+t3WDpwsH/sAeivwHiPCG9P/I0E5IKj2vnODcCwAGqc7xFqN69TZt5Qz
	HczXSspRmn/HIFgvV3YN/VPPOs7km0gYYvHUnEhxJ4MriOKRnLuJN3tkGEFWBcweQPw3
	r7dTgM5D6CljlruBf341tHYs3pDuN7OeaCQqOseD8071CBvbieFE2/nAiDkqJj2kjcBs
	5d8A==
X-Gm-Message-State: ALoCoQlSfjxZp/eo1nm/b1RTOHzi+l+UQmjHCXD90+nb2dG/PU3lPZDBbSsdOzJynLYxzleN5uVD
X-Received: by 10.107.18.67 with SMTP id a64mr9998420ioj.106.1439341833523;
	Tue, 11 Aug 2015 18:10:33 -0700 (PDT)
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com.
	[209.85.223.170]) by smtp.gmail.com with ESMTPSA id
	o19sm9380153igs.18.2015.08.11.18.10.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Aug 2015 18:10:32 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iods203 with SMTP id s203so5575206iod.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 18:10:32 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.107.130.153 with SMTP id m25mr23914063ioi.192.1439341832166; 
	Tue, 11 Aug 2015 18:10:32 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 11 Aug 2015 18:10:32 -0700 (PDT)
In-Reply-To: <1439336012-5404-1-git-send-email-denis@denix.org>
References: <1439336012-5404-1-git-send-email-denis@denix.org>
Date: Tue, 11 Aug 2015 22:10:32 -0300
Message-ID: <CAP9ODKphasqk=Lp=1SeQdTgbiXCFTzeWRrJ+KXBuaqmZOkFgHQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kselftests: add 4.1 version of Kernel Selftest suite
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
X-List-Received-Date: Wed, 12 Aug 2015 01:10:36 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 11, 2015 at 8:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>

This should make use of dynamic package split so it is easier to maintain.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

