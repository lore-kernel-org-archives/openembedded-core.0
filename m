Return-Path: <nathan@nathanrossi.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id D774F73232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Sep 2015 06:57:36 +0000 (UTC)
Received: by lbcao8 with SMTP id ao8so17822188lbc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 23:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=BftueYvwVGIlAEjBd3irmdCJGGa3gXc9TwfqwBHGPDY=;
	b=l3i0TowguMRDOkQbp4DUuRf3j9bHo0gb5/Xks9TrBBEKG/YdH66mRTL/Si7xcMq/JI
	XqmoeV6Kmxt/ZUTwqHn0Jram2ujqQKNU4kwkS36nHwP13PEa+Lr7lrtB0bVIHjFmH7ff
	/FIG716swve1zYFATI04hV7k1KE981nQfeVuOHe1bbmnFYGhONTv9jChE+MOJOptd3WV
	CP+53RaeHmw8S5/8zCz7j84wA/UrrcQY+mLlPT6OuctgoMEh9sKNJ3a1rQrc/hOyyCQa
	UIgX70y743NvOYfHD4sLqi/Wwxy+2iOqJNhpvrfmYJ3/50JuymhyMaXotpwIFZELzBEV
	cS5Q==
X-Gm-Message-State: ALoCoQlRDNmEyiKd7EAHx82McsXTPXMoh/pDHeaSsVZOVM2Iu+oD1ogMlaHqCGZx1EPXro6VaPfK
MIME-Version: 1.0
X-Received: by 10.152.161.232 with SMTP id xv8mr17495608lab.32.1441868254941; 
	Wed, 09 Sep 2015 23:57:34 -0700 (PDT)
Received: by 10.25.155.144 with HTTP; Wed, 9 Sep 2015 23:57:34 -0700 (PDT)
In-Reply-To: <1441840133.2948.14.camel@pbcl.net>
References: <1441791241-29328-1-git-send-email-nathan@nathanrossi.com>
	<1441799773.1680.102.camel@pbcl.net>
	<CA+aJhH2N0jG9amPA9Y2GKuQcJ4yK6H_1omXTCGn7=OdeXJntgA@mail.gmail.com>
	<1441840133.2948.14.camel@pbcl.net>
Date: Thu, 10 Sep 2015 16:57:34 +1000
Message-ID: <CA+aJhH2FPpXE+apKg2LGKE5iKmi9Aok-ne4Qi5pxNo1rSj03mA@mail.gmail.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: Phil Blundell <pb@pbcl.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot.inc: Add host compiler flags and openssl-native dependency
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
X-List-Received-Date: Thu, 10 Sep 2015 06:57:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 10, 2015 at 9:08 AM, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2015-09-10 at 01:42 +1000, Nathan Rossi wrote:
>> Please keep in mind, openssl-native is already dragged in by other
>> dependencies in order to build u-boot (e.g. rpm-native which is added
>> to all recipes inheriting package.bbclass regardless of
>> PACKAGE_CLASSES).
>
> The openssl dependency in rpm is already a PACKAGECONFIG though, isn't
> it?
>

Yes rpm does have openssl as a PACKAGECONFIG, but other packages such
as python-native are not setup with PACKAGECONFIG.

I think the best solution that would cover your request but also not
add any potential confusion for users, would be to have the
PACKAGECONFIG for u-boot but default to having the config enabled. And
for users who want to completely remove the openssl dependency from
their chain they are able to do so.

Regards,
Nathan

