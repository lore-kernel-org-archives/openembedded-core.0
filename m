Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D260A60167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:02:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8OF2U1X007114
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 08:02:31 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 08:02:30 -0700
Message-ID: <5422DCFD.6070500@windriver.com>
Date: Wed, 24 Sep 2014 23:02:21 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1411558039.git.hongxu.jia@windriver.com>
	<7e7372c19a7505befddeb7f5ce6edcba6109515c.1411558039.git.hongxu.jia@windriver.com>
	<CAJTo0Lb1YrBdRkRZ+_KpEaNvdbef0bAtRDJoLMw1RA=qGyrG9Q@mail.gmail.com>
In-Reply-To: <CAJTo0Lb1YrBdRkRZ+_KpEaNvdbef0bAtRDJoLMw1RA=qGyrG9Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] man/texinfo: conditionally add gzip/bzip2/xz to RDEPENDS
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
X-List-Received-Date: Wed, 24 Sep 2014 15:02:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2014 10:45 PM, Burton, Ross wrote:
> On 24 September 2014 12:38, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> +    if "compress_doc" in d.getVar("INHERIT", True):
> You'll want to split() the INHERIT variable so you're searching for a
> member and not a substring:
>
> if "compress_doc" in d.getVar("INHERIT", True).split()
>
> Without splitting, an inherited class called decompress_docker will
> trigger your code.

Yes, I will fix that, thanks for figuring that out

//Hongxu

>
> Ross


