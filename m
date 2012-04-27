Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1SNo2H-00039r-J5
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 18:28:45 +0200
Received: by bkcjm19 with SMTP id jm19so690534bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 09:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=BYYdYD7Ofz847PYIu0Q5Owd7Uvz4k037wIDluWSYfy8=;
	b=fL1QOexXV3M+4+qK6vDMlh69gH9ICah0REpk6gpKy7OlyFBMY8bGxMvUniJmhmDjq9
	49/KeodqTGtvZxh/pD27EDbD/0drbKrWCLa5yVpu7VCTL1HHlE6PKP0qvNAq1ZUpedvA
	OgNYyS6PSlzzp+Nu+GevFufOygzMg2W68/7h0BqSsvNT5D8tfxG3yAe2S50WzXY54mJ3
	XY3g2oX/UKOBpGt0cohmy/drW4z0ogHUTytSN5puXb8NiS2Ex+MzgFprIWf9wzAqM3dk
	BEX3BrjGG8fjXzf8nHXZN3zPlrZFkIIUE0+cQcPyQ/uk/yHCGRludmcEbQjkK1iKsis7
	LCvw==
Received: by 10.204.148.74 with SMTP id o10mr943475bkv.111.1335543547126;
	Fri, 27 Apr 2012 09:19:07 -0700 (PDT)
Received: from [9.152.213.70] (deibp9eh1--blueice2n2.emea.ibm.com.
	[195.212.29.172])
	by mx.google.com with ESMTPS id gi5sm4590720bkc.3.2012.04.27.09.19.05
	(version=SSLv3 cipher=OTHER); Fri, 27 Apr 2012 09:19:06 -0700 (PDT)
Message-ID: <4F9AC6F9.5010608@linaro.org>
Date: Fri, 27 Apr 2012 18:19:05 +0200
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120410 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1335524357-16990-1-git-send-email-ken.werner@linaro.org>
	<1335526116.20130.67.camel@ted>
In-Reply-To: <1335526116.20130.67.camel@ted>
X-Gm-Message-State: ALoCoQmNxo+prJci9T+VhtWttLZIluy+lZvjSBmbTnBAkPcoaJb6YQuSchVy5l0qF+gy8ya7xbAs
Subject: Re: [PATCH] Qt 4.8 GCC 4.7 fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2012 16:28:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/27/2012 01:28 PM, Richard Purdie wrote:
> On Fri, 2012-04-27 at 12:59 +0200, Ken Werner wrote:
>> This change introduces two new patches to Qt 4.8. One prevents the build
>> system from using the -fuse-ld=gold GCC flag as this isn't upstream and
>> therefore not supported by many toolchains out there. The second patch
>> fixes a compile time error when using toolchains based on GCC 4.7.
>>
>> Signed-off-by: Ken Werner<ken.werner@linaro.org>
>> ---
>>   meta/recipes-qt/qt4/qt-4.8.1.inc                   |    2 +
>>   .../qt4/qt-4.8.1/disable-fuse-gold-flag.patch      |   26 ++++++++++++++++
>>   meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch       |   31 ++++++++++++++++++++
>>   meta/recipes-qt/qt4/qt4-embedded.inc               |    2 +-
>>   4 files changed, 60 insertions(+), 1 deletions(-)
>>   create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/disable-fuse-gold-flag.patch
>>   create mode 100644 meta/recipes-qt/qt4/qt-4.8.1/gcc47-fix.patch
>
> Thanks, this is very timely as it happens.
>
> In the future could you put an "Upstream-Status:" header in any patches
> which get added along with an indication of the author? This helps a lot
> when you look at the patch in 12 months and wonder who wrote it (you
> covered why) and also gives us an idea of which patches might be worth
> prioritising to discuss with upstream.
>
> In this case, I've added your changes to master-next and added in the
> missing patch header pieces myself. I've just been working through the
> remaining gcc 4.7 issues and this looks like the main one left.
>
> Cheers,
>
> Richard

Ok, thanks!

Regards,
Ken


