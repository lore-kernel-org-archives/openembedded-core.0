Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SN2S0-0007Yg-SR for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 15:40:08 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3Vd2N918Lsz4Kn99;
	Wed, 25 Apr 2012 15:30:32 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3Vd2N86WVMz4KK2R;
	Wed, 25 Apr 2012 15:30:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id HeXkUTkDAnfZ; Wed, 25 Apr 2012 15:30:32 +0200 (CEST)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Wed, 25 Apr 2012 15:30:32 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id F18801A5A7F;
	Wed, 25 Apr 2012 15:30:31 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id DFEBD204AE2;
	Wed, 25 Apr 2012 15:30:31 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Otavio Salvador <otavio@ossystems.com.br>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <0d6637cfcd02587fe62c2c550aac5a33ce9cc72d.1335118370.git.otavio@ossystems.com.br>
References: <cover.1335118369.git.otavio@ossystems.com.br>
	<cover.1335118369.git.otavio@ossystems.com.br>
	<0d6637cfcd02587fe62c2c550aac5a33ce9cc72d.1335118370.git.otavio@ossystems.com.br>
Comments: In-reply-to Otavio Salvador <otavio@ossystems.com.br>
	message dated "Sun, 22 Apr 2012 16:15:24 -0300."
Date: Wed, 25 Apr 2012 15:30:31 +0200
Message-Id: <20120425133031.DFEBD204AE2@gemini.denx.de>
Subject: Re: [PATCH 3/5] u-boot-fw-utils: add 2012.04 release
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
X-List-Received-Date: Wed, 25 Apr 2012 13:40:08 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Otavio Salvador,

In message <0d6637cfcd02587fe62c2c550aac5a33ce9cc72d.1335118370.git.otavio@ossystems.com.br> you wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb |   33 ++++++++++++++++++++
>  1 files changed, 33 insertions(+), 0 deletions(-)
>  create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2012.04.bb

Please update and use v2012.04.01 instead.  This is a bug fix release
which fixes a nasty bug in the command line processing, which can
cause incorrect execution of commands and scripts.

Thanks.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"Out of register space (ugh)"
- vi


