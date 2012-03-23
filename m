Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SB8wX-0002C6-Ap
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 19:10:29 +0100
Received: by lbbgi4 with SMTP id gi4so2628709lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Hh19m2MY8VoQs5RNRJ1iE5anmENEYL/d5mQxXeh4o50=;
	b=EOwHm8XumtMLuZDMlpeOhv7U6K3xzEJTTe0ULqgwYozlET/49yklfUT4sUNdu//uOl
	3Zq2z6HD3dxN6pvo74jQAF2Hd3eQwmFW5YUhuyk+yPTfixVqDdn6pj8TMlCiwOZiDkmb
	sIve/s54VeXY7Pyu3Elrp7kgm/4n4hkFk0g5FK4VPZ38Advu35mWYrxJAd7/uXCNBWOO
	zLuLpm9N3HZWTt4akshnCwT/IeKmv6u0/W1DvbILoIsar6zo0lod9BpThWYlyweTPnF3
	TaH2FdXZJycnzMe/04OL7oBOkgdVk5yhdCV6bhJQKxBFWWYuSSR4x4nlzU0flzBLigxG
	4drA==
Received: by 10.112.47.229 with SMTP id g5mr4808478lbn.36.1332525692749; Fri,
	23 Mar 2012 11:01:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Fri, 23 Mar 2012 11:01:02 -0700 (PDT)
In-Reply-To: <1332524697.9740.465.camel@ted>
References: <xna3ujdvoyvh9m51g7hfhmvu.1332520606617@email.android.com>
	<ADD6A3980E8C39419A432FF422031B4C0137C776@ORSMSX106.amr.corp.intel.com>
	<1332524697.9740.465.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 23 Mar 2012 11:01:02 -0700
Message-ID: <CAMKF1spJ=N1b2ZbshXy9tXUK3hgDxGMW4O_WS0R+H0kbpp3aow@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] Revert "gdb-cross-canadian: build gdb with python support"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2012 18:10:29 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 23, 2012 at 10:44 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> but then add:
> -Wl,-rpath,${libdir}/.. -Wl,-O1 \
>
> which is:
>
> /usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr
>
> (i.e. without the /lib on the end?) ?

for (sdk atleast cross toolchain bits) libdir points to
${libdir}/arm-oe-gnueabi-linux or whatever the architecture triplet
so using ${libdir}/.. gets us to standard usr/lib


