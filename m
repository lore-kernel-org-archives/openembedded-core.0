Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF237016E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 10:44:46 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id u13so1464465uau.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 03:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TDlmC/1qw+bEcz+HOddlZ2z7yMHn3owMUFl+UDEZ8hE=;
	b=e06ThJ1VmAtbMxxzx+ghQcdnbY115Ak/b/XtL1k/qcd4y9Fg2Xm/9r5f1LhZewkm1e
	GmTdDqiLxn0FNkV3pyN5KuKBvgBnnQYxnIrvEAxnoqEJkUaLWiMp7VEhUybs9E/YeR/K
	3jz09nNjLq08qsy7q7db7SkLdqY+SWq4gqs9AWZ56sKsrkfiv3M4KVArnGCCdJ3mVJDd
	JIpECdgIcmFIsYoqMrpbGhar2/uFBMphcJaX5e09a8nmwy6hGyH7yVHBf0TlNr7tNxMQ
	GRdK7PYtj+M9NXOQ7i9kpXqT4w05rGfQPl0uvtNeFZcGuzJSVuZVkBYeZOoqke3NzFf/
	zUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TDlmC/1qw+bEcz+HOddlZ2z7yMHn3owMUFl+UDEZ8hE=;
	b=XJy6ytvVdNA1S2P252fCxHRgvjxVYlExIW3Zjl/dsdxDMtOjZofx9aLPPYiyr/OOjL
	ayf8SNip3o3Gpl0iHkdNcHvMABFGfw/lM2c3vDPxIk33jnPUTNQhhAr2WKnIy/H+ebCg
	T1IQp+9fGAvk4sDaZ2EGZwj6bvkkrPn3E1vLc25Hwbc2dDmqPhZyhb120ydm4xhHjWG6
	epBu1LWufXovRsSXNARn080wUFA93HSEEAItUzH5HR//D+/WrPppLBe+s1wt5NNxNqFa
	S4+e6JE7nZWFtPbxekXAthzVI96xB3hkaNRRkwwk1TSI1bafIZQjo/6PnHf3KmVBjTfN
	bTsA==
X-Gm-Message-State: AEkoouvRRNibti+6D1DA5si/6UWlNhOFUoQNeB4VmXCoByiMcfUCYqRJDz/p0IjTAvPy3OGiW8JYJ/tIdo5pcQ==
X-Received: by 10.176.68.4 with SMTP id m4mr48027962uam.12.1470653087708; Mon,
	08 Aug 2016 03:44:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.40.3 with HTTP; Mon, 8 Aug 2016 03:44:27 -0700 (PDT)
In-Reply-To: <CAP9ODKohXDNzKeWrkcAC7yT5AKJYqCvFBcXkJx0dD7OwO5bcTA@mail.gmail.com>
References: <917684eb0fc505f6b575ac815188baa7f685cdaf.1470643735.git.maciej.borzecki@rndity.com>
	<CAP9ODKohXDNzKeWrkcAC7yT5AKJYqCvFBcXkJx0dD7OwO5bcTA@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 8 Aug 2016 12:44:27 +0200
Message-ID: <CAD4b0_JTawOxo5nLx_Scrbbf42DDihA+V9tH7eXLBMiO3_-WeA@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ca-certificates: remove -- separator
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
X-List-Received-Date: Mon, 08 Aug 2016 10:44:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 8, 2016 at 12:36 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Mon, Aug 8, 2016 at 5:11 AM, Maciej Borzecki
> <maciej.borzecki@rndity.com> wrote:
>> Options and directory separator -- slipped past the patch removing
>> Debianims, thus resulting in failures on hosts running Fedora.
>>
>> Signed-off-by: Maciej Borzecki <maciej.borzecki@rndity.com>
>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Also, this should be backported for Krogoth no?

Yes, the problem is there as well.

-- 
Maciej Borzecki
RnDity

