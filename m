Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A68C6CDCB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 09:03:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9I93u1M029208
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 18 Oct 2013 02:03:56 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 18 Oct 2013 02:03:56 -0700
Message-ID: <5260F97B.9080701@windriver.com>
Date: Fri, 18 Oct 2013 17:03:55 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
	<67863C52-194A-4D5E-BB85-4939BE6E93D2@dominion.thruhere.net>
In-Reply-To: <67863C52-194A-4D5E-BB85-4939BE6E93D2@dominion.thruhere.net>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Fri, 18 Oct 2013 09:03:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/18/2013 04:57 PM, Koen Kooi wrote:
>> +
>> >+EXTRA_PARAM=""
>> >+if test $nfsroot -eq 1 ; then
> Ah. A whole lot of tests for a script that only runs*after*  NFS root has been detected already. Looks like you can kill that part of the script.
>
>

Yes, Thanks



-- 
Best Reagrds,
Roy | RongQing Li

