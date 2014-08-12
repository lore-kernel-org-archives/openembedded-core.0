Return-Path: <Li.Wang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E44F65D57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 08:44:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7C8iMKo000344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Aug 2014 01:44:22 -0700 (PDT)
Received: from [128.224.163.185] (128.224.163.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 12 Aug 2014 01:44:21 -0700
Message-ID: <53E9D3E2.7020101@windriver.com>
Date: Tue, 12 Aug 2014 16:44:18 +0800
From: "Li.Wang" <Li.Wang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1407824758-9261-1-git-send-email-li.wang@windriver.com>
	<1407828058-9939-1-git-send-email-li.wang@windriver.com>
	<CAJTo0LZW2OdpmevQW+5+j9Vau2M2qUpe+XUEL9aO6b=WS_B5fg@mail.gmail.com>
In-Reply-To: <CAJTo0LZW2OdpmevQW+5+j9Vau2M2qUpe+XUEL9aO6b=WS_B5fg@mail.gmail.com>
X-Originating-IP: [128.224.163.185]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpcbind: add option to fix port number
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
X-List-Received-Date: Tue, 12 Aug 2014 08:44:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

this is a description from customer:
=====
customer's description of the problem:
"
It would seem rcpbind opens a random port.
     Clearly not the most simple thing to protect with an ipfilter.
     Opening random ports in privileged port range, among them one port 
that
     identifies itself as pop3s, is not a good practice. Both Ericsson 
and our
     customers run regular vulnerability assessment tools against our 
product,
     and this will clearly be seen as a potential problem. Furthermore, 
we will
     not be able to filter the ports, since they are random, and neither 
will we
     be able to provide decent answers to our customers. To summarize: this
     should be taken care of, ie fix rpcbind so that it uses a non 
random port
     and/or to bind to a specific interface.
=====

Thanks,
LiWang.

On 08/12/2014 04:41 PM, Burton, Ross wrote:
> On 12 August 2014 08:20, Li Wang <li.wang@windriver.com> wrote:
>> fix a random port to offer customer an option for select.
> I'm curious as to why this is needed.
>
> Ross


