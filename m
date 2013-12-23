Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 4121660D7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2013 10:43:10 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBNAgwEs011522; Mon, 23 Dec 2013 10:42:59 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HEVSOwKqzhz1; Mon, 23 Dec 2013 10:42:58 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rBNAgpS7011514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Mon, 23 Dec 2013 10:42:52 GMT
Message-ID: <1387795367.11527.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
Date: Mon, 23 Dec 2013 10:42:47 +0000
In-Reply-To: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
References: <090257310d9e463d93ee5cd5fd4d27fe@DM2PR03MB399.namprd03.prod.outlook.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Why to make branch info is mandatory for non-master commit with latest bitbake
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
X-List-Received-Date: Mon, 23 Dec 2013 10:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-12-23 at 06:41 +0000, zhenhua.luo@freescale.com wrote:
> Previously the branch name doesn't need to be defined when a
> non-master branch commit is referred in recipe, this has been changed
> in latest bitbake. 
> 
> Is this an intentional change? May I know the reason of the change if it is intentional?

It was intentional and was triggered by this change:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f19546e02d3318ee69fd0c34e21aa97b74c987ec

which is a sanity test added to fix certain failure cases where a given
revision wasn't on a specified branch.

The bug was nasty since the fetcher was hitting the network in cases it
shouldn't have been when a branch wasn't specified.

Cheers,

Richard


