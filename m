Return-Path: <akuster@mvista.com>
X-Greylist: delayed 1335 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 28 May 2014 15:10:26 UTC
Received: from mail-pb0-f47.google.com (unknown [209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 67A816FB74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 15:10:26 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id rp16so11314530pbb.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=TJO1x6lNjUMlmUj0w9ycRZJ/Cw3Q64tNEowPX6k4lQk=;
	b=RRtC+Dj4f34sQW2M/F2FM17MRCgtV6v94PodNHmAZfVmMTn0fxdVQDMYU3/EebQDpD
	8n43dBP1f/qdSyTbt2F/ofAz5Orhd57rjaS2X0OxGDAmneYXiYpY+XsWcy/mVJPiUm4l
	aYBlPraY0yJYiOFSCeNcEOds63ZgV8x79rWe1ao2SmcBwjeZnWYJyKZiML9+HOzpm051
	YVPxozimXLfjVXDc6Har9/zjlSzZwokm1Uo2VKu4x5ZlwOQ5zzmnkSYUO7tb27bCWBMe
	HYf/Msfg9gmG1Hk99tjp+EzNbK2QRAEE01Dvz+/F1jCalU1BZDgZXJaaSxbseGAYZDje
	6HBQ==
X-Gm-Message-State: ALoCoQms5rok7yPA3Ve2Z0nSootKhHaj++SbUwYH35yGvZ4eGSq5NMzEhoTEq54MFcShBfxXlySs
X-Received: by 10.66.149.102 with SMTP id tz6mr48585pab.76.1401288001710;
	Wed, 28 May 2014 07:40:01 -0700 (PDT)
Received: from [172.16.1.20] (c-98-239-95-55.hsd1.ca.comcast.net.
	[98.239.95.55]) by mx.google.com with ESMTPSA id
	tf10sm28750609pbc.70.2014.05.28.07.40.00 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 May 2014 07:40:01 -0700 (PDT)
Message-ID: <5385F53F.6040700@mvista.com>
Date: Wed, 28 May 2014 07:39:59 -0700
From: "akuster@mvista" <akuster@mvista.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, 
	Armin Kuster <akuster808@gmail.com>
References: <1401138331-31087-1-git-send-email-akuster@mvista.com>
	<CAJTo0LaB94-s02ng6CXdFNLGYEasN4chZFdJXEaWnpMZ2nsWEA@mail.gmail.com>
In-Reply-To: <CAJTo0LaB94-s02ng6CXdFNLGYEasN4chZFdJXEaWnpMZ2nsWEA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Update timezone files to 2014c
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
X-List-Received-Date: Wed, 28 May 2014 15:10:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


On 05/28/2014 03:40 AM, Burton, Ross wrote:
> On 26 May 2014 22:05, Armin Kuster <akuster808@gmail.com> wrote:
>> This updates both tzcode and tzdate to latest
> Please send patches using -M so they're easier to review.

Will do.
> Also you
> put "solaris" instead of "solar" in the commit message.

I will fix

thanks
Armin
>
> Ross



