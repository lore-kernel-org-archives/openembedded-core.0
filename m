Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id D8E6D74503
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 23:39:26 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id h76so13333038wme.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Mar 2018 16:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fki+mcwECJgfyfsqB3ihETuGI1x6j+WjQH9u9mcr6/Y=;
	b=m5F9ZRcgbeGzcH8qxYY9kLwpiNCN9p8sfxfY/9EDrCXZISDW3OpWIRROmNtddkceIU
	2sWzGOeasyphHPO+mGsxt9JAiHiWz6BNsIXiM/yfphcSmjd/BnOJCfHd5NNRPwAcMeZq
	aMqYRK6m2FNxDxlbNI0uCpPBsk84qsJofVYqK996llCWfaEd+e6NSL6M1yfwrJkiuYMM
	usBOPSP7s1uw6AfuKjw4lj/nAr2XZMo5cxgqaGsR5OYL8JjqyvD/sWjqLfw2yzXx3JHO
	isEK7EY+0gM0MdjtE42TZFl0YWkIc6tH0yqrtXC3LElBT/+NhmDNwtLycAQh4D+HP3m/
	H6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fki+mcwECJgfyfsqB3ihETuGI1x6j+WjQH9u9mcr6/Y=;
	b=XRpqdTgGM7gdnwX2LUCZSr8DYsF85TDd3tmJEia6UAAp3GcbfFr2odhTE0TNIbWhNZ
	yOawI2SO2awLT6nuJsl2ADqIiIazhbiBJEarP4ZZYfNGTJP8ci1cGO2yX27qrhxKb8gd
	qZwHymncPp38Ewc1w0Lk0Q5152W1h6QeVCxAYksAvuglef6rbkuwLmRVJqIDwcWKufb6
	qKWAExtDqxUa4N+AXip25eQjjRyeYxGu9IDE8ra7D9q6phNPKQi/1vB04wNFj1fSUb5+
	fEPPMP3gP8IE1GDFmB200iKJDaV+xEliBs5DdyNjHPIrONuFqOS+s88TvP6rg5B+dcX6
	6E7A==
X-Gm-Message-State: AElRT7H7z9IFwj3qU32SAxRZw/sv0FZ1eLyvMtHMgCR0Mnp3HTga/bID
	SNmQN0Yq+qkjVVWzmJStYQksUnVipRmniZFDbns=
X-Google-Smtp-Source: AIpwx49Q4mGxPMWWPPx/qjRvIniB2cmXqvl35qYpCKhGq0I9TkCXUi3jGZY1/csbqUT0pLGKAwBYcL9kOOuFMgu7irI=
X-Received: by 10.28.212.84 with SMTP id l81mr585565wmg.151.1522366767488;
	Thu, 29 Mar 2018 16:39:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Thu, 29 Mar 2018 16:39:26 -0700 (PDT)
In-Reply-To: <20180329224129.GK2786@denix.org>
References: <cover.1521507765.git.denys@ti.com>
	<20180329224129.GK2786@denix.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 29 Mar 2018 16:39:27 -0700
Message-ID: <CAJ86T=Xi01mESEX8D3YAXo1OXj5d93y8wXz5qJw1ffKqHeXjQQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Thu, 29 Mar 2018 23:39:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 29, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> Ping. It's been 10 days - are there any issues with these updates?

Only 10 days? :-)

