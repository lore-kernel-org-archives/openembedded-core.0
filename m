Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1ThtrU-0001ON-1Q
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 04:16:56 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so1346664pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Dec 2012 19:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=lLe5ItmBdGVK/FVp5wjUsKbySGToaogbfrXSIi+d2TE=;
	b=qax48q6wBbTU3iTXOBeRCuU4iPxhKjbxkaS9lC9+CqW26HLBi5vY+pKwBTcLiCEZr8
	IXbT02pA7uSGj4oKD9xNa8Eh4XwaOScuOSimMyaYIzyPNerxibqEI7ciXFwHac2SY3Y7
	WbmVdnXDvci4n2pBzjFeKPnHwCSNQ/8oCGBgF7lkDvUvARj3whbfSnwOwmei6e7hGFHw
	ZEF6Cbc8cVDbcVGmiMXRFWViTrx3wIQiw/OM0qk2IZsZ29vtEUF9YKKnYwBFs+fU/OwU
	/1xWlRtk1zisMnW8Yr/wz6iiHYM3OcV8omSZPsABgXZA0Z8fHXSDCkVVjHtZN91qS/ey
	iP5w==
Received: by 10.68.229.194 with SMTP id ss2mr35811216pbc.17.1355108545028;
	Sun, 09 Dec 2012 19:02:25 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.76.27])
	by mx.google.com with ESMTPS id ty4sm10978730pbc.57.2012.12.09.19.02.22
	(version=SSLv3 cipher=OTHER); Sun, 09 Dec 2012 19:02:24 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 09 Dec 2012 19:02:24 -0800 (PST)
Message-ID: <1470777.I4qxdGjQG2@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
MIME-Version: 1.0
Subject: how to customize the qt4e-demo-image?
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
X-List-Received-Date: Mon, 10 Dec 2012 03:16:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi, all!

I have built a qt4e-demo-image, whose size is > 200Mbyte.

but my system only has 128M nand flash.

I have checked the image, and found it installed gtk unexpectedly.
I have not do the depper exploration for package dependency.

what I want is just to get a smaller image, what is the simplest way?

PS: what's problem about gtk dependency? it should not like that.


Yi Qingliang
Nanjing Jilong



