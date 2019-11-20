Return-Path: <pb@pbcl.net>
X-Greylist: delayed 1696 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 20 Nov 2019 22:07:00 UTC
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id 040137DE5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 22:07:00 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iXXgS-0004uO-6F; Wed, 20 Nov 2019 22:38:44 +0100
Date: Wed, 20 Nov 2019 22:38:44 +0100
From: Phil Blundell <pb@pbcl.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120213844.ome6ota74rmgosy3@pbcl.net>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 08/11] lrzsz: remove the recipe
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
X-List-Received-Date: Wed, 20 Nov 2019 22:07:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 20, 2019 at 09:00:28PM +0100, Alexander Kanavin wrote:
> Do you want to maintain it? Protocols are not changing, but the software
> that lrzsz depends on is changing.
> 
> Your first task would be making it build with the latest version of
> gettext, the branch containing that is here:

If this is the actual reason for removing lrszsz, the commit message should
say so.  As it stands, this patch provides no meaningful justification for
why the package should be removed, it just contains a statement about the
last release having been a long time ago (which may be true, but isn't
obviously relevant) and some vague sneering about "proper networking"
which doesn't seem to be helpful either.

p.

