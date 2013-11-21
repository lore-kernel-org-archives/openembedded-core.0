Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id B79C46D544
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 13:50:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALDoFuW007695; Thu, 21 Nov 2013 13:50:15 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JIzA6t3gjTov; Thu, 21 Nov 2013 13:50:15 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rALDoApS007686
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 21 Nov 2013 13:50:12 GMT
Message-ID: <1385041807.16887.131.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 21 Nov 2013 13:50:07 +0000
In-Reply-To: <528E0D2D.4010202@windriver.com>
References: <cover.1384419666.git.hongxu.jia@windriver.com>
	<ac4248f073a505534a6fc9b7c9922b6781b85685.1384419666.git.hongxu.jia@windriver.com>
	<528E0D2D.4010202@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 1/1] lib32-packagegroup-core-nfs: fix qa issue - install files into a shared area when those files already exist
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
X-List-Received-Date: Thu, 21 Nov 2013 13:50:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-11-21 at 21:39 +0800, Hongxu Jia wrote:
> Hi All,
> 
> In this case, there are two 'packagegroup-core-nfs-server-1.0-r2.0.all.rpm'
> in tmp/deploy/rpm/all. One is made by 'bitbake packagegroup-core-nfs ',
> and the other is made by 'bitbake lib32-packagegroup-core-nfs '.
> The last one overrode the previous triggered the QA check.
> 
> By default, packagegroup inherit allarch, which means the PACKAGE_ARCH
> is "all".
> 
> Is it proper that 'all' packages are not supposed to be expanded into the
> multilib versions?

Yes.

> There are some other packagegroup recipes have the similar issue.

It sounds like there is some configuration causing this to get rebuild.
Can you run bitbake-diffsigs on the stamps for the two tasks and see why
its building this twice? It sound only happen once.

Cheers,

Richard


