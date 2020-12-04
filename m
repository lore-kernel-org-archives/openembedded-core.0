Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.809.1607117404242697016
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 13:30:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KK4aCaR9;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4LU20o104815;
	Fri, 4 Dec 2020 15:30:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607117402;
	bh=6MiHxhbVuy/Cs8Xm/F/CxhEAZJXL9HL6rI9UGGXdLKE=;
	h=To:From:CC:Subject:Date;
	b=KK4aCaR9pr1lA3OeKdSHN53s3ZsMDsYm7OsHYNoqR7IgpgAZVRpnoI/2jfrlrCciq
	 pXEOebMkxp3wfDqaTCPB9vhIlR+qneL11lkL+MhNGhEpt8CEUZvOUZv0xQ2fYZCGbS
	 gPXdaZaMEbpEZbAIFVmajVOAIzl1qcqNjwHpcqPE=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4LU2fS015870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Dec 2020 15:30:02 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 15:30:01 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 15:30:01 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4LU0o7059862;
	Fri, 4 Dec 2020 15:30:01 -0600
To: <bruce.ashfield@gmail.com>
From: "Dan Murphy" <dmurphy@ti.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: [RFC]Backport of a patch from master to dunfell
Message-ID: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
Date: Fri, 4 Dec 2020 15:29:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello

How do we get this patch below backported to dunfell?

https://git.openembedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?h=gatesgarth&id=d9e327063f63193186822d958706081d64ec8139

We at TI are seeing similar issues with Dunfell and cryptodev modules on 
5.10 builds.

Dan


