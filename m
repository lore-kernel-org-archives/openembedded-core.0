Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 135BF6BD5E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 15:24:40 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r89Fc7JK012401; Mon, 9 Sep 2013 16:38:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Kug7HnoJq_X4; Mon,  9 Sep 2013 16:38:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r89Fc1ZQ012386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 9 Sep 2013 16:38:03 +0100
Message-ID: <1378740263.3484.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Date: Mon, 09 Sep 2013 16:24:23 +0100
In-Reply-To: <20130909135125.GD5834@denix.org>
References: <20130906185741.GA5834@denix.org> <20130909135125.GD5834@denix.org>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: eglibc_2.17.bb: Failure expanding variable SELECTED_OPTIMIZATION[:=]
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
X-List-Received-Date: Mon, 09 Sep 2013 15:24:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-09-09 at 09:51 -0400, Denys Dmytriyenko wrote:
> Any ideas or suggestions at this point would be greatly appreciated! Thanks.

I have vague recollections about this from something happening in
master. Perhaps try with:

http://git.openembedded.org/bitbake/commit/?id=4d50690489ee8dc329a9b0c7bc4ceb29b71e95e9

applied. This might things more deterministic, perhaps always breaking
or perhaps never.

Have you got two definitions of the "get_optimization" function?

Cheers,

Richard




