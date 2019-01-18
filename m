Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f173.google.com (mail-it1-f173.google.com
	[209.85.166.173])
	by mail.openembedded.org (Postfix) with ESMTP id 494E87C216
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 00:09:10 +0000 (UTC)
Received: by mail-it1-f173.google.com with SMTP id p197so3662165itp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jan 2019 16:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5jJmUaVAXDQD2ZKQn++sG51VHnhzHTLJL9448I79N2s=;
	b=HgcBfP3nC3Ay/cVD2XtXlS3gnR1en1hXa3nlKvnX58nkST+yhN7SbGTWrRwF91OFir
	7QzFBkWJD4lrCyda8tYPAwaJyHCahqy6MamGiqzjxJuuUOQ80Y3ZruajhTxwZ/F9eEJY
	ue4vLTSQmb4gf3TZ3EUJZ81hRpm2KW5tu50xE4Nra7/loy1snibbx3TaXCGa3XWsZWxZ
	3net0F2xkjO6DNdwSEdobe8xFHcID7AYRjG2/sxvFRofGXMWjyLbpZnD9+cuvq/PkggP
	n5kmDW8BaOip6PkHaaVTRRbaP8+uJg6tm6r0mQO+csuySIlsPxiHQFHHCBBQfCrc6ZWm
	vm0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5jJmUaVAXDQD2ZKQn++sG51VHnhzHTLJL9448I79N2s=;
	b=hYgfE9wIct2ad1hGYe1pvE3BGwQGQGtO1iA2MUEKO4Bqr6PranyP7FjLwh/11Rg9Fy
	YCyvDpPih1lSTj5EoCuTQT6LFBvtl1gf6ZAQybdj2mJWj93BKrQpJJjPV3QrsDOfVPeE
	6xZxlewWZsWYVBCfSyo9c0rq5K9B9P5QvOjbCPAwVRb2hEMcOQjH6bJcXzfqRJ5MsuHz
	aoj4ZZEZ9mpLwiYsJpkA3bGleH18zJWpObadyDVVRBcekSEzxj/BluQq91G7M+6GSobk
	AQmpxXuxq4DyxlGpVTiHcfmrn33eOShWdPWx4jmudJJJEQ5JLxOe4eiuZ4nweZFMcXW4
	OQqg==
X-Gm-Message-State: AJcUukfVETdIrDrdrzGlhLQMKKZW56/ZE4LW7ZwWHb1HcJTlwU+sybaN
	8++S0HTyzNlgzv6xyBvxSyypQPu0WdBOqBCxr3t3wQ==
X-Google-Smtp-Source: ALg8bN6R/+HW0sRSMi4Dv5nOsavGgci1v3EwVjO5RKWY0DCUyqkANjRXjwnJGi91U2NDQ9S0m8knOJbPDK+dBzPaqFs=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr9716235jal.31.1547770151340; 
	Thu, 17 Jan 2019 16:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20190116225154.12180-1-douglas.royds@taitradio.com>
	<b08ee857fa323713a81f69c756169807f62a2ba2.camel@linuxfoundation.org>
	<48037e45-c43c-ad6e-8b99-a4b797e601d8@taitradio.com>
	<3aae69e3-a2e2-6c17-f808-33f89b002576@windriver.com>
In-Reply-To: <3aae69e3-a2e2-6c17-f808-33f89b002576@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 18 Jan 2019 00:09:00 +0000
Message-ID: <CAJTo0LY2qimO9C7WFv0iTtWkpF7duhR_Q3c0zz38RLYmxcCxfA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: make cleaning of build directory on configure optional
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
X-List-Received-Date: Fri, 18 Jan 2019 00:09:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 18 Jan 2019 at 00:00, Randy MacLeod <randy.macleod@windriver.com> wrote:
> What workflow are you trying to optimize?
>
> If you're strictly changing existing source files
> then you shouldn't need to run configure again so I'm confused.
>
> Also, have you tried using ccache as per:
>     d014c8c11f cmake.bbclass: Make it work with ccache
> and if so why doesn't that work for you?

Agreed with what Randy says: ccache seems like a more scalable and
useful solution.

Ross

