Return-Path: <kirgene@gmail.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 96E366D909
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 11:54:40 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id i13so2067141qae.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 03:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=6iYzkLwmUCcfCoTq2MqTI1VJf+9AGxzL6+ftHsjej2k=;
	b=mSovtaeanleNPN321DZYPrb1mspBWVDmYMaunUpXhdgYJCQkKqMxpVdGbJ4WmrovaQ
	X+C2836BGZbDHm3QuvitUPNuY4BhywXqN30OETjodl4lGy5yrGpUcx5S/KqrjYC7rrQx
	eHffOwjLain4vUIPn9B8gzed2DmFQoUreQjbJQSTpksS+2iX9ZMZVi+CShT4o3NXfTrM
	Dw3AQqUCUl1RnRRnjCa8zZ5U0+7+dnMd/L0iJv2pxFjqAx1QZICRxpJJ3Me5VS1lHZ6N
	Han9xIAL8llUd1iMGlSL/zZVivVKADYP7mYVUqrMSEMcvDU9AwvkEbwHB15kQX44P+aw
	rwRg==
MIME-Version: 1.0
X-Received: by 10.49.1.10 with SMTP id 10mr687356qei.6.1384948481848; Wed, 20
	Nov 2013 03:54:41 -0800 (PST)
Received: by 10.96.55.197 with HTTP; Wed, 20 Nov 2013 03:54:41 -0800 (PST)
In-Reply-To: <1384810440.6460.272.camel@ted>
References: <CADV-EXGySaHof6gBdnVmZBDOw2yWB3YT804aHJPGuqE7WLo2Bw@mail.gmail.com>
	<1384810440.6460.272.camel@ted>
Date: Wed, 20 Nov 2013 13:54:41 +0200
Message-ID: <CADV-EXFfYuisF20mV5tuSLFeqxVTBVsOJPsP6n_gJ4uufUEQUA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Kernel recompile if "rm_work" defined
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
X-List-Received-Date: Wed, 20 Nov 2013 11:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/11/18 Richard Purdie <richard.purdie@linuxfoundation.org>:
> On Mon, 2013-11-18 at 21:43 +0200, Yevhen Kyriukha wrote:
>> Hi,
>>
>> When I set
>> INHERIT += "rm_work"
>> in my local.conf to save some space my kernel now recompiles each time
>> I run bitbake.
>>
>> How to fix this without removing "rm_work" from config?
>
> Like this. I keep suggesting someone send me the patch but it never
> seems to happen...
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 383043e..ff99c76 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -146,7 +146,6 @@ do_bundle_initramfs () {
>                 fi
>         fi
>  }
> -do_bundle_initramfs[nostamp] = "1"
>
>  python do_devshell_prepend () {
>      os.environ["LDFLAGS"] = ''
>

Thanks for the answer but it didn't help.
Kernel still rebuilds.

Best regards,
Yevhen

