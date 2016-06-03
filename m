Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D478D77451
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 12:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u53CeUdV010060; Fri, 3 Jun 2016 13:40:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iptx-RFZg4SF; Fri,  3 Jun 2016 13:40:30 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u53CeR7k010053
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 3 Jun 2016 13:40:28 +0100
Message-ID: <1464957627.13979.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ovidiu-Adrian Vancea <ovidiu.vancea@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 03 Jun 2016 13:40:27 +0100
In-Reply-To: <1464948105-5311-1-git-send-email-ovidiu.vancea@ni.com>
References: <1464948105-5311-1-git-send-email-ovidiu.vancea@ni.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RESEND][PATCH] package_ipk.bbclass: add kernel version to module dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Jun 2016 12:40:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-06-03 at 13:01 +0300, Ovidiu-Adrian Vancea wrote:
> From: Ovidiu Vancea <ovidiu.vancea@ni.com>
> 
> Updating the kernel ("opkg install kernel") does not update the
> dependencies (i.e. modules) because there is no possibility to do
> version
> enforcement in the OE recipe. Upon rebooting, the older version
> modules
> do not load and can leave hardware in a non-functioning state (if
> their
> drivers are not built into the kernel).
> 
> Use the Version field from the kernel package on its rdepends,
> rrecommends,
> and rsuggests fields’ version. This makes the packages on which the
> kernel
> depends to be the same version as the kernel.
> 
> Version field contains package build number (including git hash) and
> package
> revision, thus restricting the kernel and modules to always be built
> together.

Doesn't this make the system behave differently between the different
package backends? That is something we really don't want to do. 

Either all package backends have/need this dependency or none do, we
don't want different behaviours without good reason.

Cheers,

Richard

