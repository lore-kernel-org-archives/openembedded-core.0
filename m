Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD006011A
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 07:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u557KHiS005478; Sun, 5 Jun 2016 08:20:17 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id KM49Co_a4_iy; Sun,  5 Jun 2016 08:20:17 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u557KBZF005474
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 5 Jun 2016 08:20:12 +0100
Message-ID: <1465111211.13979.38.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>, OE-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 05 Jun 2016 08:20:11 +0100
In-Reply-To: <20160604225509.GB28175@openSUSE-i7.site>
References: <20160604225509.GB28175@openSUSE-i7.site>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: INHERIT += "image-buildinfo" doesn't parse
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
X-List-Received-Date: Sun, 05 Jun 2016 07:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2016-06-04 at 18:55 -0400, Trevor Woerner wrote:
> Any config with
> 	INHERIT += "image-buildinfo"
> doesn't parse on master (updated moments ago):
> 
> 	ERROR: Error in compiling python function in /z/layerindex
> -master/layers/meta-poky/meta/classes/image-buildinfo.bbclass, line
> 27:
> 
> 	The code lines resulting in this error were:
> 	SyntaxError: invalid syntax (image-buildinfo.bbclass, line 35)
> 
> 	bb.BBHandledException: invalid syntax (image-buildinfo.bbclass,
> line 35)

I've tweaked line 35 which used an obsolete python syntax so was an
obvious/trivial fix. I've not tested it though...

Cheers,

Richard

