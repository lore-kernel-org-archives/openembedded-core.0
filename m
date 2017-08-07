Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 110A86093C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 12:22:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 05:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,338,1498546800"; d="scan'208";a="887414870"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2017 05:22:50 -0700
To: openembedded-core@lists.openembedded.org
References: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <41176f6a-807d-f488-7f55-38ee82cc48bf@linux.intel.com>
Date: Mon, 7 Aug 2017 15:19:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1502107769-16160-1-git-send-email-jussi.kukkonen@intel.com>
Subject: Meson support in oe-core
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
X-List-Received-Date: Mon, 07 Aug 2017 12:22:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/07/2017 03:09 PM, Jussi Kukkonen wrote:
> New feature release, see
> https://lists.freedesktop.org/archives/wayland-devel/2017-June/034286.html
> for the major features. This is the last major release to support
> autotools.

Looks like 2017 is when autotools is finally being replaced en masse by 
various projects, particularly those related to gnome stack. Even 
relatively large projects like gstreamer are going forward with it. The 
replacement is meson, whose advantages over autotools are major, and 
disadvantages are minor:
http://mesonbuild.com/

Ross and I have done some work on bringing meson support into oe-core. 
One recipe has been fully migrated to meson (including tricker bits like
gtkdoc, and gobject introspection). Going forward that will be the 
default when a project has both that and autotools, and of course we 
should be ready for the situation when autotools support is removed from 
the upstream altogether.

http://git.openembedded.org/meta-openembedded-contrib/log/?h=akanavin/meson
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/meson



Alex



