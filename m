Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D4D465CE6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 09:54:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s679sPp0020366; Mon, 7 Jul 2014 10:54:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ec1ylt_ssGlp; Mon,  7 Jul 2014 10:54:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s679sMhM020351
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 7 Jul 2014 10:54:23 +0100
Message-ID: <1404726856.1458.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Mon, 07 Jul 2014 10:54:16 +0100
In-Reply-To: <53BA697F.8060604@windriver.com>
References: <1403922753-33481-1-git-send-email-liezhi.yang@windriver.com>
	<53BA697F.8060604@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH V2] base.bbclass: show git summary in BUILDCFG_HEADER
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
X-List-Received-Date: Mon, 07 Jul 2014 09:54:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-07-07 at 17:33 +0800, Robert Yang wrote:
> On 06/28/2014 10:32 AM, Robert Yang wrote:
> > It was:
> > meta
> > meta-yocto
> > meta-yocto-bsp    = "master:3a054dc27067efaae9150b465298d9c45d728f85"
> >
> > Now:
> > meta
> > meta-yocto
> > meta-yocto-bsp    = "master:3a054dc base.bbclass: show git summary in BUILDCFG_HEADER"
> 
> Any objections on this patch, please ? Or I will send a regular patch.

Being able to find the full sha1 can be useful and is something I use
periodical but I also understand why you want more information here.

So I have mixed feelings on it...

Cheers,

Richard


