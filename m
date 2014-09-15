Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 386AD60809
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 15:01:13 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id o8so3905523qcw.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 08:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=G/DMt58PLrUDc/CRnQutjYHT37A4hKz+lR5UlMrl+X8=;
	b=f7/bJcctqy8sS4tKKk5ToAxJP8va9ZAeIyawpiaHe3vBtZlaqGbvv4cMgoBh0GEfQN
	YGZOWbqUpfFQOoW1DUU62gj1rsaaOwX8Cg4Ysi6uAGW2YLPQkPzOrzR0su2Y5t7nnlmF
	jELDdROKMd0I0Oc+n0BMPEeGvBHDaHeD/+H2JX/d+W6HKR31eTR43bLwnZbHbPpa8ujg
	D4tLSvz01jWLzNWHctqz36dP/nvD66UobupEB6COp8HQ4vCfPDsSgiH/+xSofEtCcETf
	Ld9kQQK/NISTqj6zQJfImWtDzKGAz7GbJqjmBhlqx8gaG1g0tEelMvGusoLE0C258EuQ
	WcOQ==
X-Gm-Message-State: ALoCoQkMewD/EkiV8OWbuluDSF3HVdW77qXhMthXQPESDIEUU6xn6C3azahUruMvIh0pp7rfc4Nq
X-Received: by 10.224.126.202 with SMTP id d10mr35971133qas.22.1410793274366; 
	Mon, 15 Sep 2014 08:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 08:00:53 -0700 (PDT)
In-Reply-To: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
References: <CACS+7ZTGK6duNi6GQ6tqhmrk3_bNnEbSj=LeEzr60vRP3Dw=OQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 16:00:53 +0100
Message-ID: <CAJTo0LZewZ17aYpXao81LrmuPdgWho8WEYmYhzQ5=pP-AO-QQQ@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Mon, 15 Sep 2014 15:01:15 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 05:00, Dan McGregor <danismostlikely@gmail.com> wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> AddressSanitizer is a fast memory error detector.
> ThreadSanitizer detects data races.
> UBSanitizer detectes undefined behaviour.
>
> All consist of compiler instrumentation and a run-time library.
> The compiler instrumentation was already enabled, this builds
> the run-time library component.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>

git-am is not happy with this patch, claiming that it's malformed.
Can you try re-sending or pushing to a branch somewhere?

Ross

