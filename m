Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id C76D460144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 22:28:16 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id x12so3744534qac.19
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=pSsx4ENKRMX6aW9AKAfm10SAdrK8upI4guUJZ8l8MgE=;
	b=lizgQHqH20xSS1JwQ1gVALW4z1ncqfn9LeMirFETRJTukJtQfaRdoHv65QELcObIIk
	VsmOzeU9sJGlQ+79GgTz606eB7mdbBoQ1Zk8Bp/IX2zCuTOff+8sObFl8/lPjEW4h/Dh
	+m6UnsmrHnRxf1cGP1SzSEptOnFeUdNfpBvurJDAHXwtQ5pGokcKBfLN5V0mJoOR9eD8
	sW9OQMQYxXFhvPtRhey3vYDScOAUT9Pr84AHplFGZsD6g9XJCjYHlxLaCGRuHzG3vcjH
	0z+sgzs+PUY75IiewUlVYJ57MlyBrzlyR4MSllXf3ll2sP4r3WqeF8pkFW21IpfJI1Ww
	aEbQ==
X-Gm-Message-State: ALoCoQks293bonfmSvQgVahGoGRg3oAvMVBxtymuZSaqt+Lwo/YmrWeyKUinoo9xgKUZuy147OTb
X-Received: by 10.224.103.194 with SMTP id l2mr13342029qao.93.1411597697597;
	Wed, 24 Sep 2014 15:28:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 15:27:57 -0700 (PDT)
In-Reply-To: <1410360202-22215-1-git-send-email-maxin.john@enea.com>
References: <1410360202-22215-1-git-send-email-maxin.john@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 23:27:57 +0100
Message-ID: <CAJTo0La08fHpt1vJT+Kj97PVT1iDievLPVyEdwZy6ZKykrC8NQ@mail.gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: upgrade to 7.38.0
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
X-List-Received-Date: Wed, 24 Sep 2014 22:28:23 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2014 15:43, Maxin B. John <maxin.john@enea.com> wrote:
> Fixes two HTTP cookie related security bugs:
>  1. CVE-2014-3613
>  2. CVE-2014-3620

Can these be backported instead to 7.37.1?  Upgrading to a new major
release with many new features is exceptional now we've frozen.

Ross

