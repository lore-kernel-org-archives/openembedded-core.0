Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TGFql-0000sG-8R
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 23:05:55 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 24 Sep 2012 13:53:05 -0700
Received: by oagn9 with SMTP id n9so6027032oag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 13:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=22Ou6h4wbJWKe97bs1qDyyXI6lUWohPZk3tzISOGdM4=;
	b=nNwOAprUdeQieVeNtVdL0yEf5IjkLka+x4GQZ3CcyQKImhLet9aXHEIMgJXssff8kB
	OOTOgT3yJwMm5QfwpLbkaDhNBtjq9zvQQ+QbF2DQHZ7t6u5jrphbd41pgDOdtQ+BgKKP
	M7w3QKXniYvJfZ1Nuq3NAU2GajTaCWiAQcK/F2lsatDgKlL1CzMKtOKHUFQ0r6CjtL2V
	pzLWYwaWB1z1ztyKMY6dls4YfQrRgBgkepH451VSa2aEVwxkyMOpmQfgvkE6O57vJtJU
	EpLwptnUb6gkqrj8NYs/1yBnVPGQyT7g0sgJdC+rzKxmXqvCoiQbZrW/LScXYqqFDcwP
	6KPQ==
Received: by 10.60.29.72 with SMTP id i8mr10609218oeh.26.1348519984584; Mon,
	24 Sep 2012 13:53:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Mon, 24 Sep 2012 13:52:43 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6A2D4F@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1348516546-26005-1-git-send-email-msm@freescale.com>
	<20120924200050.GF3295@jama.jama.net>
	<70CC66F5C30A414DADDA6973E4CA391A6A2D4F@039-SN1MPN1-001.039d.mgd.msft.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Sep 2012 21:52:43 +0100
Message-ID: <CAJTo0Lbx9CoDzbKnMrdEwtTzJO-+LEatBTnZnF2f7tNWwhO+eA@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
X-Gm-Message-State: ALoCoQnW7G8o4XJS1VpWmvipYn6X4h3igCiUnm7TulgTW9A9kH59SKk1LHRLZpubWrCBpFh6k/Hh
Cc: Martin Jansa <martin.jansa@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] libx11.inc: disable warnings that don't work on certain compilers
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
X-List-Received-Date: Mon, 24 Sep 2012 21:05:55 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2012 21:06, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>> Shouldn't it be applied only for -native? version?
>
> That's reasonable. But, suppressing warnings to compile logs also did
> not seem to matter much since we don't go line by line on warnings in
> compile logs (does anyone?). I'll go with the consensus though.

I'd prefer this to be a -native only thing too.

Ross


