Return-Path: <fenixk19@mail.ru>
X-Greylist: delayed 3394 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 12 Nov 2014 14:58:16 UTC
Received: from fallback4.mail.ru (fallback4.mail.ru [94.100.181.169])
	by mail.openembedded.org (Postfix) with ESMTP id CFF8362252
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 14:58:16 +0000 (UTC)
Received: from smtp48.i.mail.ru (smtp48.i.mail.ru [94.100.177.108])
	by fallback4.mail.ru (mPOP.Fallback_MX) with ESMTP id 6CE2A109A39
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Nov 2014 16:21:31 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:Subject:To:MIME-Version:From:Date:Message-ID;
	bh=wo6nfgQhMAgreXDBfleM8uGQdecjAyMhv2avB4EhMMk=; 
	b=dBYQK5mAzEMQv+Ba5pR5/mIYTjBp6vlGYCM1J3dtiLNPrVvFp5yq+vw9hs1FP+Vdb4dA5cYIP32YDdaDlMFDAkfMW4XzDgqWdVGc2GrTiMCDQHnTnmEwUTFs8R9tYFxYEz3m6aJ96B5SLET4AlMonzLD/dH5/pY/sEGzKid+rwA=;
Received: from [190.123.47.116] (port=37771 helo=[0.0.0.0])
	by smtp48.i.mail.ru with esmtpa (envelope-from <fenixk19@mail.ru>)
	id 1XoXrN-0000Oh-Uz for openembedded-core@lists.openembedded.org;
	Wed, 12 Nov 2014 16:21:22 +0300
Message-ID: <54635D01.4060200@mail.ru>
Date: Wed, 12 Nov 2014 16:13:37 +0300
From: Alexander Varnin <fenixk19@mail.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-Spam: Not detected
X-Mras: Ok
Subject: need help in qt environment setup
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
X-List-Received-Date: Wed, 12 Nov 2014 14:58:18 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello!
I am using yocto to build images and develop software for my freescale
imx53 board.

I need some help setting up environment for QT based software development.

My software requires qt4 (embedded) support.

There is several ways to use toolchain.

First, I can use toolchain from build directory where I've compiled
qt4-embedded recipe. There I create environment-setup script using command:

bitbake meta-ide-support

Second, I can build SDK for my image:

bitbake image-name -c populate_sdk

Third, I can use meta-toolchain-qt recipe to build QT containing SDK:

bitbake meta-toolchain-qte

The first two methods is most convenient for me, because I need some
additional libraries that is not included in meta-toolchain-qte. The
first method is better, because I develop software on the same host,
where yocto is located, so I don't need separate SDK installation.

However, only the last method produces environment settings for QT
placed in
/opt/poky/1.6.1/sysroots/i686-pokysdk-linux/environment-setup.d folder.

Other two methods produce environment-setup scripts, but they don't
create sysroots/i686-linux/environment-setup.d folder. So QT environment
settings lacks from this installations.

The best way I would like to solve it, is to somehow make 'bitbake
meta-ide-support' generate environment settings for QT in my build dir,
so I can use my local (non-SDK) cross toolchain to build QT software.
How can I achieve it?

It is ok for me to use SDK as well, however, I want it to be my image
based SDK.

Thanks for any help.
Alexander.

