Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1SX4rw-0003ax-UL for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 08:16:24 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3Vy3BY4Cjfz4KMYx;
	Wed, 23 May 2012 08:06:13 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3Vy3BY32Ctz4KK4C;
	Wed, 23 May 2012 08:06:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id 3fTGUCjADiUl; Wed, 23 May 2012 08:06:13 +0200 (CEST)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Wed, 23 May 2012 08:06:12 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 5FBFF1A85E4;
	Wed, 23 May 2012 08:06:12 +0200 (CEST)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 50C71207171;
	Wed, 23 May 2012 08:06:12 +0200 (CEST)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Jason Wessel <jason.wessel@windriver.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <1337749401-27198-1-git-send-email-jason.wessel@windriver.com>
References: <1337749401-27198-1-git-send-email-jason.wessel@windriver.com>
Comments: In-reply-to Jason Wessel <jason.wessel@windriver.com>
	message dated "Wed, 23 May 2012 00:03:21 -0500."
Date: Wed, 23 May 2012 08:06:12 +0200
Message-Id: <20120523060612.50C71207171@gemini.denx.de>
Subject: Re: [PATCH] perl: Allow perl to cross build and native build in a directory named "t"
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
X-List-Received-Date: Wed, 23 May 2012 06:16:25 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Jason Wessel,

In message <1337749401-27198-1-git-send-email-jason.wessel@windriver.com> you wrote:
> If any directory in leading up to your tmp directory has the name "t"
> perl will fail to build with a very cryptic error shown below:
> 
> pod/buildtoc: no pods at pod/buildtoc line 305.
> make[1]: *** [pod/perltoc.pod] Error 255


This error message is missing in the patch itself:


> --- /dev/null
> +++ b/meta/recipes-devtools/perl/perl-5.14.2/perl-build-in-t-dir.patch
> @@ -0,0 +1,35 @@
> +Upstream-Status:Pending
> +
> +Perl cannot cross build in a path containing a directory that
> +has the name of "t".
> +
> +You get an error like:
> +
> +
> +Signed-off-by: Jason Wessel <jason.wessel@windriver.com>

... i. e. here.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
"More software projects have gone awry for lack of calendar time than
for all other causes combined."
                         - Fred Brooks, Jr., _The Mythical Man Month_


