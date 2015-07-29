Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id EF6FC7622A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 20:57:11 +0000 (UTC)
Received: by pacan13 with SMTP id an13so11490843pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to
	:content-type;
	bh=uCNF9Dtj2n89xoy9nPSMmc0tWYLjhuvdxE9P4bRIYpA=;
	b=Mq6r0RQnh1iL1hZ7EXgZCqNti6YAAaplBEwvVO0NDPraa8d/fECVazp/XdHOGUYZrs
	ldHv4fwU1evc/AI8+j/dLKJd0O1Cqdqy5samqJYLZzTjn/Q2K2/y/9qW/ZXZCR8cviBG
	bJqPsvQ3R+elfyyFxyH4LQZm8vghHXG6aO/Fl00JQ1mYL/DxvO/8HtfsssMmkQ8OGda8
	Hi8xkPg2Xrn//bJp+QoIvjXs+27+TV26WlujPSDX5Sv/Fgwk/3dZiEtNg4NxSLRDbaVU
	nlGj5VIdfHfkGoIBzPSomAURdyA/Z0UzYZdFYhS5vTX3iu9Ig1jmD5LCQFcQUXORPnSS
	rXPw==
X-Gm-Message-State: ALoCoQliNTzQI+VQM6oxXLd139tuGtAJl9qyvjo/8CtR/Vkk6ZyCwtlCYIJRyUgsSzJBBn8pYrYu
X-Received: by 10.66.119.174 with SMTP id kv14mr86405438pab.115.1438203431745; 
	Wed, 29 Jul 2015 13:57:11 -0700 (PDT)
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com.
	[209.85.192.179]) by smtp.gmail.com with ESMTPSA id
	ex13sm42599878pac.17.2015.07.29.13.57.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Jul 2015 13:57:10 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pdbbh15 with SMTP id bh15so11742322pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jul 2015 13:57:08 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.70.118.163 with SMTP id kn3mr80356614pdb.115.1438203428992; 
	Wed, 29 Jul 2015 13:57:08 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 29 Jul 2015 13:57:08 -0700 (PDT)
Date: Wed, 29 Jul 2015 17:57:08 -0300
Message-ID: <CAP9ODKrUcnyNQSfevaHLFcW63tjb3pDN4AvHmfoQOjvuLe4+cg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	"Lock, Joshua" <joshua.lock@intel.com>
Subject: [for-fido] Backport for perf - support for 4.1 kernels
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
X-List-Received-Date: Wed, 29 Jul 2015 20:57:13 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Is it possible for you to cherry-pick OE-Core:46f8420 for Fido? We got
one board using 4.1 kernel and it fails badly.

It is in use in master since April and had no change since its
inclusion so it is fairly safe.

Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

