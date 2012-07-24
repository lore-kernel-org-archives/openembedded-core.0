Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Stcry-0000BZ-Aj for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 13:01:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6OAoAhZ029565;
	Tue, 24 Jul 2012 11:50:10 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28768-04; Tue, 24 Jul 2012 11:50:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6OAnusA029552
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 24 Jul 2012 11:50:01 +0100
Message-ID: <1343126992.22222.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jul 2012 11:49:52 +0100
In-Reply-To: <7affb352c173c353df0b69002f3ca0f5ee0502cf.1343124846.git.liezhi.yang@windriver.com>
References: <cover.1343124846.git.liezhi.yang@windriver.com>
	<7affb352c173c353df0b69002f3ca0f5ee0502cf.1343124846.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] package-index: inherit pythonnative
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
X-List-Received-Date: Tue, 24 Jul 2012 11:01:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-24 at 18:19 +0800, Robert Yang wrote:
> The native python binary has been moved from usr/bin/python to
> usr/bin/python-native/python, the recipe which needs python-native
> should "inherit pythonnative", otherwise there would be errors when the
> python script runs.
> 
> [YOCTO #2822]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/meta/package-index.bb |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)

Which part of this recipe needs python-native? Shouldn't scripts which
need pythonnative be using the path to the python interpreter
explicitly?

Cheers,

Richard



