Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by mx.groups.io with SMTP id smtpd.web12.9708.1593183397594791490
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 07:56:38 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cetitec.com, ip: 212.227.17.24, mailfrom: johannes.beisswenger@cetitec.com)
Received: from mail.cetitecgmbh.com ([87.190.42.90]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Md6AP-1jFVA01iaZ-00aAfk; Fri, 26 Jun 2020 16:56:35 +0200
Received: from pflvmailgateway.corp.cetitec.com (unknown [127.0.0.1])
	by mail.cetitecgmbh.com (Postfix) with ESMTP id C01D6651A6F;
	Fri, 26 Jun 2020 14:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at cetitec.com
Received: from mail.cetitecgmbh.com ([127.0.0.1])
	by pflvmailgateway.corp.cetitec.com (pflvmailgateway.corp.cetitec.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qmj_vUezcd4M; Fri, 26 Jun 2020 16:56:34 +0200 (CEST)
Received: from pfwsexchange.corp.cetitec.com (unknown [10.10.1.99])
	by mail.cetitecgmbh.com (Postfix) with ESMTPS id 5C5B7651A3B;
	Fri, 26 Jun 2020 16:56:34 +0200 (CEST)
Received: from [10.10.5.239] (10.10.5.239) by PFWSEXCHANGE.corp.cetitec.com
 (10.10.1.99) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Jun
 2020 16:56:34 +0200
Subject: Re: [OE-core] [pseudo][PATCH 1/2] xattr: Fixed corrupting UID&GID when running setfacl -m on a directory
To: Seebs <seebs@seebs.net>
CC: <openembedded-core@lists.openembedded.org>
References: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
 <20200626090553.6853a571@seebsdell>
From: "Johannes Beisswenger" <johannes.beisswenger@cetitec.com>
Message-ID: <49dc076b-16fd-cd82-5793-bbf2c2fc9adf@cetitec.com>
Date: Fri, 26 Jun 2020 16:56:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626090553.6853a571@seebsdell>
X-Originating-IP: [10.10.5.239]
X-ClientProxiedBy: PFWSEXCHANGE.corp.cetitec.com (10.10.1.99) To
 PFWSEXCHANGE.corp.cetitec.com (10.10.1.99)
X-EsetResult: clean, is OK
X-EsetId: 37303A290D7F536B6C7463
X-Provags-ID: V03:K1:Cx/UKbfC2ZpbA0jPrFEXtBMoMRdwgAolwaP4h2ktkb+YnTfN5j7
 F+R47SPYuxX3qy0HryaUiYJxCc8MzvemCWEQ4zAhnxqBb4++6lnoptZa/IjkbJZHQS9JvN0
 riJaTG0LiEMLAsPW2LI9Tx75he1pdAowKVtLNXASPDg+XUQnQl8hib8rkyImjB2OhcfwAKM
 oehhyOyrsGDQBoK8zX2Yw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:BcFGgIPEHV0=:srdqAD3D3nvQ0d6szZ9M1p
 WQf6cFjr6m8ITlEJToCGoErSyB1Z8mwIiDfBCucmciEnmVmng2aBxvWpdpZopQ36VDjEFt9Vj
 Bej94oJmEbrBb/KAMnI3y7P89xKcWYOUeXeExQCT9ewaa//88T0YrHdhJqkbzolrMelpxSv+M
 MZIwwF5sQ0UCLPhvmeALC067xIFE8GGytFn9CoJwYPExWYFYMvmuNT2Z4Mr8cz22/WpUu0HTT
 MbMaZi1TjLpRIy039R3ZPfQXtag0NZ8lGxKu+I3o4TdptSD0Mldq4/scJuXvQY8uHJKFEgIDy
 PETS0CSRZxKRnWlOwsdgvcW2PsTVqjgBkAY6gkwFivIcgp4Fc79RWqAzRJ9Dj1B/fkBMoYupl
 UJP6hgLp8J06nbXy9ANDdSNWWfRgGpJGxB0xZTZuJnizdG/dvGxyCUUAolm2j8WzHvd6+tTTe
 MapAUp2O+cuYC0w5lDZlIUICQZrMlZ8MmzsHt0kjCLbMIaWTCzc3zw/63t8fUbB2HAe8YUGc0
 6/CGS0IdRfM8g3AXubYNkDOAecI7uNZqti351XS4d+a86cuy+5//h5NyQ4CflOnG8k0W+iCGh
 AiH73cwqTkib1cIBcLdU2drOXbjI3VU6RL3vPEkMq9cii3X0LurXmgJk2M1s04s1Ud70i9XoH
 +Z4DZrnibGaMpqysmzJLMuN1oFbYEy48UiMMteV0sI7DTQ5m+ZblQ8WWrWcakM6PuQ6u42suO
 Txmj8j5XzkESgBR5FMfUT9t/mYHq/KBCcpJCW4PiARGPkV5xgpZrjmEZ50I9XUuWsmXwYY5FD
 Az2lt52tF2S/Eu0jKK9IOexNjgN+FSY1VRPsd4VcarAUQlfljKz8PntD3XU6HP6ZzOowVGDp1
 5c86gbO1IAdssAFWIqMA==
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Thanks for the fast reply!

> Good catch, but we should still be masking in the permissions bits, we
> just shouldn't be overwriting the non-permissions bits, I think?

The OP_CREATE/REPLACE/SET_XATTR operations in pseudo_op() don't use 
msg_header.mode at all, it is only used for DB sanity checks, which in 
turn only use the non-permission bits.
So it certainly does not hurt to add them back in, and thus might be the 
proper thing to do.
Not knowing the code base I simply was being conservative and left the 
original mode unaltered.
I can send an updated patch on Monday.

On a different note, the shared_setxattr() code for the darwin port is 
very similar and also overwrites buf.st_mode and thus is also affected 
by this buf. In addition to that it is also missing the changes 
introduced by this commit 
http://git.yoctoproject.org/cgit/cgit.cgi/pseudo/commit/?id=cc6b2008646318c01153d39fef191da3e35a5fc8, 
since I don't have access to a darwin system to test any changes I left 
the port alone, but someone should look into this.

--
Johannes Beisswenger
