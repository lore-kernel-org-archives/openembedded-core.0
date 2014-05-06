Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id 2076065F25
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 21:01:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N5600JD54XBRI31@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 06 May 2014 15:00:47 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 12C172018E; Tue,
	06 May 2014 16:00:46 -0400 (EDT)
Date: Tue, 06 May 2014 16:00:46 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-id: <20140506200046.GC11339@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Recipes erroneously marked as "commercial"?
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
X-List-Received-Date: Tue, 06 May 2014 21:01:10 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

So, long time ago we had a short list of "commercial" packages in a global 
variable COMMERCIAL_LICENSE:

COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"

Then, at some point, the packages that depend on commercial ones were added to 
the list, to allow wold builds to be successful:

http://cgit.openembedded.org/openembedded-core/commit/?id=c69453fe94a649c518b0e6d79616f05579b864ce

So, the list was appended with this:

COMMERCIAL_LICENSE_DEPENDEES ?= "gst-plugins-ugly libomxil gst-openmax"

Then, later on, the feature was changed from a global list to a per-recipe 
flags:

http://cgit.openembedded.org/openembedded-core/commit/?id=a2760661b8c7a4a1b6f2e556853b3a9ae38cbcb5
http://cgit.openembedded.org/openembedded-core/commit/?id=43410523a07d9eb52a7d57ae3dc1cc320cbbc6f9

And all those recipes got marked with LICENSE_FLAGS = "commercial" 
automatically, even if they are not really commercial.

The question is - should we clean those up now? I can send a quick patch, if 
my understanding above is correct.

-- 
Denys

