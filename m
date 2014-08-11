Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF93609B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BDNfRl007647; Mon, 11 Aug 2014 14:23:41 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id odIDhPL6t7LQ; Mon, 11 Aug 2014 14:23:41 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7BDNbpP007643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 11 Aug 2014 14:23:39 +0100
Message-ID: <1407763417.22187.12.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Mon, 11 Aug 2014 14:23:37 +0100
In-Reply-To: <alpine.LFD.2.11.1408110909060.11035@localhost>
References: <alpine.LFD.2.11.1408110909060.11035@localhost>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: should all RDEPENDS always have an attached package name?
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
X-List-Received-Date: Mon, 11 Aug 2014 13:24:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-08-11 at 09:11 -0400, Robert P. J. Day wrote:
>   according to yocto ref manual, all uses of RDEPENDS should be
> suffixed with a package name (normally, _${PN}, of course), but i just
> noticed that the buildtools-tarball.bb recipe file contains:
> 
>   RDEPENDS = "${TOOLCHAIN_HOST_TASK}"
> 
> i suspect that still works just fine, but it does disagree with the
> rather adamant admonition in the ref manual.

The buildtools-tarball doesn't have any packages so in this particular
case, it is acceptable (and accepted by bitbake and the QA tests).

Cheers,

Richard


