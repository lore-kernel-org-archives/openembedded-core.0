Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
	[209.85.210.50])
	by mail.openembedded.org (Postfix) with ESMTP id A102C79B9F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 14:04:49 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id o21so12440626otb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uXJlVkG7ENkWeZeue4FzRuFmA7PDMm39iv7+BA6OKmw=;
	b=UnhfSCvl8IZ14WFu7gxXuiyW2PMiyar+JSo4t33jR44CVRRYYDRdiSy57I61XFgaAm
	fpDU/ScaRlKdstnCjcPF4DeglholC9EGXlZAL1sMjqWC+kwjpCf3ojWZT7iKnoRhlzD5
	MZjPoDx7VSqyz5HK81ucv3UK4cVi14+suA66L4Kpqlfrqm2LJHxopDrmyV1HKSREYGr2
	Gtjo7qf0GXoCeYqQcMdH531s2w5/eb1/RWa77IN3xdNYzZhPkTpxUWSIovtlMMwvBNUo
	yV820lgLmqXV9tKd1dtop/LKPJ4nj1jATS5NwWSUnO4+lWgxgWfV/7REVDXr55XC5JYr
	5uxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uXJlVkG7ENkWeZeue4FzRuFmA7PDMm39iv7+BA6OKmw=;
	b=AlDtm1o2C2YdVtgEOgD/qzD84nbH1w14/8/H1B+kqJQP9AlN5ASpyIE0hCbs8LEFGT
	Bl/LVjJytjWKQlWv7IOe241iV92ycfzMFFxbvd6hNnoADol69TJm7LCVPBBe+1IBeIqS
	DzVNvipmRsJeYcoUbHGfemeLuTrbOk6qIHE6n0TfIBgTViiYdIl6VD1JkqoZ2NPNAkd8
	L7HrakP43bYohV8Y09Pj/rmgF3wsnsp43C/u2yGTXMkaKqNZflPUoV+/BIhZ0VfQHdnX
	UbR6gbj8prEeAu6aeHPpwAQpd3rCE4WvfGcrOnCleN8uUY/pfjfaAFyLLL2LWOLTYsUA
	Z8Bw==
X-Gm-Message-State: ABuFfohu788ZQAEpLO3EtwKd0BuxXpGp3/hhkm0YmN9CdJ7FnU8ukx/m
	4Uj1kbQTDON9rg9nDAWfz2kpjizqcKNYvW3YS4uEmA==
X-Google-Smtp-Source: ACcGV61dswxX0RcUf0RjVHABu18RaOSABnEwdjZ4EofOSdLfQZsOYjc2Ma2U0tBxIfrk4ZKnGMS77rH+NpHwcG2LsSA=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr3562064otg.8.1539353090650;
	Fri, 12 Oct 2018 07:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <27c741f4-1ac3-c837-df65-60a46712888a@cisco.com>
	<CAJTo0LYQCmNA9PppMauoPzn5HBVgzLfHAxfPyVZOTcTtdzgMRw@mail.gmail.com>
	<f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
In-Reply-To: <f347f66c-0a6d-9f49-98f2-a66f735a653e@cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Oct 2018 15:04:38 +0100
Message-ID: <CAJTo0Lb=O0kLdbv9qYZLVXnfNd5Np=4HY8d7ASXSM5TiE33Ayg@mail.gmail.com>
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
X-List-Received-Date: Fri, 12 Oct 2018 14:04:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Oct 2018 at 15:03, Ruslan Bilovol <rbilovol@cisco.com> wrote:
> > This is basically due to SPF, and people sending email from
> > non-authoritive hosts.  Concrete example: Richard Purdie's mail comes
> > from a machine which the linuxfoundation.org SPF records doesn't
> > recognise as an authorised sender.
>
> Hmm.. I've just sent an email from rbilovol@cisco.com to another Gmail
> address, and Gmail says SPF checks passed:
>   SPF:  PASS with IP 173.38.203.51
>   DKIM: 'PASS' with domain cisco.com
>   DMARC:        'PASS'
>
> Does it mean oe-core mailing list's software is incorrectly configured,
> or there is something else missing on @cisco.com side?

CCing yet more people, specifically Michael Halstead who admins the
machines and actually knows what he is talking about (unlike me).

Ross

