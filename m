Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TsD90-0004tM-Fy for openembedded-core@lists.openembedded.org;
	Mon, 07 Jan 2013 14:53:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DcQZY004851;
	Mon, 7 Jan 2013 13:38:26 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04131-03; Mon,  7 Jan 2013 13:38:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r07DcHEZ004845
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 7 Jan 2013 13:38:18 GMT
Message-ID: <1357565899.25855.13.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: lei.yang@windriver.com
Date: Mon, 07 Jan 2013 13:38:19 +0000
In-Reply-To: <1357556076-17485-1-git-send-email-lei.yang@windriver.com>
References: <1357556076-17485-1-git-send-email-lei.yang@windriver.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH:V2] Remove the redundant "/" in base-files
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
X-List-Received-Date: Mon, 07 Jan 2013 13:53:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-07 at 18:54 +0800, lei.yang@windriver.com wrote:
> From: Lei Yang <lei.yang@windriver.com>
> 
> I'm working on my virt-test,when I check this file find it has
> redundant "/"
> 
> Signed-off-by: Lei Yang <lei.yang@windriver.com>
> ---
>  meta/recipes-core/base-files/base-files_3.0.14.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)

The subject line should be:

base-files: Remove the redundant "/" 

with the recipe/files being changed at the start, as per the commit
guidelines.

I've fixed it this this and merged it.

Cheers,

Richard





