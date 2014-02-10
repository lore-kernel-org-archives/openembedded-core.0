Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 8E0F76E7A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 11:09:03 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id f11so9305854qae.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 03:09:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/s+n51rC7J2HzDT54IbcNWjTd232yW2iANyC6JFJDjM=;
	b=j3czEvZX3Zs0twrCPBjO7TvQ8s1VopCW29BH1YkEEr5OSHYIxJH5z1Qga4ZX9gQpdJ
	CA7ULeYRjREcMmaknMky0vN+ZVwwSIAPphM3GmEuOvbMuhTOygpHeI0mQ6fHEveIQ7+m
	PXQFGZ6iU/nipahKtOdjMTL+AwassNNyi+H81MrNDXoavsBmoRu7ORqQHqbf4EpFhM3w
	FWFBxhNwfcbGAEEIH5NTPtx2CjMoQRVrJV2u1Aq+2LCzFZxXtqfzBwF/6xZWTaUuPUYu
	frJDhd2shUSAmNnPUqUKkuWLfI51z2PY1TPCmqWM9OIqKg2fdpvWBT/wXYXPftVaIWl2
	oiag==
X-Gm-Message-State: ALoCoQmUE9hH596vCdLpFnkFTZsFt74cmt97ldaPNSp0gC6YWyftDRQn9OOvFDMoej02NIwZCc8c
X-Received: by 10.140.42.54 with SMTP id b51mr35273700qga.87.1392030544041;
	Mon, 10 Feb 2014 03:09:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 10 Feb 2014 03:08:43 -0800 (PST)
In-Reply-To: <20140208180543.GN3698@jama>
References: <1391598835-1631-1-git-send-email-lpapp@kde.org>
	<52F25D84.6060501@linux.intel.com>
	<CAOMwXhMUuS2-dV1xe0YWFxOeD08ByUHHm8DPaqeT=4jAFzHXVA@mail.gmail.com>
	<1391860744.32614.52.camel@ted>
	<CAOMwXhM8FgqC+z-fo9VNDyn=imUhomLmm+hQUSX4k9r7AsXJyA@mail.gmail.com>
	<1391862015.32614.59.camel@ted> <20140208180543.GN3698@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Feb 2014 11:08:43 +0000
Message-ID: <CAJTo0LaXbTkt0fwsd8agLGPef1TN4frZ07kRqd0xJG9rki4Rkw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/recipes-core/base-passwd/base-passwd/noshadow.patch: Split it into two parts
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
X-List-Received-Date: Mon, 10 Feb 2014 11:09:04 -0000
Content-Type: text/plain; charset=UTF-8

On 8 February 2014 18:05, Martin Jansa <martin.jansa@gmail.com> wrote:
> From contributor POV I don't see need for "ack/Pushed" e-mail, I rebase all
> my local changes quite often, so when some are merged I'll notice that
> they are gone from my local branch. When some patch is stuck there for
> very long time, it's again easy to spot this and send reminder on that
> patch email. Another advantage of rebasing my submitted patches is that
> I'll see if my patch was modified prior to merge or when older revision
> of the patch was merged and rebase leaves me with some significant delta
> between v1 and v2 which I can easily submit as incremental patch.

FWIW, this is my workflow too.  Lots of feature branches for each
logical unit that I'm working, that get rebased every day (a basic
git-rebase-all is less than ten lines of shell).  I get to notice
patches that no longer apply and branches that are entirely merged
this way.

Ross

