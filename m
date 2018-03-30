Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CF146746C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 08:37:07 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2U8aHK0000526
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 30 Mar 2018 09:36:19 +0100
Message-ID: <1522398977.11431.114.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>,
	openembedded-core@lists.openembedded.org
Date: Fri, 30 Mar 2018 09:36:17 +0100
In-Reply-To: <20180329224129.GK2786@denix.org>
References: <cover.1521507765.git.denys@ti.com>
	<20180329224129.GK2786@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 30 Mar 2018 08:37:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-03-29 at 18:41 -0400, Denys Dmytriyenko wrote:
> Ping. It's been 10 days - are there any issues with these updates?

We're past feature freeze at this point and M3 was built (finally, and
late). During stabilisation we're only taking upgrades "with a good
reason". Security fixes, bug fixes and issues with maintenance windows
(e.g. bind) are reasons we might see some upgrades going in now but in
general we're holding upgrades until 2.6 opens.

I think Ross has a "post sumo" branch which he may pull some of these
into but I'd really like people to focus on bug fixing for sumo right
now.

Ross is also on vacation so I'll be handling things over the next week
or so (when do I get one?!). I might push a master-next-2.6 to queue
things just to make it clearer what is being deferred. Rebasing can be
a nightmare though.

Cheers,

Richard



