Return-Path: <Li.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EDF4D65FE7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 08:34:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s898Y6xA014842
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Sep 2014 01:34:06 -0700 (PDT)
Received: from [128.224.163.149] (128.224.163.149) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 9 Sep 2014 01:34:06 -0700
Message-ID: <540EBB71.2070105@windriver.com>
Date: Tue, 9 Sep 2014 16:33:53 +0800
From: "Li.Wang" <Li.Wang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1407824758-9261-1-git-send-email-li.wang@windriver.com>
	<1407828058-9939-1-git-send-email-li.wang@windriver.com>
	<CAJTo0LZW2OdpmevQW+5+j9Vau2M2qUpe+XUEL9aO6b=WS_B5fg@mail.gmail.com>
	<53E9D3E2.7020101@windriver.com>
	<CAJTo0Lbw53Ors3EiVY3Jx2_d-CQ7jf58-_Y1TJK3L4oz8QexaQ@mail.gmail.com>
In-Reply-To: <CAJTo0Lbw53Ors3EiVY3Jx2_d-CQ7jf58-_Y1TJK3L4oz8QexaQ@mail.gmail.com>
X-Originating-IP: [128.224.163.149]
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
X-List-Received-Date: Tue, 09 Sep 2014 08:34:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2014 11:24 PM, Burton, Ross wrote:
> On 12 August 2014 09:44, Li.Wang <Li.Wang@windriver.com> wrote:
>>      Opening random ports in privileged port range, among them one port that
>>      identifies itself as pop3s, is not a good practice. Both Ericsson and
>> our
>>      customers run regular vulnerability assessment tools against our
>> product,
>>      and this will clearly be seen as a potential problem. Furthermore, we
>> will
>>      not be able to filter the ports, since they are random, and neither will
>> we
>>      be able to provide decent answers to our customers. To summarize: this
>>      should be taken care of, ie fix rpcbind so that it uses a non random
>> port
>>      and/or to bind to a specific interface.
> This has been bothering me so I just did some digging.  rpcbind
> opening random ports is rather "misguided" but it appears that passing
> -s to rpcbind will cause it to drop it's privs and setuid down to
> "daemon", with the side-effect that it can't open the privileged ports
> anymore.
>
> (source: http://wiki.metawerx.net/wiki/setrpcrandomport)
this way uses dynamic library, and I use command option which insert 
code to rpcbind.
I think our thought are same, but the complements are different.

indeed, rpcbind has two random ports:
one can be fixed by configure file.
the patch is to point at the other one.

Thanks,
LiWang.
>
> Ross


