Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D73D708B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 15:06:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s92F6qi2021860
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Oct 2014 08:06:52 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Thu, 2 Oct 2014 08:06:52 -0700
Message-ID: <542D6A0B.5020708@windriver.com>
Date: Thu, 2 Oct 2014 10:06:51 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1412260145-15296-1-git-send-email-sona.sarmadi@enea.com>
	<CAJTo0LbnpxBF98ZPYa3jNHNVU0NE4nH6Ku+4JFRyuVOFxywi8w@mail.gmail.com>
In-Reply-To: <CAJTo0LbnpxBF98ZPYa3jNHNVU0NE4nH6Ku+4JFRyuVOFxywi8w@mail.gmail.com>
Subject: Re: [PATCH] Fix for CVE-2014-7186
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
X-List-Received-Date: Thu, 02 Oct 2014 15:06:52 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/2/14, 9:47 AM, Burton, Ross wrote:
> On 2 October 2014 15:29, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
>>   .../bash/bash-3.2.48/cve-2014-7186.patch           |   87 ++
>>   .../recipes-extended/bash/bash/cve-2014-7186.patch | 1303 ++++++++++++++++++++
>
> The second patch contains generated files, can you remove them from the patch?

This is actually correct in this instance.

The bash community patches the generated files for these types of patches.

--Mark

> Ross
>


