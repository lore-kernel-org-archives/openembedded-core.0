Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7C0DB601A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 16:28:04 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id z189so185959734itg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 09:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ZKRPFRIcwI91HXb0Zc+QKqtfJ05R6z5E91FYx+1n2dU=;
	b=q5Qf+34HINhi+S+g9iUlZGYmCq4rPm3jvTXi09HuUzb688TxnZUi3G4bPyAESkw38f
	1NUWUNtYhS5OrGu/c3hbns84CISADh3TCvjjWHHEOFoUs5xTgJRh3dTJtoA95oOIKA5V
	S5TvjbMULi6e+TuCnkx09G2nrfuYPhh3hRm1mkauyj0ZLA/tcFoZ7nvwhXpyzsPLjnGe
	1brw8pRuAgBnW9eP4VR2nquPiNy5K6t3F5q8/fffU+73dtJw0CY+kHL9IEvVbGMH1zcO
	we2qkDwOPg5Ym/bzsY1hcAd+X8VR95LSPRIVCqFUYp43AoBl5fuvjKzMJ5MJf5RHHXvE
	5Lmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ZKRPFRIcwI91HXb0Zc+QKqtfJ05R6z5E91FYx+1n2dU=;
	b=JWkOm/fnP71d2l6nzwr3BoJBjCx1MZb1Ga7HbtIT0fbWyNDSibCSUaeei10Nho28VB
	YGtjkbes4FjBAbQBJwU9kTctSOnGjtRHUTjG9vzqWvmZBl+hzfJNti4hjPIIaYD6k9iR
	SOaPd0UYztemJ2o6XXV71OmY54ducKw73HOMAp4NWA0Q8mrYuyZJxX1/BIjRyo0n//Lx
	HbW3POWqj27BCM5Mo9nRUpB85armjsSK7BE2cXcaSgPllPSuX/BOcQmhf4YIVxjtCjpV
	hGs3d88b+VYyncnQuFoM5CU34soIX7A4/4zvRK3Vfd4sJci7vjKdC8V0Z+QH5BwgGcJh
	YZxg==
X-Gm-Message-State: ALyK8tLEeaoAet0eDxKt0nhXuMUl+mXRqnF1eipln3ZvCWrqU/sWcgNtRtkdu34HENECAA==
X-Received: by 10.36.10.65 with SMTP id 62mr32199925itw.89.1465576085124;
	Fri, 10 Jun 2016 09:28:05 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	k128sm7679908ith.11.2016.06.10.09.28.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 09:28:04 -0700 (PDT)
Date: Fri, 10 Jun 2016 12:28:06 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: leonardo.sandoval.gonzalez@linux.intel.com
Message-ID: <20160610162806.GB18625@openSUSE-i7.site>
References: <1465476786-4405-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1465476786-4405-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/oe/terminal.py: decode bytes variable before rstrip/split
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
X-List-Received-Date: Fri, 10 Jun 2016 16:28:05 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Thank you, that solves it! :-)

