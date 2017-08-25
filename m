Return-Path: <o.mandel@menlosystems.com>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 3DFAC78477
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Aug 2017 16:15:46 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3xf5ql2x7yz1qsZH;
	Fri, 25 Aug 2017 18:15:47 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3xf5ql1v7gz3hhTj;
	Fri, 25 Aug 2017 18:15:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id P8MryGEnzlqB; Fri, 25 Aug 2017 18:15:46 +0200 (CEST)
X-Auth-Info: fr6WjuJQcN9v2v1S+oC8lKha/AlAik0bhHqm5ydvCEQHU7YU031gmPUpGk0izKPQ
Received: from [10.0.0.72] (host-141-40-253-38.customer.izb-online.de
	[141.40.253.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Fri, 25 Aug 2017 18:15:46 +0200 (CEST)
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <fa27449a-ffe7-c742-3d2f-6bcac9cac20f@menlosystems.com>
	<20170825095808.31468-1-o.mandel@menlosystems.com>
	<1503671574.21398.3.camel@linux.intel.com>
From: Olaf Mandel <o.mandel@menlosystems.com>
Message-ID: <904e30cd-13f3-844e-92ca-a01c0efc408f@menlosystems.com>
Date: Fri, 25 Aug 2017 18:14:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503671574.21398.3.camel@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] (PRE)MIRRORS: add pattern for npm:// without slash
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
X-List-Received-Date: Fri, 25 Aug 2017 16:15:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello Leonardo,

Am 25.08.2017 um 16:32 schrieb Leonardo Sandoval:
> instead of adding a new npm regex, not sure if below one would the
> same job
> 
> npm://.*(/.*)?
> 
No: the string is split into different parts before the RE is
considered. So the fetch step fails with this error:

Exception: sre_constants.error: missing ), unterminated subpattern at
position 2

Probably because the pattern was split to:

['npm', '.*(', '/.*)?', '', '', OrderedDict()]

Best regards,
Olaf
- -- 
Olaf Mandel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJZoEzpAAoJEFS9nbRiUh3/KgEIAKjWmkwrlR3CXNk1zYgS9XKb
FQsE47IYogdtLMSgjgbjo+tUVj34a4NpPY4kNXdwadXNSOQZJPDcu2hzkvxAyAVd
9pX0YtxASx4A25/kgBKiTzOL62gGf3vYAnCg3hCC4nPnZE5d49Xg/oNvhQ2E34xv
vZMaohiPwK5B2QJpPDYtVXEC72ExoMzeoEy1x46hIplQQTh3CE481TKHbFj1he/a
UVwRalNhePQbpScDu49oYdrg8bIl+GfmuDwFE5zLAWBdkkgFaDlLdbwUoz+om3xa
GUHA9eL0lu8CWmrZe1Y4RZuGgj42yJd1CDd7NA3SkeHcB6gsAPzwyn6/UF2rivo=
=mQeF
-----END PGP SIGNATURE-----

