Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 90F3C60629
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 13:09:50 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06D9iVu020349; Mon, 6 Jan 2014 13:09:44 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ivp-QW7iuFta; Mon,  6 Jan 2014 13:09:44 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s06D9dAf020345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 6 Jan 2014 13:09:41 GMT
Message-ID: <1389013776.22784.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>
Date: Mon, 06 Jan 2014 13:09:36 +0000
In-Reply-To: <alpine.LFD.2.11.1401061314390.9209@localhost.localdomain>
References: <alpine.LFD.2.11.1401061314390.9209@localhost.localdomain>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Strange looking commit in oe-core, 4cee162c292915e
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
X-List-Received-Date: Mon, 06 Jan 2014 13:09:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-01-06 at 13:25 +0100, Jacob Kroon wrote:
> Hi,
> 
> Just an observation from my side, I was looking at the recent commits
> in OE-Core and saw 4cee162c292915e68e8efcab68a31ba0e48105e9,
> "enchant: fix unrecognised option"
> 
> The actual commit message doesn't seem to have anything to do with the
> actual patch. Perhaps it has been rebased and gone through some other
> massaging, the patch seems to make sense, at least to me, still it
> would be nice to always have sane commit messages.

It looks like some wires got crossed, yes :( I've pulled it from one of
Saul's branches and shouldn't have done.

We do put quite a lot of effort into keep the standard of commit
messages high. Equally, with the volume of patches coming in and the
pressure to get things merged, the odd issue does creep in :(. More help
in patch aggregation, testing and review would always be appreciated
however its a pretty thankless task :/.

It does look like the change in question is a valid change but simply
doesn't match the description.

Cheers,

Richard




