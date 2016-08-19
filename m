Return-Path: <trini@konsulko.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 719FB6014F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 20:15:59 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id b59so6479856ybi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 13:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lbyNSDWtJt/N3piHs0Ny+LwzjOUv9+boGdiGjNqhh5k=;
	b=QGcyfiSUatxBMGQVrhc8VtzAbW2GPLRDkbR+AmTDGdYxTL7xsNJ479ZyXesTOWmttY
	lFmGB5X1xfbDPdK/iDdqPabh/vgxoRMTIbZBMUxzcFfvxXiSK5PChJGqiknA2aVA3BD4
	srbywNwo+nnVqxbap6IsDf3+BP8aSXuu2OkKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lbyNSDWtJt/N3piHs0Ny+LwzjOUv9+boGdiGjNqhh5k=;
	b=JAESOD6+6NLx0qNNszVdn/5iim0J0bo5vpIiFQduWjniwCFhr6oAjWCMN5HwnwG2lx
	9cAllIPjXkB2h0OfOzB+Xzk5eupBaQZdmUzhSftRSg5SNxBDnxX/fhTOjzRbZnoJoZce
	2Im7ywtQyAgXa9ffKKCJRhbgSlc4npjeD9P5JN5WeCqqtAUvFgc6Zh0kRdoH/M6VDRgH
	m8dMc5aSwNKtNWfZMmy4TG1eZl5TKl4yiM8XJnHmkEPyqBDzBHtpZRQj2iSalDaRNQQz
	VB9X5fKpc0/XVKMutaz6Cjf2lX7/WnqSKvVHBSCqUyOG1+4gRN73iokgF5TNPCEdcA74
	HTmA==
X-Gm-Message-State: AEkooutOOlEdArJK82HuHGxy6PYbRTBuA0DCnE8vrqgmNz7iLZeLleaxbE6u9Tqk6+w5fA==
X-Received: by 10.37.14.196 with SMTP id 187mr7070911ybo.26.1471637759335;
	Fri, 19 Aug 2016 13:15:59 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-7D0B-9B83-B12E-EF8F.dyn6.twc.com.
	[2606:a000:1407:c0e8:7d0b:9b83:b12e:ef8f])
	by smtp.gmail.com with ESMTPSA id
	p21sm2345652ywg.10.2016.08.19.13.15.58
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 19 Aug 2016 13:15:58 -0700 (PDT)
Date: Fri, 19 Aug 2016 16:16:37 -0400
From: Tom Rini <trini@konsulko.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20160819201637.GO5342@bill-the-cat>
References: <alpine.LFD.2.20.1608181237130.2886@ca624034.mitel.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.20.1608181237130.2886@ca624034.mitel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how can i add u-boot-fw-utils to my build without u-boot being part of the build?
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
X-List-Received-Date: Fri, 19 Aug 2016 20:16:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 18, 2016 at 12:41:25PM -0400, Robert P. J. Day wrote:

>   not sure if i asked this once, but i'm still trying to figure it
> out.
> 
>   i want to add the u-boot-fw-utils recipe to my current build, but
> u-boot is *not* part of the relevant BSP layer -- u-boot is being
> configured and built elsewhere, and that's not changing for the
> foreseeable future.
> 
>   the good news is that those utilities don't need to have any info on
> the default environment for u-boot -- they need only have access to
> the environment in flash, and there is a /etc/fw_env.config file that
> is all set up and ready to go and referring to the correct device and
> offset in flash.
> 
>   so how do i specify that i want to add that recipe to my build,
> while saying, "don't worry about the default environment, you don't
> need it." can that be done? thanks.

The "easy" way out here is to just set a valid (as in, compiles)
UBOOT_MACHINE and then not worry about installing U-Boot from the OE
build.  You can ASSUME_PROVIDED away u-boot itself, but you still need
to have a UBOOT_MACHINE set so that we configure U-Boot before building
the tools (And you  must configure before building).

-- 
Tom

