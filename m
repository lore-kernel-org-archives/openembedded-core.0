Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D1E36AE7C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 06:42:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6A6gofq014169
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 9 Jul 2013 23:42:50 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Tue, 9 Jul 2013 23:42:48 -0700
Message-ID: <51DD0267.6010606@windriver.com>
Date: Wed, 10 Jul 2013 14:42:47 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
	<51DB4940.2000606@linux.intel.com>
In-Reply-To: <51DB4940.2000606@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Wed, 10 Jul 2013 06:42:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2013 07:20 AM, Saul Wold wrote:
> On 07/04/2013 11:07 PM, Qi.Chen@windriver.com wrote:
>>
> Since this gets run every time for image creation, we can be sure an 
> image won't be using someform of login, so finding login.defs might 
> not be the best thing to do.
>
> take the poky.tiny example and failures:
>> cp: cannot stat 
>> '/srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/poky-tiny/build/build/tmp/sysroots/qemux86//etc/login.defs': 
>> No such file or directory
>> ERROR: Function failed: do_rootfs (log file is located at 
>> /srv/home/pokybuild/yocto-autobuilder-new/yocto-slave/poky-tiny/build/build/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.24531)
>> NOTE: recipe core-image-minimal-1.0-r0: task do_rootfs: Failed
>
> Sau!
>
>

Hi Saul,

Patch V2 has been sent which adopts the same logic in useradd.bbclass, 
that is, add passwd and shadow to the RDEPENDS if we are changing the 
user/group settings.

Two related patches are sent to poky@yoctoproject.org.
[poky] [PATCH 1/2] poky-tiny.conf: add extra libc features
[poky] [PATCH 2/2] local.conf.sample.extended: add USER_GROUP_SETTINGS

Best Regards,
Chen Qi

