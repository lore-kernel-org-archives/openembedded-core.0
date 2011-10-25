Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RIbg2-0006c7-BO for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 09:44:02 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9P7c5oK005948
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 08:38:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 05082-08 for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 08:38:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p9P7buFP005942
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2011 08:37:57 +0100
Message-ID: <1319528276.26563.39.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 25 Oct 2011 08:37:56 +0100
In-Reply-To: <1319527895-3628-1-git-send-email-Martin.Jansa@gmail.com>
References: <1319527042.26563.38.camel@ted>
	<1319527895-3628-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] libxml-parser-perl, libxml-simple-perl, expat, sgmlspl-native, git: bump PR to rebuild after perl upgrade
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
X-List-Received-Date: Tue, 25 Oct 2011 07:44:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-25 at 09:31 +0200, Martin Jansa wrote:
> * this isn't probably complete list.. just what failed here
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-core/expat/expat_2.0.1.bb             |    2 +-
>  meta/recipes-devtools/git/git_1.7.7.bb             |    2 ++
>  .../perl/libxml-parser-perl_2.41.bb                |    2 +-
>  .../perl/libxml-simple-perl_2.18.bb                |    2 +-
>  .../sgmlspl/sgmlspl-native_1.03ii.bb               |    2 +-
>  5 files changed, 6 insertions(+), 4 deletions(-)

Merged to master, thanks.

Richard



