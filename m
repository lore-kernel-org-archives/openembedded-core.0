Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5000A61EC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2013 02:05:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7N25QVn025634
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 19:05:26 -0700 (PDT)
Received: from [128.224.162.224] (128.224.162.224) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 19:05:24 -0700
Message-ID: <5216C34E.6020702@windriver.com>
Date: Fri, 23 Aug 2013 10:05:02 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130404 Thunderbird/17.0.5
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
	<0fdd588a60edecc0aa11bfbb3ac8eb3d56a2b940.1377175027.git.liezhi.yang@windriver.com>
	<1377192596.5259.8.camel@dvhart-mobl4.amr.corp.intel.com>
In-Reply-To: <1377192596.5259.8.camel@dvhart-mobl4.amr.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/6] e2fsprogs: add populate-extfs.sh
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
X-List-Received-Date: Fri, 23 Aug 2013 02:05:25 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/23/2013 01:29 AM, Darren Hart wrote:
> On Thu, 2013-08-22 at 09:13 -0400, Robert Yang wrote:
>> This script is originally from Darren Hart, it will be used for creating
>> the ext* filesystem from a given directory, which will replace the
>> genext2fs in image_types.bbclass at the moment, we may use the mke2fs to
>> replace this script again when it has the initial directory support.
>>
>> Changes of the script:
>> * Rename it from mkdebugfs.sh to populate-extfs.sh
>> * Add a simple usage
>> * Add checking for the number of the parameters
>> * Add the "regular empty file" and "fifo" file type
>> * Set mode, uid and gid for the file
>> * Save the command lines to a file and batch run them
>> * Change the error message
>> * Improve the performance
>> * Add the support for hardlink
>>
>> [YOCTO #3848]
>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
>
> Ted has offered to add this to the contrib dir for the ext2 tools. This
> is fine to add to yocto, but we should contribute this back upstream as
> well.
>

Thanks, I will send it to linux ext4 list.

// Robert

>

