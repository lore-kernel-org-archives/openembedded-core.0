Return-Path: <matt@console-pimps.org>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 36AC160144
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 13:24:45 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id w62so11081430wes.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 06:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=hhbhDeQCkU4S8cVhoKsgWzn7dqbbWAstyzXsfue+no4=;
	b=jrSmz3WD6NRTlxbW9QIaKRCAY0J+NCgsa1mHWdELeSHHch6PBpX7t2fO0jnu74WFkh
	DRA0Dzh9tRL5JYzkJOtryIkZX8nU58XZVHlLr6gzX5zfe1YHHUx2d+j29wb3XPHfaePj
	Zj6xsgVt8KZkiz+q7iFSyrJGwdIym3D3slkFSBH4sNeaJj5UzGZx3c8txzoUoVQUBrr+
	LwDw7mfvEpt6zcWp2cNjLRqaCBGl7Uup8+YO7pGM71uCw0ilRj8q/plNK1OOazdjDIVG
	3uMzljmMfRWbxPuy6WZrPHnW9AGayib/dxe48frTvQvd/zSkcmybU8mg+wWi4Dk7KgIX
	0J6A==
X-Gm-Message-State: ALoCoQnKqkGRPB/C/SepSO8RqRZPHch7kn+fR431QMsIFjWErlVhzIMhTJWVmmlfJinQYM422qhc
X-Received: by 10.194.184.101 with SMTP id et5mr4680460wjc.14.1407936286461;
	Wed, 13 Aug 2014 06:24:46 -0700 (PDT)
Received: from localhost (05428d07.skybroadband.com. [5.66.141.7])
	by mx.google.com with ESMTPSA id dc3sm4422521wjc.27.2014.08.13.06.24.45
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Aug 2014 06:24:45 -0700 (PDT)
Date: Wed, 13 Aug 2014 14:24:44 +0100
From: Matt Fleming <matt@console-pimps.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140813132444.GO15082@console-pimps.org>
References: <1407935023-9284-1-git-send-email-matt@console-pimps.org>
	<1407935023-9284-2-git-send-email-matt@console-pimps.org>
	<1407935836.22187.68.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1407935836.22187.68.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Matt Fleming <matt.fleming@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] recipes-extended: Add iasl recipe
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
X-List-Received-Date: Wed, 13 Aug 2014 13:24:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 13 Aug, at 02:17:16PM, Richard Purdie wrote:
> On Wed, 2014-08-13 at 14:03 +0100, Matt Fleming wrote:
> >+NATIVE_INSTALL_WORKS = "1"
> > +BBCLASSEXTEND = "native"
> 
> Please remove the NATIVE_INSTALL_WORKS, you don't need it!
> 
> You're making me feel old, I remember why that was added (by me iirc),
> what it did and also removing it. Its never been needed with OE-Core and
> if that is any any modern layers, it should be removed.

Sure, I'll get it removed in the next version (along with the Cc's since
they're bouncing anyway).

Thanks.

-- 
Matt Fleming, Intel Open Source Technology Center

