Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id A68936B9D6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 11:20:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r82BWqrV013232; Mon, 2 Sep 2013 12:32:52 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7AkK8kyIZ9bb; Mon,  2 Sep 2013 12:32:52 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r82BWnai013214
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 2 Sep 2013 12:32:50 +0100
Message-ID: <1378120790.1059.183.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 02 Sep 2013 12:19:50 +0100
In-Reply-To: <20130828083339.GI3544@jama>
References: <1373152387-19393-1-git-send-email-Martin.Jansa@gmail.com>
	<20130828083339.GI3544@jama>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 1/4] package.bbclass: move reading shlibs providers to separate function
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
X-List-Received-Date: Mon, 02 Sep 2013 11:20:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-08-28 at 10:33 +0200, Martin Jansa wrote:
> On Sun, Jul 07, 2013 at 01:13:04AM +0200, Martin Jansa wrote:
> > * prepare for reading shlibs providers only from dependency tree of
> >   current recipe
> > 
> > [YOCTO #4628]
> 
> Any comment on this patchset?
> 
> I'm using first 3 commits for some time in world builds and they helped
> me to discover some unexpected shlib providers (and fix them by setting
> PRIVATE_LIBS).

It was sent as an RFC and the last patch was incomplete so it dropped
off the radar :(.

If we remove the "continue" in 2/4 and maintain existing behaviour with
a warning, it would probably seem reasonable. I'll have a further look
at them.

Cheers,

Richard




