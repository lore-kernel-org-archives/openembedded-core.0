Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U3mby-0005px-1x
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:01:01 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 08 Feb 2013 03:41:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,629,1355126400"; d="scan'208";a="259574482"
Received: from lpalcu-linux (HELO [10.237.105.165]) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 08 Feb 2013 03:43:13 -0800
Message-ID: <5114E4D0.6020809@intel.com>
Date: Fri, 08 Feb 2013 13:43:12 +0200
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1360166922.git.laurentiu.palcu@intel.com>
	<4ac0c041b62e5495bff97bd2d7dc5a4e31d7ce5f.1360166922.git.laurentiu.palcu@intel.com>
	<CAJTo0LYGpC4qpjyMEms2M=wX0DYypNDJ1pjg-79xu4yMh69byg@mail.gmail.com>
In-Reply-To: <CAJTo0LYGpC4qpjyMEms2M=wX0DYypNDJ1pjg-79xu4yMh69byg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/6] Add pixbufcache class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Feb 2013 12:01:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 02/08/2013 12:31 PM, Burton, Ross wrote:
> On 6 February 2013 16:36, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
>> All packages exporting pixbuf loaders should inherit this class in order
>> to generate the correct postinst/postrm scriptlets.
>>
>> [YOCTO #3852]
> 
> Presumably this means that the gtk-icon-cache package can drop the
> pixbuf loader calls now?  Also as the gtk icon cache only handles
> built-in modules, we don't need to update the icon cache when
> registering pixbuf loaders.
This patchset addresses the postinstall issues only, that is: make them
run on host at do_rootfs. As much as possible, the previous
functionality was left intact. We could do the changes you suggest in
subsequent patches. And that's because, in case of any failures, it
would be easier to know where the problem came from.

Laurentiu

> 
> Ross
> 


