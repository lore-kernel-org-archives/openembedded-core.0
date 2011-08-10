Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qr7vj-0007rL-PM for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 14:30:39 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACQ9iE021462;
	Wed, 10 Aug 2011 13:26:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20866-03; Wed, 10 Aug 2011 13:26:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7ACQ22k021456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 10 Aug 2011 13:26:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1312900463.git.chris_larson@mentor.com>
References: <cover.1312900463.git.chris_larson@mentor.com>
Date: Wed, 10 Aug 2011 13:25:28 +0100
Message-ID: <1312979128.14274.360.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/3] Implement IMAGE_FEATURES in a general way
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
X-List-Received-Date: Wed, 10 Aug 2011 12:30:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-09 at 07:40 -0700, Chris Larson wrote:
> From: Chris Larson <chris_larson@mentor.com>
> 
> This is a second attempt at this, scrapping the class changes from the previous
> request and redoing it in a less invasive way, and breaking up the changes into
> 3 pieces. This implements IMAGE_FEATURES. IMAGE_FEATURES is analagous to
> DISTRO_FEATURES and MACHINE_FEATURES, for root filesystem construction.
> Currently, the only supported features are any defined package groups, as used
> by the oe.packagegroup python module.
> 
> Example usage:
> 
>     PACKAGE_GROUP_myfeature = "vim iptables"
>     IMAGE_FEATURES += "myfeature"
> 
> This also makes the dev-pkgs and dbg-pkgs features general, and adds a doc-pkgs
> feature.
> 
> 
> The following changes since commit 866a34dd80228a0c10cbea5d7715e2acd6cea131:
> 
>   uclibc_0.9.32: Sync mount.h from eglibc (2011-08-09 15:17:45 +0100)
> 
> are available in the git repository at:
>   git://github.com/kergoth/oe-core feature/image_features
> 
> go here for github's branch comparison interface:
>   https://github.com/kergoth/oe-core/compare/master...feature%2Fimage_features
> 
> Chris Larson (3):
>   image: implement IMAGE_FEATURES
>   image: add support for generally useful {dev,doc,dbg}-pkgs features
>   core-image: adjust to use the new IMAGE_FEATURES support

Merged to master, thanks.

Richard



