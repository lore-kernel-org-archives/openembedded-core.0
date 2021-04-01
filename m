Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.7618.1617312653533179560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Apr 2021 14:30:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=JVvOvSh3;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 131LUn6t056665;
	Thu, 1 Apr 2021 16:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617312649;
	bh=GcjmIk5jmjpTk4CRqGnxqx/CH8a/botzH0dQY70GVlA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JVvOvSh3i1o2XfqvY8QVGx9zZlCVLJhHr9EttC2KxUkLGdY2SThjc1MT+JKrh9+xh
	 ULns9tvxT4zQM8BZu2RBD2by9sricw+G269OnvdgFMEzeP6zMZmVQMCCIyReuYVTSF
	 KypTU8Biu+lWrA8V0OJKV1uPeZU5Z8V5lS/sUq7U=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 131LUnu0116157
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Apr 2021 16:30:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 1 Apr
 2021 16:30:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 1 Apr 2021 16:30:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 131LUnBu041220;
	Thu, 1 Apr 2021 16:30:49 -0500
Date: Thu, 1 Apr 2021 16:30:49 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: Denys Dmytriyenko <denis@denix.org>,
        Patches and discussions about the
 oe-core layer <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] make-mod-scripts: pass CROSS_COMPILE to configure and build
Message-ID: <20210401213049.sr4dpimkilbwfpdj@sulfide>
References: <1617235191-37594-1-git-send-email-denis@denix.org>
 <CADkTA4PmeaiFRZLxFkJ=TJnWLcMHYnEn_tvNUwZ4N+uHV05S-Q@mail.gmail.com>
 <20210401203131.6sxb4rnpopuvkzni@upstate>
 <CADkTA4OYuHR_GF2pUmjEE=-YfWEy4KQwSjj7FXoxd+i37s=TMA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OYuHR_GF2pUmjEE=-YfWEy4KQwSjj7FXoxd+i37s=TMA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:52-20210401, Bruce Ashfield wrote:
[...]
> > Though I still don't understand the rationale why would we not move
> > CROSS_COMPILE from kernel.bbclass to kernel-arch.bbclass instead of
> > having to duplicate it here? after all KERNEL_CC etc are in that realm
> > and would'nt CROSS_COMPILE fall in that bucket?
> 
> It is definitely a valid thing to do as well.
> 
> My only hesitation is the timing. We are very close to release, so I'd
> prefer the lightest touch fix, which is this one.
> 
> We can of course revisit in about a month when the release is out.

Aah, thanks.. understood. And, thanks for looking closer at this.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
