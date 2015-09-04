Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A19C576FC9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84FXXmM006411; Fri, 4 Sep 2015 16:33:33 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id z_Aj5Cpz7yUr; Fri,  4 Sep 2015 16:33:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t84FXKLR006408
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 4 Sep 2015 16:33:32 +0100
Message-ID: <1441380800.24871.173.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 04 Sep 2015 16:33:20 +0100
In-Reply-To: <2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
References: <1441380461.24871.171.camel@linuxfoundation.org>
	<2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: Set gcc 5.2 as the default
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
X-List-Received-Date: Fri, 04 Sep 2015 15:33:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-04 at 08:29 -0700, Khem Raj wrote:
> > On Sep 4, 2015, at 8:27 AM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > -GCCVERSION ?= "4.9%"
> > +GCCVERSION ?= "5.2%"
> 
> a small nit. Make it 5.% to logically indicate that 5.x is a bug fix release and next big upgrade will be
> 6.x

I'm not sure this would be a good idea. We have had 4.8 alongside 4.9
and can imagine doing something like that with newer 5.x releases
depending on how they work out. I doubt 5.2% hurts anything, apart from
needing to tweak that file slightly more often...

Cheers,

Richard




