Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB0F79D5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Oct 2018 16:58:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9VGwLg1003486
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 31 Oct 2018 16:58:22 GMT
Message-ID: <4e434cc58c28b1b1cbc0861141d244b5f17ea02b.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 31 Oct 2018 16:58:20 +0000
In-Reply-To: <20181030081942.20787-1-anuj.mittal@intel.com>
References: <20181030081942.20787-1-anuj.mittal@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] xf86-video-intel: update to latest
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
X-List-Received-Date: Wed, 31 Oct 2018 16:58:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-10-30 at 16:19 +0800, Anuj Mittal wrote:
> For changes, please see:
> 
> 
https://cgit.freedesktop.org/xorg/driver/xf86-video-intel/log/?qt=range&q=e4fe79cf0d9a05ee3f3a027148ef0aeb2b1b34e1...0932a6b37ba6d5c9e916a1cb6ab89c3205b81a0c
> 
> Enable sna by default and remove upstreamed patches.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>

Fails on musl unfortunately:


https://autobuilder.yoctoproject.org/typhoon/#/builders/11/builds/157/steps/7/logs/step1b

Cheers,

Richard


