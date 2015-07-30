Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3973E7632C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 13:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6UDDUfV032550; Thu, 30 Jul 2015 14:13:30 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gO9abftNw9MS; Thu, 30 Jul 2015 14:13:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6UDDFRo032546
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 30 Jul 2015 14:13:26 +0100
Message-ID: <1438261995.11208.109.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Date: Thu, 30 Jul 2015 14:13:15 +0100
In-Reply-To: <1438166990-13918-1-git-send-email-adrian.ratiu@ni.com>
References: <1438166990-13918-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: Remove replace call from MACHINE_ARCH
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
X-List-Received-Date: Thu, 30 Jul 2015 13:13:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-07-29 at 13:49 +0300, Ioan-Adrian Ratiu wrote:
> This replace() hack was added to fix Yocto bug #946 [1] with commit id
> 69b3a11. It is time to fix this properly.

I'd love to see this fixed properly. I assume you're volunteering to do
this?

>  It should not be an issue
> anymore with libzypp after 4.5 years, but if the initial bug still
> exists, then a more intelligent solution should be used to fix it.

We no longer use libzypp. I believe however that this is a more deeply
rooted rpm issue.

So, what testing did you do of the rpm backend after this change?

Note that we also have to do mappings of TARGET_ARCH ->
TRANSLATED_TARGET_ARCH which is the same issue as this one.

Cheers,

Richard



