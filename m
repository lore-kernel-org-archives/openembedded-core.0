Received: from mail-ve0-f179.google.com ([209.85.128.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNStJ-0003tb-82
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:58:37 +0200
Received: by mail-ve0-f179.google.com with SMTP id cz11so1999680veb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 11:41:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ZTGEH8xdABnT83AGhzAwbFso0HRLIz/CkBRU4iDCLGg=;
	b=a9JYyCgc5X9iF0LONwhTyXpCTwTNAyVVsnUWrwUOIHtpI5yhGZKEJCou+DPLgDyaDb
	Trj6kPu4VvZ+jkA5JOcClusNgH4dM5bXtQDnOHHPbkh2M99U9AIHhgIypvO56hf2eQXz
	/gQHIO0o9tXQiNew1joGivwRBChucz96femPT+qKxPbBkJvpGxZcCsZMYnhcCbZFtGld
	NrMmYmQKQkALednzurK0KLpT0/cw38RmY4OhVW2AHy6bZc/TGlPmqV7/dSLBkEemGlFC
	UBuKJSv8XVpyeQ3OTUxLV9FzhSkRePyfJ4npv671+F943KiVp/1lMeXZJ6KZ+suUzYxk
	s7ng==
X-Received: by 10.52.25.99 with SMTP id b3mr1849645vdg.99.1365014485373; Wed,
	03 Apr 2013 11:41:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 11:41:05 -0700 (PDT)
In-Reply-To: <515C76F5.7000000@linux.intel.com>
References: <cover.1364942359.git.dvhart@linux.intel.com>
	<D8E6D6E1514B4B1297F02DD04278253F@intel.com>
	<515C76F5.7000000@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 19:41:05 +0100
Message-ID: <CAJTo0LYR8-JghpQ2KOC_YvVxsorc50dLHfUJPUUZE62ug16C+A@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQmzK64cgPoVWgwBKWmF+wts8I4dd/YzMKcPMOtBzujHxFMm6WwFYeXAi1SO+cygjlpjzjor
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add input group and udev rule to fix rootless X
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 18:58:37 -0000
Content-Type: text/plain; charset=UTF-8

On 3 April 2013 19:37, Darren Hart <dvhart@linux.intel.com> wrote:
>>> udev: Add rule adding input devices to input group
>>
>> Please put this in udev-extraconf so that systemd's udev can use it too.
>
> Do you mean instead of udev? I didn't see udev-extraconf in the package
> built for core-image-sato for atom-pc...

Yes, udev-extraconf is in recipes-core/udev/ and is where the
automount helpers go, so it's recommended by both traditional udev and
systemd's udev already.

Ross


