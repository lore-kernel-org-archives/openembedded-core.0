Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1S9xSd-0005Nx-R9 for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 12:42:43 +0100
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id 3VBsV75KYCz4Kh0t;
	Tue, 20 Mar 2012 12:33:51 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.8.164])
	by mail.m-online.net (Postfix) with ESMTP id 3VBsV72VgPz4KK4V;
	Tue, 20 Mar 2012 12:33:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from smtp-auth.mnet-online.de ([192.168.8.180])
	by localhost (dynscan1.mail.m-online.net [192.168.8.164]) (amavisd-new,
	port 10024)
	with ESMTP id n4DslqDKCJyM; Tue, 20 Mar 2012 12:33:50 +0100 (CET)
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216]) by smtp-auth.mnet-online.de (Postfix) with ESMTPA;
	Tue, 20 Mar 2012 12:33:49 +0100 (CET)
Received: from gemini.denx.de (gemini.denx.de [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id BEAC71A6535;
	Tue, 20 Mar 2012 12:33:49 +0100 (CET)
Received: from gemini.denx.de (localhost [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id D4362202A50;
	Tue, 20 Mar 2012 12:33:48 +0100 (CET)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	Denys Dmytriyenko <denis@denix.org>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <20120320004345.GG15554@denix.org>
References: <20120319215934.5336A206060@gemini.denx.de>
	<20120320004345.GG15554@denix.org>
Comments: In-reply-to Denys Dmytriyenko <denis@denix.org>
	message dated "Mon, 19 Mar 2012 20:43:45 -0400."
Date: Tue, 20 Mar 2012 12:33:48 +0100
Message-Id: <20120320113348.D4362202A50@gemini.denx.de>
Subject: Re: specific version dependenciews - was: Linking two recipes
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
X-List-Received-Date: Tue, 20 Mar 2012 11:42:44 -0000
Content-type: text/plain; charset=UTF-8
Content-transfer-encoding: 8bit

Dear Denys,

In message <20120320004345.GG15554@denix.org> you wrote:
>
> > Is there a clever way to describe such a multi-level dependency chain?
> 
> Will this help? See line #4 in the first example and lines #30-31 in second:
> 
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/gnutls/gnutls.inc#n4
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb#n30

Yes, this looks indeed interesting.

Is there also away to ask for a specific package version, i. e.
instead of "libgcrypt (>= 1.4.2)" something like "libgcrypt (= 1.4.2)"
or "libgcrypt-1.4.2" or such?

> There are some caveats with that notation, IIRC...

What would these be?  Is there any documentation about such details?
I searched the bitbake, poky and yocto docs but could not find it...

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Our OS who art in CPU, UNIX be thy name.
Thy programs run, thy syscalls done,
In kernel as it is in user!


