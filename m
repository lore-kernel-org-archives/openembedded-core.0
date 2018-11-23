Return-Path: <ola.x.nilsson@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03F4C6C690
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 11:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 82F1D185B9;
	Fri, 23 Nov 2018 12:12:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 7euobQNw1psn; Fri, 23 Nov 2018 12:12:57 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 0BC4B185FD;
	Fri, 23 Nov 2018 12:12:56 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E15F41A069;
	Fri, 23 Nov 2018 12:12:56 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D622A1A064;
	Fri, 23 Nov 2018 12:12:56 +0100 (CET)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 23 Nov 2018 12:12:56 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id CA3591D93;
	Fri, 23 Nov 2018 12:12:56 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 23 Nov 2018 12:12:56 +0100
Received: from lnxolani1 (10.0.5.60) by xbox02.axis.com (10.0.5.16) with
	Microsoft SMTP Server id 15.0.1365.1 via Frontend Transport;
	Fri, 23 Nov 2018 12:12:56 +0100
References: <0473F6BDF4E7AC46B8E60219F1EDEEBC3C09B6@PGSMSX101.gar.corp.intel.com>
	<0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39@PGSMSX101.gar.corp.intel.com>
User-agent: mu4e 1.0; emacs 27.0.50
From: Ola x Nilsson <ola.x.nilsson@axis.com>
To: "Bheemanadhuni, SrikanthX X" <srikanthx.x.bheemanadhuni@intel.com>
In-Reply-To: <0473F6BDF4E7AC46B8E60219F1EDEEBC3C0A39@PGSMSX101.gar.corp.intel.com>
Date: Fri, 23 Nov 2018 12:12:46 +0100
Message-ID: <jwqtvk82gk1.fsf@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-selftest : Unset SANITY_TESTED_DISTROS bugzilla: 11933
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
X-List-Received-Date: Fri, 23 Nov 2018 11:12:58 -0000
Content-Type: text/plain


On Fri, Nov 23 2018, Bheemanadhuni, SrikanthX X wrote:

> Hi,
>
>  
>
> unset the SANITY_TESTED_DISTROS in the function  _add_layer_libs() file b/meta/lib/oeqa/selftest/context.py
>
>  
>
> And added function remove_variables() which is called in 
>
> final:
>
>      self.remove_variables()
>
> the function will comment the the unset SANITY_TESTED_DISTROS in local.conf
>

I would keep/modify the message that SANITY_TESTED_DISTROS is needed, so
the user could set it before running oe-selftest the next time.  Just
like the meta-selftest layer.

-- 
Ola x Nilsson

