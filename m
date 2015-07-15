Return-Path: <kirgene@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 771D96AC95
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 15:04:17 +0000 (UTC)
Received: by wicmv11 with SMTP id mv11so568717wic.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jul 2015 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Sq3X5IO/ryESPA5IWI3kyYpXSxFi9/rVbBcJ/dbRt2A=;
	b=jeYj1Z5FR/cX7SHcnJ4PWGvTsfKkietiUTVP5ZutDGZAXOorNR06GWai8WMcCTXfg2
	IV+62WsFin4i2OUQzzoEigTGE665GyQVNFzG6qD7BRziOZ5rMgGjAbfQ7WyXKAzzHdgr
	whu4bTQ2QWJvQ7J9kuaTrchv1MwsHbn9NR7KZcJixdjZGO3ju/JB1lY3d69HYZYPx+65
	y1d1LkzTs7k5MMZxx7/kFiKyw+j/kgTgLVRf21phmJTFfD8t0rH3UsnrYyyb7oV++bsc
	7kxqZFLu1YL54grZhB5S+oYu3HslbKbjFmArIx2Hu4LUSGrWPWWx5q5SQVymqY1M9Xam
	4oeA==
MIME-Version: 1.0
X-Received: by 10.180.8.68 with SMTP id p4mr17286402wia.27.1436972656822; Wed,
	15 Jul 2015 08:04:16 -0700 (PDT)
Received: by 10.194.169.3 with HTTP; Wed, 15 Jul 2015 08:04:16 -0700 (PDT)
Date: Wed, 15 Jul 2015 18:04:16 +0300
Message-ID: <CADV-EXHwJ5oRgdS-LBTagNK+xqP=wmcgy59BeNiJ8bHo5dPVTw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Different kernel configuration for different distros
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
X-List-Received-Date: Wed, 15 Jul 2015 15:04:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi
I have custom (non-yocto) kernel and several distros that use it.
Each distro needs to define specific CONFIG_* for this kernel.
I'd like to know the right way to customize kernel recipe from each
distro's config.

-- 
Regards,
Yevhen

