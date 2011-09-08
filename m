Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R1aUx-0005eg-HZ for openembedded-core@lists.openembedded.org;
	Thu, 08 Sep 2011 11:02:15 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8893Asd022121 for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2011 10:03:10 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xzncssekuxeb
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2011 10:03:09 +0100 (BST)
Received: from [192.168.1.40] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p88933k1022107
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Sep 2011 10:03:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <fc7bc3e00722ddc9c5ae1b4c7866cf5cd313538c.1315466194.git.sgw@linux.intel.com>
References: <cover.1315466194.git.sgw@linux.intel.com>
	<fc7bc3e00722ddc9c5ae1b4c7866cf5cd313538c.1315466194.git.sgw@linux.intel.com>
Date: Thu, 08 Sep 2011 09:57:00 +0100
Message-ID: <1315472220.13021.54.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PULL v2 1/1] python-native: add link for python2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Sep 2011 09:02:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-08 at 00:18 -0700, Saul Wold wrote:
> Add link for python2 as some configuration tools search from a python2
> and could find the host python instead of the python-native.
> 
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../recipes-devtools/python/python-native_2.6.6.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)

Merged to master. Interesting find!

Cheers,

Richard



