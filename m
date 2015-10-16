Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6CFFF77055
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 09:32:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G9WbqB011622
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Oct 2015 02:32:37 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Fri, 16 Oct 2015 02:32:36 -0700
Message-ID: <5620C452.8040601@windriver.com>
Date: Fri, 16 Oct 2015 17:33:06 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <cover.1444979576.git.Qi.Chen@windriver.com>	
	<7314976f3f2463926748eec4fbf8c0a3111c4caf.1444979576.git.Qi.Chen@windriver.com>
	<1444984136.19532.7.camel@pbcl.net>
In-Reply-To: <1444984136.19532.7.camel@pbcl.net>
X-Originating-IP: [128.224.162.211]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] openssl: don't move libcrypto to base_libdir
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
X-List-Received-Date: Fri, 16 Oct 2015 09:32:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2015 04:28 PM, Phil Blundell wrote:
> On Fri, 2015-10-16 at 15:14 +0800, Chen Qi wrote:
>> A patch more than two years ago moves libcrypto from libdir to base_libdir
>> for the reason of /usr split. And I don't think this reason still stands.
> Why not?
>
> p.
>
>
>
>

1) There are a bunch of /usr split patches on the mailing list and they 
are not accepted.
2) It was moved to /lib because dhclient started before mounting the 
local filesystem on sysvinit.
     Now, mounting local filesystem happens before dhclient in sysvinit.

// Qi

