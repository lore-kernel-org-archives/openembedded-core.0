Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 532D172D36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 00:01:11 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so514704iec.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 16:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=u9ZXSE4Qr9HEYFUo29KZiT9GOQ47bhB65dHPJapXoTA=;
	b=vHLqCrz7+8M0acypk9kwflW9T3aeqbHY+saGDmEipmp9PvFX88dSkLGSU9tb37Mpm9
	Q69dY+yf1Gu+qQcHqQgSJOIZuo2nX9nx31fDz6oojRC+1A18vthPYhlVRnA4yHRhYYPM
	QHtVk68s4FHMXpRafqBQg1pjgiwGq1qZxOl0j1OkJ9NIPOS8DO6+XsfiLAPj0Pt+UQEn
	4cLDortdQ9dOWimrwBAUxbG/R/Y5q6jDIdFdS6Negb5YhsN907KNU4dZDtEKw/GEHqwK
	CxVQWP5aIMfwAmFF94rIR8IM4yyzyCeR+96zl+yecq8ElrLjmm4rzkpWoy+6/ZORHGBt
	JcHg==
X-Received: by 10.42.188.133 with SMTP id da5mr831442icb.37.1424822472861;
	Tue, 24 Feb 2015 16:01:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.117.7 with HTTP; Tue, 24 Feb 2015 16:00:42 -0800 (PST)
In-Reply-To: <1424820723.26813.19.camel@rpsys.net>
References: <1424801246-16399-1-git-send-email-ross.burton@intel.com>
	<1CD26AA6-733E-4DE9-836A-25F0E0FA4C64@gmail.com>
	<1424820723.26813.19.camel@rpsys.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Feb 2015 16:00:42 -0800
Message-ID: <CAMKF1sq+QK2nhtCju+zLmfJHn0aHna5DZwt79F_JVv-Y6tDKcA@mail.gmail.com>
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] util-linux: disable systemd
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
X-List-Received-Date: Wed, 25 Feb 2015 00:01:12 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 24, 2015 at 3:32 PM, Richard Purdie <rpurdie@rpsys.net> wrote:
>
> In history we have no good example of successfully splitting one piece
> of source over multiple recipes, apart from perhaps gcc which we'd all
> agree is horrible in a variety of ways. Any time we have attempted this,
> we've tended to revert or have calls to revert (e.g. avahi).

I asked for specific problems/issues observed with split builds. I got
no concrete examples, yes it has to be done carefully but then I dont
think its something that can not be fixed destabilize the release so
much. We are building it twice identically and just changing the
packaging. In any case, sometimes we should try to tackle the issues
out of milestone pressures too.

