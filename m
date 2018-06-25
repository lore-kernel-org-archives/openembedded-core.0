Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFD975034
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 07:18:58 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w5P7Ist9024298
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 25 Jun 2018 08:18:55 +0100
Message-ID: <575b002da9b0b86490a3eada07f254428549965e.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 08:18:54 +0100
In-Reply-To: <1529783581-46179-9-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1529783581-46179-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<1529783581-46179-9-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 8/8] [PATCH v2] meta-toolchain: Added dnf-nativesdk into cross-development toolchain.
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
X-List-Received-Date: Mon, 25 Jun 2018 07:18:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2018-06-24 at 03:53 +0800, Zheng Ruoqin wrote:
> Add dnf-nativesdk and it's runtime dependence to make dnf work on
> cross-development environment.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>

I don't mind adding enough of the changes so that dnf-nativesdk is
buildable so some of your other patches can be merged.

I do not want to add dnf-nativesdk to meta-toolchain by default however
as there are many people who don't need this there. I'd suggest this is
a customisation you'll need to maintain yourselves.

I appreciate why you want to do this, I also believe we have a better
technique in the form of the eSDK, where we can use the same tools and
the same codebase to build for example a rootfs.

The eSDK use case (a locked sstate cache) is designed so that a user
doesn't need to worry about a whole build, or building from scratch.
They can use the same tools everyone else uses and the same workflow
and code to bulld a rootfs or a recipe or any workflow. This makes it
much more powerful and able to fulfil many different use cases compared
to meta-toolchain. In the long run I'd therefore prefer we promote this
and use the eSDK as I think it will become our preferred way of
handling problems like this.

Cheers,

Richard

