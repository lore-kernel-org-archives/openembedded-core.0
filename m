Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by mail.openembedded.org (Postfix) with ESMTP id D96537722A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 09:20:38 +0000 (UTC)
Received: by mail-lf0-f42.google.com with SMTP id t196so71878319lff.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 01:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=dySSOOwhgV1mLVjqgICKikQorUDZKcI/HOabMcSqjQM=;
	b=FDcEQKMqt8aPUhi6UJ/HeVU6IrJsQXGol83HKJKlmAr0OusYe49RYtnOPNqH6HWtlg
	z3eURjercSB6AWiSxJKjwg13qp3vZYi8tqMaB1pMUwqlPL5OH2uNUVYNeMpXJKi51jPq
	sLA8VcBcbBk985rl66+jrsXkfZt/4mVsRmsAIA0Myt5lYmCT90SNgjm+mHT/sozDw63l
	ij1z/fv4u8pecAU29uIoFwBMH9dVQLj7g6O3EotK3mTmo1rspnkFNiLzgUyXxzoNg92l
	qcR6zlKXg2CI0O4exbFrXmJw5XcEZ6ONaMbsEhn4QjR7vH/kI33oinG3Nghv+ld6vU2C
	RmAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=dySSOOwhgV1mLVjqgICKikQorUDZKcI/HOabMcSqjQM=;
	b=LT8HAZ0B9ahzsnr3HUeYqTy4ikt+sKowf3uG3E9aEskz3nvWRcdTqjFlcW0aoyzX/K
	SeanmL6MdQNDM/a0/uJoWi9YBXX/3ji9HuqZNYSxVAEaZ85mrDBSgcLPZ6RY6BXV/F81
	+90DL8coQ2qWKEnsP5LeEL/7pZWhD43KFAOOsFjhCMFIW73GaeM3H73UY45Zu2yM01PE
	AO9ZZ+fnOAwuhA8ahh2PC9Sp5A0iMiqlblzailfIB+BE6O8iBBNGLIxQnQlMYiX40DVg
	irbDPL756bqaP3J0jv1rBO/QyNgoib6WqVUnu3iLE1UKw7+FE08GGHcZIkiJGFt/Up4i
	XBzQ==
X-Gm-Message-State: AIkVDXJKS5tYGyNyaWW/+u708AikBTyZvPGloYONffhTCRSKiwNpGh4OdyhxxRAajYt1zg==
X-Received: by 10.25.7.206 with SMTP id 197mr4983197lfh.72.1482225639900;
	Tue, 20 Dec 2016 01:20:39 -0800 (PST)
Received: from [10.25.0.170] ([195.159.140.90])
	by smtp.googlemail.com with ESMTPSA id
	x142sm4490481lfa.32.2016.12.20.01.20.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Dec 2016 01:20:38 -0800 (PST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20161216144423.GB6398@linux.intel.com>
	<1482138565-4120-1-git-send-email-kristian.amlie@mender.io>
	<1482138565-4120-4-git-send-email-kristian.amlie@mender.io>
	<CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <b93b393d-4936-a820-173d-2813ecb108ca@mender.io>
Date: Tue, 20 Dec 2016 10:20:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ4S6FWzR6u2Kek_KjcXD48qTWbVLn5Vm2j20fJtyts9A@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] selftest/wic: Add tests for --exclude-dir option.
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
X-List-Received-Date: Tue, 20 Dec 2016 09:20:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 19/12/16 21:49, Burton, Ross wrote:
> 
> On 19 December 2016 at 09:09, Kristian Amlie <kristian.amlie@mender.io
> <mailto:kristian.amlie@mender.io>> wrote:
> 
>     +        res = runCmd("e2ls %s" % os.path.join(self.resultdir,
>     "selftest_img.part1"))
> 
> 
> To avoid adding recipes for software that hasn't been touched for about
> a decade, can this be done using debugfs from util-linux?

Probably, I'll check. It would be nice to use something that's up to date.

-- 
Kristian

