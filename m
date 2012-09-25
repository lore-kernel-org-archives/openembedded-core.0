Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <walters@verbum.org>) id 1TGdMy-0005e6-2S
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 00:12:44 +0200
Received: from compute5.internal (compute5.nyi.mail.srv.osa [10.202.2.45])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 5BE0B20934;
	Tue, 25 Sep 2012 17:59:56 -0400 (EDT)
Received: from frontend2.nyi.mail.srv.osa ([10.202.2.161])
	by compute5.internal (MEProxy); Tue, 25 Sep 2012 17:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=message-id:subject:from:to:cc:date
	:in-reply-to:references:content-type:mime-version
	:content-transfer-encoding; s=smtpout; bh=/UBNu1ChMw24b4355t4Jkg
	GteOY=; b=HbVw5Wa4uQ1FMGknULMOQWQHPT9N7OCmuqJfosv3APwhxL2CVk8GDH
	/TQrQRwTFc74fcxW4FexBgzQg6Zb8Fh0Ku/0oIJTBfpu8DeJ9XVxQNK68IT16IBy
	C+/nViYyQ0C6T6oG65xOWh8UtAyBDGYB3K/JdG2zshLepe+CcQg3o=
X-Sasl-enc: J3oKLruiVv1mmvePixx5YULEoLTU0Zf5ZlZYpWzH3ZiP 1348610396
Received: from [192.168.1.6] (unknown [50.138.225.153])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0AF8F4827C8;
	Tue, 25 Sep 2012 17:59:56 -0400 (EDT)
Message-ID: <1348610357.2853.5.camel@lenny>
From: Colin Walters <walters@verbum.org>
To: Phil Blundell <philb@gnu.org>
Date: Tue, 25 Sep 2012 17:59:17 -0400
In-Reply-To: <1348577690.31293.70.camel@phil-desktop>
References: <1348577690.31293.70.camel@phil-desktop>
X-Mailer: Evolution 3.4.4 (3.4.4-1.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Remove static libraries from -dev packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Sep 2012 22:12:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-25 at 13:54 +0100, Phil Blundell wrote:
> Fixes the QA warnings:
> 
> WARNING: QA Issue: non -staticdev package contains static .a library: util-linux-libblkid-dev path '/work/mips32el-oe-linux/util-linux/2.21.2-r3micro3/packages-split/util-linux-libblkid-dev/lib/libblkid.a'
> WARNING: QA Issue: non -staticdev package contains static .a library: util-linux-libuuid-dev path '/work/mips32el-oe-linux/util-linux/2.21.2-r3micro3/packages-split/util-linux-libuuid-dev/lib/libuuid.a'

> -FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.a ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"
> +FILES_util-linux-libblkid-dev = "${base_libdir}/libblkid.so ${base_libdir}/libblkid.la ${includedir}/blkid ${libdir}/pkgconfig/blkid.pc"

Wouldn't EXTRA_OECONF += " --disable-static" be better?





