Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1UTFDW-0000ck-2m
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 19:35:28 +0200
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id D9D1E209CF;
	Fri, 19 Apr 2013 13:17:48 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute1.internal (MEProxy); Fri, 19 Apr 2013 13:17:48 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=subject:from:to:cc:in-reply-to:references
	:content-type:date:message-id:mime-version
	:content-transfer-encoding; s=smtpout; bh=0pIIlv1b4IKV4ZOs7RK0ZM
	3Gk6c=; b=Tr1mDuj3BRlmt7crxNkhj/L6G83to227QVNPyfAkOJWYhLLWd3dCAe
	Hf5R4j2p/5XqgsFv86deul49hFHFAgVuh+SMhEFZHkecnLp5rxVId61ZX2/qne+4
	Y1/YzXdqy82GnzyTPILEzCQkNdddlOFOpRMhdVmnh3OW2hhBNpDyI=
X-Sasl-enc: ayIlCrdYWhgoSQtjQAMQzTr6toED2RJiMVTzo94+h8A5 1366391868
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 87DDE20006A;
	Fri, 19 Apr 2013 13:17:48 -0400 (EDT)
From: Colin Walters <walters@verbum.org>
To: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3286324B-9629-4783-AEAB-C7D920313B1A@dominion.thruhere.net>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost>  <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost>  <1366025504.8670.30.camel@ted>
	<1366027932.32176.4.camel@localhost>  <1366028557.8670.34.camel@ted>
	<1366030768.32176.9.camel@localhost> <1366376397.10502.126.camel@ted>
	<3286324B-9629-4783-AEAB-C7D920313B1A@dominion.thruhere.net>
Date: Fri, 19 Apr 2013 13:17:47 -0400
Message-ID: <1366391867.25265.1.camel@localhost>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 (2.28.3-30.el6) 
Cc: mclasen@redhat.com,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
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
X-List-Received-Date: Fri, 19 Apr 2013 17:35:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-04-19 at 15:41 +0200, Koen Kooi wrote:

> And would introduce some dependency hell (gtk-doc-native needed for every little gnome thing *and* udev) 

Nope, that's why gtk-doc-stub exists, and it's already used in OE:

http://git.gnome.org/browse/gtk-doc-stub

> but more importantly it will expose us to that stupid, stupid, stupid practice of using git submodules to drag in autoconf stuff. 

Correct handling of git submodules is definitely nontrivial.




