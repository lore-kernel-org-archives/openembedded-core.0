Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SwiJ7-0007Sx-QM
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 01:26:25 +0200
Received: by ggnp4 with SMTP id p4so7189612ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 16:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=VkFLdKl1r9M/dvI+D35/8Bpn9YlYm83uE9p0r0ROlrw=;
	b=iJfOHaXWaQRtbvnKgN3aBZGaqx22fZQQ199Zxfh4VtonRUBPSmoBvpphAjzpnwH4IG
	+2mYkZhethWqSCXwBC9ezJTbYdvwigbjpE5GPe8vSm9EAYgnJlfoOujHsxdNopuzbm2I
	XzgTKmeyYnCiiNlIZIlZuz/7Mi/hSjkNQp80bOh1FzsIET2mnRl+DUIuCYQ3ltL1Nl68
	1KBRVmvHSgvTDKATw307g5cb9tYAtAB8UlhPxzgF4PWVANaFrpBiAAbWjXbwsQkalrlp
	R//XtdOgrthDCMJhJObvhgdPK8g/YMVvWumFavLRdzLCJkqG8fh0ooiSxVRo9uiubTog
	dkTg==
Received: by 10.42.146.6 with SMTP id h6mr731080icv.53.1343862886281;
	Wed, 01 Aug 2012 16:14:46 -0700 (PDT)
Received: from [10.11.81.126] (corp.force10networks.com. [64.186.164.204])
	by mx.google.com with ESMTPS id fe7sm8274099igc.14.2012.08.01.16.14.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 16:14:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <cover.1343425855.git.peter.seebach@windriver.com>
Date: Wed, 1 Aug 2012 16:14:43 -0700
Message-Id: <9E87C506-7378-41D1-8568-31C67EACFC96@gmail.com>
References: <cover.1343425855.git.peter.seebach@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
Subject: Re: [PATCH 0/1] Update pseudo to 1.4 (target improvements)
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
X-List-Received-Date: Wed, 01 Aug 2012 23:26:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jul 27, 2012, at 2:54 PM, Peter Seebach <peter.seebach@windriver.com> =
wrote:

> Someone managed to do something which caused pseudo to try to build
> on ARM, where -m32 doesn't work, and I looked at the sort of =
half-baked
> --arch fix in tree, concluded I hated it, and redid it. So as of 1.4,
> pseudo now has support for a --cflags configure option, so the build =
system
> can pass in its own cflags instead of relying on pseudo being able to
> guess the correct way to change bit widths around.

thats someone was me. Thanks for fixing it.=


