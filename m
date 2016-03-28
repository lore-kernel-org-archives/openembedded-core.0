Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA0A65CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 22:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMIYXH021827; Mon, 28 Mar 2016 23:18:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EvrCDH4VoXjT; Mon, 28 Mar 2016 23:18:34 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2SMISFW021822
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 28 Mar 2016 23:18:29 +0100
Message-ID: <1459203508.21672.9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Christopher Larson <clarson@kergoth.com>, Mariano Lopez
	<mariano.lopez@linux.intel.com>, openembedded-core@lists.openembedded.org
Date: Mon, 28 Mar 2016 23:18:28 +0100
In-Reply-To: <CABcZAN==+94v=j6knPg5Ap7ov17h6S-Yb=tjz7-7E6jsZSN2vg@mail.gmail.com>
References: <cover.1458803813.git.mariano.lopez@linux.intel.com>
	<34e4b28e8c8e665b38fd82d59ecaf8d486de6193.1458803813.git.mariano.lopez@linux.intel.com>
	<CABcZANkt+zzsRKL7ao2aP81Cu7Easc5rmmGHQzBdy0jwRNTDQg@mail.gmail.com>
	<56F97344.9040204@linux.intel.com>
	<CABcZAN==+94v=j6knPg5Ap7ov17h6S-Yb=tjz7-7E6jsZSN2vg@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] archiver.bbclass: Just archive gcc-source for all gcc recipes
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
X-List-Received-Date: Mon, 28 Mar 2016 22:18:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 18:43 +0000, Christopher Larson wrote:
> Fair enough, thanks for the clarification!

Its worth noting we did kill the concept of "shared stamps" from
bitbake since it turned out to be a huge pain which could be solved in
other ways which whilst ugly, are more reliable and work better. It was
only ever used by gcc and didn't work with the kernel as the semantics
were different.

I'd love a clean solution but have yet to see something that can work
better than what we have today without invasive changes to bitbake.

Cheers,

Richard




