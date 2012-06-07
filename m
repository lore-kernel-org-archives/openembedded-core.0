Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1ScRoF-0004Vj-QU
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jun 2012 03:46:48 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 0FEB420C07
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2012 21:26:43 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute1.internal (MEProxy); Wed, 06 Jun 2012 21:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:date
	:in-reply-to:references:content-type:content-transfer-encoding
	:mime-version; s=smtpout; bh=fuxcjgL0OGKVbp/nu8NZoFiKJfw=; b=sR4
	eOQ6U8yDX+SrYXHQkN6ZRYY90K88h7fXuPSK0Zcrg3QpUZ453U6AfR9uFoDeI3dr
	nUJjnraQNrKmF7eP16IYBZDLTnXSHO/1k7IcJfsXwmZoIFvV3y/iuR08foWlyqbI
	p2swBXYMbeNQgTJoVt47PjfsVDSQJTtu4AbO+cHg=
X-Sasl-enc: 5QTZ7jGLJoWZxkJqeHGigaCYz4eOl0TMWTFg4kDJyTA2 1339032402
Received: from [192.168.1.7] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id BE73848256F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2012 21:26:42 -0400 (EDT)
Message-ID: <1339032402.14663.6.camel@meta>
From: Colin Walters <walters@verbum.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 06 Jun 2012 21:26:42 -0400
In-Reply-To: <f33daa49ebd9193dd5689490ca3cbad3803082c5.1338994308.git.mark.hatle@windriver.com>
References: <cover.1338994308.git.mark.hatle@windriver.com>
	<f33daa49ebd9193dd5689490ca3cbad3803082c5.1338994308.git.mark.hatle@windriver.com>
X-Mailer: Evolution 3.2.3 (3.2.3-3.fc16) 
Mime-Version: 1.0
Subject: Re: [PATCH 4/6] shared-mime-info: fix build race condition
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
X-List-Received-Date: Thu, 07 Jun 2012 01:46:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-06-06 at 09:53 -0500, Mark Hatle wrote:
> From: Joe Slater <jslater@windriver.com>
> 
> The definition of install-data-hook in Makefile.am leads
> to multiple, overlapping, executions of the install-binPROGRAMS
> target.  We modify the definition to avoid that.

See also https://bugs.freedesktop.org/show_bug.cgi?id=46093



