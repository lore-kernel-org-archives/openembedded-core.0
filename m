Return-Path: <olof.johansson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2B80760167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 775FF2E4FC;
	Thu, 30 Jul 2015 13:24:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id Xx+CH-aZNvOU; Thu, 30 Jul 2015 13:24:30 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id EEE232E4F3;
	Thu, 30 Jul 2015 13:24:29 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D7A81F25;
	Thu, 30 Jul 2015 13:24:29 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id CC36B1236;
	Thu, 30 Jul 2015 13:24:29 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id CAA0E34005;
	Thu, 30 Jul 2015 13:24:29 +0200 (CEST)
Received: from lnxolofjn.se.axis.com (10.92.17.1) by xmail2.se.axis.com
	(10.0.5.74) with Microsoft SMTP Server id 8.3.342.0; Thu, 30 Jul 2015
	13:24:29 +0200
Received: by lnxolofjn.se.axis.com (Postfix, from userid 20466)	id 8AD8F9C68B; 
	Thu, 30 Jul 2015 13:24:29 +0200 (CEST)
From: Olof Johansson <olof.johansson@axis.com>
To: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <55B9F7A5.3040100@windriver.com>
References: <1438249425-5423-1-git-send-email-olofjn@axis.com>
	<55B9F7A5.3040100@windriver.com>
Date: Thu, 30 Jul 2015 13:24:29 +0200
Message-ID: <1438255416-sup-6247@axis.com>
User-Agent: Sup/0.20.0
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Don't warn about "invalid" PACKAGECONFIGs by default
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
X-List-Received-Date: Thu, 30 Jul 2015 11:24:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from Robert Yang's message of 2015-07-30 12:08:37 +0200:
> I have a new patch for this, it will be moved into insane.bbclass,
> and the recipe can set INSANE_SKIP:
> +
> +    # Check invalid PACKAGECONFIG
> +    pkgconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
> +    if pkgconfig:
> +        pkgconfigflags = d.getVarFlags("PACKAGECONFIG") or {}
> +        for pconfig in pkgconfig:
> +            if pconfig not in pkgconfigflags:
> +                pn = d.getVar('PN', True)
> +                error_msg = "%s: invalid PACKAGECONFIG: %s" % (pn, pconfig)
> +                package_qa_handle_error("invalid-pkgconfig", error_msg, d)
> 
> I'm testing it, and will send it out sooner.

Thanks, such a patch would work nicely with my use case!

-- 
olof johansson

