Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.380.1607119095685900738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Dec 2020 13:58:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yPymZgz2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4LwETp116870;
	Fri, 4 Dec 2020 15:58:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607119094;
	bh=EzHs3lHJOyWZmlqIMw7/Cjoe7DjNcaJUb9aYm50C3Ik=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=yPymZgz224HfFHPVrXNIWXrkS0Z7jQz1ZetT/J0sjt8I2XAhaLGrjawWbienms+6M
	 eE03sraui1eWRxs+Wlbszi/7+/LW0kl2tDjxxOzLWxDlWpPJdhQicTDs4Ud5/jdxOQ
	 gjbMJxTWtAh/oHeIelz1mptrMj9m9zONLRQMBDe8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4LwEmM118198
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Dec 2020 15:58:14 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 15:58:14 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 15:58:14 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4LwEOr119050;
	Fri, 4 Dec 2020 15:58:14 -0600
Subject: Re: [OE-core] [RFC]Backport of a patch from master to dunfell
To: Konrad Weihmann <kweihmann@outlook.com>,
        <openembedded-core@lists.openembedded.org>
CC: <steve@sakoman.com>
References: <8a9e9b68-8fc3-824e-a6aa-7556945cea59@ti.com>
 <AM9PR09MB473930BB3590152E9973D066A8F10@AM9PR09MB4739.eurprd09.prod.outlook.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <52b29399-9153-274e-8439-ec46aa3456d3@ti.com>
Date: Fri, 4 Dec 2020 15:58:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM9PR09MB473930BB3590152E9973D066A8F10@AM9PR09MB4739.eurprd09.prod.outlook.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Konrad


On 12/4/20 3:35 PM, Konrad Weihmann wrote:
> I would include dunfell maintainer, so he can pick that up in his next 
> patch bump
> CC: steve@sakoman.com
>
Thanks for the info.

I am currently backporting them now locally just to make sure they fix 
my issue.

Apparently there are 3 patches on kernel.bbclass that need to be backported

Dan

