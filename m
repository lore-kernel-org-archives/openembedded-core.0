Return-Path: <marcin@juszkiewicz.com.pl>
Received: from tygrysek.juszkiewicz.com.pl (tygrysek.juszkiewicz.com.pl
	[178.33.81.99])
	by mail.openembedded.org (Postfix) with ESMTP id 002A8608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 16:02:12 +0000 (UTC)
Received: from [192.168.0.102] (87-206-152-156.dynamic.chello.pl
	[87.206.152.156])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id A1400D22B2;
	Fri, 31 May 2013 18:02:13 +0200 (CEST)
Message-ID: <51A8C982.6040006@juszkiewicz.com.pl>
Date: Fri, 31 May 2013 18:02:10 +0200
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <1370015692-22428-1-git-send-email-mark.hatle@windriver.com>
	<1370015692-22428-2-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1370015692-22428-2-git-send-email-mark.hatle@windriver.com>
X-Enigmail-Version: 1.4.6
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gcc: add build directory to include directories
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
X-List-Received-Date: Fri, 31 May 2013 16:02:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

W dniu 31.05.2013 17:54, Mark Hatle pisze:
> From: "Roy.Li" <rongqing.li@windriver.com>
> 
> [ CQID: WIND00386962 ]
> 
> Add build directory to include directories by -I${B}/include which will
> be searched before standard system include directories.
> 
> Both libunwind and gcc supply unwind.h, once gcc use libunwind's unwind.h,
> the compiling will fail.
> 
> This patch is generally not applicable to the upstream as they do not
> use libunwind.
> 
> (LOCAL REV: NOT UPSTREAM)
> 
> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>

Acked-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>

It works! Thanks a lot guys.

