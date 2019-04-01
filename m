Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC387D207
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 23:22:01 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id k64so2080732itb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 16:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VucYoDGcUGc6B5jpvijskt3NFu9mXvJwmFHjiDikKEk=;
	b=wEMRg8zbhWdIS50ZjwP+A6It71h7Tuzkm6YPTsMsmhFLOeZ3EEkBmHewPUw8UwWsB1
	OocXrjAAX4afU2hrw9Mvv63zHk33PwWuNr3A2dl1m05589FIl/0OXw7mWJOar+EHLRMB
	T+nUhyAAncV7czVfmfz6OvyY6moK3G8sESCrOCsc46aCwkHOOE/P8KurbRODB4zKqnNR
	6RaaWsT3YSR0FW+u8vP/pRXY91a6HKkFyAixCdu5lNNOLrwjPrmM/p5ZIqvodIGxSXD4
	OUYm3+Z05X9Aeh6YWv+Cjh452fPKPZC3hAjJDUUZJCsFh2fQ4GBny/iiHWTdW5zNBxfY
	/O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VucYoDGcUGc6B5jpvijskt3NFu9mXvJwmFHjiDikKEk=;
	b=Cbjqpez2wsnmgcspkRj6tKVv1rJROEL6yquE97XmAw80rdaMRDix4NUORvc9KbZMXV
	9uVs0behhfezY2vjFS2fZGd/w+U9qbA4xnjq6PrR1LSzgQOls2SYh5P6+mZjgM+TNfV0
	B4eBCXoiUPJs+P9Z1SoqyHrAxTyMgWTWERY/kQXnF1hmeysfDlXPqBDtEZslRRvLWIAy
	bFPlSoj8ypP9/3ghx5P7Rl0iZ/jrmttam/qmxjsRnDR3pvGMnpvyblsmZf1Df8CeevF7
	Rj/rw8JYOapFf+zRm6tZYe/u/YadW4fQmJbLzmnbCghEUDq82G5HT1ENmhDT2sM93dDC
	ldig==
X-Gm-Message-State: APjAAAXslUq8CaUUQAGvZrqgQ8ET4bPYXvuQjVgmg5aiT5rN4HqicE0I
	z9LsPte8FJKb8C1wVAwlCTVnxiPG1fe+Z61EbCMoYhxiuuk=
X-Google-Smtp-Source: APXvYqye2/1Br9dju019NeDMX4yTqtakDvB1B51piqozdbYq9ahzLPF1FBJEUJwcRbmBn61KGZSEZgNIJFRFdn9cSME=
X-Received: by 2002:a24:d643:: with SMTP id o64mr1908809itg.148.1554160922413; 
	Mon, 01 Apr 2019 16:22:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190401222438.26872-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LZ7PSj5_X8t_n2C9sMktpOfYd79q6M69q4b3vpRkih4=Q@mail.gmail.com>
	<66007396-8ceb-4ce5-7d33-2223c4fcf1dc@oleksandr-kravchuk.com>
In-Reply-To: <66007396-8ceb-4ce5-7d33-2223c4fcf1dc@oleksandr-kravchuk.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Apr 2019 00:21:50 +0100
Message-ID: <CAJTo0LbJwtkbOZP-HojkachZ4AA9q+=1cS4hRwp4iy_34RCTjg@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: update to 0.1.11
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
X-List-Received-Date: Mon, 01 Apr 2019 23:22:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Apr 2019 at 00:18, Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
> I wonder that as well.
>
> As someone rather new to the YP, I would sensitively like to learn why,
> so I don't waste your time in the future again, because I have not
> ignored the warning/error. I have simply not seen one.

This only happens occasionally and we've never managed to get to the
bottom of it.

Using the current patch (not a fixed one) can you force it to rebuild libcomps:

$ bitbake libcomps -C unpack

And then mail me the log.do_patch from the work directory?

Also, do you have PATCHRESOLVE set?  Probably best to check that using
bitbake -e just in case you've a site/distro config setting it:

$ bitbake -e | grep PATCHRESOLVE=

Thanks for all the patches, it's much appreciated.  We're deep in
feature freeze right now but I'm queueing them up for when master
opens for upgrades again.

Ross

