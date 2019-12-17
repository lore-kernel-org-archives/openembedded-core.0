Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id AF4927F88E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Dec 2019 15:54:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 07:54:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="221787342"
Received: from kdobros-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.194])
	by fmsmga001.fm.intel.com with ESMTP; 17 Dec 2019 07:54:29 -0800
To: Alistair Francis <alistair@alistair23.me>,
	openembedded-core@lists.openembedded.org
References: <20191214180842.14879-1-alistair@alistair23.me>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <a72aa388-a311-f680-3621-ada8350a9f16@intel.com>
Date: Tue, 17 Dec 2019 15:54:28 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191214180842.14879-1-alistair@alistair23.me>
Subject: Re: [PATCH] mesa: Upgrade to 19.3.0
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
X-List-Received-Date: Tue, 17 Dec 2019 15:54:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Breaks the no-x11 builds.

Waffle:

/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/waffle/1.6.0-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: 
fatal error: X11/Xlib.h: No such file or directory
   134 | #include <X11/Xlib.h>
       |          ^~~~~~~~~~~~

glew:

In file included from include/GL/eglew.h:107,
                  from src/glew.c:43:
/home/pokybuild/yocto-worker/no-x11/build/build/tmp/work/core2-64-poky-linux/glew/2.1.0-r0/recipe-sysroot/usr/include/EGL/eglplatform.h:134:10: 
fatal error: X11/Xlib.h: No such file or directory
   134 | #include <X11/Xlib.h>
       |          ^~~~~~~~~~~~

I believe the big X11 on/off toggle changed in this release?

Ross

