Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UPETY-0003xP-B1
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 17:59:20 +0200
Received: by mail-ea0-f172.google.com with SMTP id z7so2345827eaf.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 08:42:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=nZ9NhBnH/fRfpM33OoSkV5cq8QkSMjmBp53jEMr4qvg=;
	b=pxrM33pWRsF0YkWfPqUFjA0nK+8ylxaFXttYXt1ihCIOAIV7Yhs4qnv40dI3WmndXc
	V3Me7/X0MjE0Bug3wjSwO0IAxMxzJijNaoXGIZkNV8FZuYYqOcAwRk5y5Pitevkmc2Nv
	1PG2pHTb8HdpUNQT6/5aHZq6HP5PvfBDpxELJHUMBNmTlQXznNZ1TrDq5WWHujTXtHGR
	r3XZUsxeQFD2sjBH/ll/jnRFNTbKHtBGi6VKwjM4aWufAE5P7Hc2vQSAkm8CMB3DFBP8
	32GtCxgTK1NUSS1YRg9iSRNul0IfxvYUuP7ZiWBf7Z03guxLY58IWwVsMQFljwMc8Aon
	LWBA==
X-Received: by 10.14.215.193 with SMTP id e41mr50089268eep.32.1365435721519;
	Mon, 08 Apr 2013 08:42:01 -0700 (PDT)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id a1sm32797467eep.2.2013.04.08.08.41.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 08:42:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1365431958-22005-1-git-send-email-radu.moisan@intel.com>
Date: Mon, 8 Apr 2013 17:42:00 +0200
Message-Id: <CD6D3298-FD47-421C-A35A-C9C34106A4DE@dominion.thruhere.net>
References: <1365431958-22005-1-git-send-email-radu.moisan@intel.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Mailer: Apple Mail (2.1499)
X-Gm-Message-State: ALoCoQnNQzak7JTFb8Z3zBYfXRIpARzqAYbur4pwqOP9XkZ8nRKewOuOb/hULBUnerED7lN1XlAI
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: Move udevd back to /sbin
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Apr 2013 15:59:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 apr. 2013, om 16:39 heeft Radu Moisan <radu.moisan@intel.com> het =
volgende geschreven:

> Fixes [Yocto #4046]

Can you eloborate a bit in the commit message?=


