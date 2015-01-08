Return-Path: <pab@pabigot.com>
X-Greylist: delayed 441 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 08 Jan 2015 20:01:51 UTC
Received: from p3plsmtpa12-09.prod.phx3.secureserver.net
	(p3plsmtpa12-09.prod.phx3.secureserver.net [68.178.252.238])
	by mail.openembedded.org (Postfix) with ESMTP id 29F7B72498
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 20:01:51 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-09.prod.phx3.secureserver.net with 
	id dXuU1p00P0BVjqb01XuVwo; Thu, 08 Jan 2015 12:54:30 -0700
Message-ID: <54AEE07C.2010602@pabigot.com>
Date: Thu, 08 Jan 2015 13:54:36 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <1420706622-31273-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<CAP9ODKpUV8+ZvnLba83djVXeFw8cR0cBTYobf5DG9A38jMG--Q@mail.gmail.com>
	<20150108194430.GA3617@localhost.localdomain>
In-Reply-To: <20150108194430.GA3617@localhost.localdomain>
Cc: Maciek Borzecki <maciek.borzecki@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd-networkd: cherry picking route handling patch
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
X-List-Received-Date: Thu, 08 Jan 2015 20:01:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2015 01:44 PM, Maciej Borzecki wrote:
> On 01/08 12:13, Otavio Salvador wrote:
>> On Thu, Jan 8, 2015 at 6:43 AM, Maciej Borzecki
>> <maciej.borzecki@open-rnd.pl> wrote:
>>> static route to the gateway, to workaround a misconfigured DHCP server
>>> that would assign an address from network pool that the gateway is not
>>> a part of. The trick was missing a source IP address specification in
>>> the static route, thus normally the first assigned IP address would be
>>> used for outgoing IP packets. In this particular case the address
>>> would the static one, hence the packet would most probably be dropped
>>> by the router. Also, it is quite common in smaller networks that the
>>> DHCP server, gateway router and even a DNS server are colocated. In
>> collocated?
> Yes, obviously collocated.

Or preferably "co-located", as collocate is a technical term in 
linguistics that is pronounced differently than the term intended here.

http://www.grammarphobia.com/blog/2013/08/collocation-colocation-co-location.html

Peter

