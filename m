Received: from mail-out.m-online.net ([212.18.0.9])
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <wd@denx.de>)
	id 1Q5Irl-0006of-Op for openembedded-core@lists.openembedded.org;
	Thu, 31 Mar 2011 16:28:53 +0200
Received: from frontend1.mail.m-online.net (unknown [192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id D47AB1C08E0C;
	Thu, 31 Mar 2011 16:19:20 +0200 (CEST)
X-Auth-Info: pWlHTCHtN4oR1PSfoVUxeP69QpxiACtnNRqU3/KoVOY=
Received: from diddl.denx.de (host-80-81-18-216.customer.m-online.net
	[80.81.18.216])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 75CE01C000BE;
	Thu, 31 Mar 2011 16:19:20 +0200 (CEST)
Received: from gemini.denx.de (unknown [10.0.0.2])
	by diddl.denx.de (Postfix) with ESMTP id 529D0329A66F;
	Thu, 31 Mar 2011 16:19:20 +0200 (CEST)
Received: from gemini.denx.de (localhost.localdomain [127.0.0.1])
	by gemini.denx.de (Postfix) with ESMTP id 3B1C5F03208;
	Thu, 31 Mar 2011 16:19:20 +0200 (CEST)
To: Paul Eggleton <paul.eggleton@linux.intel.com>
From: Wolfgang Denk <wd@denx.de>
MIME-Version: 1.0
In-reply-to: <41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
References: <cover.1301578942.git.paul.eggleton@linux.intel.com>
	<41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com>
Comments: In-reply-to Paul Eggleton <paul.eggleton@linux.intel.com>
	message dated "Thu, 31 Mar 2011 14:46:14 +0100."
Date: Thu, 31 Mar 2011 16:19:20 +0200
Message-Id: <20110331141920.3B1C5F03208@gemini.denx.de>
X-Mailman-Approved-At: Thu, 31 Mar 2011 16:41:21 +0200
Cc: poky@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 1/1] README.hardware: remove u-boot flashing instructions for mpc8315e-rdb
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
X-List-Received-Date: Thu, 31 Mar 2011 14:28:53 -0000
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit

Dear Paul Eggleton,

In message <41ae31ba057b63d3c518e2edf217109c59b64603.1301578942.git.paul.eggleton@linux.intel.com> you wrote:
> From: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Upgrading u-boot is apparently not necessary with current board revisions,
> and these instructions may not work properly anyway (our toolchain seems not
> to be able to compile u-boot in the way described), and given that they are
> potentially risky they should be removed.

The instructions you delete appear to be pretty generic ones, and I
see no reason why they would not work.

If the Poky too chain has issues with this, then there is a problem
with that tool chain, and you should enter a bug report.

What exactly would that problem be?

In any case, just papering over the problems seems not a good
startegy to me.

Best regards,

Wolfgang Denk

-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
It's a small world, but I wouldn't want to paint it.


