Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7C9720D6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jan 2015 01:27:08 +0000 (UTC)
Received: by mail-pa0-f47.google.com with SMTP id kq14so21945362pab.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Dec 2014 17:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=e3bGQYVwSIYIm79Q6jfEPaxd2wwfEibHmTqhC8EixsM=;
	b=pxhozrEt/zpHhJVTJ1NRXkyjFNjFZeR/0aXvY+qkZWMWDDj11tE+ni9P62TnOFEF4y
	8VroLZaZYsotaXFW7NOiYAs3Tvs68nx2TIRQFHURjCTH4MzBm1ZHVYYJUj9k2XLB9gNr
	OrF7nHtvsmfG5sZZMbPoikE1rqBvS9urFogPWkpimDq2pDURj3G7Uuky2Ift/zHdx69L
	QX9yyooONqTX0n3inW6SShDDq5do/Q2pgJUOGQkaqiAAMWFwFSTea5bOzOhg4DJKll2n
	f3L7TVR1LKELsMYxDKgNiw8fr5ZR2kOkJzx0WDLGqfIyPjKYxNG36Uf12laH0MEqfVqY
	IZvg==
X-Received: by 10.68.193.225 with SMTP id hr1mr98572915pbc.15.1420075628902;
	Wed, 31 Dec 2014 17:27:08 -0800 (PST)
Received: from ?IPv6:2601:9:3580:84c:91e4:f8f7:9c14:a30c?
	([2601:9:3580:84c:91e4:f8f7:9c14:a30c])
	by mx.google.com with ESMTPSA id
	pb6sm42360187pbb.13.2014.12.31.17.27.07
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 31 Dec 2014 17:27:08 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <753fbc2e1bfa852129865ba40212607cefc6ad09.1418885581.git.kai.kang@windriver.com>
Date: Wed, 31 Dec 2014 17:27:07 -0800
Message-Id: <B9A5BF78-4EBF-4BDA-BAFC-F32B8E358782@gmail.com>
References: <cover.1418885577.git.kai.kang@windriver.com>
	<753fbc2e1bfa852129865ba40212607cefc6ad09.1418885581.git.kai.kang@windriver.com>
To: Kai Kang <kai.kang@windriver.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 13/19] runqemu: add qemuarm64 support.
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
X-List-Received-Date: Thu, 01 Jan 2015 01:27:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Dec 18, 2014, at 12:51 AM, Kai Kang <kai.kang@windriver.com> wrote:
> 
> +        "qemuarm64")
> +            mem_size=128
> +            ;;

there is a limit on 32bit arm but is it same for 64bit as well ?
if not can we use 512 or 256 atleast

