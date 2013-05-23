Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 748206086B;
	Thu, 23 May 2013 08:27:17 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 May 2013 01:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,726,1363158000"; d="scan'208";a="245559252"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2013 01:27:02 -0700
Message-ID: <519DD2D2.3010009@intel.com>
Date: Thu, 23 May 2013 11:26:58 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130221 Thunderbird/17.0.3
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <20130512163307.035FC504FC@opal> <20130522160725.GM32431@jama>
In-Reply-To: <20130522160725.GM32431@jama>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Laurentiu Palcu : libdrm: upgrade to 2.4.44
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
X-List-Received-Date: Thu, 23 May 2013 08:27:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 05/22/2013 07:07 PM, Martin Jansa wrote:
> On Sun, May 12, 2013 at 04:33:07PM +0000, git@git.openembedded.org wrote:
>> > Module: openembedded-core.git
>> > Branch: master
>> > Commit: 563edb321594b007cae2294e807235ad22fd27da
>> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=563edb321594b007cae2294e807235ad22fd27da
>> > 
>> > Author: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> > Date:   Fri May 10 16:23:33 2013 +0300
>> > 
>> > libdrm: upgrade to 2.4.44
>> > 
>> > Removed part of the installtests.patch since tests can now be installed
>> > giving an option to configure script.
>> > 
>> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
>> > Signed-off-by: Saul Wold <sgw@linux.intel.com>
> Are you using buildhistory to test such upgrades?
> 
> This was caused by added --enable-install-test-programs.
> 
> Buildhistory shows that kmstest and vbltest were added to PN causing PKG to 
> change from libdrm2 to libdrm and breaking upgrade path
> 
> ${PN}-tests looks like better place for tests.
> 
>  * check_data_file_clashes: Package libdrm wants to install file /usr/lib/libdrm.so.2
>         But that file is already provided by package  * libdrm2
>  * check_data_file_clashes: Package libdrm wants to install file /usr/lib/libdrm.so.2.4.0
>         But that file is already provided by package  * libdrm2
> 
> -PV = 2.4.42
> -PR = r4.0
> -PKGR = r4.0.2
> -PKG = libdrm2
> +PV = 2.4.44
> +PR = r0
> +PKGR = r0.0
>  RPROVIDES = 
> -RDEPENDS = eglibc (>= 2.17)
> +RDEPENDS = eglibc (>= 2.17) libdrm-kms (>= 2.4.44)
>  RRECOMMENDS = 
> -PKGSIZE = 34635
> +PKGSIZE = 46491
>  FILES = /usr/bin/* /usr/sbin/* /usr/lib/libdrm/* /usr/lib/lib*.so.* /etc /com /var /bin/* /sbin/* /lib/*.so.* /lib/udev/rules.d /usr/lib/udev/rules.d /usr/share/libdrm /usr/lib/libdrm/* /usr/share/pixmaps /usr/share/applications /usr/share/idl /usr/share/omf /usr/share/sounds /usr/lib/bonobo/servers
> -FILELIST = /usr/lib/libdrm.so.2 /usr/lib/libdrm.so.2.4.0
> +FILELIST = /usr/bin/kmstest /usr/bin/vbltest /usr/lib/libdrm.so.2 /usr/lib/libdrm.so.2.4.0
> 
No, I didn't use buildhistory on this... :( My bad. I just wasn't
expecting the PKG to change. It looks like I was wrong.

Thanks for reminding me. Hopefully, I'll remember it next time.

I agree that the tests should be in a separate package. I'll make the
change as soon as I find some time.

Thanks,
Laurentiu

