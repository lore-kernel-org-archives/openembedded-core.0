Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id C289D610F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 12:21:21 +0000 (UTC)
Received: by mail-qg0-f45.google.com with SMTP id f51so8341574qge.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 05:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1PednuPgoRc/6z/FrQY/2MrvnBYLAqfaF3FUb7ZR73Y=;
	b=WzoQnt7NjAXPGmiUmV7unCDP6mDv/ukcQo0dcWhyjxbD2UB6+RPHpVwWlJT3qc2e7D
	v5llJOtdwyGsAGP8QvF6gcNcqsMQmONW7Lcme6BtWedHvSYdIS2MFlS4sQqB6fSIS1ME
	Xj8u/Sed3yEQjfnUMK3Rmq9x39p5uPnjE6UYTn5sVILSScsKBn/iHYQKWo3v0B8+ykYY
	JyCbMW7SYDa2Y+pZzboAb31+E89XVqNeSDmt9vj6xHsO9QGNOprCOe2bTGiRhpcjVimp
	uWmz6C7LnuPlqSnzLmUtRrzpUbLthUL3fCFbrVZ7I/ikdT41/g93ZQgVrX3HHUuwEtwM
	z4cQ==
X-Gm-Message-State: ALoCoQkN1mEeeNQOCq4RuikCNCKzMOxdhmhzzmWnNKqVyRNIKxE6a9pMzNgX45DjpgLnqGZrizKh
X-Received: by 10.224.122.83 with SMTP id k19mr63334804qar.78.1407759682889;
	Mon, 11 Aug 2014 05:21:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.95.235 with HTTP; Mon, 11 Aug 2014 05:21:02 -0700 (PDT)
In-Reply-To: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
References: <CAOMwXhMSMY6Bxzn7Qwmz-kUnFez_LkhSU7FArsoo0rdz6ZVifw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Aug 2014 13:21:02 +0100
Message-ID: <CAJTo0LYEYgWqTW7mmeonf=JVbH8hXrKhtBTsy_LfSRpuVZQ_tA@mail.gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Adding cgdb to meta
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
X-List-Received-Date: Mon, 11 Aug 2014 12:21:28 -0000
Content-Type: text/plain; charset=UTF-8

On 11 August 2014 12:35, Laszlo Papp <lpapp@kde.org> wrote:
> So, instead of different developers maintaining this in their own layer, how
> about including it in meta?

I'd suggest sending a recipe to meta-oe.

Ross

