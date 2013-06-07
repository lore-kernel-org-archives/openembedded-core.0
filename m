Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 217406A8CB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 17:22:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HS3hr002854 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:28:03 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bDhMNAG5oxGC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 18:28:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r57HRuqX002846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Jun 2013 18:27:58 +0100
Message-ID: <1370625762.6864.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Jun 2013 18:22:42 +0100
In-Reply-To: <1370625553.6864.64.camel@ted>
References: <1370625553.6864.64.camel@ted>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: Re: [PATCH] scripts/buildenv-internal/sanity: Update to python 2.7.3 as a minimum
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
X-List-Received-Date: Fri, 07 Jun 2013 17:22:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-07 at 18:19 +0100, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

I should add that I'm aware that some of these commit messages are
missing full explaintions. I will add those before they get merged, I
just ran out of time today yet wanted to post them for others to see.
Its pretty clear what the patches are doing and why is covered in other
emails I've written today.

This series does depend on the bitbake series which I've posted to
bitbake-devel.

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rpurdie/t8

is the series (ignore the top two commits).

Cheers,

Richard


