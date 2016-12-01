Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id E143F601F1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2016 22:28:51 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id w194so11652264vkw.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2016 14:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cIR12/p6wsx/rLYwF0cQ+ZQr3+evGxJQMSopq01/GTA=;
	b=nmVByvyiCiI9ooDqMPGf/UNPUqk3r6m0/MuCqtYpx/TUCv8XrRlDi3OdFF4MPxbsIX
	56k4Mk37qZy2YoD38ZX6cmQhClp6twVPkYtnW4bnAwxTHmqiOBawESKNmWrc9kevyDkC
	L5tv5Ndjv9CBfxYfQZB9/Wm9d5g3LM/7pS6O/GewM5WqMf7WYI1aVO4uago+1PVCzHr7
	uJgJNqo6aWoDjjOCLb45HSb5xd4gx8oV5kmuWZKPxqKF4p7vSrqtT7xyTT2fGki02lts
	tyfIiQGG7sDIvdN9ndHGBNj0JBdXb6P6hdviuX711EzG4McYeVWm+qMo1KQZq65iiJqg
	AWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cIR12/p6wsx/rLYwF0cQ+ZQr3+evGxJQMSopq01/GTA=;
	b=YkY/okvRMxBuAO+Uowcpitl1s4wNKFY1dlkU2JpQEzbA4YLJj+GvjMQLc3eKWmdTZ9
	gEI0HhOYRYjei5ucjiRMQcgaK3Zz56b60L5BJKqYNNxio/GXfT4lWww5JFz/mSsFFzDB
	BUlwFeQ6cv5cYE4x4ijcOJWCf2y19ZiUA9KsrWj6IsfgMZws+9rA0Y01/kiYjbsvhZvc
	ARcmxO4Ts3rDM/96i4uJvBFUyb9HXLNJCOavJ882PS+9YKCt/BJRLEw67v004hzSpqas
	n9JBbCVuR772but+aX1goMUe5D+esT6KC/d6YvgJepkqQF1W+Osp2kJRDU7Jfdpt0kCj
	wHpA==
X-Gm-Message-State: AKaTC01KijPY+ys4EvW4hHT8cwjebxDxWTQU46AO+c/uHc3PZ+yq+0s+e4ppkUy/5BnJHjjeoDSSf8U/akopQg==
X-Received: by 10.31.153.195 with SMTP id b186mr15808182vke.140.1480631333050; 
	Thu, 01 Dec 2016 14:28:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 1 Dec 2016 14:28:22 -0800 (PST)
In-Reply-To: <CAJTo0LY4K4mRh6_jCJj1pEGHRvx67kZuQ0DbNtkA_EOkP7GyRw@mail.gmail.com>
References: <20161128212606.26139-1-raj.khem@gmail.com>
	<CAJTo0LY4K4mRh6_jCJj1pEGHRvx67kZuQ0DbNtkA_EOkP7GyRw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Dec 2016 14:28:22 -0800
Message-ID: <CAMKF1soQVKD8HbOUNHrSGm7mqZXjaCH9=U2_iB0-tL1o7cCz7w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V5] systemd: Upgrade to 232
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
X-List-Received-Date: Thu, 01 Dec 2016 22:28:52 -0000
Content-Type: text/plain; charset=UTF-8

sent a v4

On Thu, Dec 1, 2016 at 12:22 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 28 November 2016 at 21:26, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> -PV = "230+git${SRCPV}"
>
>
> packages/corei7-64-intel-common-poky-linux/systemd-boot/systemd-boot-dev:
> PKGV changed from 230+git0+3a74d4fc90 to 1.0 [default]
>
> I'm starting to wonder if systemd and systemd-boot sharing a .inc is a good
> idea!
>
> Ross

