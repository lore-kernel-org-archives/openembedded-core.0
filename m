Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2E88E770A6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 14:41:19 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so87420101ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 07:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=q3SJ2kWgRecSGrptd9UEDADFDNI12MvfLz5opHrnhvI=;
	b=Bc/chKhXyETBZzb15ycjsiFFvo3z/homB6Nt3iJmBJLFAwFDISlltkHlGhe96KaJ22
	l+5r4Ac02XPhkr7SXImq+jQWy8E0HocUI0TeyIi5iG+wcNHAOGtyemQJowo9qBopy1nD
	LhaBVHfEln6v3+TfmZ3F8PCEz0D/srcBhwEmQ7onMEaihHDGnuDLWhEYxAd0SQ6aqnNz
	NYzCfXAUxZYqE6hWbpGBkdloewWhDUUCY/vwVMWi/x8rj6/p/FRLfSLzI9XGZVSjtO5j
	4cVu7scpDHl9hV7V8xkF3h3nJdNFMDMmmNU/WfvIX2QTLC4nXXd17u+urM3MWx3yKpcm
	0OLg==
X-Gm-Message-State: ALoCoQlXN+IPPFmmdGpTxnu7y/btR+vEB3IjxPQKtIUFWQ/4fyTxmJXJzlf2q0MmpLYIeVWvV80b
X-Received: by 10.107.19.70 with SMTP id b67mr11016579ioj.144.1443710479516;
	Thu, 01 Oct 2015 07:41:19 -0700 (PDT)
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com.
	[209.85.213.176])
	by smtp.gmail.com with ESMTPSA id 31sm2802668iom.35.2015.10.01.07.41.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Oct 2015 07:41:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igxx6 with SMTP id x6so16195404igx.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 07:41:17 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.143.102 with SMTP id sd6mr4049729igb.5.1443710477387;
	Thu, 01 Oct 2015 07:41:17 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 1 Oct 2015 07:41:17 -0700 (PDT)
In-Reply-To: <CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
Date: Thu, 1 Oct 2015 11:41:17 -0300
Message-ID: <CAP9ODKoL6bWh7Z9AYHLC-tzh6MbCtsPuEBf=-gYdbi7K0kABqQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 14:41:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 1, 2015 at 11:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, Oct 1, 2015 at 7:24 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> Just a heads up for people that we've branched for release and that
>> jethro branches are now available. Bitbake branched as 1.28, I decided
>> to save bitbake 2.0 for another occasion.
>
> what would be the occasion ?
> this time lets branch consistently. Across different repositories
> please.  I would also suggest to not use codenames in branches
> but rather the numbered release. If we want to use codenames for
> branches then lets drop the numbered release names.

I agree.

The mix between codenames and version numbers cause a lot of confusion
for outsiders. We, involved with the project development can handle it
(even though sometimes I ask myself if one codename is older or newer
than another) but for outsiders it is deadly confusing.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

