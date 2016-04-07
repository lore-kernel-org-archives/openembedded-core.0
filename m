Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5997B770CD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 09:50:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u379oGLr022983
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Apr 2016 02:50:16 -0700
Received: from [128.224.162.236] (128.224.162.236) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 7 Apr 2016 02:50:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1459891560-4178-1-git-send-email-ross.burton@intel.com>
	<CAJ86T=XXJtGhRqvtkXp1aAHMYN8Y0VDrUJZfDhqNkodtbOXymw@mail.gmail.com>
	<CAJTo0LZSmc3+nOGn1dK9CzKqd+aAkAnFdk=tkk-gCHPqz+8NNg@mail.gmail.com>
	<5705C7DE.2000102@windriver.com>
	<CAJTo0LaGS9g=-kamcNL8Z+QcC2JkM-C-iE0BJv1H0ARoSYaprw@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <57062D55.7030705@windriver.com>
Date: Thu, 7 Apr 2016 17:50:13 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaGS9g=-kamcNL8Z+QcC2JkM-C-iE0BJv1H0ARoSYaprw@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Apr 2016 09:50:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2016 05:12 PM, Burton, Ross wrote:
>
> On 7 April 2016 at 03:37, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     I got this error when build in an old build dir:
>
>     | pbzip2: error while loading shared libraries: libbz2.so.0: cannot open
>     shared object file: No such file or directory
>     | WARNING: exit code 127 from a shell command.
>     | ERROR: Function failed: do_image_tar (log file is located at
>     /buildarea/lyang1/test_fetch/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/temp/log.do_image_tar.33968)
>     ERROR: Task 19
>     (/buildarea/lyang1/poky/meta/recipes-core/images/core-image-minimal.bb
>     <http://core-image-minimal.bb>, do_image_tar) failed with exit code '1'
>
>     It is OK when clean pbzip2-native and rebuild. But I wonder how can this
>     happen since pbzip2-native DEPENDS on bzip2-native.
>
>
> Can you find the cooker log for this run?  Did it rebuild pbzip2-native as expected?

Yes, it did:

NOTE: recipe pbzip2-native-1.1.13-r0: task do_populate_sysroot: Started
NOTE: recipe pbzip2-native-1.1.13-r0: task do_populate_sysroot: Succeeded

// Robert

>
> Ross

