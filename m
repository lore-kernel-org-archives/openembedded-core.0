Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SyNpK-0007vy-8z for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 15:58:34 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3WrKsR6Jjdz4KK9x;
	Mon,  6 Aug 2012 15:46:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3WrKsR4mttzbbj1;
	Mon,  6 Aug 2012 15:46:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 4nKhxO1yjFLc; Mon,  6 Aug 2012 15:46:42 +0200 (CEST)
X-Auth-Info: uIkEplrpWPB2KlhWyJT2+j9P2Dao805+ceqSNy4+azM=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Mon,  6 Aug 2012 15:46:42 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 1D4361A2115;
	Mon,  6 Aug 2012 15:46:42 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id E98B3203FD8;
	Mon,  6 Aug 2012 15:46:41 +0200 (CEST)
To: Radu Moisan <radu.moisan@intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <501FC96A.8000400@intel.com>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
	<20120806074542.A63C0203FD8@gemini.denx.de>
	<501FC96A.8000400@intel.com>
Comments: In-reply-to Radu Moisan <radu.moisan@intel.com>
	message dated "Mon, 06 Aug 2012 16:40:58 +0300."
Date: Mon, 06 Aug 2012 15:46:41 +0200
Message-Id: <20120806134641.E98B3203FD8@gemini.denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 06 Aug 2012 13:58:34 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Radu,

In message <501FC96A.8000400@intel.com> you wrote:
>
> in the new shell
> 
>  >make coreboot-x86 (without _config)
> 
> The output I got is as follows:
> 
> Configuring for coreboot-x86 - Board: coreboot, Options: 
> SYS_TEXT_BASE=0xFC0000
> make
> /bin/bash: i386-linux-gcc: command not found
> /bin/bash: i386-linux-gcc: command not found

It seems CROSS_COMPILE is set to "i386-linux-", but i386-linux-gcc is
not anywhere in your PATH.  Please check your PATH and fix it.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Advice is seldom welcome; and those who want it the most always like
it the least.                         -- Philip Earl of Chesterfield


