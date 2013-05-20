Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 019946A2F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2013 22:25:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4KMT20u026522; Mon, 20 May 2013 23:29:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v9I98FrOeNYM; Mon, 20 May 2013 23:29:01 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4KMSuqc026514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 20 May 2013 23:28:57 +0100
Message-ID: <1369088718.11013.3.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 May 2013 23:25:18 +0100
In-Reply-To: <B646CCF4-2E7C-4135-AD1D-D72E0827C779@gmail.com>
References: <1369052565-26170-1-git-send-email-mac@mcrowe.com>
	<B646CCF4-2E7C-4135-AD1D-D72E0827C779@gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Mike Crowe <mac@mcrowe.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Add dependency on binutils
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
X-List-Received-Date: Mon, 20 May 2013 22:25:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-05-20 at 10:37 -0700, Khem Raj wrote:
> On May 20, 2013, at 5:22 AM, Mike Crowe <mac@mcrowe.com> wrote:
> 
> > Compiling the Linux kernel requires binutils; kernel.bbclass uses
> > INHIBIT_DEFAULT_DEPS so it had better depend on binutils explicitly.
> > 
> > (The lack of this dependency isn't always a problem because binutils
> > is required to build gcc-cross but if gcc-cross is reconstructed from
> > the sstate cache then gcc-cross's dependency on binutils-cross is
> > ignored due to being in the safe dependency list in
> > setscene_depvalid.)
> 
> what good is cross-gcc without cross-binutils. Could it be fixed in gcc recipes instead so
> it pulls binutils-cross 

This needs fixing in the logic in sstate.bbclass.

Cheers,

Richard


