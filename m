Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9D96C268
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 23:34:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wADNY9AT022168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 13 Nov 2018 23:34:11 GMT
Message-ID: <b26d278cf4a89f6a10aa3895efb84256ed0f6be9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 23:34:09 +0000
In-Reply-To: <1542101577-59901-2-git-send-email-ee.peng.yeoh@intel.com>
References: <1542101577-59901-1-git-send-email-ee.peng.yeoh@intel.com>
	<1542101577-59901-2-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 2/4] qemurunner: Add support for slirp
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
X-List-Received-Date: Tue, 13 Nov 2018 23:34:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-11-13 at 17:32 +0800, Yeoh Ee Peng wrote:
> Enable qemurunner for slirp. Retrieved the port from localhost
> to connect to qemu.
> 
> [YOCTO#10713]
> 
> Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
> ---
>  meta/lib/oeqa/utils/qemurunner.py | 17 +++++++++++++----
>  1 file changed, 13 insertions(+), 4 deletions(-)

  File "/media/build1/poky/meta/lib/oeqa/core/decorator/__init__.py", line 32, in wrapped_f
    return func(*args, **kwargs)
  File "/media/build1/poky/meta/lib/oeqa/selftest/cases/devtool.py", line 1282, in test_devtool_deploy_target
    with runqemu(testimage) as qemu:
  File "/usr/lib/python3.6/contextlib.py", line 81, in __enter__
    return next(self.gen)
  File "/media/build1/poky/meta/lib/oeqa/utils/commands.py", line 327, in runqemu
    qemu = oeqa.targetcontrol.QemuTarget(recipedata, targetlogger, image_fstype)
  File "/media/build1/poky/meta/lib/oeqa/targetcontrol.py", line 148, in __init__
    logger = logger)
TypeError: __init__() missing 1 required positional argument: 'use_slirp'

I'm therefore not sure how much testing this has had?

Cheers,

Richard



