Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SuU6C-0002bU-6G for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:51:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QJeLta025211
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:40:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24456-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:40:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6QJeDK7025202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 20:40:15 +0100
Message-ID: <1343331612.7600.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 Jul 2012 20:40:12 +0100
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
References: <cover.1343199345.git.Xin.Ouyang@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB16174E03@IRSMSX102.ger.corp.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Package recipes change proposal (system-wide) - name wise
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
X-List-Received-Date: Thu, 26 Jul 2012 19:51:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-07-25 at 07:23 +0000, Iorga, Cristian wrote:
> For me, having the version number contained in the name of package recipe is a little bit puzzling.
> For example: libpcre/libpcre_8.31.bb
> 
> Is there a solid technical reason to not have it like this?
> 
> libpcre/libpcre.bb
> and inside the recipe to have a PV variable defined:
> PV="8.31"

FWIW, you can do that and it will just work, even today. Its just not
the convention we've "grown up" with.

> In that case, the upgrade/update process would not involve performing a "git move" operation.
> In my opinion, this "git move" operation is something to be avoided, as it puzzles a little bit the versioning system and complicates the review process.
> 
> Of course, some changes in the bitbake system would be involved, but I guess would not be too complicated.
> Also, there will be a volume of work to be performed for changing the name of recipes and adding the PV variable inside the recipe.
> But I guess that a script could solve that, followed by some manual review.

The original idea was that updating to new versions was easy, it was a
mv operation. The checksums have of course complicated this idea but the
principle still applies. It also lets you see versions without having to
view the files themselves which I know I personally find very useful.

Also, as others have mentioned, git can detect move operations if you
tell it to.

Cheers,

Richard



