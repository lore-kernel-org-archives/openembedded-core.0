Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id C9849766A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 13:33:47 +0000 (UTC)
Received: by lanb10 with SMTP id b10so11199952lan.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=XahRd0cME2Yx9xz3RJ2EnjvfTRUoWA1U5EgIN+ePPFQ=;
	b=TUGt8klQVxgmFm6CFO6PcFTWtdkf7qyVAoBKabXtQkh9xIZ7x6q46ian6ylpHcZVMa
	Hoq7/mJDr9+VjSCfE9tVffRraWM9j0nM3BlTHZGs1kzVQ34Gj1VOtctetS3B6nC0SnU6
	VIi0eCYPXvcXYBgqZxZF5l4We9G43M1iaU1Z4qX5StXNnA1uWL6QqYAkeTQel9PrAJn8
	de0fqL4UKqVV+7x8L9dTODKWAGRYnZqJRVB8xN7E5A65To5veB7DlpPZggj2/KR3n4GB
	p4vMxmqzcISrtrhAcpsKDT2lWhyfF4OVd3rxvVu90e2nwatgPUKZWBKqyrIWy7yNNcEW
	unmQ==
X-Gm-Message-State: ALoCoQkXVu3JXPg6zn3qgGw4Jv2WXFMu38qkszUNR9CR7GMz05NfAZRW1kjAEq6bvO9HNgi0YnG9
X-Received: by 10.112.55.40 with SMTP id o8mr19392027lbp.6.1442496826354;
	Thu, 17 Sep 2015 06:33:46 -0700 (PDT)
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com.
	[209.85.215.45])
	by smtp.gmail.com with ESMTPSA id up2sm531522lbb.23.2015.09.17.06.33.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Sep 2015 06:33:45 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by lanb10 with SMTP id b10so11199496lan.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 06:33:45 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.152.43.164 with SMTP id x4mr5815227lal.57.1442496825135;
	Thu, 17 Sep 2015 06:33:45 -0700 (PDT)
Received: by 10.112.252.229 with HTTP; Thu, 17 Sep 2015 06:33:45 -0700 (PDT)
In-Reply-To: <55FAC07A.3000907@mlbassoc.com>
References: <1442496086-1994-1-git-send-email-otavio@ossystems.com.br>
	<55FAC07A.3000907@mlbassoc.com>
Date: Thu, 17 Sep 2015 10:33:45 -0300
Message-ID: <CAP9ODKqAQiGTZ5vbQjcpYbywAto6caG9Vcvbx4KQbYeQnUY2JQ@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Rename 'BRANCH' variable to 'SRCBRANCH' for clearness
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
X-List-Received-Date: Thu, 17 Sep 2015 13:33:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 17, 2015 at 10:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2015-09-17 07:21, Otavio Salvador wrote:
>>
>> The 'BRANCH' variable name has no explicit relation with the
>> SRC_URI. Using 'SRCBRANCH' makes it more obvious and easier to
>> identify.
>>
>> This patch makes the use consistent across the metadata.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
>
> These should be separated into one for glibc and another for mmc.
> Also, the subject line needs to mention the recipe name based on
> the commit guidelines.

I can split it but it does not make much sense for this specific case,
IMO. This is a global change and so it provides an easier view of
affected recipes for such a change. If it, supposedly, introduces a
regression it is easier to revert it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

