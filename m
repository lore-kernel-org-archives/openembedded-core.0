Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TrvJ4-0006Tm-Aq
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 19:50:51 +0100
Received: from compute3.internal (compute3.nyi.mail.srv.osa [10.202.2.43])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 45B82208F3;
	Sun,  6 Jan 2013 13:28:17 -0500 (EST)
Received: from frontend1.nyi.mail.srv.osa ([10.202.2.160])
	by compute3.internal (MEProxy); Sun, 06 Jan 2013 13:28:17 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=LqcgIOa/vSmWbCatlGPAdB
	4MwBE=; b=n5hc2P8bk1S4CizjuPjzbYlC1UFJBPl2pJr6vq4DbNAlhS8MkncCWH
	FusLWyMoXMU7vpnj7fhISx01AWR8sExIZpRVUHcAnPHnCXtPt0iVEfcWo+tQb+FW
	ZjzYOWBSubY7WUfkJB9QjSqHmoOniwigAGxM65Q5qTtZtVHMcBYCU=
X-Sasl-enc: B1RASfOV46P31NQZX48shV4RoYGMVtMvrYZCmnkZiEB1 1357496896
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id DE2738E0408;
	Sun,  6 Jan 2013 13:28:16 -0500 (EST)
From: Colin Walters <walters@verbum.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <2f2c14ff5bbe6619fd7ac1649f5f985604bd6941.1357354330.git.hongxu.jia@windriver.com>
References: <cover.1357354330.git.hongxu.jia@windriver.com>
	<2f2c14ff5bbe6619fd7ac1649f5f985604bd6941.1357354330.git.hongxu.jia@windriver.com>
Date: Sun, 06 Jan 2013 13:28:16 -0500
Message-ID: <1357496896.8239.0.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-27.el6) 
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Sun, 06 Jan 2013 18:50:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-01-06 at 16:34 +0800, Hongxu Jia wrote:

> +# Add option -march to BUILD_CFLAGS in order to let the atomic operations
> +# ("lock free") be available while using old version GCC on x86 host to
> +# compile glib-2.0-native
> +BUILD_CFLAGS += "-march=${@'${BUILD_ARCH}'.replace('_','-')}"

Shouldn't this be handled more generically for all native recipes?




