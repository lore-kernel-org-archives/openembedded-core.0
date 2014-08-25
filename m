Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 60C596FCE0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 23:27:53 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so22132703pab.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9CjJ17GTy7Y3wPlrzlj7gGTkcNZEVPY51nlF/c0T1Ek=;
	b=uwi8vOyfLASKOApkJlXeQmURmvB9DiMQgJ1yyWWVuysrX5zZnLYuJWOz4X9ABwxLQu
	5qpbu62RjrMVRAZEIxaDarWak7O9Nyq3whMnCvTjp1sIZOPw+vySJTPh+TgrzZkRU6vA
	zBJMEktZB/86rnlGjfntLGejAwfaQ8u7W1UsefLYVvwqRa5yJNyeruYVATsU1rD3zgxi
	74ijA5gm3vGu3RPVZzi8Hgj1Qk4MRI5qQpnIblgYe5n8yPqDGZ1O5d9fnIDTlTrflGkN
	7JillIMP4FfyA/r5lzWkKQCPeaowcbcFWlvazBr8mkdOht9XwMftQfGkM0/FrLbM3FIa
	gMSQ==
X-Received: by 10.70.125.165 with SMTP id mr5mr2748164pdb.102.1409009274660;
	Mon, 25 Aug 2014 16:27:54 -0700 (PDT)
Received: from haswell ([2601:9:3580:7a5:baca:3aff:fe80:aa8f])
	by mx.google.com with ESMTPSA id qg6sm1625209pdb.5.2014.08.25.16.27.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Aug 2014 16:27:54 -0700 (PDT)
Date: Mon, 25 Aug 2014 16:31:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
Message-ID: <20140825233139.GB9458@haswell>
References: <1408935491-79054-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<20140825160425.GB21358@haswell>
	<1409007467.2532.13.camel@besquive-mobl.amr.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1409007467.2532.13.camel@besquive-mobl.amr.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Andreas Schwab <schwab@linux-m68k.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] eglibc: Fix to egrep 'yes$' instead 'yes' at configure
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
X-List-Received-Date: Mon, 25 Aug 2014 23:27:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 14-08-25 17:57:47, Benjamin Esquivel wrote:
> To Khem and Andreas, 
> 
> I would say that the proposed patch is based on the existing design, a
> corner case was found and it deserves a fix but not so sure about
> redesigning it
> 
> By redesign I mean to modify also the part where the string is thrown
> into the conftest.c
> 
> Please let me know your thoughts

there is nothing wrong in redoing it. It would fix the issue and make it
more readable too.

