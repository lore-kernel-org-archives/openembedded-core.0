Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id CB8C77E655
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 14:55:46 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id v193so2386318itc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2019 07:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uRSdQJp3rigLSXfsdGFEDRTceVuVxCEltg9aKJF68bs=;
	b=Qgn/3DQf97jaTxCnBrSNBYGzL344pP8Rrx4MT9ywbI+raVhA8PQlbjmwSto+zt39U6
	dIFvzVVdcRAox4cgVjLJ0MOFFniJiIjXJ3o5vNuyZKvcKvfvW2Ih0Lx7qAagsmmXuFtw
	+YO1qYmUT+qtMhqWfgddLu9Rq0agJ2C2lWF3QNCZT5riEpRl8nJuP4jm9fEbOCKTQxyg
	TU3s0YCvHssv/Gx10wIIazw2ln/o4U0jwHNy2ewaOt5/S658lE7BRaRuBYGjiPlOvw85
	RmdpAwR/Y8ms9duS9oHoP2TJs1pXPLiSjl5YXQPSup8YzQGUgI4AthveK8PAGhr5kG2R
	RLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uRSdQJp3rigLSXfsdGFEDRTceVuVxCEltg9aKJF68bs=;
	b=ewCakFwc1d+NkoKW+s6Ju7CjFXC4K78B4sEJXSnlXuS9JMAEEQOyVi9QLgypWQJBJo
	ifucqae15TJRj+bjTbHY2wY43r3PYbBlAUgnQ0sEdUc73RkaraSXXkjGJCjTVjstBelk
	dAznjbPAZzjEswGCyKPqpKSnB/pujDObpqLbQiAxzFzIfd4cNkZ1Clg/fY4zyGKqBm4V
	myktXa6I3IwwlchbLIEUFtjLbWFGoQPd0WDPwMU/M6Ltwv7Qx1XKSQqd69R4NwXi6LNG
	M+HdFIrkhsbdxvGFxEmLaqZ/GtSyN/Z1Ih0TPUIkH2NviN+LWnaOMxj9e9miSJ31XIiz
	1kqA==
X-Gm-Message-State: APjAAAVUqnC3lrmeewcOU+EmHKJ5XUZs7CykCZDdFHvZBuwDd8SoEjP1
	AS6nG2WzYZoUDCpcC8AMrZr8+1Hic5nB4o2EJEAr+SQ9
X-Google-Smtp-Source: APXvYqwfXAXHGdHupitcjSDJFoFmbZeQ1z2xLTETgUphcfJV4C7+ZUpVb5okbwUMJKuHs7fqM4YZ01QZJZ0m5p5eKXE=
X-Received: by 2002:a02:781c:: with SMTP id p28mr51176913jac.31.1560264947646; 
	Tue, 11 Jun 2019 07:55:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190611142607.18038-1-quentin.schulz@streamunlimited.com>
	<20190611142607.18038-2-quentin.schulz@streamunlimited.com>
	<CAJTo0Lb2E-yTtJaWE5ezF-jTNpVXKyWD0i5xhJY8rrnzxfrjhw@mail.gmail.com>
	<20190611145216.2766qintxmm3pkwr@qschulz>
In-Reply-To: <20190611145216.2766qintxmm3pkwr@qschulz>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jun 2019 15:55:36 +0100
Message-ID: <CAJTo0LYkbNbMKo89fxeabCNm9MsZsK-kYqUy0JQu1+n7HAQ7hQ@mail.gmail.com>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Adrian Bunk <bunk@stusta.de>, andriy.danylovskyy@streamunlimited.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 2/2] selftests: add tests for INCOMPATIBLE_LICENSE
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
X-List-Received-Date: Tue, 11 Jun 2019 14:55:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Jun 2019 at 15:52, Quentin Schulz
<quentin.schulz@streamunlimited.com> wrote:
> Sorry for the noise, apparently forgot to pull master and didn't even
> see my patch was already there *sigh*.
>
> I'll remove the import and test on master with and without the patch you
> already merged.
>
> Do you want me to send a v5 or a separate patch series is better for
> you?

Either is fine.  Note that in the broken case - where the recipe isn't
skipped - the test goes ahead and compiles stuff.  Can you also try
using --dry-run to see if that results in the same test behaviour, but
without attempting compilation.

Ross

