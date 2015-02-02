Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id F2C61606BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Feb 2015 13:41:39 +0000 (UTC)
Received: by mail-ob0-f176.google.com with SMTP id wo20so7915825obc.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Feb 2015 05:41:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+cIlKweRMuwNQ2/tZ2H4Ib7KONcbL4ffo5fj7xA5LNo=;
	b=Cx9PBlbpTfgaogu56rz0lunCNBpC7ZX7G2PnrhJVSGf53fRvF029ogJ6uZiMrd/YXQ
	tdi1yAOB8WqbluKBPxHcogbi1vu0EGkH/yXDDuMv9AQikBqr0/7rWyO+oDfPfWr8XVS9
	nXNUMYh5q4b1xUDVeNwUZOHWPmlzGm/Vgy7wVVK5eG3vNXOgUYKPo24Kvp/CIB+ByXzV
	OVCqaLHsluq5dm54gatVeRNIL2vU9pOjiTfJNdhE8pkURySpayfV6vdsgN1MABiRe+bN
	gwyF/P1cAs9but9cx26cuM2ZHXR7Lm9K40vG/QukfQNIfdhodZlYGdzDCXMyXOK9ifvf
	/+VQ==
X-Gm-Message-State: ALoCoQl8zX5HNfOr+kc+NCUQlmwaQ+hEqrIoS2r0NJyULsXEI8ZB26W414IEDsz2woYOf+KYxaVx
X-Received: by 10.182.86.100 with SMTP id o4mr11565464obz.51.1422884500585;
	Mon, 02 Feb 2015 05:41:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.116.167 with HTTP; Mon, 2 Feb 2015 05:41:20 -0800 (PST)
In-Reply-To: <1422679169-30177-1-git-send-email-pengyu.ma@windriver.com>
References: <1422679169-30177-1-git-send-email-pengyu.ma@windriver.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Mon, 2 Feb 2015 14:41:20 +0100
Message-ID: <CAP71WjyZHe0aysFuZLuNS84ngaxDJ4hbETA31EROYKS9bS9VMw@mail.gmail.com>
To: Pengyu Ma <pengyu.ma@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][V2][PATCH] mesa: Upgrade to 10.4.3
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
X-List-Received-Date: Mon, 02 Feb 2015 13:41:49 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 31, 2015 at 5:39 AM, Pengyu Ma <pengyu.ma@windriver.com> wrote:
> flags for EGL and GBM Gallium had been removed in 10.4,
> so remove these flags.


I tested this patch on Snapdragon running freedreno driver with
OE-core as of this morning, it worked fine. and i could play
supertuxkart fine ;-)

so:
Tested-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>

However, i think we need a bit more clean up, since we removed the
support for EGL/GBM, we need to remove them from PACKAGES and
FILES_xxx as well since they are no longer needed.

cheers
nicolas

