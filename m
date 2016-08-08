Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id EE8147718C;
	Mon,  8 Aug 2016 16:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u78Fx0Zh014860; Mon, 8 Aug 2016 16:59:54 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id WpZo97cp-MJJ; Mon,  8 Aug 2016 16:59:54 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u78FxpZI014923
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 8 Aug 2016 16:59:52 +0100
Message-ID: <1470671991.8166.44.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, =?ISO-8859-1?Q?Andr=E9?= Draszik
	<git@andred.net>
Date: Mon, 08 Aug 2016 16:59:51 +0100
In-Reply-To: <ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
References: <CC61EFE1-5F39-4848-AD71-8E9C8DEC43C8@gmail.com>
	<1470637705.8166.29.camel@linuxfoundation.org>
	<8C207C42-3D61-4C3F-A1DE-F305AA6617BA@gmail.com>
	<1470644094.8166.37.camel@linuxfoundation.org>
	<1470646210.8166.38.camel@rpsys.net>
	<1470647765.4581.23.camel@andred.net>
	<ACB9AEF7-A7DF-4A88-9762-7569D91AD12D@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Yocto Discussion Mailing List <yocto@yoctoproject.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] binutils 2.27
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
X-List-Received-Date: Mon, 08 Aug 2016 16:00:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-08-08 at 08:21 -0700, Khem Raj wrote:
> They are different issues. for OE ppc also shows same errors with lib
> unwind.

FWIW, I think the connmand segfault on mips and powerpc is hinted at
with this bug:

https://bugs.launchpad.net/ubuntu/+source/lua5.3/+bug/1570055

connmand is a binary linked with a linker version-script. If I build
connmand without that option, it doesn't segfault, at least on mips.

The binutils manuals say you shouldn't build binaries with version
scripts:

http://ftp.gnu.org/old-gnu/Manuals/ld-2.9.1/html_node/ld_25.html 

Its suspected connman might do this to limit the function exposure to
its plugins.

Now sure exactly what needs to happen here without more research but it
certainly hits at where the problem is. I suspect its the same issue on
ppc.

Cheers,

Richard




