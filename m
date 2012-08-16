Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1yHW-0003Zl-U6
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 13:30:31 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7GBIV5L000799
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2012 04:18:31 -0700 (PDT)
Received: from [128.224.163.142] (128.224.163.142) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 04:18:31 -0700
Message-ID: <502CD706.8050703@windriver.com>
Date: Thu, 16 Aug 2012 19:18:30 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1345105475.git.liezhi.yang@windriver.com>
	<27dcb81ca366e3bab299395b8ce150e02fdd3a4f.1345105475.git.liezhi.yang@windriver.com>
	<C2485FB5-A9C5-4CC5-8115-6ED44ED65468@dominion.thruhere.net>
In-Reply-To: <C2485FB5-A9C5-4CC5-8115-6ED44ED65468@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/3] ipk: install external binary packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 11:30:31 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 08/16/2012 05:40 PM, Koen Kooi wrote:
>
> Op 16 aug. 2012, om 10:27 heeft Robert Yang <liezhi.yang@windriver.com> het volgende geschreven:
>
>> It's been suggested that it would be a useful feature to be able to
>> easily take a binary from a 3rd party software vendor and integrate
>> it into an image created by the build system.
>
> So why not write a recipe for such packages? That way you can fix a lot more of packaging screwups (it's a vendor binary, screwups are a given) and don't need to patch a ton of classes.
>

I think that this is easier than use recipe for such packages, here are my
rough thoughts:

If we do it in a recipe, we should tell the recipe:

1) Where are the binary pkgs

2) Which recipe will be installed

These 2 are similar to EXTERNAL_PACKAGE_DIR and EXTERNAL_INSTALL_PACKAGE which
I have used.

3) Write the do_fetch to copy the pkgs to $WORKDIR

4) Write the do_install to uncompress the binary pkgs if we want to fix the
    screwups (I don't know the exactly meaning of screwups, I think it is
    similar to "trouble"), and I don't know what can we fix for a binary pkg,
    the common errors that we meet are the dependencies and conflicts, but it
    seems that we can do nothing on them. If we can't fix the pkg, it seems not
    very different from patch the class.

And from the user side, he needs to add the recipe to the image, then
specify where are the binary pkgs and which needs to be installed. It is not
as easy as the current implementation.

// Robert




_______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>


