Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 2F06A608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 11:35:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r78BZijn016467
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 07:35:45 -0400 (EDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 04:35:43 -0700
Message-ID: <5203828E.2040705@windriver.com>
Date: Thu, 8 Aug 2013 19:35:42 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<CAJTo0LZgSV7RRPE6qjNp9fkRD9abiWoW6teRdYq2zBXEWdcmew@mail.gmail.com>
	<52037BBF.1030600@windriver.com>
	<CAJTo0LbxpTyZCn7wCmynEPT9n5o=iSbZcn7HMooe=mewV_fE3w@mail.gmail.com>
In-Reply-To: <CAJTo0LbxpTyZCn7wCmynEPT9n5o=iSbZcn7HMooe=mewV_fE3w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] libdbm-sqlite-perl: add version 1.40
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
X-List-Received-Date: Thu, 08 Aug 2013 11:35:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 07:12 PM, Burton, Ross wrote:
> On 8 August 2013 12:06, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> It seems DBI is a commonly-used perl database support package,
>> and work with multiple DBDs, the DBD::driver is based on actual
>> database. We get sqlite in oe-core, so put them in oe-core.
> There are many perl packages that are commonly-used but we don't put
> them all into oe-core.  I'm really thinking that we need to start a
> meta-perl for the majority of Perl libraries, apart from the ones that
> are needed in oe-core.
Great, how about create a new layer named 'meta-perl', we sould do:
- put these perl database libraries to that layer as a start;
- and than move other perl libraries already existed in oe-core
   to that layer, it includes:
   * meta/recipes-extended/perl/
   * meta/recipes-devtools/perl/
- except the perl libraries which used for lsb test, we should keep
   them where they are;
   * meta/recipes-lsb4/perl/

//Hongxu

> Ross


