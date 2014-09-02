Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id A21016FE3B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 10:19:05 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x3so6618173qcv.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 03:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=kMY8ZiAjw3k8VafE19vDoTY6undTk0g77CIg0pxE/Og=;
	b=bRA9QhV5FgT3Za1uGNgE7qh90yZH2xCikhCIzqFkANaKn855TwARu7qWDBWmS3wZJj
	vaJV2cxYNDfrJUcRC6eVbfEMnPGJUBvlFht9Ic6YyBymvFRzQZhs+MpAzD+ZMipJ2anD
	JPnbxsEKZbiqePX1IRtgRY0TzkeiNxEaoVYKH62ey5Hbq4bizAIK4aAcDAG7idTg0pkf
	2uQERTSM32RLyUWR9y9ejvwCjgKK2PeyPe7++59U3tLfBQ8Bt7g4AxqT0R/yrAVwahh5
	y5LcCmYJm1DrKnqr7KMvL9+FMxg+NN423ihT6rw6remGKn2/2OlztrQPtBRR4MV6FENU
	HMFg==
X-Gm-Message-State: ALoCoQmJUTaYE6L7qsf6vh5WXv7Geu2CmN13AnTx02ulsG55Hqo4issHsAvEUGbYNH1f8JomZwIU
X-Received: by 10.224.64.201 with SMTP id f9mr55072999qai.64.1409653145626;
	Tue, 02 Sep 2014 03:19:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 03:18:45 -0700 (PDT)
In-Reply-To: <20140902095158.GB8525@mail.itconsulting-heinold.de>
References: <cover.1409650332.git.liezhi.yang@windriver.com>
	<5b78099a3fbf3740a08eba0bf9c88fceaa14f3b6.1409650332.git.liezhi.yang@windriver.com>
	<20140902095158.GB8525@mail.itconsulting-heinold.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 11:18:45 +0100
Message-ID: <CAJTo0LZFFVp38pVT3hUu8WxwyWYaEe_T7ueH=isvoA0G8OiXhg@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] piglit: add bash to RDEPENDS_piglit
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
X-List-Received-Date: Tue, 02 Sep 2014 10:19:09 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 10:52, Henning Heinold
<henning@itconsulting-heinold.de> wrote:
> how about to split out the tests into an extra package and let the package depends on bash?

Piglit is a test suite.  A test suite without tests doesn't make sense. :)

Ross

