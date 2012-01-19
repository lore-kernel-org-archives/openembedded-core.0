Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RntAI-0005s0-Fh for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 15:40:34 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEWtLm002868
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:32:55 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02801-02 for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:32:49 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0JEWlEC002862
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 14:32:48 GMT
Message-ID: <1326983567.2511.73.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 19 Jan 2012 14:32:47 +0000
In-Reply-To: <1326981104-9888-1-git-send-email-Martin.Jansa@gmail.com>
References: <1326981104-9888-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] task-base: rename VIRTUAL-RUNTIME-alsa-state to use underscore
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
X-List-Received-Date: Thu, 19 Jan 2012 14:40:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-19 at 14:51 +0100, Martin Jansa wrote:
> * in http://lists.linuxtogo.org/pipermail/openembedded-core/2012-January/016226.html
>   we talked about
>   VIRTUAL-RUNTIME_alsa-state, but
>   VIRTUAL-RUNTIME-alsa-state was used instead, which is inconsistent with other VIRTUAL-RUNTIME vars
> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/default-providers.inc |    2 +-
>  meta/recipes-core/tasks/task-base.bb           |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Merged to master, thanks.

Richard



