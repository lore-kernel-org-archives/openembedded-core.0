Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2666ABF3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 14:07:26 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id kq13so3415144pab.39
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2013 07:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=h3HecRrt9P8gFJf6bsCUphuNmWa2NEixzUxbgAxaxno=;
	b=cyrgFKvLcgnmND2OZj1xBn9E+UPbrsNKuywriarddJ1Z7ITjMH00fc/bTBzMZzM2o3
	orE1C1H7G1juvPsVvDgMOdB3+rR2XplDVwUZwP6Av3I2BNAS414DP04/ZjxDsvQC2q6y
	GBtxrjVkU5SguSJb+0ngSQHNCD9d0Vpw5jC7pocNcdJqhbu7RXkck7iGkQ6132YysImT
	TyvpmYNHU1VnKlMovjg2KiHnA0UQfTCHBQQM0kHL5E5+P+TqFBBl9QAZDEe/42GXua/m
	Z17SUiJMQXJdA7MTS8QP4lV+zXVdPT6SQoJh5pDJVhRaOKErmA4Ki27njtDILe+/59yb
	jHQg==
X-Received: by 10.68.179.99 with SMTP id df3mr16117374pbc.198.1372514847154;
	Sat, 29 Jun 2013 07:07:27 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id b4sm13010437pba.45.2013.06.29.07.07.25
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 29 Jun 2013 07:07:25 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130629052911.GP3261@jama>
Date: Sat, 29 Jun 2013 07:07:26 -0700
Message-Id: <567DDFA0-3AD6-42DA-9850-C3FCA0F4C3EF@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<984ceb9c26e5fc05dcad1046f8ebf396a9034e10.1372456294.git.raj.khem@gmail.com>
	<20130629052911.GP3261@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 04/24] classes/distutils: Introduce PYTHON_PN
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
X-List-Received-Date: Sat, 29 Jun 2013 14:07:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


On Jun 28, 2013, at 10:29 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

>> inherit distutils-base
>> +#distutils-tools
> 
> ^^ do we need this?

No, update the pull branch with fix

