Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1RZWNu-0007PQ-BY for openembedded-core@lists.openembedded.org;
	Sun, 11 Dec 2011 00:31:14 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 123E41C0C143;
	Sun, 11 Dec 2011 00:24:21 +0100 (CET)
X-Auth-Info: /KbieJDi/PVojvrEKrAdYQKa7zAzSj/sgHYG4rw1sVs=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 7DDFA1C00060;
	Sun, 11 Dec 2011 00:24:21 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id C11BF1A3768;
	Sun, 11 Dec 2011 00:24:20 +0100 (CET)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 9B0B61F4E08;
	Sun, 11 Dec 2011 00:24:20 +0100 (CET)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Saul Wold <sgw@linux.intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
References: <cover.1323554268.git.sgw@linux.intel.com>
	<cover.1323554268.git.sgw@linux.intel.com>
	<71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com>
Comments: In-reply-to Saul Wold <sgw@linux.intel.com>
	message dated "Sat, 10 Dec 2011 14:01:59 -0800."
Date: Sun, 11 Dec 2011 00:24:20 +0100
Message-Id: <20111210232420.9B0B61F4E08@gemini.denx.de>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH 3/5] self-hosted: Add ext2 utilites and perl-pod for building
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
X-List-Received-Date: Sat, 10 Dec 2011 23:31:14 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Saul Wold,

In message <71f6cb63e711721a1a03cfc1c0f1d054472241fe.1323554268.git.sgw@linux.intel.com> you wrote:
> Add self-hosted-host-tools for non-build related tools
...
> +    e2fsprogs \
...
> +    genext2fs \

It's certainly nice to have the ext2 tools then, but would it not also
make a lot of sense to include mtd-utils (so we can erase flash and
create UBI volumes / UBIFS file system images) and eventually even
dosfstools?

Most embedded systems come with NAND these days, and a lot of them use
UBI/UBIFS...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
If all you have is a hammer, everything looks like a nail.


