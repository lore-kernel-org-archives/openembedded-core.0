Return-Path: <alejandro.delcastillo@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id AE42373E11
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 22:13:04 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t41MD5CM018287 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 May 2015 17:13:05 -0500
Received: from [10.2.106.105] ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015050117130577-548859 ;
	Fri, 1 May 2015 17:13:05 -0500 
Message-ID: <5543FA71.9060903@ni.com>
Date: Fri, 01 May 2015 17:13:05 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20150501160602.GA5885@denix.org>
In-Reply-To: <20150501160602.GA5885@denix.org>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/01/2015 05:13:05 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/01/2015 05:13:05 PM,
	Serialize complete at 05/01/2015 05:13:05 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-01_08:, , signatures=0
Subject: Re: opkg_install_pkg: Package <name> md5sum mismatch. Either the opkg or the package index are corrupt.
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
X-List-Received-Date: Fri, 01 May 2015 22:13:11 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=windows-1252



On 05/01/2015 11:06 AM, Denys Dmytriyenko wrote:
> Hi,
>
> Has anyone ever seen this message during <image>.do_rootfs task?
>
> Collected errors:
>  * opkg_install_pkg: Package <package> md5sum mismatch. Either the opkg or the package index are corrupt. Try 'opkg update'.
>  * opkg_install_cmd: Cannot install package <package>.
>
> We started seeing it on random packages inside the <image> few weeks ago on 
> different machines. At the time we had switched to bitbake 1.26. But even 
> trying different bitbake versions still occasionally caused the same error, so 
> the culprit is still unknwon. Using oe-core/daisy for now.
>
> Any comments or suggestions to where start looking would be appreciated! 
> Thanks.
>
The error is saying that there is a mismatch between the registered package mds5sum and the actual md5sum of the package. On your log.do_rootfs log file you should find the opkg-cl command being called, which has an opkg.conf file as parameter. Inside the conf file, you will see the paths to the local repos being used to build your image.  Can you confirm that the registered md5sum for one of the problematic packages on the Package file on the repo doesn't match the actual package md5sum?

Alejandro

