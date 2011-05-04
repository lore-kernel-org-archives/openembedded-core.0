Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHeXP-0000ST-4J for openembedded-core@lists.openembedded.org;
	Wed, 04 May 2011 18:02:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p44G0DYp000716
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 May 2011 17:00:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00495-03 for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2011 17:00:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p44G04pp000707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 May 2011 17:00:05 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTinduv4VofN2=adDN2-HZozYTO45ew@mail.gmail.com>
References: <cover.1304515719.git.ke.yu@intel.com>
	<1304518043.21461.154.camel@rex>
	<BANLkTinduv4VofN2=adDN2-HZozYTO45ew@mail.gmail.com>
Date: Wed, 04 May 2011 17:00:04 +0100
Message-ID: <1304524804.21461.158.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Wed, 04 May 2011 16:02:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 16:24 +0200, Frans Meulenbroeks wrote:
> Most of the time the SRCREV is before the PV, but not always (and sometimes
> separated with an empty line and sometimes not).

Patches welcome...

> Also there is at least one error introduced:
> 
> diff --git a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bbb/meta/recipes-devtools/yaffs2/
> yaffs2-utils_cvs.bb
> index 6171fe5..c729c7c 100644
> --- a/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb<http://git.pokylinux.org/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb?h=kyu3/srcrev-recipe&id=d2e078aa046ae6c4f169695f546cf229db5be1f7>
> +++ b/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb<http://git.pokylinux.org/cgit.cgi/poky-contrib/tree/meta/recipes-devtools/yaffs2/yaffs2-utils_cvs.bb?h=kyu3/srcrev-recipe&id=c75b49ff5cfd10f5187af2b66a0a8d5513460374>
> @@ -1,3 +1,4 @@
> require yaffs2-utils.inc
> PR = "r1"
> +SRCDAT = "20071107"
> 
> That should be SRCDATE. There might be more of these, my eye just fell on
> this one.

Good catch, we need to fix that.

> Frans
> 
> PS: speaking of yaffs2 utils: it could be considered to move to a somewhat
> newer version (not that I care as I do not use yaffs2)

It is something we should look at going, yes although I don't think
yaffs2 has changed that much in a while.

Cheers,

Richard



