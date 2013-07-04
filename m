Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id E2AAC61663
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 08:54:32 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-86-109.range86-137.btcentralplus.com
	[86.137.86.109]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 76121952D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 09:54:33 +0100 (BST)
Message-ID: <51D53848.3060209@r-finger.com>
Date: Thu, 04 Jul 2013 09:54:32 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
	<20130703161921.GB3452@jama>
In-Reply-To: <20130703161921.GB3452@jama>
Subject: Re: [PATCH 0/4] Allow xuser to shutdown
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
X-List-Received-Date: Thu, 04 Jul 2013 08:54:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/07/13 17:19, Martin Jansa wrote:
> Shouldn't we create separate recipe for xuser or any other default user
> and add it to connman and xserver-nodm-init RDEPENDS?
> 
> I know there is some overhead from having one more package installed on
> image, but it would be a bit easier if we later decide that xuser also
> needs some file to be installed in his home or something like that.

Yes, please; the current situation makes it rather awkward if you need
to tweak some of the xuser parameters in a distro specific way. But
perhaps it should be called something other than xuser?

Tomas

