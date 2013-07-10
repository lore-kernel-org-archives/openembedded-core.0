Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F3C261FE1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 02:12:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A2CnxF011593
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2013 19:12:49 -0700 (PDT)
Received: from [128.224.163.134] (128.224.163.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 19:12:48 -0700
Message-ID: <51DCC31E.4020505@windriver.com>
Date: Wed, 10 Jul 2013 10:12:46 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1373253853.git.jackie.huang@windriver.com>
	<226f2074b7530a82f4cf0e614eecd58f1fd2c22b.1373253853.git.jackie.huang@windriver.com>
	<CAJTo0LbLGKEea1vfcQH19JU++mTViDeZ2CSyLu3Cof2wqEYcMQ@mail.gmail.com>
In-Reply-To: <CAJTo0LbLGKEea1vfcQH19JU++mTViDeZ2CSyLu3Cof2wqEYcMQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0: inherit pythonnative
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
X-List-Received-Date: Wed, 10 Jul 2013 02:12:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 7/9/2013 10:56 PM, Burton, Ross wrote:
> On 8 July 2013 04:25,  <jackie.huang@windriver.com> wrote:
>> glib-2.0 needs to inherit pythonnative because it depends on
>> python-native. This has caused problems on SLED11.2 if no
>> python-xml installed.
>
> I just built glib-2.0 from scratch without python-native being
> present, so can you justify this please?

The problem happened on a SUSE host without python-xml installed, Robert 
just told me that it has been taken care of by:

commit bb027a332f2f2927a6bcbc4c035b42a012d0579e
Author: Jesse Zhang <sen.zhang@windriver.com>
Date:   Mon Jun 3 07:37:48 2013 +0000

     sanity.bbclass: make sure python is a full install

     Components of the Standard Library should be available. Add a sanity
     check for xml.parsers.expat; we might add more in the future.

     [YOCTO #4424]

     Signed-off-by: Jesse Zhang <sen.zhang@windriver.com>
     Signed-off-by: Saul Wold <sgw@linux.intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Thanks,
Jackie

>
> Ross
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

