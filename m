Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Si4zp-0004Z2-9p
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 16:38:01 +0200
Received: by eaal1 with SMTP id l1so611806eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jun 2012 07:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=/jIN+dcS2MMLehQB6vFJDCKzlsYl52AmuZsfIUz8K0s=;
	b=gkr8j0q2kwd80yWONI72WRad9A1ofw0nRDRuHsyJpuIhOuSYEfCHexhVsPy1kSL6CY
	R12NC/M8tAkz2L7iPLwqTM3XbegVlubouLCag9NJ9bxGA+8Omkdh6aLbF0e+em8DOg7e
	rNGATZTF+tT2aGrmJ7CSz4gFDAnY/eYrIq8TH3H0ZGvje6zL4s0RumO7cIJ54xtWYDEK
	E4OwMZAubYB7L4rWMXRyG288n9YEhFNHq6ikTRYIu33b07UBvYM0xYmF+AEtZS7CNnsQ
	t2+QBluArwF29cEJ1ZCdHAuIhOx+ho0bJcIWnxWg5hR0niOIlFnbUP2lPH6MlVtdV/xO
	No0A==
Received: by 10.14.185.137 with SMTP id u9mr506845eem.220.1340375234269; Fri,
	22 Jun 2012 07:27:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Fri, 22 Jun 2012 07:26:43 -0700 (PDT)
In-Reply-To: <lypq8rzaoj.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1340373998.394.36.camel@ted>
	<lypq8rzaoj.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jun 2012 07:26:43 -0700
Message-ID: <CAMKF1soi2zErZ_M3bAYZZ2qdToWMcCwA_CaEpU9=w+i4O5jimA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf/abi_version.conf: Update to use BasicHash signature generator
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
X-List-Received-Date: Fri, 22 Jun 2012 14:38:01 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 22, 2012 at 7:24 AM, Enrico Scholz
<enrico.scholz@sigma-chemnitz.de> wrote:
> Has this really been tested?

Angstrom. SHR, yocto has it on by default for months now. No one
reported issues thus far.


