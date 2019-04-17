Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0EC7D302
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2019 07:40:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x3H7e2HJ019362
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Apr 2019 00:40:02 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 17 Apr 2019 00:40:02 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1555408184-375724-1-git-send-email-changqing.li@windriver.com>
	<1555408184-375724-2-git-send-email-changqing.li@windriver.com>
	<20190416131839.GA29433@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <b32d8b82-1dad-2cdf-d665-f1cbd6dc8a23@windriver.com>
Date: Wed, 17 Apr 2019 15:39:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190416131839.GA29433@localhost>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] glibc: Add a C.UTF-8 locale
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
X-List-Received-Date: Wed, 17 Apr 2019 07:40:06 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/16/19 9:18 PM, Adrian Bunk wrote:
> On Tue, Apr 16, 2019 at 05:49:44PM +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> * This patch is get from fedora project, link:
>> https://src.fedoraproject.org/rpms/glibc/blob/0457f649e3fe6299efe384da13dfc923bbe65707/f/glibc-c-utf8-locale.patch
>>
>> * At this point, most major distro have support this locale
>> ...
> Is there now agreement on the exact semantics of this locale?
> I remember this was a problem when it was suggested for upstream
> inclusion ~ 5 years ago
>
> E.g. the Debian definition of C.UTF-8 is very different to and
> more than 10 times to size of the Fedora definition of C.UTF-8.

I think no,  glibc bug still in New status.

>
> cu
> Adrian
>
-- 
BRs

Sandy(Li Changqing)


