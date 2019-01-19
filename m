Return-Path: <marek.vasut@gmail.com>
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
	[209.85.210.176])
	by mail.openembedded.org (Postfix) with ESMTP id 87DF87BF70
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Jan 2019 07:03:40 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id w73so7680683pfk.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 23:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=N3IzXuILYgiYbht0820BYoZHZ+Ahc1zm605C/sRWFGQ=;
	b=uOo/bmibvdpFu6rLNiVPH+EADxPofbyBw4u+apB69yw26H7rbpRAZV9zH7eIjWaDo1
	nXn8AcRhfkWLUTQsvjBT0ZBX62JPmNnEYNn1ng+n+1Quwysa86HIuT6hnbcVntqdsy6F
	07qEJejhnYfvcpgCyeKiWKZeeHW+/nZh6HWzqOoBEpelPEb9s+oL5u9ngNyZxID0NMGv
	XIxHwu0kMvm2nLCX0prtKJ61JuVjSECOJGFcGMOMcbLNqwyiJtRXkJbmmLHOhHQyTzuc
	pMDqOBlPBqN/p8p9O73rgglCdvXVOuMidhFaEYOvO+b6R+lSNY+F+MqxXs9pzK6zFpUE
	I5xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=N3IzXuILYgiYbht0820BYoZHZ+Ahc1zm605C/sRWFGQ=;
	b=O+BxmD55opRTa+oa7hz5naBBTi3k4oYJw4j4Euxe0CMXuphV6I/qRJ91a7eFUWObVm
	rgN8R3Cw+JIEUmSg2uMZBkhdsOApL/HfQCc9aI86eIeyuQbuS3PGzWQgsmwV4lKBMzsi
	5nJxZlBltm2oYl3z2lRb+jgy44nmb7iOuyzPaEY5duIYuiOaJN+xHdCT4BQCUlqftdru
	ZqKWUK+qUvSN/13NIjH+SWaZYEHbQZwARgaVpNK1ynRYtLcUj+zLpeiTnB5zD9IaqR9k
	zKwivtpcEEADIb1qyW5eb51U/i70Bv7aD5P6ft81S4VHyJc/yAr5jutJPFfOsvEt9HAr
	o0uw==
X-Gm-Message-State: AJcUukeV2LmBG8xUTBrjPpsXwKU7rdElYk2sV+hQYsOESxeih2uWkpf/
	uHx7zoGWDrZHeiHnALkKLAUPSN/+
X-Google-Smtp-Source: ALg8bN4EexRTaVak3PZEq5TrSAmcRrfGAELozSD5hUZGpLKixmJfp6sXNoasQcadMB9FS7ev1zupVA==
X-Received: by 2002:a63:a16:: with SMTP id 22mr20612064pgk.318.1547881421258; 
	Fri, 18 Jan 2019 23:03:41 -0800 (PST)
Received: from [192.168.42.184] ([103.44.164.150])
	by smtp.gmail.com with ESMTPSA id
	f64sm20441432pfh.0.2019.01.18.23.03.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jan 2019 23:03:40 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190117104456.E6876440001@auh.yoctoproject.org>
	<5a8d0f4a-2b06-cd9c-b571-ce3bff62f86c@gmail.com>
	<CANNYZj_cKj2+RwqyaCYjSfERWeGugBrhmgKoYVrwxof4c8Vpkg@mail.gmail.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <37865567-ce21-bd52-2ea6-9f478377f5e3@gmail.com>
Date: Sat, 19 Jan 2019 08:01:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj_cKj2+RwqyaCYjSfERWeGugBrhmgKoYVrwxof4c8Vpkg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [AUH] u-boot: upgrading to 2019.01 FAILED
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
X-List-Received-Date: Sat, 19 Jan 2019 07:03:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/18/19 10:39 AM, Alexander Kanavin wrote:
> On Fri, 18 Jan 2019 at 08:10, Marek Vasut <marek.vasut@gmail.com> wrote:
> 
>>> Next steps:
>>>     - apply the patch: git am 0001-u-boot-upgrade-2018.11-2019.01.patch
>>>     - check the changes to upstream patches and summarize them in the commit message,
>>>     - compile an image that contains the package
>>>     - perform some basic sanity tests
>>>     - amend the patch and sign it off: git commit -s --reset-author --amend
>>>     - send it to the appropriate mailing list
>>>
>>> Alternatively, if you believe the recipe should not be upgraded at this time,
>>> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
>>> automatic upgrades would no longer be attempted.
>>>
>>> Please review the attached files for further information and build/update failures.
>>> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler
>>
>> Can AUH be fixed please ?
> 
> We have previously discussed this: fixing devtool to upgrade several
> recipes in a single transaction is non-trivial as it operates on one
> recipe at a time.

Can you elaborate what needs to be done to fix this ?

> Please try to accept that AUH is not perfect and
> take these emails as a reminder to do the version update (which you
> should, as the listed maintainer).

This kind of automated update seems like a perfect simple manual task
for a computer to do, so I'd prefer not to waste my time on it. I'm not
happy with "accepting that tooling is sub-par and thus do stuff
manually", I'd much rather see the tooling fixed so it can be useful.

> The attached patch is actually
> useful as a starting point, you only need to rename the other two .bb
> files to complete the update.
-- 
Best regards,
Marek Vasut

