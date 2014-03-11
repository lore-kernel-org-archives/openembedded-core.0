Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56AB06B181
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 09:16:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2B9GCPf009659
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 11 Mar 2014 02:16:12 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 11 Mar 2014 02:16:12 -0700
Message-ID: <531ED455.50702@windriver.com>
Date: Tue, 11 Mar 2014 17:16:05 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Jussi Laako <jussi@sonarnerd.net>
References: <531ECDCE.3020805@sonarnerd.net>
In-Reply-To: <531ECDCE.3020805@sonarnerd.net>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [dora]Re: Failure in license.bbclass
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
X-List-Received-Date: Tue, 11 Mar 2014 09:16:13 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

It seems dora has some patches of oe-pkgdata-util not
rebased from poky, such as:

commit 6ce287937e86a43d696e3615aa18d439928b7691
Author: Paul Eggleton <paul.eggleton@linux.intel.com>
Date:   Fri Oct 18 14:52:10 2013 +0100

     scripts/oe-pkgdata-util: add ability to find a recipe from a target 
package

//Hongxu


On 03/11/2014 04:48 PM, Jussi Laako wrote:
> Hi,
>
> Your recent (from November) change to license.bbclass in Yocto Dora 
> release completely breaks COPY_LIC_DIRS.
>
> Running the command manually for any package results in command line 
> syntax error:
> jussi@porkkala:/home/scratch/jussi/poky/build> oe-pkgdata-util 
> lookup-recipe 
> /home/scratch/jussi/poky/build/tmp/sysroots/cubox-i/pkgdata 
> alsa-conf-base
> syntax: oe-pkgdata-util glob [-d] <pkgdatadir> <vendor-os> <pkglist> 
> "<globs>"
>                      read-value [-d] <pkgdatadir> <vendor-os> 
> <value-name> "<package-name>_<package_architecture>"
>
>
> Best regards,
>
>     - Jussi


