Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1BECB6BCAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 16:13:08 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id oz11so2777056veb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 08:13:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=0UW3RFlwMjSS5T5hu5uMNjSf98ji9yXstSuIs4PEx38=;
	b=GjwQ6lZivBpK57LnkqEkted8H0bbHlrb3I1lJXmQrFl9w8XE6U5B3SS2xd5RLtKMmt
	lZ1eGN+5kzjBLOXZfu+Fs7Qy2gXjK97aMq0GSvSkXdzcJ+1wrbuXmY/LgoO9XczyzVKH
	wz7Gy8ZCHuWtbjL/ewzRm58ukco6qmDWeJkl49wvc0M/MZeDxbyjZVRRZrb5GAm34ZrF
	PGGt77atZS7YX7q2POw99Wk67rwAPGPXO0nxAVKLUce/NJE1Oo2md5FseLPuZjTU2c9p
	lyPjgmnlNi/Uj/J5L7bqHCUmxucHwvJRsMQCQ/eSuUK20Pms9MG/2CKXmJHYHvggKdMo
	dFWg==
X-Gm-Message-State: ALoCoQn0MoBh9wFLwehs2Auh/YVsMHMkavqSa8Lzd9L86rPJkyMaAEDaTX6zBKn8R4uP7nQsPSfQ
X-Received: by 10.58.7.40 with SMTP id g8mr33892vea.45.1385050386801; Thu, 21
	Nov 2013 08:13:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 21 Nov 2013 08:12:45 -0800 (PST)
In-Reply-To: <1385018566-23581-1-git-send-email-mark.hatle@windriver.com>
References: <1385018566-23581-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Nov 2013 16:12:45 +0000
Message-ID: <CAJTo0LbHSrOfDR8Ya_PffA5STouX=3-bJW8_1uzLd1jwfSOvdQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] matchbox-keyboard: check and link against libXrender
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
X-List-Received-Date: Thu, 21 Nov 2013 16:13:08 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2013 07:22, Mark Hatle <mark.hatle@windriver.com> wrote:
> +Upstream-Status: Pending

This is sad considering that we host the git repo for this.  I've
merged an equivalent fix from master to the 0.1 branch in git, merged
in some more patches that we were hanging on to were already in
master, and have a patch to oe-core that I'm just testing now to move
our recipe to match.

Ross

