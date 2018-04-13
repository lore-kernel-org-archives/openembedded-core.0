Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2765E6093A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 16:21:00 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id j3so2134160pgf.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 09:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=E9SjYbvVfbyqhEMhbiE/Esin0nk1pJc24o9oWhIT7mM=;
	b=ZO70HkNW5isLOhn8YdStEmgU12pbwlaesmhdVxSnA7sPyZE7T3VPE+Eqae7MqJC0Ex
	61pWLjr2+ATRUJd0tnCefTMCZUeTthQ12j8B73MsrlDR67SH6fMgMalaxWuxM/xt23wc
	5aU3MMHwTs21mBFO5xcpWjEDBA+QSL4/3uIhKj3PLrg+HtnXDxf5y4kUNkzsB7nukQHC
	t4Qo9hHg7/aoY5up+dsWZShZCdbsE1uBmZkfemglwqTMbQYhUXLdZofgs2V1udtOoKb0
	2rZEJGKjOatcf/cxneD+QyihlPNZBB2DVQrmqcYM8YEW9g0e9RK2EeklJPL5CtB1zpZp
	nYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=E9SjYbvVfbyqhEMhbiE/Esin0nk1pJc24o9oWhIT7mM=;
	b=jCviQ6DSttXrSj4wYnuQeitlNfe9nWcLddLBhm3xQoYb5VA+xAZVNxga1Pg3tNIbyl
	QwzXhq+75iLP96X1pQfE+X/c3dToOzCq/o5CcW1Vi3uD0et5GZ9SpAnkI/jV3mIbCJjr
	HJo0etuI3Gm6i3dI/sO2Vl1HfGHC7rDesJwnawG3S8fvTebu0ldyhuZ/gJQSAdQXfngU
	UsROrkKfT0YbSk5g9TRVzjHQCgkSGokNVv9v5A43YyFmZa8SULjxDDxrKw2wuI7usia9
	AvjjWpqjaJ8aboMTHw6ii9h3BbtfwUE/CFq4yhTJ3oMqTP3B+N764REkeWkoLE4eL/Il
	DprA==
X-Gm-Message-State: ALQs6tBE62PlkZu/kItGB2TJZwj/DNHPdho9yaxXNjWT5eYOG0hbZpcI
	v2QUn0VCqjhYvbDei1kK52obmRGxNBQvmzKV2O4=
X-Google-Smtp-Source: AIpwx48parqbTyBm7DphX/chwAAS3L6EjMDFKrarvFeo9b/sOZC8DqSVZOrnMWiSZNJeYxruXD9jcOpJbhpr+s5A3xs=
X-Received: by 10.101.97.15 with SMTP id z15mr4580622pgu.393.1523636461906;
	Fri, 13 Apr 2018 09:21:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.183.207 with HTTP; Fri, 13 Apr 2018 09:20:31 -0700 (PDT)
In-Reply-To: <CAJTo0LaRbkg4Xs9HZPZtaU1w0Qr8_DeBFfwjvpXFahBWumu33g@mail.gmail.com>
References: <20180413160945.9944-1-raj.khem@gmail.com>
	<CAJTo0LaRbkg4Xs9HZPZtaU1w0Qr8_DeBFfwjvpXFahBWumu33g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2018 09:20:31 -0700
Message-ID: <CAMKF1sodAGotc5G=2KxPicEtczEwOfgi5w8yCE+j1oMQW3YYsg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Upgrade to latest
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
X-List-Received-Date: Fri, 13 Apr 2018 16:21:01 -0000
Content-Type: text/plain; charset="UTF-8"

usual master stuff

On Fri, Apr 13, 2018 at 9:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Is this a freeze break request for Sumo or an early submission for master?
>
> Ross
>
> On 13 April 2018 at 17:09, Khem Raj <raj.khem@gmail.com> wrote:
>> Changes are here
>>
>> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=55df09bfccbfe21fc9dd7d8f94550c0ff25ace04..ae2a01da2e388535da243b3d974aef74a3c06ae0
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-core/musl/musl_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
>> index 9f8c5126e8..42ba411f17 100644
>> --- a/meta/recipes-core/musl/musl_git.bb
>> +++ b/meta/recipes-core/musl/musl_git.bb
>> @@ -3,7 +3,7 @@
>>
>>  require musl.inc
>>
>> -SRCREV = "55df09bfccbfe21fc9dd7d8f94550c0ff25ace04"
>> +SRCREV = "ae2a01da2e388535da243b3d974aef74a3c06ae0"
>>
>>  PV = "1.1.19+git${SRCPV}"
>>
>> --
>> 2.17.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

