Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 760F265D5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Aug 2014 03:36:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7C3a0oJ019413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 20:36:00 -0700 (PDT)
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 11 Aug 2014 20:36:00 -0700
Message-ID: <53E98B9F.5080800@windriver.com>
Date: Tue, 12 Aug 2014 11:35:59 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1406620925.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1406620925.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] qemu-native: depends on libxext-native when enable sdl
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
X-List-Received-Date: Tue, 12 Aug 2014 03:36:10 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit


Ping, I think that it can fix qemu-native's build error on Yocto's AB:

     ERROR: User requested feature sdl
            configure was not able to find it.
            Install SDL devel

// Robert

On 07/29/2014 04:02 PM, Robert Yang wrote:
> The following changes since commit 91ca6b1b2e009381d8e813906654c0958eee7efc:
>
>    lib/oe/rootfs: Improve error message whitespace (2014-07-28 12:20:56 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib rbt/qemu
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qemu
>
> Robert Yang (1):
>    qemu-native: depends on libxext-native when enable sdl
>
>   meta/recipes-devtools/qemu/qemu.inc |    5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>

