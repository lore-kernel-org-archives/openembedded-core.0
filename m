Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AADCC606A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 22:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49Msq11010517; Mon, 9 May 2016 23:54:52 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yCx8HnpGju5R; Mon,  9 May 2016 23:54:52 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u49MsmMa010513
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 9 May 2016 23:54:49 +0100
Message-ID: <1462834488.21831.158.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <kergoth@gmail.com>
Date: Mon, 09 May 2016 23:54:48 +0100
In-Reply-To: <CABcZANnDfYVQY5D5YYOGXCdVoU45Gku_hcA=wOat=6_=f9vrfw@mail.gmail.com>
References: <1462219765-18957-1-git-send-email-kergoth@gmail.com>
	<CAJTo0LadzExDXkkX9a6r1TTO2aQhTQ+kY82mV_-BLqs6jYnFFA@mail.gmail.com>
	<CABcZANmJe_UvZ6zeuMTwiyx9X+xY9ATD9XVW7ESrskMtjPL4YQ@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B61181DEFA@ORSMSX112.amr.corp.intel.com>
	<CABcZAN=jh=+8PMVw2YMw41Aax1hmssjOVe24SG9XhjB4HgQuwQ@mail.gmail.com>
	<1462832190.21831.156.camel@linuxfoundation.org>
	<CABcZAN=yO4rnaGLMvp6pFcAThE+u4AQ5GugPK2Yw-9ZOWufQSQ@mail.gmail.com>
	<CABcZANnDfYVQY5D5YYOGXCdVoU45Gku_hcA=wOat=6_=f9vrfw@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [master][PATCH] gcc-cross{, -canadian}: remove --with-linker-hash-style
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
X-List-Received-Date: Mon, 09 May 2016 22:54:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-09 at 15:41 -0700, Christopher Larson wrote:

> I have to say, I didn't realize oe-core patches require testing with
> meta-qt3. I can't remember the last time I touched qt that old. I'll
> have to add more non-core layers to my local testing in the future.

The version of lsb we have requires qt3 so it gets pulled into poky-lsb
only. Personally, I can't wait to upgrade lsb and then drop it. I'm
hoping that happens this cycle, finally.

Cheers,

Richard

