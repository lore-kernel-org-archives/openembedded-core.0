Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1D07D7FAA4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 13:31:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x9PDVco1007778
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 25 Oct 2019 06:31:38 -0700 (PDT)
Received: from [128.224.56.205] (128.224.56.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Fri, 25 Oct 2019 06:31:38 -0700
To: Trevor Woerner <twoerner@gmail.com>, zangrc <zangrc.fnst@cn.fujitsu.com>
References: <20191021055052.10882-1-zangrc.fnst@cn.fujitsu.com>
	<20191024130641.GA30191@linux-uys3>
	<33468050-37e6-a0ef-b95d-039814a52343@windriver.com>
	<62d969ba-cf7f-8651-6dd9-e7e71b489c6e@gmail.com>
	<62ff460a-48d7-b82a-97c6-4c4d6d74a5fa@cn.fujitsu.com>
	<20191025131722.GA19333@linux-uys3>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <983d4e37-5da2-57dc-8e5d-e0c08d83de85@windriver.com>
Date: Fri, 25 Oct 2019 09:31:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025131722.GA19333@linux-uys3>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libcap-ng:upgrade 0.7.9 -> 0.7.10
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
X-List-Received-Date: Fri, 25 Oct 2019 13:31:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 10/25/19 9:17 AM, Trevor Woerner wrote:

> On Fri 2019-10-25 @ 01:30:32 PM, zangrc wrote:
>> hello！
>>
>> We think this problem has something to do with the host environment. We
>> tried to reproduce the error on ubuntu16.04 and fedora29, but they all
>> compiled successfully. Can you tell us which distributions are having this
>> problem?
> openSUSE 15.1
> (which is the current "latest" openSUSE release)

I'm seeing it on Ubuntu 18.04.3 LTS. I've managed to get past the same 
attempted build (bitbake binutils) on Fedora 30 Server.

Out of curiosity I checked out the commit prior to the upgrade 
(a5a987ff5e5e) on Ubuntu 18.04.3 LTS and did bitbake libcap-ng-native,

and it succeeded. Going back to latest master (with the upgrade), the 
same bitbake fails as described at do_compile.


