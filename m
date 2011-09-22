Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R6ssT-0001ta-0d for openembedded-core@lists.openembedded.org;
	Fri, 23 Sep 2011 01:40:25 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MNfJGL003248 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 00:41:20 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SCuRmzLk37Zt
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 00:41:19 +0100 (BST)
Received: from [192.168.250.158] ([116.246.20.131]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8MNfCpa003233
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2011 00:41:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Sep 2011 00:33:15 +0100
In-Reply-To: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
References: <CAP9ODKpF7hQQmB7YWE4RCWDbEfZwv8432KJrBmvpwe1u_SaCTg@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316734501.28323.18.camel@ted>
Mime-Version: 1.0
Subject: Re: Branch management for OE-Core release
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
X-List-Received-Date: Thu, 22 Sep 2011 23:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-09-22 at 09:49 -0300, Otavio Salvador wrote:
> I noticed the 2011-1 branch today and it seems it is not fully merged
> into master; this is a mistake since it will create an upgrade path
> problem for users of it.

Its a branch, master continues on, that branch just gets fixes suitable
for a stable/release branch. I appreciate people have different
definitions of stable and we need to do a better job of documenting what
those criteria are. As a quick attempt:

I've always said with "stable" branches, its up to the person
maintaining it to define what it means. Right now, I'm trying to get a
branch where all the Yocto QA tests pass so it has some base
functionality across all the different architectures, image targets,
SDKs and so forth.

Longer term I'm initially proposing it will take the same kinds of
changes as we'd take for point releases in Yocto. These are high impact
bug fixes, build system OS fixes as new distros appear and security
issues that we're aware of. What is out of scope are new features and
significant version changes. The QT version increment is marginal in
that regard. If after release when we have more time to test it works
out ok it might be considered being just a point release and not a major
version change.

Cheers,

Richard






