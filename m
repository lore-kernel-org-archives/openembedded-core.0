Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id D97B26AD68
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 12:12:44 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id m5so5586177qaj.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 05:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XpRIv4V4jpr7d20rvS2T8+KYKsRKkGcRSTbrPZZN7+Y=;
	b=gYJJcSe5kNliPf73ppZ+uLEuYnWVILush8UynpPiO4KVxai8vOavYa3IuFIC1gVQ1b
	MG0HfN1wQkoHO3q9VXTPuEqiFCMDaLbJgLP/inCHSX5MTgq6CV4gOwal1WW2xkUqypFp
	yH4F6VAD3E+OHa4NZioa+cyrJgx7BXREvT5ilsnYjEQrsDa3Y+O7fI84aCCaEYqQRgyM
	xj6cFAD6CfY7XpxQPasZV5OYc2mcM6cW3PEc1R3NU79kBO3cy8vXJiw/+7cAWci72u4j
	8+No14cdHhJmTlrFHvFDQjTvau+esiwTHB1J+VDeEVd3L/pidv6BE024Xd854vlwYkfL
	McgA==
X-Gm-Message-State: ALoCoQkciMnoMTCmZhO6DLHBhnKHSwBNhps1U2PLE5YEjtWq5DvktMJI4w5T/GDfTr85YFEDRURx
X-Received: by 10.140.37.75 with SMTP id q69mr30428120qgq.60.1403525565312;
	Mon, 23 Jun 2014 05:12:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 23 Jun 2014 05:12:25 -0700 (PDT)
In-Reply-To: <3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jun 2014 13:12:25 +0100
Message-ID: <CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Mon, 23 Jun 2014 12:12:52 -0000
Content-Type: text/plain; charset=UTF-8

On 19 June 2014 14:54, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>> * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts, so
>> these cannot be allarch
>
> As I've said before, I really dislike this change. The system should be made
> to handle the situation properly instead of working around the issue.

Isn't this what the abi exclude thingy is for?

Ross

