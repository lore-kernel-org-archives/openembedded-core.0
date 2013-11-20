Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 432146A463
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 00:42:50 +0000 (UTC)
Received: by mail-pd0-f177.google.com with SMTP id q10so3659664pdj.22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 16:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=9YSMjqF4sWaIbuNnoGVHJIXbnJwxDUM74pv6vyzFmQg=;
	b=TC610D6EiakTxxBjMwZLo9yAaccYTUyNFgPPZLTMtEXQ0w2IYb8gVZjvm/1VLXGQfi
	70e1QoDKq2OYLmx/RN57hn7AihEx5vUv8ZhAIrzF4DT38tZMyAGPY+/j9S5WyfvLOf24
	X8EWRUgOXeKSZTSRJN0RgSRZBm4bblgcGi026XueX5EVVfjouH8LqgUeyTIUfgu0t5ar
	jzl1i3BZairEaS31JXYie1WVv5wglq5b4XRfnqUOoYLEeWEcb35XWj6UolXo2d26xYz/
	3nsqUCMN4n/lB5h+WBPFibT7e3g6Gj+3om9hbhZ1ATQKM0KRSPiKiuQtPqpBMWGaTBpA
	6DSg==
X-Received: by 10.66.132.69 with SMTP id os5mr28577806pab.114.1384908172017;
	Tue, 19 Nov 2013 16:42:52 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.160.94])
	by mx.google.com with ESMTPSA id
	qv8sm33383940pbc.31.2013.11.19.16.42.49 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Nov 2013 16:42:51 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Date: Wed, 20 Nov 2013 08:35:17 +0800
Message-ID: <4743472.yrXvDUgRGV@yiqingliang-pc>
User-Agent: KMail/4.11.3 (Linux/3.11.6-1-ARCH; KDE/4.11.3; x86_64; ; )
In-Reply-To: <1384860914.23724.83.camel@phil-desktop.brightsign>
References: <2838381.LbivOYPPzY@yiqingliang-pc>
	<1384853093.3814.56.camel@x121e.pbcl.net>
	<1384860914.23724.83.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kernel build fail after update
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
X-List-Received-Date: Wed, 20 Nov 2013 00:42:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, November 19, 2013 11:35:14 AM Phil Blundell wrote:
> On Tue, 2013-11-19 at 09:24 +0000, Phil Blundell wrote:
> > On Tue, 2013-11-19 at 07:21 +0800, Yi Qingliang wrote:
> > >I found one patch 'Use hardlinks for do_populate_sysroot for speed'
> > >may be related with this error.
> > 
> > The failure only seems to occur with the kernel, whereas I think that
> > patch applies to all recipes.
> 
> I realise now that this isn't true; assuming you meant
> 13259459e200a237ca486cbe1123a0b0a4d1eebf then this is indeed specific to
> kernel.bbclass.
> 
> p.

Yes, that is it. 

-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

