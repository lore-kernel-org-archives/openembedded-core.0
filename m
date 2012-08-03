Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SxM7S-0003mm-5R
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Aug 2012 19:57:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q73HjJAZ025577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Aug 2012 10:45:19 -0700 (PDT)
Received: from msp-dhcp43.wrs.com (172.25.34.43) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 3 Aug 2012 10:45:19 -0700
Message-ID: <501C0E2C.50108@windriver.com>
Date: Fri, 3 Aug 2012 12:45:16 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <501BFFD9.6060108@windriver.com>
In-Reply-To: <501BFFD9.6060108@windriver.com>
Subject: Re: how to fix WARNING: QA Issue: libpam: installed in the base_prefix, requires a shared library under exec_prefix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Aug 2012 17:57:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/12 11:44 AM, Yao Zhao wrote:
> Hi all,
>
> Any suggestion to fix these kinds of QA warnings?
>
> libpam is referencing /usr/lib/libcrack from /lib/security.
>
> I tried to fix cracklib to install to /lib but cracklib is using other
> libraries from /usr/lib, I am afraid that I am touching a chain, so any
> good ideas?

Historically I'm used to cracklib being in /lib... but I also don't remember a 
huge chain of additional libraries.

It may be worth identifying the chain and seeing if we can break it, or at least 
reduce it in some fairly easy way.

--Mark

> thanks,
> yao
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



