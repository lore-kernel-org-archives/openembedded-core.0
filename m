Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5DAE673DBA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 10:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t41AviI1013253; Fri, 1 May 2015 11:57:44 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id EwSC3RhmTsQj; Fri,  1 May 2015 11:57:44 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t41AvUoD013246
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 1 May 2015 11:57:42 +0100
Message-ID: <1430477850.18360.11.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Date: Fri, 01 May 2015 11:57:30 +0100
In-Reply-To: <1430477339.3318.6.camel@collabora.co.uk>
References: <[OE-core][PATCH] systemd: remove unused patches>
	<1430476889-5490-1-git-send-email-joshua.lock@collabora.co.uk>
	<1430477339.3318.6.camel@collabora.co.uk>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: remove unused patches
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
X-List-Received-Date: Fri, 01 May 2015 10:57:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-01 at 11:48 +0100, Joshua Lock wrote:
> On Fri, 2015-05-01 at 11:41 +0100, Joshua Lock wrote:
> > These patches are no longer required since 
> > 7bfc9891ff498bdde31aadd2449d3b4692dbc510
> 
> Ah, I see Ross has submitted a patch to re-add the Make-root-s-home
> -directory-configurable.patch
> 
> Possibly ignore this?

I've actually been hoping someone would send this cleanup. I dropped the
problematic part of the patch and queued it.

Cheers,

Richard


