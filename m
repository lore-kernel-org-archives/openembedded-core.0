Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1T6jtG-0008PE-2J for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 17:09:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7TEuu4l017870;
	Wed, 29 Aug 2012 15:56:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16660-07; Wed, 29 Aug 2012 15:56:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q7TEugjP017864
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 29 Aug 2012 15:56:45 +0100
Message-ID: <1346281003.3283.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Wed, 29 Aug 2012 15:56:43 -0700
In-Reply-To: <9f48122d927aa0253b5f5a4e0f3dfe242c557d4e.1346236551.git.kai.kang@windriver.com>
References: <cover.1346236551.git.kai.kang@windriver.com>
	<9f48122d927aa0253b5f5a4e0f3dfe242c557d4e.1346236551.git.kai.kang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Add dependency libidn to 3 packages
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
X-List-Received-Date: Wed, 29 Aug 2012 15:09:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-29 at 18:39 +0800, Kang Kai wrote:
> Add dependency libidn to wget, ghostscript and msmtp. These packages
> check libidn automatically to build with or without libidn.
> When libidn has been populate to sysroot but doesn't create rpm/deb
> package, create image will fail as follow:

What do we gain by adding this dependency? Do we need it?

Cheers,

Richard



