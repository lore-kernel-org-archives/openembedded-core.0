Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UVQ7l-0001PK-5p
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 19:38:28 +0200
Received: from compute4.internal (compute4.nyi.mail.srv.osa [10.202.2.44])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 40B3A201C8;
	Thu, 25 Apr 2013 13:20:43 -0400 (EDT)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute4.internal (MEProxy); Thu, 25 Apr 2013 13:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=OEZ0+HU8LFvUzDL3MMSwZI
	rH5l8=; b=YjSjcE1bZHiUnwxtuEtFNA5fv1el7Lt+VqYFarl+Kb/N7etfxUD+BU
	ODNfiJ1xYQAp70b5P5P8TrlwiVfsyZukFoi7nxRRT8CbvO9VPmiq/iOcFPfV3r+e
	QDHZbTTipxskFQ8RDzjpt/h8N7qyvMMxs6dX3duUGRQyUw2XGdEZk=
X-Sasl-enc: 5WJPfXrNseoodIH5azLhHvAP1MB6/ZkmmWD4jc6pqJgV 1366910443
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id EC6CFC80008;
	Thu, 25 Apr 2013 13:20:42 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1366900461.14512.92.camel@phil-desktop.brightsign>
References: <1366900461.14512.92.camel@phil-desktop.brightsign>
Date: Thu, 25 Apr 2013 13:20:42 -0400
Message-ID: <1366910442.6622.2.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib: Add --disable-man to configure arguments
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
X-List-Received-Date: Thu, 25 Apr 2013 17:38:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-04-25 at 15:34 +0100, Phil Blundell wrote:

> -CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap"
> +CORECONF = "--disable-dtrace --disable-fam --disable-libelf --disable-systemtap --disable-man"
>  
>  PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-modular-tests', '--disable-modular-tests', d)}"
>  EXTRA_OECONF = "--enable-included-printf=no ${CORECONF} ${PTEST_CONF}"

Looks good.

Signed-off-by: Colin Walters <walters@verbum.org>





