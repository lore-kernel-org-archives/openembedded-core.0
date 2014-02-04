Return-Path: <David.Nystrom@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 402516E89B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Feb 2014 14:08:41 +0000 (UTC)
Received: from [5.5.8.242] (192.168.201.202) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.158.1; Tue, 4 Feb 2014 15:08:36 +0100
Message-ID: <52F0F464.5060107@enea.com>
Date: Tue, 4 Feb 2014 15:08:36 +0100
From: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.nystrom@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>, =?ISO-8859-1?Q?David_N?=
	=?ISO-8859-1?Q?ystr=F6m?= <david.nystrom@enea.com>
References: <cover.1391427313.git.laurentiu.palcu@intel.com>	<52EFA891.7060806@enea.com>
	<20140203164718.GA5112@lpalcu-linux>
In-Reply-To: <20140203164718.GA5112@lpalcu-linux>
X-Originating-IP: [192.168.201.202]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/49] Rootfs/image generation refactoring (cover letter only)
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
X-List-Received-Date: Tue, 04 Feb 2014 14:08:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2014-02-03 17:47, Laurentiu Palcu wrote:
> On Mon, Feb 03, 2014 at 03:32:49PM +0100, David Nystr=F6m wrote:
>> On 2014-02-03 12:38, Laurentiu Palcu wrote:
>>> Hi all,
>>>
>>
>> Have you tested that BUILD_IMAGES_FROM_FEEDS functionality is not
>> broken by these commits ?
> No, I did not test this. I tried to test it on master though and it
> doesn't seem to work...

Whats in master worked for me not too long ago with IPK at least.

> Anyway, if you have a working environment, can
> you give it a test? Technically, the feeds are added to the main
> opkg.conf file in OPKG_PREPROCESS_CMD. And this functionality is
> supposed to work.
>
> laurentiu

$ grep -r FEED conf/local.conf
BUILD_IMAGES_FROM_FEEDS=3D"1"
IPK_FEED_URI=3D"file:///media/sdb5/repo/build/tmp/deploy/"

$ bitbake -c rootfs core-image-minimal

DEBUG: Executing python function rootfs_process_ignore
DEBUG: Python function rootfs_process_ignore finished
DEBUG: Executing python function rootfs_runtime_mapping
DEBUG: Python function rootfs_runtime_mapping finished
DEBUG: Executing python function do_rootfs
NOTE: ###### Generate rootfs #######
ERROR: There are no packages in /media/sdb5/bld/tmp/deploy/ipk!
DEBUG: Python function do_rootfs finished
ERROR: Function failed: do_rootfs
/media/sdb5/bld/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/temp/=
log.do_rootfs.25006=20
(END)

$ grep -r "There are no packages in" ../poky-contrib/*
Binary file ../poky-contrib/meta/lib/oe/package_manager.pyc matches
../poky-contrib/meta/lib/oe/package_manager.py:=20
bb.fatal("There are no packages in %s" % self.deploy_dir)
../poky-contrib/meta/lib/oe/package_manager.py:=20
bb.fatal("There are no packages in %s!" % self.deploy_dir)
../poky-contrib/meta/lib/oe/package_manager.py:=20
bb.fatal("There are no packages in %s" % self.deploy_dir)
d

Br,
David

>
>>
>> Br,
>> David
>>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


