Return-Path: <trini@konsulko.com>
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0E7BA73182
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 15:23:37 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id f74so27149177qge.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 08:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=GSNqAXqVAVqjFjw97ZDDKro5bpQSD32X6T7pHX79S9w=;
	b=Z6eZys4IiYE3RhbFKcwyhNFuhDLdzUoSVasdMLL1ssYvsmO6m2CIJ5qLzQpWUOMzfT
	+46laOw1PG5qu0nc3J07SewwHXcTLxJScsvdA43GL/X1jgHvnDs8ieTuyA+Rf2OcVv6D
	USaIQF6KdNASjVrogpf2bFv+2gSroDTetgQws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=GSNqAXqVAVqjFjw97ZDDKro5bpQSD32X6T7pHX79S9w=;
	b=A6Y5/n6KM2rcdIin2W5Rowu27N41iCUUnMd3Ldq5iC874ruzitkFSiKXZ3vSYzbOLa
	nJpdKHc1mRLO69fcqbn+PzGDhJZK8H4lR4ODsu4RCFtc6EMc57zgmL4auG9KMxlA/T8W
	NNjSdvh0fJQrGVQ8ar7SmNjsfxg5Lyqhw36+Tb66EFQ1IzQCBLK96CtPtBKTCNlWWcU0
	DWy492AuMDv1luJaKl7WTPLoXrq6GEjuuw39lGpQcVxIRo8xljve1P6nRFaokKtfp5KN
	S1ejPV+PS2lU8yzDfdETUzbw8d60lhjsCoPU3qPIfYfrnVEb9NoB3/YupkY+p0QJr0PM
	dEKw==
X-Gm-Message-State: AOPr4FWTxMr3DSUPLKuYpfNghkJ7igD00nvr5Am0cFIMcBPdjIVLQ2jaEQiLDXVXoMqZ2g==
X-Received: by 10.141.0.8 with SMTP id b8mr11815489qhd.104.1461165818289;
	Wed, 20 Apr 2016 08:23:38 -0700 (PDT)
Received: from bill-the-cat ([2001:470:8:32a:225:22ff:fec3:d28d])
	by smtp.gmail.com with ESMTPSA id
	d65sm3904193qka.38.2016.04.20.08.23.37
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 08:23:37 -0700 (PDT)
Date: Wed, 20 Apr 2016 11:23:40 -0400
From: Tom Rini <trini@konsulko.com>
To: Yannick Gicquel <yannick.gicquel@iot.bzh>
Message-ID: <20160420152340.GE1924@bill-the-cat>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
	<1461160239-7799-4-git-send-email-yannick.gicquel@iot.bzh>
MIME-Version: 1.0
In-Reply-To: <1461160239-7799-4-git-send-email-yannick.gicquel@iot.bzh>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH v2 3/4] kernel: fitimage: support device tree compiler options
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
X-List-Received-Date: Wed, 20 Apr 2016 15:23:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 20, 2016 at 03:50:38PM +0200, Yannick Gicquel wrote:

> This introduces a new variable to set the device tree compiler options while
> calling mkimage ('-D' option). By default, this variable is not set but it can
> be defined in a configuration file, as following example:
> 
> UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
> 
> Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

