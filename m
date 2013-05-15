Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UcgqV-0007DV-4H
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 20:54:40 +0200
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 77B9520EC4;
	Wed, 15 May 2013 14:36:25 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Wed, 15 May 2013 14:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=1CQdREbD0bt02gK8ehYmVc
	kYpgY=; b=BgV91wEyoTQqmqJakoUwvWwjJgL7t6zNWfrEfh605germGJmlzj41G
	jfbnEp8TWJx14A6fiP+AanVXOwKUCTBRSiMMh5PeLjSUm5mxK8vFHKgadSOpCxLy
	CfeFuZTFMNfFxHLLJe7TjFWM8XO9Aj/I5vYdkgF6s7ERO7rs97r7o=
X-Sasl-enc: 3S8ApQuv6AG+gVPmZBKCX3ZjWhvwTh8lHKcpTo/g6E0F 1368642985
Received: from [10.193.23.197] (unknown [66.187.233.207])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0ABC0C80004;
	Wed, 15 May 2013 14:36:24 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Ross Burton <ross.burton@intel.com>
In-Reply-To: <1368458850-5309-1-git-send-email-ross.burton@intel.com>
References: <1368458850-5309-1-git-send-email-ross.burton@intel.com>
Date: Wed, 15 May 2013 14:36:23 -0400
Message-ID: <1368642983.28256.109.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: drop dependency on python-argparse
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
X-List-Received-Date: Wed, 15 May 2013 18:54:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-13 at 16:27 +0100, Ross Burton wrote:
> Since 2.20 the use of argparse was removed, so we don't need these dependencies
> anymore.

You mean 2.30.  Other than that,

Reviewed-by: Colin Walters <walters@verbum.org>




