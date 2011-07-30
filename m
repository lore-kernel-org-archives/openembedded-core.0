Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnDEk-0007Uh-57
	for openembedded-core@lists.openembedded.org;
	Sat, 30 Jul 2011 19:22:06 +0200
Received: by pzk1 with SMTP id 1so8391501pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=Jg2bS8tF0mbtNk0yXB/tx9SbnCgBW0tyN51Tv4bOi14=;
	b=Gd+B5QoQML7X6VNnNyJbUdXZW62hwk2eDY0/mYgjiKme+8U0u9uBbR3fXuANIQvrBW
	dEml+6B4PieqLRe7kHBBJr5bD/TbXp3QNSWqgLdrTrJ0RUkWrmZGF0rE98VM3kCwmLWk
	Q5zS9UqEs9dDlZAM0pMrNR7/Ii6U4rBZoiPjU=
Received: by 10.68.1.161 with SMTP id 1mr4740930pbn.185.1312046267218;
	Sat, 30 Jul 2011 10:17:47 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm3207710pbi.35.2011.07.30.10.17.45
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 10:17:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 10:17:43 -0700
Message-ID: <1498473.Y2coYvunJ8@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <547eb0a8ac9c26e8fbc03948a4ebd402c6e9a3fb.1311715727.git.mark.hatle@windriver.com>
References: <cover.1311715727.git.mark.hatle@windriver.com>
	<547eb0a8ac9c26e8fbc03948a4ebd402c6e9a3fb.1311715727.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: Re: [v2 PATCH 1/8] multilib_header.bbclass: Add oe_multilib_header wrapper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 30 Jul 2011 17:22:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, July 26, 2011 04:31:02 PM Mark Hatle wrote:
> This helper function and associated header will allow us to
> resolve two/three header files that conflict due to contents
> that change based on wordsize and ABI.

Will it be a nop for non multilib case ?



