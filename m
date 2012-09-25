Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TGVaw-0001nA-8U
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Sep 2012 15:54:38 +0200
Received: by eeit10 with SMTP id t10so1738861eei.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2012 06:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=z2N59l7/0AnhGEiKjZ5bpY689+GhNllfRup5vEFrzS8=;
	b=CaQ/gfzHy5C8KoznKZ/e9Rl5ernCIBYnlqbhlMzTaicQNPpep8J98tjvQb0fWSqOUi
	/O1LymJsrM4zTqu03BmsWiKUqKbm6hcUVZqWWf4YD1Sm5RiY+KJzgWyBYhoNFp+tE702
	ZY0aL6Uq3VcxbVj98B3b3c8CT0jUs1/PvAnCoNjYbIa56uAcH9I/TOn8dpNPMa3uP48w
	ShNwnYUbG7qUZ69kY+vz+n+01wYWzwejjIqvfoaeFP8/khcHBUoksHCJWlhaUmxhNWiB
	0rMLVLdYgiLpLM4CrzdjS6idXLP8dI6XQTZ7WZK+G32yGa3qfBLY/X2u2wr28nm2jp8q
	gmKw==
Received: by 10.14.220.134 with SMTP id o6mr20240694eep.35.1348580509342; Tue,
	25 Sep 2012 06:41:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Tue, 25 Sep 2012 06:41:18 -0700 (PDT)
In-Reply-To: <50616B77.1030007@communistcode.co.uk>
References: <505C7402.4060604@communistcode.co.uk> <505C7F3A.7020400@intel.com>
	<505C8503.2040907@communistcode.co.uk>
	<CAMKF1spWUv8SFWnQ-_hKqw_+0NEK_Yq4-dhfyAnr-eTyMRemyg@mail.gmail.com>
	<50601BC1.9060706@communistcode.co.uk> <50601D62.8070408@intel.com>
	<50601FD9.4080009@communistcode.co.uk>
	<CAMKF1sqGGc+mE-0JpxznkC1KkbqMrVOzMqRiUtxX8fOR7FqwTQ@mail.gmail.com>
	<50616B77.1030007@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Sep 2012 06:41:18 -0700
Message-ID: <CAMKF1sqWTFmvWq8PbFohzWZ8-fPn1BMREdb7yryDJEsZf9U8SQ@mail.gmail.com>
To: ml@communistcode.co.uk
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: ld problems with relocated toolchain
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
X-List-Received-Date: Tue, 25 Sep 2012 13:54:38 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 25, 2012 at 1:29 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Ok, I passed the compiler and the linker the sysroot flag and it compiled
> successfully. Thank you everyone for all your help and I'll brush up on my
> compiling/linking knowledge!

Hmm if you installed toolchain in different prefix then it was built
on and then experience

<cross>-gcc hello.c not building thats a problem we have to fix in
relocatable SDK install or wherever
wasnt that the case ?


