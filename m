Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1THN6f-0003dz-UB
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 01:02:58 +0200
Received: by iebc13 with SMTP id c13so5859459ieb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 15:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fuYOrQgX60Af5f1A90X5zTR0420RgWYTL/qbVXeRt1g=;
	b=zCSeTqBPBS0R4kOBFbVaWg2kZsOzluU8PY44v2s8ZJm3obCJHudzBR4J7n1NuG8G18
	6OoSIx7GOVxHQwPfPPW1FhKBrBruIVl9a1L1N8ZxYO1gldMYVGFI9496WWujRwvI2dzS
	GBElYQy5Rd6GFSkTdArBBaz5AuVdQS0TIzffHderpRSeq3xSv6rVHFyntqS8s8Ll43kq
	epHaBdLSb9rk14gR8az/AIcgwlFttB4kqh5a8Ved2hot1Tnj7NtE4aX6qjXPC+1ZIaiZ
	1dO7+bVBMNy0EfC/cnayAFWJ+Fj8+wdOOOPer4VWC8EpGAHo2c4PE2B/Sbhak2Bym4Q8
	O5qg==
MIME-Version: 1.0
Received: by 10.50.77.164 with SMTP id t4mr5039037igw.7.1348786205142; Thu, 27
	Sep 2012 15:50:05 -0700 (PDT)
Received: by 10.64.49.71 with HTTP; Thu, 27 Sep 2012 15:50:05 -0700 (PDT)
In-Reply-To: <5064D5FF.2050409@windriver.com>
References: <20120927142926.CA9C5103AC@opal>
	<20120927153419.GD3454@jama.jama.net>
	<20120927175531.GF3454@jama.jama.net>
	<CAP9ODKr0nC2WbN=gCieWRnf4=-9SiiB6NUiubVrTxnnvbAaGtg@mail.gmail.com>
	<5064D5FF.2050409@windriver.com>
Date: Fri, 28 Sep 2012 00:50:05 +0200
Message-ID: <CA+chaQdL+UTXrMsUJkzrEbpqMSxdQ3v7uCycumO9aUqmm9cnkg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Martin Jansa : xserver-xorg: use EXTENDPKGV instead of PV in RCONFLICTS_${PN}-module-exa
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
X-List-Received-Date: Thu, 27 Sep 2012 23:02:58 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 28, 2012 at 12:41 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> Just an FYI -- Martin Jansa found a problem with the implement of the
> package version comparison.
>
> In deb and ipk, they do not support '<' or '>', instead it's '<<' and '>>'.
> (Odd, historical reasons apparently).
>
> While RPM doesn't have any idea what '<<' or '>>' is.
>
> Talking with RP and others it seems like the best approach is to implement a
> conversion, in the deb and ipk packaging classes, to convert '<' and '>' to
> the '<<' and '>>' equivalents.  As well as add a sanity check that nobody is
> using '<<' or '>>'.
>
> I'm in the process of doing that now.
>
> --Mark

There is still some problem in opkg, now when I'm testing << with opkg
which should work as LESS (and < as LESS_EQUAL), it still shows <= in
opkg status and behaves like <=. So there is probably some bug in opkg
still hidden :/


