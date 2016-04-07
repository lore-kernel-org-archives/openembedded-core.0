Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 32B0473257
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 02:37:21 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u372bK9i006323
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Apr 2016 19:37:20 -0700 (PDT)
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Apr 2016 19:37:20 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Andre McCurdy <armccurdy@gmail.com>
References: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XXJtGhRqvtkXp1aAHMYN8Y0VDrUJZfDhqNkodtbOXymw@mail.gmail.com>
	<CAJTo0LZSmc3+nOGn1dK9CzKqd+aAkAnFdk=tkk-gCHPqz+8NNg@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5705C7DE.2000102@windriver.com>
Date: Thu, 7 Apr 2016 10:37:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZSmc3+nOGn1dK9CzKqd+aAkAnFdk=tkk-gCHPqz+8NNg@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bzip2: set correct soname
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
X-List-Received-Date: Thu, 07 Apr 2016 02:37:22 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Hi Ross,

I got this error when build in an old build dir:

| pbzip2: error while loading shared libraries: libbz2.so.0: cannot open shared 
object file: No such file or directory
| WARNING: exit code 127 from a shell command.
| ERROR: Function failed: do_image_tar (log file is located at 
/buildarea/lyang1/test_fetch/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_image_tar.33968)
ERROR: Task 19 
(/buildarea/lyang1/poky/meta/recipes-core/images/core-image-minimal.bb, 
do_image_tar) failed with exit code '1'

It is OK when clean pbzip2-native and rebuild. But I wonder how can this
happen since pbzip2-native DEPENDS on bzip2-native.

// Robert

On 04/06/2016 04:23 PM, Burton, Ross wrote:
>
> On 5 April 2016 at 23:02, Andre McCurdy <armccurdy@gmail.com
> <mailto:armccurdy@gmail.com>> wrote:
>
>     > +libbz2_la_LDFLAGS = -version-info 1:6:0
>
>     1:6:0 or 1:0:6 ?
>
>
> 1:6:0 results in /usr/lib/libbz2.so.1.0.6, which is what upstream intended in
> their broken Makefile that we don't use.
>
> Ross
>
>

