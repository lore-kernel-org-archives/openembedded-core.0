Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TFsKB-0005iJ-Kj
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 21:58:43 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id A49922068F;
	Sun, 23 Sep 2012 15:45:58 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Sun, 23 Sep 2012 15:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=gfpewwE9NJScrXpMxfin8r
	xXAY8=; b=JDm3RyKg588Kn/gw1Mk/4pOngLHDhMYHRHSnQQvDj7PR8Gj7nG1K0B
	N/u3Fcl8pbFXTIugWbI7bch46D09+vPTWSjlN8xavRgZh7F9jFp7o4/78u1jmZXU
	5asKzliVGKeYkEHPMFaURNDuuymnS97zyAoaE5U03Sj1dCOB1KEhc=
X-Sasl-enc: lQXz7ybr/tErVRjyl9JrHIAWBWLSgd2MZg+G3nmCG7kj 1348429558
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3D9A448279F;
	Sun, 23 Sep 2012 15:45:58 -0400 (EDT)
Message-ID: <1348429520.4646.16.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Phil Blundell <philb@gnu.org>
Date: Sun, 23 Sep 2012 15:45:20 -0400
In-Reply-To: <1348339337.4444.229.camel@x121e.pbcl.net>
References: <1348339337.4444.229.camel@x121e.pbcl.net>
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] dbus: Remove hardcoded reference to /usr in System V startup script
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
X-List-Received-Date: Sun, 23 Sep 2012 19:58:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-09-22 at 19:42 +0100, Phil Blundell wrote:

> -	install -m 0755 ${WORKDIR}/dbus-1.init ${D}${sysconfdir}/init.d/dbus-1
> +	sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh

Does that actually work?  The variable reference is inside single quotes
so it won't be expanded by the shell, right?




