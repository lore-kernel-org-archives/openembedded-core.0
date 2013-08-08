Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id D4A776B22D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 09:17:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r789HtCj014704
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 8 Aug 2013 05:17:55 -0400 (EDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 8 Aug 2013 02:17:54 -0700
Message-ID: <52036240.3090506@windriver.com>
Date: Thu, 8 Aug 2013 17:17:52 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Olof Johansson <olof.johansson@axis.com>
References: <cover.1375952210.git.hongxu.jia@windriver.com>
	<9facc9593dc27237a07ebd620b9d7c9d9541f20a.1375952210.git.hongxu.jia@windriver.com>
	<20130808090617.GF25081@axis.com>
In-Reply-To: <20130808090617.GF25081@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 08 Aug 2013 09:17:58 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2013 05:06 PM, Olof Johansson wrote:
> On 13-08-08 11:01 +0200, Hongxu Jia wrote:
>>   create mode 100644 meta/recipes-extended/perl/libdbm-sqlite-perl_1.40.bb
> The recipe is called libdbm-sqlite-perl, but the perl module is
> called DBD::SQLite. Is that intentional, and if so, why?
I know what your mean, we should rename the recipe:
s/libdbm-sqlite-perl_1.40.bb/libdbd-sqlite-perl_1.40.bb/

//Hongxu
> Regards,


