Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4D49B719B3;
	Mon,  5 Dec 2016 18:37:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uB5IbDUr029585
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 5 Dec 2016 10:37:13 -0800
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 5 Dec 2016 10:37:12 -0800
To: Brian Avery <avery.brian@gmail.com>,
	<openembedded-architecture@lists.openembedded.org>,
	<yocto@yoctoproject.org>, <openembedded-core@lists.openembedded.org>
References: <CAKV_0ei2fHx-byfoVD85KFEpKkA23jgoVC9PUyK=6gJZQGTugA@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <2c6bdf61-0227-a6a8-5455-5533dbfbbd38@windriver.com>
Date: Mon, 5 Dec 2016 12:37:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAKV_0ei2fHx-byfoVD85KFEpKkA23jgoVC9PUyK=6gJZQGTugA@mail.gmail.com>
Subject: Re: [Openembedded-architecture] RFC BuildAppliance future
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
X-List-Received-Date: Mon, 05 Dec 2016 18:37:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On 12/5/16 12:04 PM, Brian Avery wrote:
>   Please note, this is going out to 3 lists in an attempt to insure that no one
> who would be impacted by this change misses it. Implied spam apology included.
> 
>   The Yocto Project currently provides a virtual machine image called the Build
> Appliance
> (https://downloads.yoctoproject.org/releases/yocto/yocto-2.2/build-appliance/).
> This image can be run using either VirtualBox or VMware. It enables you to build
> and boot a custom embedded Linux image with the Yocto Project on a non-Linux
> development system.  It is not intended for day to day development use, but
> instead, is intended to allow users to “try out” the tools even if they do not
> have access to a Linux system.

What are the requirements for a Windows user to use this, instead of the VM
approach.  (In the past it was easy for a Windows user to get the VM, and just
run it to test out things.)

--Mark

>   We are considering replacing the VM based Build Appliance with a set of
> containers (https://hub.docker.com/r/crops/poky/, or if you want a user
> interface (https://hub.docker.com/r/crops/toaster-master/ ).  These containers
> currently provide most of the functionality of the Build Appliance and should
> shortly be at feature parity with the Build Appliance.  We are actively adding
> to and supporting the containers as some of our developers are using them in
> their day to day development in order to benefit from the host isolation and
> ease with which other distributions can be tested. 
> 
>   This is an RFC to see what features in the Build Appliance are important to
> you but would not be provided by the container solutions.  If the community
> would be just as content using the container approach as using the VM based
> Build Appliance image, then we’d be better off deprecating the Build Appliance
> and applying those resources elsewhere.  If there are important features the
> Build Appliance provides which the container solution does not, or cannot
> provide, we’d love to hear what they are!
> 
>  Thanks in advance for any feedback,
> 
> -Brian
> 
> an Intel Employee
> 
> 
> 
> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture
> 


