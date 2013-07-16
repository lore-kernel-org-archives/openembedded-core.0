Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 747FA6B231
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 18:22:27 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so691853vbe.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 11:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=WNnMa87qGxBbN1Ir0LM2jJMq4RYyWeIlkudga72DETA=;
	b=KAGvY0pO7wBmDeo4efvl6UVRcA1RpYsVNwiv8dR+7ieOPv9l20n2kteO1/HllRrzo1
	U9WeeaU1yY9HmA16kEynZxvEm9Y3j6ECJV1COMDHPLfefZ3twWZQjuCQZWDIGHql9Yg2
	ESHPXW78j4hEN0Q1DwuHf926OMl1aee3ZIu75yBnk30SeqvlzaXd7kn9gLQ2IP1ezVP6
	nXP8UzI9A3iP39U9YcltNcEa41RBgVEae5bTE1xFdP1nbTjfOvA90vYUdGSXIY5mk22d
	pLS2sRWTSfFsCATiUOIkMAHlfXbE6A1QRJJ8S9sOATlakRvM4Pq2swn3y6C2BuzntAnd
	6tqw==
X-Received: by 10.58.219.232 with SMTP id pr8mr810536vec.80.1373998947739;
	Tue, 16 Jul 2013 11:22:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 16 Jul 2013 11:22:07 -0700 (PDT)
In-Reply-To: <1373988362-10097-1-git-send-email-cristian.iorga@intel.com>
References: <1373988362-10097-1-git-send-email-cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jul 2013 19:22:07 +0100
Message-ID: <CAJTo0LbYg9miLMgAOSf1ZMs1nD-BboGjmKqjXyCSbtwGytHAJg@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQl61QZmBf0sj4/7ia/8kChO9tam129SqWNEfgBJ6kkQNQrIGafD9qfAeZVCbFLCKnChJyUR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V4 0/2] BlueZ 5 experimental recipes
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
X-List-Received-Date: Tue, 16 Jul 2013 18:22:27 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2013 16:26, Cristian Iorga <cristian.iorga@intel.com> wrote:
> This sets of patches adds bluez5 recipes as experimental packages.
> BlueZ 5.X is not an upgrade for Bluez 4.x, as such, no upgrade is
> provided/possible.
> The two versions of the BT stack also conflicts each other.
>
> In V4 RREPLACES is removed from the recipes.
>
> Cristian Iorga (2):
>   bluez5: new package for v5.7
>   bluez4: conflicts with bluez5

Looks good to me, thanks Cristian.

Ross

