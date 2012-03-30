Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SDinq-00069A-Ef
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 22:52:10 +0200
Received: by pbcum15 with SMTP id um15so2003645pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 13:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=hRFvgU+l3EJw+LfNczuUWaWqYKqjRNu5raD3TONDj3A=;
	b=HjLnj9Y8tlXv17d80pLIQUgKsOysv8bLNHcHeLHijL0m9Xu9XTpcVmb32zy7xWEouY
	vnXXfrkZl/4f1QxZT6Z+CqwBzPNXMFUs6Om+DTJhZ+Um9nQhZO4h2LyRnJuUnhZOUq31
	2fT/oQ23n4uLIm5zhWBDYbD1IJA72N8LjSMk0z4K/vTZprYOy4wFiKFy1l9VfIEL7t+8
	g3l6N+/8Fzqc80yVJqJHAbJMi63r/qUfHsFimYO+cmQo0d/IlrOQnDfEs9owFqQxOP3C
	GryYwROl6D+dQbEcHt+zvgxaGPje/5JKzfiqZu8n5WQF7BQCUw/PsVRrdPFKAPBZXhrj
	RrAA==
Received: by 10.68.236.72 with SMTP id us8mr684817pbc.41.1333140184853;
	Fri, 30 Mar 2012 13:43:04 -0700 (PDT)
Received: from [10.61.32.129] ([69.38.219.78])
	by mx.google.com with ESMTPS id l8sm8073730pbd.62.2012.03.30.13.43.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 13:43:03 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1333058859.18082.44.camel@ted>
Date: Fri, 30 Mar 2012 13:43:13 -0700
Message-Id: <3ABC0140-1A7C-45A2-A601-3D8BDCB839D6@dominion.thruhere.net>
References: <cover.1332952962.git.dexuan.cui@intel.com>
	<1333058859.18082.44.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQko1k2FK/GYaFemuWvkoT/WJJsZahBHNMRkjEM7r7hOX3hCMtzp9YXLHc5kTXszEL1Q7JBp
Subject: Re: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
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
X-List-Received-Date: Fri, 30 Mar 2012 20:52:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 29 mrt. 2012, om 15:07 heeft Richard Purdie het volgende geschreven:

> On Thu, 2012-03-29 at 00:51 +0800, Dexuan Cui wrote:
>> Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please =
comment.
>>=20
>> Let's figure out if this big patch is accepatable or not...
>>=20
>> With this patch, I can successfully create a 8.5GB .ext3 file with =
genext2fs.
>> The speed is slow -- I spent about 1.5 hours.
>=20
> If these patches solved all the problems and made things work
> wonderfully I'd probably say we'd take them. Unfortunately I don't
> consider taking 1.5 hours to build am 8GB filesystem "wonderful", its
> rather worrying and I don't think its performing any where need fast
> enough for our needs :(.
>=20
> Patching genext2fs at this point in the cycle is a rather risky
> undertaking too and I'm getting very concerned about this.=20

The biggest issue I have with genext2fs is that it currently allocates =
RAM for the complete image, which in my case will cause it to swap and =
for other users cause it to crash, since image > (ram + swap). Fixing =
the memory issue before the release would be greatly appreciated.

What about putting it on the shortlist for backports after the release? =
That should give us all more time to test it and eventually get into the =
hands of stable branch users. Of course I'd still prefer it to go in =
before the release and backport fixes :)

regards,

Koen=


