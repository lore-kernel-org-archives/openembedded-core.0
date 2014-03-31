Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9016F770
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 16:31:03 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s2VGUwA4017743; Mon, 31 Mar 2014 17:30:58 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id fMiUxve1BU7x; Mon, 31 Mar 2014 17:30:58 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s2VGUsQs017730
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 31 Mar 2014 17:30:56 +0100
Message-ID: <1396283449.14790.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kai Kang <kai.kang@windriver.com>
Date: Mon, 31 Mar 2014 17:30:49 +0100
In-Reply-To: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
References: <1396275649-32352-1-git-send-email-kai.kang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nss: avoid to use the hardcode kernel version
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
X-List-Received-Date: Mon, 31 Mar 2014 16:31:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-03-31 at 22:20 +0800, Kai Kang wrote:
> I don't quite understand what you mean "this makes nss machine
> specific". After update way for nss-native, I send this new version
> for review.

The kernel is machine specific. You're adding a dependency on the kernel
to nss recipe. This means the nss recipe now depends on the kernel and
the nss recipe is then also machine specific.

We do not want nss to change each time you change machine. This was
unacceptable last time you sent the patch, its still unacceptable.

Cheers,

Richard




