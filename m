Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 37F0271501
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:36:33 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id cm18so139827qab.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7wrCG5ihprmaG5UV8f6lSzO+IVCbj07skU2DCJaOuJI=;
	b=DMmu9Im3B6dlMRwUjTGyOeJQsraFwjd1RrLVUJ2CN7QOmj1JjKiUjWiI5xj8dsUP/q
	pqptmRWq3WM96RIgtNP97TsKR4HdUUS1GRMRXX8ZxL5A8khfe8XEfv5e+adZxX70kDer
	D9KqNIto/dXA3u+Mzgzx6FD1nZsV6Tr1mXXp6TZ07R+uYWHpbbgc92AveAHgh4y/UyUw
	QwLwZkYvdkox04wiSbUZ7VBVJWf67TfV2juiRvYdd27OjPOCGcDRFvzIHCmq+HavOty0
	WbJVUzjjv1F5d9c3Kj01KIUO75KrFeKXItRq8UBHCBNx+RveWeSOH6U3W+7TrgubCLL9
	hcjQ==
X-Gm-Message-State: ALoCoQmv8qD9caC7/29v1m8yEVWnS8ZLP3m6sG6ZNDADQ8m165mkXOYiTw1EnD0wK3WQaIGUG1UU
X-Received: by 10.140.40.84 with SMTP id w78mr20048604qgw.87.1412069790406;
	Tue, 30 Sep 2014 02:36:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 30 Sep 2014 02:36:09 -0700 (PDT)
In-Reply-To: <18401A03-E69C-43BB-9956-13955179B13A@dominion.thruhere.net>
References: <1411802545-17081-1-git-send-email-koen@dominion.thruhere.net>
	<1411802545-17081-2-git-send-email-koen@dominion.thruhere.net>
	<1412024343.2853314.173154429.5067015A@webmail.messagingengine.com>
	<18401A03-E69C-43BB-9956-13955179B13A@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Sep 2014 10:36:09 +0100
Message-ID: <CAJTo0Lb8k5W3dwfgtodG=zh9GEFr4CBdzd+BOav7jV=s9vHCQQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] systemd 216: add system user factory files to CONFFILES
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
X-List-Received-Date: Tue, 30 Sep 2014 09:36:41 -0000
Content-Type: text/plain; charset=UTF-8

On 30 September 2014 08:39, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The real question is: do we want to keep changes to these files on package upgrade or wipe them out?

They're in /usr, so they get overwritten.

Ross

