Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tw9w0-000114-Hi
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Jan 2013 12:16:34 +0100
Received: from mail-vb0-f70.google.com ([209.85.212.70])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 18 Jan 2013 03:01:06 -0800
Received: by mail-vb0-f70.google.com with SMTP id s24so2427578vbi.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2013 03:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=jKZd9/9qEwrBHmtCbIjBkXPDG01gibC7y//mvrOaSPw=;
	b=cBFvkp+Cu5/3wUnnn2uoFZVhHlNHR57I9oVmmyCww503HoSy/DPEEQ4NgekbrZe9OH
	XMIMwfuih8P4vBgVZuWfFHpSYPguHN9KWWyi/PRZ1PIxWm06E25ZyfUl5+cXCiul76NF
	/1w1Km/TVCU39ah77fFML8pa+ACs1I0LkSJo0I7oR86V2ZcAnaUxFEXZSewXi4knDNDl
	HHBVA0eiOoi/mH7t3kXQCQmM7q9kUglTrDuppTPBSmtiG4TRl4bd92XsUHnjY/Pfv8/N
	f7fG9kQ1o6NWb9imVq9ZrF6cHqZe+RK8NN01olwLCVlA6x+WnSHo0dT009olCjR44ybP
	LmGg==
X-Received: by 10.220.240.141 with SMTP id la13mr8970730vcb.39.1358506865291; 
	Fri, 18 Jan 2013 03:01:05 -0800 (PST)
X-Received: by 10.220.240.141 with SMTP id la13mr8970721vcb.39.1358506865185; 
	Fri, 18 Jan 2013 03:01:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Fri, 18 Jan 2013 03:00:45 -0800 (PST)
In-Reply-To: <50F92AEB.8000609@topic.nl>
References: <3116730.Gs6kyeAI7b@yiqingliang-pc> <50F92396.403@topic.nl>
	<CAJTo0LYbNyBMhWNDH5pzmn2BO9mCt+0mODXohaC7ZO-PSyLVAQ@mail.gmail.com>
	<50F92AEB.8000609@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jan 2013 11:00:45 +0000
Message-ID: <CAJTo0Lbg5CAH86-p-LNFipLqs5KSuMO+pMGv-P8DEhx4roTr2Q@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQm9St6rZ8c/AIKf4qo+mbX+qNFSLbPLmw4EnQwG1Or0s/8ngfAqqaiIrVCwDhpBLf3Gixo3dliivYR3aLt/lKxA4vYkjuzGoMOijafnZ1TsPOnJkWLRr760KI/z1hi0hGUwixRD5WmJh87+Czw9TTChM2Tedj3V+XnJIJJyzYg5W1FhR5IVE1wjpTz7qjjjDzZ4r7AR
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: OpenMP and OE-core (or: Why is OpenMP explicitly disabled?)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Jan 2013 11:16:35 -0000
Content-Type: text/plain; charset=UTF-8

[re-adding oe-core to CC]

On 18 January 2013 10:58, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> I'd welcome suggestions, especially for "words" to use. I'd be tempted to
> add "openmp" to MACHINE_FEATURES (because it's mostly a machine thing, I'd
> expect).
>
> Just compiling without the "--disable-libgomp" should be harmless
> regardless. Right?

If all that does is make the compiler larger, and doesn't impact
generated images, then you can make a case for enabling it always.

Ross


