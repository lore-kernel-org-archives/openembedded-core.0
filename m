Return-Path: <pb@pbcl.net>
Received: from pbcl.net (pbcl.net [159.69.221.92])
	by mail.openembedded.org (Postfix) with ESMTP id 50F647F30E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 22:32:08 +0000 (UTC)
Received: from pb by pbcl.net with local (Exim 4.89)
	(envelope-from <pb@pbcl.net>)
	id 1iXYW7-00052t-P4; Wed, 20 Nov 2019 23:32:07 +0100
Date: Wed, 20 Nov 2019 23:32:07 +0100
From: Phil Blundell <pb@pbcl.net>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Message-ID: <20191120223207.6cuuklpgrzuhqug3@pbcl.net>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
	<20191120134455.125118-8-alex.kanavin@gmail.com>
	<20191120194927.GA28030@localhost>
	<CANNYZj_g1kDJ5CSbKg4DEaATCiyPPT=2GuYEsUyHr+7ZpH8EkQ@mail.gmail.com>
	<20191120213844.ome6ota74rmgosy3@pbcl.net>
	<CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9uAs5wQPya6R9q3gfSQm_Xyu9xViGBxOQ2COKKbcYeWg@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Nov 2019 22:32:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 20, 2019 at 11:12:37PM +0100, Alexander Kanavin wrote:
> The gettext problem is the immediate reason, but the broader reason is that
> the code is not maintained, and we should try to avoid burdening the
> project with unmaintained code. There's already 8 custom patches fixing
> issues caused by lack of upstream maintenance, and the gettext certainly
> won't be the last required fix. I have no interest in zmodem transfers,
> thus I opted for recipe removal.

I don't in general buy the line of argument that "I have no interest in 
X, and I want to make some change that happens to break X, ergo X should 
be removed", but in this particular case it probably is true that lrzsz 
has few enough users that it wouldn't qualify for inclusion in oe-core 
if someone were trying to add it nowadays.  So if it represents a net
maintenance burden then, although I do still use it myself from time to
time, I would be OK with it being removed from oe-core.

However, I think the point still stands that the commit message needs to
provide a better description of why the package is being removed.  If you
think it represents an ongoing maintenance headache that's already bad and
only going to get worse, and this now outweighs its usefulness, let's just
say that.  Not all old software is problematic, and not all problematic
software is old; the fact that the last release was 20 years ago is an
interesting fact but in isolation that doesn't represent a problem.
Indeed, compared to some other packages in oe-core, eight patches in
total over a 20-year period doesn't seem like that bad of an average.

p.

