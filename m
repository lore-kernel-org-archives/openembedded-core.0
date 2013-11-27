Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 433C06C739
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:34:36 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id q10so8950578pdj.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 18:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=bMzzeYSIKTsNsbAQh1tTqe1yFoIRZCPeLhuzUFs7riU=;
	b=F3MhQuhSwJE/K2NV2zCCXnWVCUj+pQ8ua94gRh/7H0zdK1Tg460bpy+IE4PJ3ZuQk1
	GlUcC+wQcX315P6DpVw+kAJdiceSQHpvCGXFSV52GZ1kC0nGB7+ND30VLgege8xyd+Dm
	TBJXA47eSQM1BgpV5YpJVOPgdhjJo9YymYCkddL6lJo9KsYSVBvNIQoLf3MFb4ckDgaw
	VAPkTWdv1aPweVguaZtNI6iIP8wL6rcLjVNaWCOpchC8d9zt85Bs8WYcYvqPAQhHVpGC
	22mgML0cCYIumhJ5hKBEqv05V9aOJhITOAiOGGj1EAGu6UZQ4v1iNCDHkVcQOWfniWzY
	Kznw==
X-Received: by 10.68.175.66 with SMTP id by2mr2534693pbc.172.1385519675707;
	Tue, 26 Nov 2013 18:34:35 -0800 (PST)
Received: from yiqingliang-pc.localnet ([49.65.161.88])
	by mx.google.com with ESMTPSA id
	wp8sm83988217pbc.26.2013.11.26.18.34.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 18:34:34 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Nov 2013 10:26:50 +0800
Message-ID: <1385519843.Wb3uGFo0b4@yiqingliang-pc>
User-Agent: KMail/4.11.3 (Linux/3.11.6-1-ARCH; KDE/4.11.3; x86_64; ; )
In-Reply-To: <20131127020336.GO2870@jama>
References: <72922584.TJuWgrnFYb@yiqingliang-pc> <20131127020336.GO2870@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: kernel and boost will recompile every time
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
X-List-Received-Date: Wed, 27 Nov 2013 02:34:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, November 27, 2013 03:03:36 AM Martin Jansa wrote:
> On Wed, Nov 27, 2013 at 09:51:22AM +0800, Yi Qingliang wrote:
> > Hello.
> > 
> > 	I know the kernel will recompile every time for recent update, and I
> > 
> > found the boost will also do like that, even I have sstate cache in my own
> > server.
> > 
> > 	How to debug this problem?
> 
> kernel rebuilding was fixed few days ago, do you have latest revision?
> 
> You can use scripts/sstate-diff-machines.sh to "store" the signatures
> and then compare them when you notice something unexpectedly rebuilding.

thanks, I will try


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

