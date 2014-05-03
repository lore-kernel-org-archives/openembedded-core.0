Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f172.google.com (mail-qc0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 61D0D65E83
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 20:46:49 +0000 (UTC)
Received: by mail-qc0-f172.google.com with SMTP id l6so1506661qcy.31
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 13:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9QlBok1pBozeUmkCJaIbo7TwnJcFg99f4dIPkpXywGQ=;
	b=H9MuJnfiV7mRt6yPG2LPz3duWw+vcW0A3eiGDFL2fx8qQXU+RSbAPcNeD87KTRJ0fG
	fGZiz1800u/rUFw0KTT5OpGMUDeXmqWcGJM4x4tumWfxUrM2Y1NFCqLMA3ZPwvBGeLXL
	NJOScsM3lbQJ/mpP6oyLMKxXn6WRocVRTzza4yjxFXpJ28DBrUPwB1blHM6Z5VZAmuQX
	9DT+ustAr46qTzc2/poNNufI5C109O/jrTayv1wPjbtI8Zmv3rtMIaUSDTu9Asq1nqKv
	/8usmrL7Xtv0jC+0UWE0Pm9gKJ62eht4uvYSSlTBbtS2rUTYwOALf4cVMtsaQ1XRuK9+
	RgLA==
X-Gm-Message-State: ALoCoQlmaJJ4p7nCesPHYMj6xjvUuDgjl4WCibI0Wj6dMFgmwi4a44TnwWpJG9prG52rYd8Oqdxq
X-Received: by 10.140.109.70 with SMTP id k64mr30938732qgf.92.1399150010565;
	Sat, 03 May 2014 13:46:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Sat, 3 May 2014 13:46:30 -0700 (PDT)
In-Reply-To: <1399108088.12731.94.camel@ted>
References: <CANyK_8f74ZEqzX1ve=93GnZ7fg1NEiZUVeOKmmHuY+kHX-UseA@mail.gmail.com>
	<1399066445.12731.86.camel@ted>
	<CANyK_8eUuUqAMf87-pSVdd7X5_BTXOn7iQCdQ0XYyTjxu=PKbA@mail.gmail.com>
	<1399068428.12731.88.camel@ted>
	<CAJTo0Lbb_D7+SOMuPE5fKY52mnHuw=s3Y_0LxOzwsQTQcKsYXg@mail.gmail.com>
	<1399108088.12731.94.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 3 May 2014 21:46:30 +0100
Message-ID: <CAJTo0LYTjqP1x_oChu27f5J7jws4Rv5tP5kZ8ZrOPv86rUQ2MA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Ensuring a task is re-ran when local.conf is updated
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
X-List-Received-Date: Sat, 03 May 2014 20:46:51 -0000
Content-Type: text/plain; charset=UTF-8

On 3 May 2014 10:08, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
>> Could this be the root-cause of so many instances where we've had to
>> add explicit hints that variables should be added to the hash?
>
> Is there really "so many"?
>
> In each case we've seen its been due to the code being python that the
> parser can't expand. A simple example that trips it up:

Maybe I'm biased from my experience with the systemd class but
thinking about the situation which caused me pain, it was through a
localdata.getVar so this would solve it.

Ross

