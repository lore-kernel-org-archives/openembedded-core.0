Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5F3D27458F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 11:21:21 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id a19-v6so12622469otl.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=FMa064jUnmxJi9Jo39Q8XpdtxEMExC/AL0AaeftkDkM=;
	b=ea6NhIZq2BJAHW8kl1yjdz0/BlptnqzszE3Lydud747wOOqYiIeFtsCJtuEqy3JQqi
	fEMBqlTbnln5Y4WStJ/6SYUbVEIIBlumrbQtx98UFBJj7yWakjw3rh2Rx7VcyNhz0hFM
	leJDGoXhq1X0vS8zpUCnEc3uNH31pGYLrN72OUYTUQnQ3C9fwtyJXObqag1mh/rfpVUb
	rTV11GsbsO/WE01XWugtP4ijnHq20g3bGZDYG1QVbzK47BQkFdvdrCeoMX6/Ei27R6ca
	gyWuSkWzJ08MJ2izv3OlU3oE3J3VvjfPnj3D+TwobeD4YwjyIMOgqcKmbdXcXOGVh6kg
	oCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FMa064jUnmxJi9Jo39Q8XpdtxEMExC/AL0AaeftkDkM=;
	b=PWQAwKX+1XfeeAmClEmeTu/5wAFxYsmOyQOsPUgOscS/C3Q+9xpYCFVmgNlN9r8ij6
	6MZS6qiSzjr6T2arhPMTg7ppkL7r5VKCOXA/OgCVvOqFca8jqLWORjniuFXVNqH/a9YJ
	411hKCSLvEWYCF6srKMbcCVOaYGXqAGjuIgguf4XHXOJ77/qLwNvoV1vPlL0tDk5TgE5
	a/3sJ5JTl9fZdzUJTg2ngr+/2k4OVKV4L5ArH5jAw14lSLXhaIeU89fAtbvR1gbRoExm
	91k14pRq3iL9PP0qSx57KuBoJ/wAKcIjsgG0ogRqC7KIZz4r/VIGxpXCyOBqv2C1dGBD
	PdSw==
X-Gm-Message-State: APzg51CTGNJ0Bnc2qEbm5sMz0dxyuxyO/sSj/UJSyeCT2emMJ00kDrLm
	mR/PvWj04FTTp5ntoxbRj3UifqisDjBK3fhaetyBuw==
X-Google-Smtp-Source: ANB0VdaytP1S/RsE8/iLeN/SDWdwzPtjnX/chJJ/reHDdbTEfYfX8VuCANpDZCFJebeaONYq2PW4xCzwPPm05gjlcGo=
X-Received: by 2002:a9d:844:: with SMTP id
	62-v6mr23501642oty.159.1537528881695; 
	Fri, 21 Sep 2018 04:21:21 -0700 (PDT)
MIME-Version: 1.0
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 12:21:10 +0100
Message-ID: <CAJTo0La8KFRbVQvhcYyN-JMjRiBzjeUE9-dwadBvmCCbX95A=g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Kernel warnings with master/poky-lsb
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
X-List-Received-Date: Fri, 21 Sep 2018 11:21:21 -0000
Content-Type: text/plain; charset="UTF-8"

FYI, the poky-lsb builds for meta-yocto-bsp BSPs are all emitting this warning:

WARNING: linux-yocto-4.14.48+gitAUTOINC+9beb3a2873_04043b48eb-r0
do_kernel_configcheck: [kernel config]: This BSP sets config options
that are not offered anywhere within this kernel:
CONFIG_USB_OCTEON2_COMMON

Is this something that is fixed in 4.14.67? Did I miss an upgrade or
are there upgrade patches outstanding?  Note that we were hoping to
roll M3 this week.

Ross

