Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Sen.Zhang@windriver.com>) id 1UcsMT-0004mP-5X
	for openembedded-core@lists.openembedded.org;
	Thu, 16 May 2013 09:12:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4G6sBKt028748
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2013 23:54:11 -0700 (PDT)
Received: from [128.224.162.230] (128.224.162.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 15 May 2013 23:54:10 -0700
Message-ID: <51948307.5070608@windriver.com>
Date: Thu, 16 May 2013 14:56:07 +0800
From: Jesse Zhang <sen.zhang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
X-Originating-IP: [128.224.162.230]
Subject: should perl modules go in oe-core? (possibly python and ruby ones too)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 May 2013 07:12:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi,

We've accumulated quite a few perl modules and would like to contribute
some/all of them to oe-core. But I think we'd better ask how everyone
thinks before doing so, since the number of the modules are pretty
large, and the policy may as well apply to python/ruby packages.

Most of the modules are simple cpan recipes. They are easy to maintain,
but do consume *some* manpower.

I think there are a few alternatives.

1. decide on each module on a case-by-case basis.

2. keep all of them in some special layer other than oe-core.

3. everyone maintain what they need in-house.

None of them seems perfect. Is there already some policy?

jesse


