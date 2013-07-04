Return-Path: <laurentiu.palcu@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9D7BB6077F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 07:24:16 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 04 Jul 2013 00:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,993,1363158000"; d="scan'208";a="326661473"
Received: from lpalcu-linux.rb.intel.com (HELO [10.237.105.165])
	([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 04 Jul 2013 00:24:10 -0700
Message-ID: <51D52319.7030302@intel.com>
Date: Thu, 04 Jul 2013 10:24:09 +0300
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1372861799.git.laurentiu.palcu@intel.com>
	<20130703161921.GB3452@jama>
In-Reply-To: <20130703161921.GB3452@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Allow xuser to shutdown
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
X-List-Received-Date: Thu, 04 Jul 2013 07:24:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 07/03/2013 07:19 PM, Martin Jansa wrote:
> On Wed, Jul 03, 2013 at 05:34:20PM +0300, Laurentiu Palcu wrote:
>> The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:
>>
>>   bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)
>>
>> are available in the git repository at:
>>
>>   git://git.yoctoproject.org/poky-contrib lpalcu/b4345_shutdown_icon_rootless_x
>>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/b4345_shutdown_icon_rootless_x
>>
>> Laurentiu Palcu (4):
>>   sysvinit: allow users in shutdown group to perform halt/reboot
>>   connman: make xuser a member of 'shutdown' group
>>   xserver-nodm-init: make xuser a member of 'shutdown' group
>>   shutdown-desktop: give entire path in Exec field
> 
> Shouldn't we create separate recipe for xuser or any other default user
> and add it to connman and xserver-nodm-init RDEPENDS?
> 
> I know there is some overhead from having one more package installed on
> image, but it would be a bit easier if we later decide that xuser also
> needs some file to be installed in his home or something like that.
I can see one advantage of having a separate recipe for xuser: the user
creation would be done in one place and we souldn't have to change in
two places if we want to add the user to another group (for example).

It sounds a good change to me.

Laurentiu
> 
>>  meta/recipes-connectivity/connman/connman.inc      |    2 +-
>>  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb     |   12 +++++++++---
>>  .../x11-common/xserver-nodm-init.bb                |    2 +-
>>  .../shutdown-desktop/shutdown-desktop.bb           |    2 +-
>>  .../shutdown-desktop/shutdown.desktop              |    4 ++--
>>  5 files changed, 14 insertions(+), 8 deletions(-)
>>
>> -- 
>> 1.7.9.5
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

