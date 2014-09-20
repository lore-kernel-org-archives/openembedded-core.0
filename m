Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id C07676B876
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Sep 2014 00:08:50 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id i50so685080qgf.14
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 17:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cYmbAr3wjUJSFAy4a4+SEZCFMHtX1JS5Roh45G03P7k=;
	b=KfYIoDqDoAzMsiYSeXwqq6j3bATUioXNoppfEU4/TgNrFdb0gU/jKSofiWgMoOlAvx
	+dSaxJvbtEbQ1d/MI+r47npE9Qnl9UnWVf0VQPtMJMXUvui0npZAJ550qOmDJ5jTFEUJ
	Zylrxn0qAZzqVMhNNCTABewt56a8uNdqvxACxhlBPv+xIJFj2oryHCgTzuzKQ75E7KUA
	Lr/lH/KitsfT49ZHURug/GyzNX1kcaoPqQm+KPEgN4N8l3kmm1aCUXRx1barWX7kq/Hz
	5apNJrdEQDWLIVMM651a/ept6q5VyOBrH4JH7fe0TeI0DyJq26IwKKrpjpAlyFnq47yp
	+w2g==
X-Gm-Message-State: ALoCoQnYYOx6HdeeFhPxHAQlPMlIcPu65jf7MnQvKjhAWXSP1YJjqLL8wM9gEfYEDonYUXPXq9Lm
X-Received: by 10.224.104.2 with SMTP id m2mr5305480qao.52.1411171731477; Fri,
	19 Sep 2014 17:08:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 17:08:31 -0700 (PDT)
In-Reply-To: <20140920000507.GA27494@linux.intel.com>
References: <20140919224401.GA24684@linux.intel.com>
	<CAJTo0La4Etb61dwdMdikLJpByAhFE6OM1-bAHAZPyk12Nok9uw@mail.gmail.com>
	<20140920000507.GA27494@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 20 Sep 2014 01:08:31 +0100
Message-ID: <CAJTo0LYcfieYJgUmELamwKrjD49=nBFufuJ64mqOM=X0XGyK3w@mail.gmail.com>
To: todd.e.brandt@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Phoronix Test Suite package
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
X-List-Received-Date: Sat, 20 Sep 2014 00:08:52 -0000
Content-Type: text/plain; charset=UTF-8

On 20 September 2014 01:05, Todd E Brandt <todd.e.brandt@linux.intel.com> wrote:
>> Surely phoronix has more dependencies than just php...  Or is this
>> just the runner and it talks to slave?  Honestly have no idea how the
>> phoronix test suite is structured.
>
> it's designed to be a minimal install with only php as the dependency. It uses
> the network to download test definitions and to upload test results.

Fair enough.

>> Finally, this is a patch to meta-oe, so it should go to
>> openembedded-devel@, not openembedded-core@.
>
> ok, I'll resubmit on the proper list, sorry for the mistake and thanks for the feedback.

No problem, thanks for the recipe. :)

Ross

