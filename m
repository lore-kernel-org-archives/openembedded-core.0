Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id BEBB074F78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 10:05:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5PA5KXq004615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Jun 2018 11:05:23 +0100
Message-ID: <d49e616f6561b4bf1883bfb59078d8a100ff1709.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Zheng Ruoqin
	<zhengrq.fnst@cn.fujitsu.com>
Date: Mon, 25 Jun 2018 11:05:20 +0100
In-Reply-To: <CAJTo0LaTFH59fz_Mr+FPrMNnZY5+AG1aw7xOMH9bzRQPqw3vfQ@mail.gmail.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-7-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<CAJTo0LaTFH59fz_Mr+FPrMNnZY5+AG1aw7xOMH9bzRQPqw3vfQ@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8][PATCH v2] update-rc.d: Add nativesdk
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
X-List-Received-Date: Mon, 25 Jun 2018 10:05:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-06-25 at 10:43 +0100, Burton, Ross wrote:
> As update-rcd is for managing init scripts, and init scripts make no
> sense in a nativesdk environment, it would probably be best if the
> update-rc.d class only added these dependencies for target packages.

I had the same thought initially. I think this is being used by
postinstall scripts in the target rootfs from the SDK. Whether that is
a good idea or not I'm torn on. I did make my view clear about
preferring eSDK for this kind of tooling, as otherwise you end up
reinventing the rootfs code.

Cheers,

Richard

