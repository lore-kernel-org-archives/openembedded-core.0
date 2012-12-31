Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TpeSi-0002iB-1P
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 13:27:24 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id CC127F81217; Mon, 31 Dec 2012 05:12:24 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id B2188F81215;
	Mon, 31 Dec 2012 05:12:23 -0700 (MST)
Message-ID: <50E18137.9090009@mlbassoc.com>
Date: Mon, 31 Dec 2012 05:12:39 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <alpine.DEB.2.02.1212301442200.16593@oneiric>
In-Reply-To: <alpine.DEB.2.02.1212301442200.16593@oneiric>
Subject: Re: any objection to my cleaning up some packagegroup files in oe-core?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 31 Dec 2012 12:27:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-12-30 12:44, Robert P. J. Day wrote:
>
>    specifically, in cases like this in packagegroup-core-sdk.bb:
>
> RDEPENDS_packagegroup-core-sdk
>
> could more cleanly be expressed as:
>
> RDEPENDS_${PN}
>
> could it not?  there are quite a few of those unnecessarily verbose
> constructs, anyone mind if i submit a patch to make that change?

Why stop there?  It seems that recipe could use more changes:
   RPROVIDES_packagegroup-core-sdk = "task-core-sdk"
   RREPLACES_packagegroup-core-sdk = "task-core-sdk"
   RCONFLICTS_packagegroup-core-sdk = "task-core-sdk"

   RDEPENDS_packagegroup-core-sdk = "\

All of these should use _${PN}

Also, most of the recipes in meta/recipes-core/packagegroups/* could
use similar changes to make them more readable and maintainable.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


