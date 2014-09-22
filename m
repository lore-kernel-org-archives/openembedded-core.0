Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id EEBD5609BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 17:03:56 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id x19so4948562ier.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=zhjsPZWNLN1fO10aW45eMAau/ImTP8zhi8D7IvrKAcc=;
	b=GaO5JA2slsNpGQ0LVCuZ5QeEC5tM0UZ+EaTq6OUBlAw/fudsPGUNFJqgWfUdMVx+Yc
	JdWjmQOMhEWsiw+wcLIbDxBYeVQWsW0YoFQ1A89MuLHRjHX5JtnGC/VMDkoI5kV5rtnI
	hhqnOCJ2/uGQ4XcCkZZJ8K5tkbFLXBYiEScpT8z8Gp7TdUqZXNDap+E9h5RvXY6TsoTv
	XqrkPEOQDZCBT5uf0MAxRoHUfNZ2t60BGJJe3SN53/jwRaLkSr4xAaccalM3f5O1MEF9
	f+WcYIaFEx3clfsNh4I8juOXN3FUzGAwTe9bhnrZEu53OqIC+CYclbD/qmdyF1kbewMy
	7atQ==
X-Received: by 10.50.109.228 with SMTP id hv4mr16039244igb.13.1411405437173;
	Mon, 22 Sep 2014 10:03:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.240.6 with HTTP; Mon, 22 Sep 2014 10:03:27 -0700 (PDT)
In-Reply-To: <54203FCE.3080901@windriver.com>
References: <1391681105-8896-1-git-send-email-raj.khem@gmail.com>
	<2251278.GaOGmN6XgQ@peggleto-mobl5.ger.corp.intel.com>
	<54203FCE.3080901@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Sep 2014 10:03:27 -0700
Message-ID: <CAMKF1srheZyVe5ATST-ToxZQJkXTTNvoh8j+PzrytSVbjVV9wA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] kernel: Enable externalsrc on kernels which instantiate kernel.bbclass
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
X-List-Received-Date: Mon, 22 Sep 2014 17:04:02 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 22, 2014 at 8:27 AM, Bruce Ashfield
<bruce.ashfield@windriver.com> wrote:
> But the reports we've been getting have been that externalsrc
> builds are working for kernels, and linux-yocto without the change
> in place, so I'm looking to reduce the patch footprint and re-submit.

no, it cant work if folks were trying the usecase I have mentioned.
The fix is infact for
non linux-yocto kernels.

