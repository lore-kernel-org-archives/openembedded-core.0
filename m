Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 425FF61116
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 07:40:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s317ed42024897
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 00:40:39 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 00:40:38 -0700
Message-ID: <533A6D67.9060608@windriver.com>
Date: Tue, 1 Apr 2014 15:40:23 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1395997035.git.hongxu.jia@windriver.com>
	<eedfe13af69c82c667fb78152bb070b0cc448bc2.1395997035.git.hongxu.jia@windriver.com>
	<CAMKF1sozZEVsJ=oaBW-mqex27LvOTfOGW90+g_9gkPg27OJEhA@mail.gmail.com>
In-Reply-To: <CAMKF1sozZEVsJ=oaBW-mqex27LvOTfOGW90+g_9gkPg27OJEhA@mail.gmail.com>
Cc: Saul Wold <saul.wold@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] libarchive: fix CVE-2013-0211
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
X-List-Received-Date: Tue, 01 Apr 2014 07:40:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2014 01:30 PM, Khem Raj wrote:
> On Fri, Mar 28, 2014 at 2:43 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> ++      const size_t max_write = INT_MAX;
> I think INT_MAX is a mismatch here size_t may not be defined 'unsigned
> int' on all kind of architectures.

How about test the size of size_t and assigned the related MAX value:

const size_t max_write = (sizeof(size_t) >= 
sizeof(int))?INT_MAX:(sizeof(size_t) == sizeof(short))?SHRT_MAX:CHAR_MAX;

//Hongxu


