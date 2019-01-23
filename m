Return-Path: <nick83ola@gmail.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 898FD6BC01
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 12:22:00 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id c206so1636910oib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 04:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=pHYQB+i8JqrcCHft9rEdu9Sy4h3yeBwWgBg90JyeonA=;
	b=TwxnNtQTWwK8wJkem9dpgoY1j71qkqwigYA2xSPsFEMEoG23psTZ0jo7nlzvRnNVyP
	E7mgAPAa6T4qQ/UQNPQUT8FbMbUXxFs3SJdHaPqaV7f68njJA7RfuxsKFr8b+RBmiT3v
	LzGFb+rcFNGWQiQvtc3Pmh/+MXop0HXwridKeZoRp7jYlyQ6N35GgiAoFQP8T1HtGiX8
	TZDhVplExNwd1Rv6HbIPNHjIE1oyCWNyLW4EqNOnfeRwZv5FRIacxfA1so83CSglMIMj
	P1SWms9bO5/G2vjjEyqskjlPL3RAvQ65pAHhgdksdsa9qACl1rXWC/VG5W9taMBbuXuI
	JjTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=pHYQB+i8JqrcCHft9rEdu9Sy4h3yeBwWgBg90JyeonA=;
	b=llUWBcw19EztSB8UWey9nS1Dr7Iwbben0nPQdtqhC4Yiy1JbiVqU3pCz4iJs1N1Rp5
	4t4sHsgCP4P8xVEf3LJJqkFoHXGZGHC0cpMaS83krK40RtI9hNa2EiFBxf1w0It95tiy
	/s8jIx+WgTyzgxEs+UfutSZdrcwvhF6sUVqaTNK0TKWV/I1DApTscz7RZeBhEhK6hL64
	MnvqHYS91K80Dq8ie6uUyzU7EQj3sVjJGF9wqhXAlINGiEVK69SqReJr/1WK49yXz/n8
	TMTKhAV9kX3EUB6+rPV34Sf0RInXvrM4m45ACB227SJTxtuI4PizrJVcEn8hSJ1hm5qb
	PZ3Q==
X-Gm-Message-State: AJcUukcbgsZCRNUnGada6/B4dXLIw/EufLWWOIb0pGt2Yr1BRsIweMII
	1Cc1Tp1VOjuRfB07ibH0UtnxEDoX4gQTPymcW79wMC8Ny70=
X-Google-Smtp-Source: ALg8bN5uLRIsRPSqvhJHHMbyeVjskLFiPGH0UZBw9k7AAnWXyOsPvhAnFas3ojFGbiBPQBTwW5Co3WLq+ap32ItX/j0=
X-Received: by 2002:aca:44f:: with SMTP id 76mr1070655oie.212.1548246121375;
	Wed, 23 Jan 2019 04:22:01 -0800 (PST)
MIME-Version: 1.0
References: <CABPh3UMd9LvewWZuiTSiJgW_J74E+kJ7Tfxmq7mXgzGjSekF9Q@mail.gmail.com>
	<CABPh3UOpcpnsyY_yvFM5SGeSsR6vt7_iELQMKx4CuWDJeJQhVA@mail.gmail.com>
In-Reply-To: <CABPh3UOpcpnsyY_yvFM5SGeSsR6vt7_iELQMKx4CuWDJeJQhVA@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Wed, 23 Jan 2019 12:21:50 +0000
Message-ID: <CABPh3UMRwQz5s57oFLGHSBT-Guns5r2XRsFtU4ZLXmJspcjtcA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image-buildinfo: make the build file shell compatible
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
X-List-Received-Date: Wed, 23 Jan 2019 12:22:00 -0000
Content-Type: text/plain; charset="UTF-8"

sorry here is the correct file


############################################################
# Build Configuration                                      #
############################################################
DISTRO="esw-space-controller"
DISTRO_VERSION="2.6"
TARGET_SYS="arm-poky-linux-musleabi"
MACHINE="bumblebee-cl-imx7"

############################################################
# Layer Revisions                                          #
############################################################
BBLAYERS_meta="HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modified"
BBLAYERS_meta-poky="HEAD:eddff2b361928e88e3628ebc22a1a0ebb119e01b:modified"
BBLAYERS_meta-freescale="HEAD:15a354ee592866a61a893562760ef84bf8fe5e4d:"
BBLAYERS_meta-ti="master:fb8bfa61d74e49d1a436612b07bdb69c1bdd350f:"
BBLAYERS_meta-jci-bsp-bumblebee="HEAD:1e293e40a21840fb42abb6d188d23867afb5e9b2:"
BBLAYERS_meta-oe="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-networking="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-python="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-webserver="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-swupd="HEAD:ed8911cc40b5164af0715f471ee204ea9a3d3491:"
BBLAYERS_meta-tpm="HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:"
BBLAYERS_meta-security="HEAD:393db42323515a65e554a6b2ed05f7ffcc958e3f:"
BBLAYERS_meta-perl="HEAD:ff6bead1624a1e261408516b3d064a04aab5f592:"
BBLAYERS_meta-gplv2="HEAD:aabc30f3bd03f97326fb8596910b94639fea7575:"
BBLAYERS_meta-jci-app-esw="contrib/nlunghi/SPACE-557:5a8aea37191e603b1bba74222ad236f7a3e5cc93:modified"
BBLAYERS_meta-eclipse-smarthome="HEAD:e91f8808ea1a16f5f03359631c58a782067e7884:"
BBLAYERS_meta-java="HEAD:99d16707d03898fe9fd5b4fee32f6417825a9e6a:"
BBLAYERS_meta-jci-app-bumblebee="contrib/nlunghi/proxy-rest:57f09dd7147d1dae5caf681114b5087bf7957bbf:"
BBLAYERS_meta-nick="master:3987b1f760a25941168f6c0277a0c49b46f5c723:modified"
BBLAYERS_workspace="<unknown>:<unknown>:modified"

