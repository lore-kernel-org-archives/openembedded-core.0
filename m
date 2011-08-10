Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr8at-0001Q0-VK for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 15:13:12 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AD8g9E021717
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 14:08:42 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20866-08 for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 14:08:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7AD8V1t021711
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2011 14:08:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>
References: <1312912632.14274.312.camel@rex>
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>
	<27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>
Date: Wed, 10 Aug 2011 14:07:56 +0100
Message-ID: <1312981676.14274.376.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
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
X-List-Received-Date: Wed, 10 Aug 2011 13:13:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-10 at 07:59 -0500, Kumar Gala wrote:
> On Aug 9, 2011, at 11:00 PM, Lu, Lianhao wrote:
> 
> > Richard Purdie wrote on 2011-08-10:
> >> If we don't do this, the SDK target sysroot is named generically even
> >> when it contains package architecture specific optimisations.
> >> 
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> ---
> >> diff --git a/meta/classes/populate_sdk.bbclass
> >> b/meta/classes/populate_sdk.bbclass index 0f3591b..8c19e83 100644 ---
> >> a/meta/classes/populate_sdk.bbclass +++
> >> b/meta/classes/populate_sdk.bbclass @@ -5,7 +5,7 @@ SDK_DIR =
> >> "${WORKDIR}/sdk"
> >> SDK_OUTPUT = "${SDK_DIR}/image"
> >> SDK_DEPLOY = "${TMPDIR}/deploy/sdk"
> >> -SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${TARGET_SYS}"
> >> +SDKTARGETSYSROOT = "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"
> > 
> > In gcc-configure-sdk.inc, it is set "--with-sysroot=${SDKPATH}/sysroots/${TARGET_SYS}". 
> > Is there any inconsistency?
> 
> Binutils might also need updating.

This is an interesting question. We certainly compile in a default path
for the sysroot but we in general always override it from the
environment anyway.

As long as the package architectures for the sdk components are correct
we should be able to update the defaults. I've not yet checked that
though.

Cheers,

Richard





