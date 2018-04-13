Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3ADDC7460B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2018 12:07:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3DC7GJv027886
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 13 Apr 2018 13:07:21 +0100
Message-ID: <1523621236.2942.334.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
Date: Fri, 13 Apr 2018 13:07:16 +0100
In-Reply-To: <CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
References: <20180410143532.31916-1-ross.burton@intel.com>
	<CA+chaQdRDvvi-2UgmbC_=yjiuN-8yqdrk5K1yzTh9CVKZsXiJA@mail.gmail.com>
	<CAJTo0LZWZRj0u9J+Z42Lxuh98u-f2i8HQwM37z1TPqRB9KbfLA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: use pigz to create .gz files
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
X-List-Received-Date: Fri, 13 Apr 2018 12:07:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2018-04-11 at 14:36 +0100, Burton, Ross wrote:
> Wouldn't that introduce a fun circular dependency if pigz-native
> needs
> to be built?

For the sstate code we could probably make it use pigz if present. 

We could also only depend on pigz-native for target, or encode the
actual pigz-native dependencies.

So there may be a few options if its worth the performance win.

Cheers,

Richard

