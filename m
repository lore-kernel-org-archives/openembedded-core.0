Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1630F60229
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 17:58:42 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3IHwduW016592
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 18 Apr 2018 18:58:40 +0100
Message-ID: <1524074319.18865.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Apr 2018 18:58:39 +0100
In-Reply-To: <CAJTo0LYpsTA9ppPKZkke2uAotyx7KKwm9CJSZyaVrfEkA5XW8Q@mail.gmail.com>
References: <1523983449-32655-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAJTo0LYwLeeR0y0x=PdYKCSdvi1hku5q_ixf77Te+bKqC_Lk_Q@mail.gmail.com>
	<CAJTo0LYpsTA9ppPKZkke2uAotyx7KKwm9CJSZyaVrfEkA5XW8Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uninative: Add allow-shlib-undefined to BUILD_LDFLAGS and drop other workarounds
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
X-List-Received-Date: Wed, 18 Apr 2018 17:58:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-04-17 at 21:57 +0100, Burton, Ross wrote:
> The dbus-glib-native one hits a few times but the only other place it
> has broken so far is in cmake-native:
> 
> bin/cmake: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.25' not
> found (required by
> TOPDIR/tmp/work/x86_64-linux/cmake-native/3.10.3-r0/recipe-sysroot-
> native/usr/lib/libexpat.so.1)
> 
> Is expat using rpaths or something and picking the wrong libc?

I've sent a followup patch which should address these issues, thanks.

Cheers,

Richard

