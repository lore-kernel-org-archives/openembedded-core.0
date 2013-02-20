Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U8CBz-0007C7-Fv
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 17:06:47 +0100
Received: by mail-ve0-f181.google.com with SMTP id d10so7065391vea.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2013 07:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=mY96CFYap8X2Uzs0dWEmZWaFKhTfVytZ3S8bYXCi+io=;
	b=evlJGnDUAPFJFNVpXss9Ig1rLMxSHYKFwp5Hsj0Qa7b1hGGzaAUMvJ9f4nF4KVCvZA
	DEYOT6xHBbdKOqJzeRJYITbhDBh3pWJvmye6xGcIkhaUG7s1M/ieKFanpsrJVZD4zJsN
	j5igEeVJ4nKMiPiC6qNXbQYX2v4VNHfsv0Na/fTjiT0KYH//xmVod3Vpq6E8h9MkVapl
	afWq/oYTEFvRc5lc7MSZW1ZeJ4gq0oCBfHNJGWJXuIUclIkLNPCQYT2dyRjg6/VEsTli
	qGzO/sUyXvJOdykt5STl0xQAag7iIqaD9I4N2mLDWQljPiCffrRWSe35tPgh6xMRY+BW
	cesA==
X-Received: by 10.220.220.6 with SMTP id hw6mr1533287vcb.59.1361375429226;
	Wed, 20 Feb 2013 07:50:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Wed, 20 Feb 2013 07:50:09 -0800 (PST)
In-Reply-To: <5124E661.5030004@intel.com>
References: <1361202441-22679-1-git-send-email-constantinx.musca@intel.com>
	<CAF6bG8dW=kCYM3c-_4A_hzNjiAQZjz6YKByZDjLYZR4y3j2-Aw@mail.gmail.com>
	<5124E661.5030004@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Feb 2013 15:50:09 +0000
Message-ID: <CAJTo0LYmwDKSvJAUPD-PcTC2eUkgOmT67jM=7ZShVVC5JXuS-A@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQm2c+CMYjW30cltgYFsvCyx079vTfacJpBR2pgCYMR2rgdtFMwmZp7VUPyOg0n7/X+i68Tl
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg: upgrade to 9
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
X-List-Received-Date: Wed, 20 Feb 2013 16:06:47 -0000
Content-Type: text/plain; charset=UTF-8

On 20 February 2013 15:06, Constantin Musca <constantinx.musca@intel.com> wrote:
>>   Have you tried to build webkit-gtk against this? At one point I had
>> similar jpeg update in my tree causing webkit-gtk build failure.
>
> You are right. The problem is that I can't upgrade webkit-gtk because the
> new version requires ruby.

But we can cherry-pick any libjpeg fixes until we've bitten the bullet
and integrated ruby.

Ross


