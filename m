Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E023B60110
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 22:34:17 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1a6Qps-0001qI-9p; Tue, 08 Dec 2015 23:34:16 +0100
Message-ID: <1449614049.2002.11.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: akuster <akuster@mvista.com>
Date: Tue, 08 Dec 2015 22:34:09 +0000
In-Reply-To: <56674604.3030900@mvista.com>
References: <1447263707-27696-1-git-send-email-akuster808@gmail.com>
	<1447263707-27696-2-git-send-email-akuster808@gmail.com>
	<56670658.3070109@gmail.com> <1449597115.1472.179.camel@pbcl.net>
	<56674604.3030900@mvista.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ldconfig: add method to extend ldconfig search dirs
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
X-List-Received-Date: Tue, 08 Dec 2015 22:34:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-08 at 13:05 -0800, akuster wrote:
> This is for ldconfig-native. The homebrew OE created. It has hard coded
> search patches. So OE only supports the standard /usr/* /lib* paths in
> the native part of the build.

In that case, given that you're talking about image construction, isn't
the right thing to make ldconfig-native respect whatever search paths
it's given by /etc/ld.so.conf in the image filesystem?

> so its using the default in the native ldconfig:
> 
> #ifndef LD_SO_CONF
> # define LD_SO_CONF SYSCONFDIR "/ld.so.conf"
> #endif

I assume the point you're making here is that this ends up reading the
host's /etc/ld.so.conf, not the one in the image.  Is that right?

p.



