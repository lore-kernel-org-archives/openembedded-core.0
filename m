Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 485756B824
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:38:48 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id q58so386364wes.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:38:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FmzuGhFHaKZftr0df3pDZ0Y1kbymn4oj7vRkJJkCHNA=;
	b=M6uc9eHtqC+FLQgUpzQWmK96eMGeZg/f/GtAxJN99A101sRlhnHQJz9vScV15QRxoG
	IV10heslh4Ik9+VjUMLx2Mk803RVPU1qTZnqHoq22bW3IbXiDf9C2RJO0t+TMcUnk3pV
	iJWXRDSU4wwY6dyzJknaSXo1xTsPVXJTd59Ns4uV+kmD+BlVQ/+FHprdxKzmbpfV0xrw
	uE+1ky66opqNtnsU02nk0XK78IlhmbzqnnfcErfhh7hJFJCDMzYLHcd0INMKD0nhH9h1
	dqta5Wv7thSwERwkQq9980ZuLQ5nCovJAFpMj3vF5wZYtc0TYSm22DJjXiSuXkSIenr8
	jkxw==
X-Gm-Message-State: ALoCoQnoWB4A1W4LMUcUhKNNWTGU/2ItIdOcoyhzBbfL/KrqcXA+8KoSuRhGUyTu7Arq8wQuxi5y
X-Received: by 10.194.8.9 with SMTP id n9mr9644127wja.11.1376559527223; Thu,
	15 Aug 2013 02:38:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.140.10 with HTTP; Thu, 15 Aug 2013 02:38:27 -0700 (PDT)
In-Reply-To: <520C9F8A.7080703@windriver.com>
References: <520C9F8A.7080703@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Aug 2013 10:38:27 +0100
Message-ID: <CAJTo0Lb=hiUHtjMSS8HMQC_gvdy6kjyvs77q1fxZtr9Y=ky24Q@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: About PACKAGECONFIG audit
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
X-List-Received-Date: Thu, 15 Aug 2013 09:38:50 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2013 10:29, wenzong fan <wenzong.fan@windriver.com> wrote:
> A probable ways maybe:
>
> 1) Run world build to generate the sysroots as much as possible;
> 2) Run 'configure --help' on each package to spot all of the optional
> dependencies, and convert them into PACKAGECONFIG specs/or any other
> prompts.
> 3) Run #1, #2 as an audit script periodically.

Step 2 would be hard to to automate and some optional dependencies
don't have configure options.  However Martin Jansa recently
contributed scripts/test-dependencies.sh which does repeated builds to
determine if there are any "floating" or missing dependencies, which
can be ran periodically as an audit.

Ross

