Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SxKvj-0002RH-NN for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 18:40:51 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3WpYNk2XcNz4KK6S;
	Fri,  3 Aug 2012 18:19:18 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3WpYNk2QyXzbbcf;
	Fri,  3 Aug 2012 18:19:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 6kNwRDjGmpsc; Fri,  3 Aug 2012 18:19:15 +0200 (CEST)
X-Auth-Info: sxh+mPbL7rBLN8FlRQVzpUFjiVuDwijyW+5qM/YtL4g=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Fri,  3 Aug 2012 18:19:15 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 45AAB1A2157;
	Fri,  3 Aug 2012 18:19:15 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 399D1203B3D;
	Fri,  3 Aug 2012 18:19:15 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Radu Moisan <radu.moisan@intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
Comments: In-reply-to Radu Moisan <radu.moisan@intel.com>
	message dated "Fri, 03 Aug 2012 15:38:42 +0300."
Date: Fri, 03 Aug 2012 18:19:15 +0200
Message-Id: <20120803161915.399D1203B3D@gemini.denx.de>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Fri, 03 Aug 2012 16:40:51 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Radu Moisan,

In message <1343997523-4117-1-git-send-email-radu.moisan@intel.com> you wrote:
> Building u-boot requires UBOOT_MACHINE. In the u-boot README file
> building u-boot is achieved with "make NAME_config" and then
> "make all". I assumend UBOOT_MACHINE to be the "NAME" part and thus,

Actually a plain

	make NAME

does the same as "make NAME_config && make all".

You might also consider running "./MAKEALL NAME" instead, which
aut-adjusts to te number of available cores on the build host, so you
get somewhat reduced build times.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
An Elephant is a mouse with an Operating System.              - Knuth


