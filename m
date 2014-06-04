Return-Path: <sledz@dresearch-fe.de>
Received: from zk223.dresearch-fe.de (zk223.dresearch-fe.de [217.92.177.116])
	by mail.openembedded.org (Postfix) with ESMTP id C29286FB7F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jun 2014 14:20:59 +0000 (UTC)
Received: from fensuse.internal.dresearch-fe.de
	(fensuse.internal.dresearch-fe.de [172.29.23.6])
	by zk223.dresearch-fe.de (Postfix) with ESMTP id 6EE81E0122;
	Wed,  4 Jun 2014 16:21:00 +0200 (CEST)
Received: from [IPv6:::1] (localhost [IPv6:::1])
	by fensuse.internal.dresearch-fe.de (Postfix) with ESMTP id 5D8327012EE;
	Wed,  4 Jun 2014 16:21:00 +0200 (CEST)
Message-ID: <538F2B4C.10704@dresearch-fe.de>
Date: Wed, 04 Jun 2014 16:21:00 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Olof Johansson <olof.johansson@axis.com>
References: <538ED39B.2090204@dresearch-fe.de>
	<20140604082943.GA11527@axis.com>
In-Reply-To: <20140604082943.GA11527@axis.com>
X-Enigmail-Version: 1.6
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: ^{} what is it good for? (bitbake problem)
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
X-List-Received-Date: Wed, 04 Jun 2014 14:21:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit

On 04.06.2014 10:29, Olof Johansson wrote:
> On 14-06-04 10:06 +0200, Steffen Sledz wrote:
>> So what is this ^{} which comes from lib/bb/fetch2/git.py good for?
>> Or is this a remnant from a typo?
> 
> From git-rev-parse(1):
> 
>   <rev>^{}, e.g. v0.99.8^{}
>       A suffix ^ followed by an empty brace pair means the object could be a
>       tag, and dereference the tag recursively until a non-tag object is
>       found.
> 
> Without this change, (some?) tag references would end up not
> being considered to be on the requested branch by bitbake (by
> default, master), as the tag objects themselves are not. The tags
> therefore have to be resolved to a reference to a commit.
> 
> Given the description in git-rev-parse(1), it surprises me that
> it doesn't work for some cases. I think it has to do with the tag
> being annotated or not.

You were right. The method works with annotated tags only. I've changed the related tags.

Thx,
Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

