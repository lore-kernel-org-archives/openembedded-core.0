Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id DA92171C90
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 16:48:39 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id v27so9668980qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 09:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b5xvhe0uL5qoPCmcQx4i3U3HIk54SUhlfF0U3YKLBAs=;
	b=XP73yEGpN0gFF2F9XoxB8AKaj7Ihzk6+Aywyv3CrTA+oeTpCFc3FrKPdNm3Kx28H8W
	W9/HzjnABYpkC3RwXcG3K5ftyDmp1NXUeDswsEoomvuT4E7laPxTMHjHmKezPBavf4p1
	uqS+Q2viffcyU5jVVImmVrHoHikxApfEnSzP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b5xvhe0uL5qoPCmcQx4i3U3HIk54SUhlfF0U3YKLBAs=;
	b=LORHUBG0kBZzBoKaU83O7R+wvVH+trSHG3IG77nIpZ8Zs4iZSkFopb2u2gmho2J+IV
	JDLxWozO0Yxg20mhGwBVF1IvBjk9QK/dDrC3JoOM+d2NwJmMhqVCTFD00QhgcoWBG99s
	3FppuezfC5RpXTqrs7nRswrkoTRGmWfX3khV6hQzG2hQYS8BdWqKaDO8uxkzbEDYi6wk
	WYtp18GD4v+n6iPOftVBgVoJxTOLtTJevkBo8ClJidyHmO8DaQ8uhIqfG7ngQLhrzCrH
	YicSP/rjDcMn8cXfia3BDI85X6j/y4jSxwbW6QhlDWeHO8tSaNv/hiHSdDVgeNkLepb+
	k54A==
X-Gm-Message-State: AODbwcDSPnBlbqJdm1kPgYyXheZvbWLeuhFsNWkdOK80JJ9DNajgJ7bG
	fODdls9jXgOdQpiu+JrnxaGHPbhzk1B9
X-Received: by 10.200.3.79 with SMTP id w15mr41858qtg.203.1494521320445; Thu,
	11 May 2017 09:48:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Thu, 11 May 2017 09:48:19 -0700 (PDT)
In-Reply-To: <CAMKF1so+CTyskyQ1OhaKoXxNFt0yKpXj3NechSm9JGZsAQ6trg@mail.gmail.com>
References: <alpine.LFD.2.20.1705110623380.31743@localhost.localdomain>
	<CAP71WjzrOsmind=t8wE+9HRDyxDBnc3SMMx9RM=8sbhX0Yg9Sg@mail.gmail.com>
	<CAMKF1so+CTyskyQ1OhaKoXxNFt0yKpXj3NechSm9JGZsAQ6trg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 11 May 2017 18:48:19 +0200
Message-ID: <CAP71Wjw6mgBVTz_qapVAtM=WevCUu9DCLSKLe-uBsq2F7euOnQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OT?] where to start building for qualcomm snapdragon APQ8016E dragonboard 410C?
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
X-List-Received-Date: Thu, 11 May 2017 16:48:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 11, 2017 at 6:43 PM, Khem Raj <raj.khem@gmail.com> wrote:
> user meta-96boards and meta-qcom and you are set usually do builds
> for MACHINE = "dragonboard-410c"

meta-96boards is not required.  the main recipe from meta-96boards
which is 'useful' is 96boards-tools since it would auto resize the
rootfs partition at first boot. but it's clearly non essential
content.

>
> you also need
>
> ACCEPT_EULA_dragonboard-410c = "1"
>
> otherwise the build errors out with strange access errors.

hmm. that's not quite expected.. I will check this one. on the other
hand I will soon remove that anyways..

