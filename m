Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TA1er-0003Ce-OW
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 18:43:53 +0200
Received: by eekb57 with SMTP id b57so1191373eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 09:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=rF2IhDQE3gXL6ANLdIDRX8nJA7Bo6TwDiyEbhZrTrRI=;
	b=ayby8zCm3FsXFqNezfXzmb4wd+Gr7uXY7g+D/g4jRjNZUd58qym0AX7XRaRigOBKLv
	T/ApCNRQOsAdn0XrZNM5AkcFGtAzq0Ii3MatbQUdLzHAAxHs4himOu+Ql4XYe1eqTD35
	M7boPpC83PR/s47V/HMOOWMH9FPF8yFWxubpRR65o5I/Nt0F6Nkv80I31coyGBiu1EAs
	Dv/9glpEhPLYbuU6FVUx2tGTbN0IP4UdDTIAwg1qTtpCNNFASsnFg4z2Mxw9rDjEwPR+
	YBQSM79cdcQGGxTQ3pVqbqq8IdZxQueEqvRmEwDx0hlV3R8Ro8zsSaqmj6HuRiDqm1yW
	CxKA==
Received: by 10.14.202.131 with SMTP id d3mr9086269eeo.32.1347035488186; Fri,
	07 Sep 2012 09:31:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 09:30:58 -0700 (PDT)
In-Reply-To: <1592942.MflME341bO@helios>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<50462C35.6000400@windriver.com>
	<CAMKF1soNQdFWREGh5_BNmBdqgRNk9+Tri+zFR3fvjT_94pYWsA@mail.gmail.com>
	<1592942.MflME341bO@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 09:30:58 -0700
Message-ID: <CAMKF1spTF8GSpZ0bzoMr03s1xQSyQ-m=jsRNYQF6hTaMng6gWQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Fri, 07 Sep 2012 16:43:53 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 6, 2012 at 2:32 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>
> So I agree this is hard to do properly now and is going to be impossible to
> keep up with as time goes on, but where do you get this from?

read the links I posted in this thread earlier.


