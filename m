Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id D4D1F771A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 10:28:58 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id d189-v6so48276800oib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jul 2018 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RcvrS6ObOMcqLrTnWcW0JTS5VkyjBs3y9iD4/OO8008=;
	b=E2iosWNy1AFZHvRWzoVJf4pQ0S7PQ/xW/tejbI7l6n6jLCDSGapSGR89mPGgtk3Yib
	wzOvYDHyljn8eP0ETPqibVWNsjb6HSHNQDW8n92H5NOteTJIK8pY+OZskJYoDsodC6XB
	SBC+3hbJhpL89OuaM1udSCAWFPtV2ZwmPKUechkoO18/dSZheI4D65dv6CnbyharHjF3
	+5wSAEHHzhtOnNvoKkW4l+EBpfHDF4XrXQVd7YYtOrranBbw5ENuuvt7DIdobhMfwELT
	eaxpCjiDD2d/DMzAgZPSfZEvz9lQiut88Q+vsGYnlV/Qg2gmMRyfETyaV2BVXVBJm20H
	JB7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RcvrS6ObOMcqLrTnWcW0JTS5VkyjBs3y9iD4/OO8008=;
	b=p4W9zBI8EgHJCWmH1j8BUW7ooko5mE8V5b+JM5WWENSaTnCzzi3NXewBsY/I802gSp
	IEq0N/35bqclKsj55JqDLtENHq61TPItKJXMsGP4SHm7hKdypaSN9HFxe5tE/8QW3S61
	Ej6bHV0cBL9WDPQ6HHzYVI1dV2uvuU1ijoDM09Bbqz0+2bW7hb4T9XneYGDI/N9IqbJB
	aUJcUA0K5Xd0QtN1xktrnd0TxjyBP585rpiFv9N4bEZ9ll91ALjxn0dG4HVqLgUmRdFB
	PKznTd0hTx1bePggYqygNRoC4KF/LKMNGclCwizQ/1+LVG9csBAShQhI2WoOEB0Ut2NH
	/P2w==
X-Gm-Message-State: APt69E009+MqaKUz2BDq9reWjEXVxSVMO1pDCsAuiF3SQ2tfzplB/yJr
	qfZTJYPR0DdG51RzPEHFqatcg2V36vMHZvbJ1BcZmA==
X-Google-Smtp-Source: AAOMgpcPo6yCXzzZxrrHPpjjfpdQmqHarh4lYkNz1OdV7ACgk5FsmiBduVYtpIsPoh4tyw2Toz777da+0+5ej0+NEHk=
X-Received: by 2002:aca:2808:: with SMTP id
	8-v6mr33020054oix.235.1531304939835; 
	Wed, 11 Jul 2018 03:28:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP; Wed, 11 Jul 2018 03:28:39
	-0700 (PDT)
In-Reply-To: <20180711094532.8141-1-ueba.takuma@jp.fujitsu.com>
References: <20180711094532.8141-1-ueba.takuma@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Jul 2018 11:28:39 +0100
Message-ID: <CAJTo0LbmWrs3kJ81oVKcqMMgU00Hoj4XcaiWKUXZD_pwZ11L3g@mail.gmail.com>
To: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] zip: fix the license description
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
X-List-Received-Date: Wed, 11 Jul 2018 10:28:59 -0000
Content-Type: text/plain; charset="UTF-8"

On 11 July 2018 at 10:45, Takuma Ueba <ueba.takuma@jp.fujitsu.com> wrote:
> Exactly speaking, BSD-3-Clause differ from Info-ZIP license.
> Consequently, we fixed license description.

WARNING: zip-3.0-r2 do_populate_lic: zip: No generic license file
exists for: Info-ZIP in any provider

Ross

