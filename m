Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Swi7C-0007Ky-LR
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 01:14:06 +0200
Received: by yhjj56 with SMTP id j56so7203316yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 16:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=MSeCjqwTdMHwhX1rCqcz4UoukoW3iYnBtJ+qn36Won0=;
	b=CryPoIeTxUndvO1JG+SesO59F1hKAz4pjwkOnCVPYmYhWl+MqUdHU3sEmCWLUeWv0C
	JU6CAU2+UzWHkppg5S5tQiQnW2gleYRL8kd4E6KZNnyIejOkFN3Kcp0r8xzjSh6o58f3
	zWqu/BZIA+xYi87L8bCrJ8+Pjg36mxHELgsIKFFPNMJNMy1xm54KYJ5jCijpn5WGkJ3m
	JmzX5ZHzTyjUbB6wDG4gluaQKwOlSR51EanCW/NwKEhfedTfGe11ww5Y4voziSYTgv0R
	KCqQl4Xrp8O14R2skWWUTk8aXAMTm9lN+qJfUkAZUmzs6KKP26ox9v1BNrEtEfnoJBXq
	Gy9g==
Received: by 10.50.46.230 with SMTP id y6mr6840200igm.20.1343862146927;
	Wed, 01 Aug 2012 16:02:26 -0700 (PDT)
Received: from [10.11.81.126] (corp.force10networks.com. [64.186.164.204])
	by mx.google.com with ESMTPS id ud8sm8238166igb.4.2012.08.01.16.02.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 16:02:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20120801065401.GD15199@jama.jama.net>
Date: Wed, 1 Aug 2012 16:02:24 -0700
Message-Id: <8071B2D8-3431-4B9B-A810-0F01D4837779@gmail.com>
References: <20120801065021.GC15199@jama.jama.net>
	<20120801065401.GD15199@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 23:14:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Jul 31, 2012, at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> well not exactly like this one as this is causing
> /bin/sh: 1: Syntax error: Bad fd number
> probably from ">&" in dash


yes. I swear I have since fixed this patch this seems to be an older version
did you look into meta-ti/master ?




