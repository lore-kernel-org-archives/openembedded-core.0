Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 12ED8605F3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 08:04:17 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5L8AZeX014281; Fri, 21 Jun 2013 09:10:36 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5KeS-Z6Nk2z5; Fri, 21 Jun 2013 09:10:35 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5L8AV59014278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 21 Jun 2013 09:10:32 +0100
Message-ID: <1371801843.20823.281.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Holger Hans Peter Freyther <holger@moiji-mobile.com>
Date: Fri, 21 Jun 2013 09:04:03 +0100
In-Reply-To: <20130621063103.GE15853@xiaoyu.lan>
References: <20130621063103.GE15853@xiaoyu.lan>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: AUTOINC ending in filenames in tmp/deploy/images
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
X-List-Received-Date: Fri, 21 Jun 2013 08:04:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-21 at 08:31 +0200, Holger Hans Peter Freyther wrote:
> Hi,
> 
> I am building an U-Boot from git and the file in tmp/deploy/images contains
> AUTOINC instead of the replaced git version.
> 
> $ ls images/u-boot-sysmobts-v2-v2011.12+gitAUTOINC+40d74c99ac-r17.bin
> 
> This is with Poky from yesterday, is this a known issue of the AUTOINC? The
> filename is set with 'u-boot-${MACHINE}-${PV}-${PR}' and the PV is like
> this 'v2011.12+git${SRCPV}'.

Use PKGV and PKGR instead of PV and PR and this should work better.

Cheers,

Richard



