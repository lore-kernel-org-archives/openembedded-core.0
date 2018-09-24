Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 64952745A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:11:25 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w8ODBD7M023096
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 24 Sep 2018 14:11:14 +0100
Message-ID: <045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko.Rapeli@bmw.de, bruce.ashfield@gmail.com
Date: Mon, 24 Sep 2018 14:11:13 +0100
In-Reply-To: <20180924121927.GI9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:11:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
> > That was one old way, but not the only. And not for exposing non
> > uapi
> > headers.
> 
> What other ways exist?
> 
> I don't care how, but I must export custom kernel specific headers
> and
> other files to other recipes in a build in ways which are compatible
> with
> yocto upstream.
> 
> I have not seen any documented ways for this.

It may not be documented, perhaps because its actually very simple.

Any recipe can expose headers into the recipe sysroot, they simply
install them where needed in do_install as normal.

So all you need is a recipe which installs the right headers and then
you DEPEND on that recipe. Where that recipe gets the headers isn't
relevant.

Cheers,

Richard

