Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id E9A7D6E9D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 02:40:59 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id rq2so17648150pbb.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 18:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=GDWloVYANH/LuUxKvS9Rg1OWaF7G9ktw0yYqPAA4nx4=;
	b=clVnlQlc15yfkPrNkENIbyfSX9U/Q5tJFJGOLn3iDiXxzgPAKKVgtqXLxILSUpAT9q
	Dw7KqIqMQwgbtUF1w1uB17JOR7USZ7WhPCzhf56//cpefBdDCoGAxPwkQWDBxAanMVZY
	JqUNKGXFUdEtwam1jNo/1fsE/CvwAoWRVzEgbkBFGZbJOu82ydcgZDfCwgx2iKsA4hwm
	87PmrR/y3D8CuQCAza+iyMosZt34lzPqfXJCJ5/3N6glpbFUnsiB5U7k0xwwY2QRYbdn
	pEX+9WZee/1k6zf98ORJHcepTThyBmbIGa1hWqkaDDSRn3QkhZpT34YhEc/PYcHsf+2j
	O6OA==
X-Received: by 10.68.171.193 with SMTP id aw1mr36758178pbc.117.1392777661003; 
	Tue, 18 Feb 2014 18:41:01 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	id1sm60737954pbc.11.2014.02.18.18.40.53 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 18:40:54 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1392777327-12786-1-git-send-email-yanjun.zhu@windriver.com>
Date: Tue, 18 Feb 2014 18:40:51 -0800
Message-Id: <DFFB071F-AB89-462B-97F6-95F4EE0A766B@gmail.com>
References: <1392777327-12786-1-git-send-email-yanjun.zhu@windriver.com>
To: Zhu Yanjun <yanjun.zhu@windriver.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nmap: use native python and add python dependence
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
X-List-Received-Date: Wed, 19 Feb 2014 02:41:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Feb 18, 2014, at 6:35 PM, Zhu Yanjun <yanjun.zhu@windriver.com> wrote:

> +export BUILD_SYS
> +export HOST_SYS
> +export STAGING_LIBDIR
> +export STAGING_INCDIR
> +

why are these needed ?

