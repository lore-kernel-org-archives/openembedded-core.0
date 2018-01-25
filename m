Return-Path: <kristian.amlie@northern.tech>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id 08A4C601F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 10:33:43 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id h92so9151259lfi.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jan 2018 02:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=northern.tech; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=x80/PuX5TV3oSp7LLdZ1MzvqrAhtpeQfO7r5jfPEkrg=;
	b=lXTgSqHjAMvYt8swGta+mcqXQ6TfFAjoYYcCK81NbfDrH36m8SrcCNMRF3rKITYMHN
	KgzqNsS60wUGKDrhrFe/fTVUdMu5etqBChHrCnqaWJWAQsYqFb/SKPKb5BFQBsOwZhWk
	y0ptqXDoVhxReD8ImcH+CWuhr3vWwSNtvhGPjWIOi0IMXscZr+EKfKiriw6bLbokAJ2K
	EkSNbUCyTvX3iuQ1quGsNCuKVL7Mjmz+vNPJs21mx6rcKJCAHFXjGljr+CvSPxbQtXoi
	n8j9WsXUIHv9np95xxSYzLNQ31mV3RESt+NDOMUYiJPSRRPhgBwL72zMvUC2qgvTKy5q
	eq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=x80/PuX5TV3oSp7LLdZ1MzvqrAhtpeQfO7r5jfPEkrg=;
	b=jlU3S2gy7Y86bKWprttmDZj935HDXkRqaoSLc2I5ercO/W9VerewJl6FgeGAwKLPN2
	G/HHJQeAcCPZHcoFnfM2sGyjUEchhB+C8jyA3vemXtuYgbcwUYMhazzYY8C/7TML/sI9
	zMFy6WC6XjBckpEk/aITB1h28jAF+p3WuqtCNfWl4gP0dvHNvf0WEKaF4UcaVF2A+Y6B
	svi7euRvszY4l5pLwBAU8kK/9+qS4KiRQ7wTB1lS9vjUta+yhn9Iil0+KhUYyNoLgW5P
	XC7ZYpXv3hfGHoStPArpKb1vWKi+wV5qgewx/P9FuC3BLcVnB2PmgXrVw9K5sgyYTqIK
	u1lQ==
X-Gm-Message-State: AKwxytcLsYOnyebNRMaznMVQbdBBoh5zFPd9o8eyTHJTXNnhM/nZduQv
	x4oj7iI7QtJBS97HigO5zI5YsELKTC0=
X-Google-Smtp-Source: AH8x2274B6kEAC4b7F/HIj0gPzCPwBahSvAZxAn3Mq0GU+yEVTuXbxLo4FVkTQWsy3I6Bjojoi859g==
X-Received: by 10.25.161.84 with SMTP id k81mr5691828lfe.127.1516876424079;
	Thu, 25 Jan 2018 02:33:44 -0800 (PST)
Received: from localhost.localdomain ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	11sm444246ljx.58.2018.01.25.02.33.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jan 2018 02:33:43 -0800 (PST)
From: Kristian Amlie <kristian.amlie@northern.tech>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jan 2018 11:33:35 +0100
Message-Id: <1516876416-13748-1-git-send-email-kristian.amlie@northern.tech>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
References: <e4d7ba56-e92f-9322-6e37-be08bcab8ad8@linux.intel.com>
Subject: Re: [PATCH v6] do_image: Implement IMAGE_ROOTFS_EXCLUDE_PATH feature.
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
X-List-Received-Date: Thu, 25 Jan 2018 10:33:44 -0000


>>> Bear with the pre-release freeze period please; once rocko is out
>>> patches will start flowing to master again.
>> 
>> So now that rocko has been out for a while, can we get this in please?
>> Already reviewed, and rebased patch is included.
> 
> Please do pay attention to what the recent Yocto Project Status emails
> say. Specifically:
> 
> " Until we resolve these issues patches will continue to be slow to merge, if at
> all. This also blocks several core developers from doing any feature work at
> this point in time (e.g. layer setup tool is on hold, again).

Things seem to have calmed down a bit, so I'm submitting a rebased
patch. Let me know if is not the appropriate time.

-- 
Kristian

