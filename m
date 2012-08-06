Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SyIBx-0007A9-IR for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 09:57:33 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3Wr9rv3rTDz4KK6t;
	Mon,  6 Aug 2012 09:45:51 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3Wr9rv2JRdzbblg;
	Mon,  6 Aug 2012 09:45:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id 4mrvy-ol+jlQ; Mon,  6 Aug 2012 09:45:44 +0200 (CEST)
X-Auth-Info: 5w08DbAgCXufbKQ1sXRMxhsnB0Qz3l4yq70SjoT0nlM=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Mon,  6 Aug 2012 09:45:44 +0200 (CEST)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id D36011A2115;
	Mon,  6 Aug 2012 09:45:43 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id A63C0203FD8;
	Mon,  6 Aug 2012 09:45:42 +0200 (CEST)
To: Radu Moisan <radu.moisan@intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <501F63FF.1070401@intel.com>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
Comments: In-reply-to Radu Moisan <radu.moisan@intel.com>
	message dated "Mon, 06 Aug 2012 09:28:15 +0300."
Date: Mon, 06 Aug 2012 09:45:42 +0200
Message-Id: <20120806074542.A63C0203FD8@gemini.denx.de>
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
X-List-Received-Date: Mon, 06 Aug 2012 07:57:33 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Radu,

In message <501F63FF.1070401@intel.com> you wrote:
>
> > Actually a plain
> >
> > 	make NAME
> >
> > does the same as "make NAME_config && make all".
> >
> > You might also consider running "./MAKEALL NAME" instead, which
> > aut-adjusts to te number of available cores on the build host, so you
> > get somewhat reduced build times.
> 
> I've tried to build this way but got into some errors and did not 
> pursued further in debugging them. However, because UBOOT_MACHINE is 

Could you please tell me exactly what these errors were?  Log files
etc. highly appreciated...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
If programming was easy, they wouldn't need something as  complicated
as a human being to do it, now would they?
                       - L. Wall & R. L. Schwartz, _Programming Perl_


