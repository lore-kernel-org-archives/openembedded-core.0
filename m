Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
 by mx.groups.io with SMTP id smtpd.web11.3755.1627403755574503319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jul 2021 09:35:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=dwrobel@ertelnet.rybnik.pl header.s=ertelnet header.b=DWIlQfMY;
 spf=pass (domain: ertelnet.rybnik.pl, ip: 136.143.188.14, mailfrom: dwrobel@ertelnet.rybnik.pl)
ARC-Seal: i=1; a=rsa-sha256; t=1627403752; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UaCBpPUWlyMBxgr3ipxdQ9lvTZaNdprQGiyQ4elUI42X+wB/X7BSP6cMRaD0SEBcH3gFTw+vieAfFuAOdXC8Be1DMY14u4+PYLFj+WDyjEj+vWLIs5tFRiEYdGnPgEhpz1aX3+80weEFRLJURRI/67XWcJU0R4blOdzqsvqVJ00=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1627403752; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=BxUnQWhKo0SWzKrzFVOcl5ztwqlZaVg3qRKlhus5Ur8=; 
	b=aFr/lJQvbMcftr8Acov2EEtDqDKaxG1EHqnlrCRW8n4jrqMaJpT/uz/DPkcZzTy0Ium/hMHy94cCSVn5E7xgCJlh90p3ycQleI3Z5sMGAllvKC4Gxuy1WgI5pQeAAB998oIu9XnjhTldhdkvP981qiHV911DIhIawtm3wutIf30=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ertelnet.rybnik.pl;
	spf=pass  smtp.mailfrom=dwrobel@ertelnet.rybnik.pl;
	dmarc=pass header.from=<dwrobel@ertelnet.rybnik.pl>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627403752;
	s=ertelnet; d=ertelnet.rybnik.pl; i=dwrobel@ertelnet.rybnik.pl;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=BxUnQWhKo0SWzKrzFVOcl5ztwqlZaVg3qRKlhus5Ur8=;
	b=DWIlQfMYQ/Dc7cuDVcdVatgEpnrnyzdWn5HSZYlvKSY0zzydc/2lxIDvzDp1Q9DO
	B+RCVr74ArTEg7qZ6gK42wthyykGisw37rFZf9GuAHAwptrlKYnHxmFtC1zLJGtmZDF
	+JrMtvrjBUUsk2Myj7neyE4HwIAlU/hJVQpXd0lM=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1627403750683372.3381106998612; Tue, 27 Jul 2021 09:35:50 -0700 (PDT)
Date: Tue, 27 Jul 2021 18:35:50 +0200
From: "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl>
To: "Seebs" <seebs@seebs.net>
Cc: "openembedded-core" <openembedded-core@lists.openembedded.org>
Message-ID: <17ae8d28d09.af318d0d58783.8610860541762814287@ertelnet.rybnik.pl>
In-Reply-To: <20210727104927.18f26c21@seebsdell>
References: <20210727114906.191837-1-dwrobel@ertelnet.rybnik.pl> <20210727104927.18f26c21@seebsdell>
Subject: Re: [OE-core] [PATCH pseudo 1/4] Remove -fno-strict-aliasing and -Wno-deprecated-declarations
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit




 ---- On Tue, 27 Jul 2021 17:49:27 +0200 Seebs <seebs@seebs.net> wrote ----
 > On Tue, 27 Jul 2021 13:49:03 +0200
 > "Damian Wrobel" <dwrobel@ertelnet.rybnik.pl> wrote:
 > 
 > > -# no-strict-aliasing is needed for the function pointer trickery.
 > >  pseudo_wrappers.o: $(GUTS) pseudo_wrappers.c pseudo_wrapfuncs.c
 > > pseudo_wrapfuncs.h pseudo_tables.h
 > > -    $(CC) -fno-strict-aliasing $(CFLAGS) $(CFLAGS_PSEUDO)
 > > -D_GNU_SOURCE -c -o pseudo_wrappers.o pseudo_wrappers.c
 > 
 > I would be really uncomfortable relying on that not being needed, even
 > if it happened to work in specific cases. The function pointer trickery
 > is black magic and very much undefined behavior, and warning the
 > compiler away from it seems reasonably likely to be advantageous.

Based on my experience, It's usually better to see this warning and fix the code instead of relying on the back magic.

--
Regards,
Damian

 > 
 > -s
 > 
 > 
 > 
 > 
