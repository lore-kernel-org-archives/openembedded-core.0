Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id C81C677016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 07:45:19 +0000 (UTC)
Received: by qkfq186 with SMTP id q186so5490819qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 00:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=f31563PmXrvlKnwEhw9JFcxlho2j8v9KQsw5YY5p6zI=;
	b=V3wZe0kFiEcKGKwCg8v6HgEEPSnSmXfiP7jBV2ZCsrvFZzMcJvwV8DubW5beYX9pwW
	KoImoTUuLZ8kLfRu6/BFmF8iA46RdJWGYzzyMXoz4SVxh+pGpxt+I/wpxsJQ8qFxvxfL
	4rjnN6xRobme7JT/c3pPvP2jAUidn595kh57ME+NLPdfw80ChRwP1vC7eUR84gttOFoy
	iA2xGOA7YB6kwLP5hReLWqmHlSrzR53iKjUpM8kxahgqku0VkJ0sn7XllMHKFAIUVomV
	lgJcxP9uQdK015jQBo77mVxN2wWM94I89uUR1fX7eXuEGqd7v4pUqhUw6KNZqph2TPgR
	ZVsg==
X-Gm-Message-State: ALoCoQkMdA++V8g04F4JChoaBogBW+fP3aHbEtQs++jL4IjVECVpXpom3YJsgdXIxhQz74mPCjGF
X-Received: by 10.55.209.210 with SMTP id o79mr3197874qkl.43.1441352719924;
	Fri, 04 Sep 2015 00:45:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.9 with HTTP; Fri, 4 Sep 2015 00:45:00 -0700 (PDT)
In-Reply-To: <55E949A4.9050805@dresearch-fe.de>
References: <55E949A4.9050805@dresearch-fe.de>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Fri, 4 Sep 2015 09:45:00 +0200
Message-ID: <CAP71Wjzcr_ByLfCnAgQ3t2MYv+D88iTL5_VJ4Cdn23iAnyHfhg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] "sub" machine types?
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
X-List-Received-Date: Fri, 04 Sep 2015 07:45:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 4, 2015 at 9:35 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> We have some products which differ in bootloaders (u-boot) and kernel device trees only. They use the same kernel and root filesystem.
>
> Does OE have concepts for this? Or any suggestions to realize this without building for many machines?

most BSP layers use SOC_FAMILY, see [1] for this type of things, such
that you can create 'SOC' specific packages that are reused across
multiple (OE) machines. That sounds like that would help in your
situation.


[1] http://www.yoctoproject.org/docs/1.8/ref-manual/ref-manual.html#var-SOC_FAMILY

