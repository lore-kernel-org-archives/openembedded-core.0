Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id D796860842
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 10:40:27 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w16so6229481vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2013 03:40:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=0/Of+GVTqQNm5tFBoXaFPiez0OR5J/lCRfdu/TpJuZg=;
	b=IIkWTuF6aqnMD6fWIFxgvRw29L5C1eJ0a6smfcNlW8w1BFkjBhts8K8aA0lyszPch9
	Jnvo4wc+APqsmH7METtoUH+yEbhx+xnXwrJuvQaFVL54RGaIKYmbEp7lgCJiFXTDtlbB
	8P6EQ4QXjWT6gJ4FvNirUY/ExOLFphAHg4gIucc5s3nPG010GDdOSTJtJ0JXkwiolJrs
	NGr2+aT++8rWDGwPbHkYS1c+h96EZUGmuOq4YTaTTaIc3fd5x8uQ8luKdsFB3umyfMnO
	g0As9lANxWCSXVodv86ukr0VVx3pVS3cuaG07NJ+DRhSOQTuQB1tcpYK/MLE3zrRZRBG
	1Flw==
X-Received: by 10.52.31.230 with SMTP id d6mr11067233vdi.43.1374662426717;
	Wed, 24 Jul 2013 03:40:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Wed, 24 Jul 2013 03:40:06 -0700 (PDT)
In-Reply-To: <1374662115.23294.126.camel@ted>
References: <cover.1374511663.git.sgw@linux.intel.com>
	<1374662115.23294.126.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jul 2013 11:40:06 +0100
Message-ID: <CAJTo0LZ6yT8nGNrGoK2qNFBHu8t4k5C0cbEO6beC0OcnwQeB2Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQn72hUL3RQuSYnhgO39ED1j5yTPxuYLfkJTc9/HWvYyocleWHm8SKFzdT8xczVJxeKX+1gx
Cc: otavio@ossystems.com.br, paul.eggleton@linux.intel.com,
	dvhart@linux.intel.com, zhenhua.luo@freescale.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Wed, 24 Jul 2013 10:40:28 -0000
Content-Type: text/plain; charset=UTF-8

On 24 July 2013 11:35, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>>   docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe
>
> I merged this but with this last one, why not rename the recipe to the
> standard naming and then we don't need to set PV?

It's likely/possible to install multiple versions of this package at
once so we can't just replace the -4.5 with _4.5, but renaming it to
docbook-sgml-dtd-4.5-native_4.5.bb should solve the problem.

Ross

