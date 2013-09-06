Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 55A7B6BEA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2013 14:35:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86EmNOs024580; Fri, 6 Sep 2013 15:48:24 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vqrT6wNy5oM5; Fri,  6 Sep 2013 15:48:23 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r86EmKkN024572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 6 Sep 2013 15:48:22 +0100
Message-ID: <1378478098.3484.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Date: Fri, 06 Sep 2013 15:34:58 +0100
In-Reply-To: <1378474690-39713-3-git-send-email-mihaela.sendrea@enea.com>
References: <1378474690-39713-1-git-send-email-mihaela.sendrea@enea.com>
	<1378474690-39713-3-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] gcc-runtime: Add ptest
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
X-List-Received-Date: Fri, 06 Sep 2013 14:35:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-06 at 15:38 +0200, Mihaela Sendrea wrote:
> libstdc++-v3 tests need g++ installed on the target, otherwise the
> majority of the tests will fail.

Shouldn't that be listed in RDEPENDS then? I'm guessing the problem is
that adds the target gcc into the build and kills performance? :/

Rather tricky :(

Cheers,

Richard



