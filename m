Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 249AD6BA8F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 16:59:37 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id x14so4063100vbb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 09:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TgNMerer9fHrF271s+AE9d8P/MCk3ZMhrJTv6Z4/ICs=;
	b=OfqhnjN5+njs/KbvJFrltaRtXO3qnIojLKXo5JRxxQnHamsQwaQP1G6YlNtxX7svfh
	dE8aDUDGPZn6QRxGDjxgxqbP8dl+L4ldbfhWBYQTD1V7cvYwh6YeKyx1/rWw1kabeX8Z
	LfY1nCtelh24CZhfz6I0k+ndskuab5zBt9c2H2RLYEvd2FuilX02/6GJRzngqvJ7U1Xs
	ru0D8jE1qKLQoYW9yL5Y4xzgvfpqXjSk3FoBL6zUAQ4Vi6t+QotZHHL8cbqPLevCpcHw
	9PJ6ERoDChKfXizm1umKuG55h9J2ZOfQp/sHIjaa4ekUPlkUok2QEisdIXX6W/cCh7fz
	omFw==
X-Gm-Message-State: ALoCoQmRl/HDNXa7eoVN4ai8xgFAW2U5F4JBokuntyahsJJNCFNfDFje2qhrkcEcaQJYlvBUZ1oH
X-Received: by 10.58.97.138 with SMTP id ea10mr6396veb.38.1378227577499; Tue,
	03 Sep 2013 09:59:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 09:59:17 -0700 (PDT)
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 17:59:17 +0100
Message-ID: <CAJTo0LZKRmPzCGxh_DzTx+AHgGMFWybg0UvMNjZrP4jEW3D0-w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V4 00/20] Add python 3 support
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
X-List-Received-Date: Tue, 03 Sep 2013 16:59:37 -0000
Content-Type: text/plain; charset=UTF-8

On 27 August 2013 18:15, Khem Raj <raj.khem@gmail.com> wrote:
> python3: Add recipes
>   python3: Add native recipe
>   python3: Upgrade to 3.3.2
>   python3, python3-native: Consider OE staging installation
>   python3: Fix host include contamination issue
>   python3: Fix the compiler invocation and linker flags when cross
>     compiling
>   python: Add Patch description and status information
>   python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc

For bisecting and clarity, why can't all of those be squashed into
"add python 3"?  I don't see the point of merging a broken Python 3
recipe and then six required fixes.

Ross

