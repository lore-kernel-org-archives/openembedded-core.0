Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrRVJ-0007rT-6M
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 12:29:13 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 03:17:51 -0700
Received: by qcmv28 with SMTP id v28so761811qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 03:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=zTEXidXrdJvd2qxdsvO6WjK7BsHE33PQzB0usd2b2a4=;
	b=JPpcg/xOrfjbb3lg1rPfnDy0IVqIkbYo7HVZIzBINFyLvkceKcZRcKKwzmTpcOnSbK
	TlKVrLIiU1+bv5iwYFByu+3OzP9jaIpreXcoKJ2kT3JvtwxGiBkT062Nozicy/wa4IUw
	9jXMX/Mj/XoaHgXvA8PysxbFgqVe9TcwHI0J7MxMmRAVN6BPQ3ivnBZtejq8QNSZzjq7
	B9ycu4yHqTaMIqIQlDN/jS9T5vmKb7DIo0ad8soeayOZFJ5dBgpQ4vt/gNYdzy4tw7uG
	1+UYsXcFMhh1l82uI9WR+GkiLj8mAtcrt2nV+irFyhDDSZdy9ImSg3+Ud4owiwd/ZzvX
	A9yg==
Received: by 10.224.177.1 with SMTP id bg1mr4837029qab.68.1342606670347; Wed,
	18 Jul 2012 03:17:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 03:17:29 -0700 (PDT)
In-Reply-To: <1342606005.30680.17.camel@ted>
References: <1342606005.30680.17.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 11:17:29 +0100
Message-ID: <CAJTo0LbkkXkJH-mbxwqKK7KM1PWDdF4mD+K8omTF4SQ9_WDogQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmBn4hyRoQ48m8spf3JW1qGatc188VWnQaFfmiiSB7hZAW9P/sfO4RFGRObtgzA43A4+qSU
Cc: bitbake-devel <bitbake-devel@lists.openembedded.org>
Subject: Re: PLEASE READ: Major change landing shortly (python whitespace)
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
X-List-Received-Date: Wed, 18 Jul 2012 10:29:13 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2012 11:06, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I put a proposal to the TSC, that we have bitbake warn/error whenever it
> finds tab characters in any python function. The advantage of this is
> that we give the user a clear definitive error. The downside is that
> we'll have to go through all the metadata and scrub it for the problem.

Have you ran that warning over oe-core to check that there are not any
legitimate uses of \t, not for indentation but inside strings?  I
can't think of any realistic use but you never know (construct a
Makefile in a python function?).

Ross


