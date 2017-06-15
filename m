Return-Path: <gchoc-openembedded-core@m.gmane.org>
X-Greylist: delayed 907 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 15 Jun 2017 10:25:18 UTC
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 113457838D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:25:18 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1dLRj4-0008T4-Bo for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 12:10:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Anton Eliasson <anton.eliasson@axis.com>
Date: Thu, 15 Jun 2017 09:50:53 +0000 (UTC)
Message-ID: <ohtl9t$i6i$1@blaine.gmane.org>
References: <1497336760-36835-1-git-send-email-amarnath.valluri@intel.com>
	<1497336760-36835-5-git-send-email-amarnath.valluri@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Pan/0.139 (Sexual Chocolate; GIT bf56508 git://git.gnome.org/pan2)
Subject: Re: [PATCH v3 4/8] bash: changes to support merged /usr
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
X-List-Received-Date: Thu, 15 Jun 2017 10:25:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 13 Jun 2017 09:52:36 +0300, Amarnath Valluri wrote:

> Most of shell scripts refer to '#!/bin/{sh,bash}' inside the script. But
> when 'usrmege' feature is enabled this path will be /usr/bin/{sh, bash}.
usrmege -> usrmerge

Also in next patch.
> 
> so to satisify build dependency add '/bin/{sh,bash}' to its providers
> list.
> 
> Signed-off-by: Amarnath Valluri
> <amarnath.valluri@intel.com>
> ---

Best Regards, Anton Eliasson


