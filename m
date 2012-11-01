Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TTtQN-0006Ba-WE for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 12:59:04 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA1BjQ1T007745;
	Thu, 1 Nov 2012 11:45:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15538-05; Thu,  1 Nov 2012 11:45:21 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qA1BjILA007739
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Thu, 1 Nov 2012 11:45:19 GMT
Message-ID: <1351770317.6502.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Xin Ouyang <Xin.Ouyang@windriver.com>
Date: Thu, 01 Nov 2012 11:45:17 +0000
In-Reply-To: <97f30a7d4fa7b7ed6a9992512f5c727af5dc4504.1351759577.git.Xin.Ouyang@windriver.com>
References: <cover.1351759577.git.Xin.Ouyang@windriver.com>
	<97f30a7d4fa7b7ed6a9992512f5c727af5dc4504.1351759577.git.Xin.Ouyang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0: inherit pythonnative
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
X-List-Received-Date: Thu, 01 Nov 2012 11:59:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-01 at 16:53 +0800, Xin Ouyang wrote:
> glib-2.0 needs to inherit pythonnative because it will run python
> scripts to generate codes while do_compile.
> 
> This has caused problems on some hosts(SLED11.2) if no python-xml
> installed.
> 
> [Yocto 2843]
> 
> Signed-off-by: Xin Ouyang <Xin.Ouyang@windriver.com>
> ---
>  meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

This is going to adversely affect build speed. Can we not document that
python-xml needs to be installed on these hosts? I'd have thought that
would be available on most systems we support running on these days?

Cheers,

Richard



