Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC006010D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 14:19:27 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i138so3380949wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 07:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xDxO6MlEcbHCvpgFazcNfzEVNFTX81N4IoehDs1QYlA=;
	b=UiJZictEv+F7KKuOp0FsxzyOziyibMiAG5OTQrRNOjl7LeNIOF9tlOIEwwPrxXMMsx
	DPu3mtGCOjzNReSOKzuPKzF/+O7fi8BWUpvDG57oT9LC2o43JbCen9RlPeNAuWKGS8+3
	++ZS0nsN2a1zThOGi+VNOLoNL771uKKhCM66JdKbdB9yzNdBB9saai3JruIP5KR/F7kT
	c/ZdzW3UmjmgCcXgQ0Y8UFg8GX4yoUl/272PJEJn2eQyNvSQvDbExh6km05aR2i2uPT7
	WVnIgq781bWcD4RN0tt5+zxAHJHliiSBsqmjgKgv+jYkuxD6VVO8Zlc7tbQ0kr3xsLLp
	Szdw==
X-Gm-Message-State: AE9vXwPfzNf9nLp3eCaNzt04PtXteOvZJV52qcIDdlZV3+KoiqXMam0mOjxK4QYUJcvCAA==
X-Received: by 10.28.107.144 with SMTP id a16mr3935796wmi.75.1472566768004;
	Tue, 30 Aug 2016 07:19:28 -0700 (PDT)
Received: from localhost ([185.46.212.59]) by smtp.gmail.com with ESMTPSA id
	e5sm18928814wma.13.2016.08.30.07.19.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 30 Aug 2016 07:19:27 -0700 (PDT)
Message-ID: <1472566766.8449.29.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 15:19:26 +0100
In-Reply-To: <94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
References: <cover.1471281772.git.bruce@zedd.org>
	<ff62fe65ad3bae260ec0951caddf428632ef35de.1471281772.git.bruce@zedd.org>
	<1472547914.8449.25.camel@andred.net>
	<94a7387f-cc88-2e7f-21b6-57970dfdbb04@windriver.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/6] kernel-yocto: streamline patch, configuration and audit phases
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
X-List-Received-Date: Tue, 30 Aug 2016 14:19:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Di, 2016-08-30 at 09:05 -0400, Bruce Ashfield wrote:
> On 2016-08-30 05:05 AM, André Draszik wrote:
> > 
> > My kmeta stuff is located directly inside two meta-* layers (i.e. not in
> > an
> > extra git repo), where the 2nd layer's kernel recipes .bbappends to the
> > 1st
> > one with additional kmeta things.
> > 
> > This used to work fine, but since this commit it doesn't anymore as only
> > the
> > kmeta stuff from the 2nd layer is being copied into workdir.
> > 
> > Have I been doing something that wasn't guaranteed / supposed to work in
> > the
> > first place? Or should that still work? Is it worth fixing or should I
> > rethink my approach?
> 
> That was complexity that I had tried to remove, but thinking on it a
> bit, I think I can restore that without adding much complexity.
> 
> I'm just finishing work on the 4.8 kernel today, and can look at this
> tomorrow.

Thank you Bruce!

> Do you have any public layers that I can reference to pull together a
> test case ?

Unfortunately not :-(

But I'm happy to test and report back!


Cheers,
Andre'


