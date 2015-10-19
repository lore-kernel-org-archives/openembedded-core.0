Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C309D65CBD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 15:34:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9JFX1fn015603; Mon, 19 Oct 2015 16:34:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1jUNwwI1gQ7I; Mon, 19 Oct 2015 16:34:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t9JFXrC2015676
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 19 Oct 2015 16:34:04 +0100
Message-ID: <1445268833.17974.106.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 19 Oct 2015 16:33:53 +0100
In-Reply-To: <562501BF.6010202@windriver.com>
References: <1445264230-1126-1-git-send-email-dbaryshkov@gmail.com>
	<562501BF.6010202@windriver.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libsdl: support native compilation
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
X-List-Received-Date: Mon, 19 Oct 2015 15:34:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-10-19 at 09:44 -0500, Mark Hatle wrote:
> On 10/19/15 9:17 AM, Dmitry Eremin-Solenikov wrote:
> > qemu-native can use SDL backend for graphical output. Currently it is
> > expected to use libsdl provided by the host. However this can lead to
> > library incompatibilities between host and target. Make libsdl recipe
> > support native compilation.
> 
> I don't object to the patch.. but we did have multiple problems in the past
> where libsdl (native) did not work with the host systems X11 or what-ever.
> 
> Various failure conditions about not linking, linking to the wrong libsdl, or
> execution failing are what made us prefer the host system's libsdl -- or simply
> disabling libsdl altogether.

This is my big worry too. I remember a lot of problems trying to build a
libsdl that worked on all of the different linux distros someone might
run on. Previously we found that assuming a working libsdl or disabling
it was much easier.

How wide has the testing if this patch series been?

Cheers,

Richard


