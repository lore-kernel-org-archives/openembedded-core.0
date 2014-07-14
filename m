Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id CACF26ACED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 18:55:25 +0000 (UTC)
Received: by mail-qg0-f41.google.com with SMTP id q107so1680577qgd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 11:55:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=PHuEiKuEBjx/qr9Ra92Gv1LZbb0do73Oha2umy63lkI=;
	b=jf315umiBkgvdd3RSWzNNy2XWCUZaJS4N+I8aV7a24edewCvZMnCYnyfEAWMxPOoKD
	H513l2ytk6HGVprflET3U97vDVwZ3XYgDxfeKQG+HzBe5FZjsmsAGYw6/Q/AKb79vm+t
	F4ebN2AjZFDJ1pqS6bE7d6gwY+qMmDZo6tsxO4mgvNpH9aPIjYsDTwkP3w2BRHMjAUX/
	0BpBGNgdGzJIs+jDSDz7i0XkqvGMTIsyB9LpjNS8FTlMZ03H9YmLFnAkvuXWcoZE4idk
	cVM2WAwlbinsGfiMnSarGUhm3R0SiAMTvGOBXtrZIXAIoYPeEMTMljuOwQhjjGlU4aU0
	a2QQ==
X-Gm-Message-State: ALoCoQkQ/upr6rngC6O5k9yZIDmCay1EsrKAVSREx4AYXj5HNwTh4t2zvP1MHPLKHMBy9k0ZdoCj
X-Received: by 10.140.91.164 with SMTP id z33mr26175760qgd.65.1405364126557;
	Mon, 14 Jul 2014 11:55:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Mon, 14 Jul 2014 11:55:06 -0700 (PDT)
In-Reply-To: <20140714133950.37e29e55@e6410-2>
References: <cover.1405110050.git.peter.seebach@windriver.com>
	<0cbfa0da548acdef1a4ab12cb708c699a495dd7f.1405110050.git.peter.seebach@windriver.com>
	<CAJTo0Lay1CB_BumWQDDLHrS2i2XkiE99TamO3bwMH86_=P8gFg@mail.gmail.com>
	<20140711152449.08d84fdc@e6410-2> <1405114369.21289.95.camel@ted>
	<20140714133950.37e29e55@e6410-2>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Jul 2014 19:55:06 +0100
Message-ID: <CAJTo0LaUMieDWUeYB7a2rhV0vE6HPypTwAMCwzosU1qX4H=gyA@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] pseudo_1.6.0.bb: uprev to pseudo 1.6
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
X-List-Received-Date: Mon, 14 Jul 2014 18:55:31 -0000
Content-Type: text/plain; charset=UTF-8

On 14 July 2014 19:39, Peter Seebach <peter.seebach@windriver.com> wrote:
> So should I resubmit with the attr-native dependency? I don't know how much
> build time that will impose, but I assume not very much.

Please do, the build time for attr-native is minimal in the scheme of things.

Ross

