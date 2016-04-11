Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B617F73216
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 01:19:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3B1JY3Q018101
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 10 Apr 2016 18:19:34 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 18:19:33 -0700
To: Denys Dmytriyenko <denis@denix.org>
References: <cover.1428410929.git.liezhi.yang@windriver.com>
	<20160410225130.GK16135@denix.org>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <570AFBA4.40201@windriver.com>
Date: Mon, 11 Apr 2016 09:19:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160410225130.GK16135@denix.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 0/2] unique -dev package
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
X-List-Received-Date: Mon, 11 Apr 2016 01:19:38 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/11/2016 06:51 AM, Denys Dmytriyenko wrote:
> On Tue, Apr 07, 2015 at 05:58:13AM -0700, Robert Yang wrote:
>> Hello,
>>
>> I think that one recipe should only have one -dev package, I'm not sure
>> whether this is right or not, please feel free to give your comments, we
>
> I know it is already 1 year since this change. But I can't seem to find any
> discussion or any explanation to why this change was required and what
> specific problem it was supposed to fix. Please point me to a clear reasoning
> of this change. Thanks.

There is only one source package, so there should be only one pack of header
files, dev libs, and so on, and they should be placed in a uniq pkg.

// Robert

>

