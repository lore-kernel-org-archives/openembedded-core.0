Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6B10760064
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 13:13:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id v2so5161265otk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7x5YmJMDGeu5FwSZMkYIz0QzsXa/CZEtUUZdLmsIAyw=;
	b=ZKtV3h2Ye66Bz7lFcplmEWTC8FbFtNp7kjhXn1iJ0T1LNuiQsmfi112SrTjPiBRU84
	RHtpQgOakRbd6EeVUDJ8mrGqSy8yzF6c2E3oduK96+MrwfyHk8qhqfbuqkHHX4DREXKR
	DKuCwzooATyZ6J5aZAiUuUXUm2qIU0SD5IKknhb42sTGO7v3lnsNIJVBHdpIW41uCOyy
	oAbtbbVJnVo4WyGQCk6WpdwgLyydnOA5bj2Rwck1LQXRR1p9wanQ89yZrSR+ZvWSLLXu
	Hjp56/K39ygJCSqLbb+WKdaJzpkl9eIib4J02VWFCPqMjpLFLj8lfdmkKk2D+vdTVdSI
	e9Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7x5YmJMDGeu5FwSZMkYIz0QzsXa/CZEtUUZdLmsIAyw=;
	b=iZ5b8s+e7NZ1N2CwihSlCrCw/ZI7fYOTqW3l3ok7Qe1oNndDCyvcyD5fAzERLM1+Ve
	Ga3Y006WM699WFxyQ+N4lLrWcHIqkbXy/sCKLaIrgCEgRjt9HiYm6RE5dfGdRkHwuKrZ
	ke7VfEX6IuVJ4bMgD/wGWYnk5eLCXNvXLUq207ilxcxkWTDJxOeutpjQS2KjEa65YRJN
	juQyZ+SCH0tbwicpqDNd8pjGtC/Z8dt/jl8RXne9PeQTlqduCfkDHo2AGG2N9R4Z0zkN
	BNElmxThuVxeUGbjMrd8g4BMWQQjMNDfXZybdnI+H620XV+FGqXozhqq0a7Q4g9+l6Tc
	pvTg==
X-Gm-Message-State: ABuFfojzpwO0fbk9vL7kVbTccPOqk4DNz5PK6dAS+/NFVXaTdtt/DcXI
	+CwqMBYkPbGm5jCiHAy3b+dlPUQsQV3nIWvBy93k2w==
X-Google-Smtp-Source: ACcGV62M22v6JMLWvceOSc7umLoRuo0PaoVgbSS0UNJH8kauZsRr6gJdFnqE4kB3ADPZwzhYF4pmkoBniHOSTpu5erE=
X-Received: by 2002:a9d:3ee4:: with SMTP id b91mr3954244otc.330.1539350017379; 
	Fri, 12 Oct 2018 06:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
In-Reply-To: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Oct 2018 14:13:25 +0100
Message-ID: <CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
To: rbilovol@cisco.com
Cc: Andrii Bordunov <aborduno@cisco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Why openembedded-core mailing list is now author of some patches?
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
X-List-Received-Date: Fri, 12 Oct 2018 13:13:36 -0000
Content-Type: text/plain; charset="UTF-8"

Ironically, this mail is From: Ruslan Bilovol via Openembedded-core.

This is basically due to SPF, and people sending email from
non-authoritive hosts.  Concrete example: Richard Purdie's mail comes
from a machine which the linuxfoundation.org SPF records doesn't
recognise as an authorised sender.   If mailing list software wasn't
such a pain we could stop it doing that, but apparently it is.
Another option would be to patch git to recognise a "via" From and use
the Reply-to field.

We should have a pre-commit hook to be sure that any instances of this
are caught and fixed before being pushed though.

Ross
On Fri, 12 Oct 2018 at 14:08, Ruslan Bilovol via Openembedded-core
<openembedded-core@lists.openembedded.org> wrote:
>
> Hi all,
>
> Looking at OE-core history, I see that in some cases
> patch' author is incorrect, and actually is
> set to openembedded-core@lists.openembedded.org:
> http://git.openembedded.org/openembedded-core/log/?qt=author&q=openembedded-core%40lists.openembedded.org
>
> Moreover, in patchwork many of these patches are mapped
> incorrectly to Andrii Bordunov who isn't actually
> related to most of them:
> https://patchwork.openembedded.org/project/oe-core/patches/?submitter=12919&state=*&q=&archive=both&delegate=
>
> So is something broken in OE mailing list/patchwork?
>
> Thanks,
> Ruslan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

