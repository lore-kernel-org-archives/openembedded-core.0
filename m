Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f44.google.com (mail-vb0-f44.google.com
	[209.85.212.44])
	by mail.openembedded.org (Postfix) with ESMTP id 413C260886
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2013 08:49:36 +0000 (UTC)
Received: by mail-vb0-f44.google.com with SMTP id e13so99894vbg.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2013 01:49:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DQTyh/IfJrD7YBcuB1Jnfsob+ZJOxfo46Ud+19FMCsg=;
	b=jx22mkGdZ+nwenFJPh5y4jwZLVZhbpI8CbV/4be6+tjpGQsES55e5SnkM8WdbhXorO
	sN/AFsOIWkJrp35rr62ILK72Fqg/IXTy9iaa7DEOXNhe7ez0lzgbVuwpEGQ4NdsVPG0n
	YCggWeYGQSp73IClGbdoVXaeb1FNQJEF0OUhnGQyorMQNN8U3EJh/bcbuki1xZjepMgn
	aruetBmEd4B14BQh3/EcQ0yE09nvDzbQH28MJTVBau9ZSd5G2zsEgVbXukSL5cut4pnE
	UXzJHgkToBxdBhkV1YiZXL2FHJ+HdioG+QTX+Cbyqd6tvYKi6B1909KS0hCcIFl07o/T
	45pQ==
X-Gm-Message-State: ALoCoQmyaqHW1To8FeSs4YvMcd+iP1DygfMbjUUmaaf77NFqbcce/HqMwc/xRbEH3ihtwUITuK9N
X-Received: by 10.220.86.1 with SMTP id q1mr43372vcl.91.1375778976525; Tue, 06
	Aug 2013 01:49:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 6 Aug 2013 01:49:15 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16C12030@IRSMSX105.ger.corp.intel.com>
References: <cover.1375714695.git.cristian.iorga@intel.com>
	<ac2478839baa47707462f083c300ce22cdb8e1f0.1375714695.git.cristian.iorga@intel.com>
	<CAJTo0Lbo_v=SAxKTM8vSa_=LK295uZVjgukpsXKJ+uhAZWOq9g@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16C12030@IRSMSX105.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 6 Aug 2013 09:49:15 +0100
Message-ID: <CAJTo0LZvuVTCnmKZtAgO_K+B=LRtugStcrAZfzaHLHnZJE5v-w@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] harfbuzz: upgrade to v0.9.19
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
X-List-Received-Date: Tue, 06 Aug 2013 08:49:37 -0000
Content-Type: text/plain; charset=UTF-8

On 6 August 2013 08:00, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> For evaluating the correct functionality of harfbuzz, I built and ran core-image-sato.
> The text looked OK, I try to see if there are some issues in any of the included apps.
> Did not find any, so I considered that the harfbuzz upgrade went OK.
> Are there any other more complex tests to perform?

Hopefully harfbuzz has a test suite we can ptest one day, but
generally when it breaks all you can see is squares. :)

Ross

