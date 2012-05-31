Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SaEWz-00066G-LF
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 01:11:49 +0200
Received: by eekd49 with SMTP id d49so681680eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2012 16:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=C0jNS1bchYGVBy/BuUzvEjIgj16Y8Osre5bsl8hzAUs=;
	b=Vjaqh6Db6wPNksfVtHmVaXPIn2QvlVBVeRzFxCwr7EBb34sZ1qrvBSdreb9DQD8SG3
	zMfmQVTzqfeU34UjkUEKGkJPLzShlYirHA1RLOHKB6G7/ozGC38vAU9DMeb/o40riF/C
	rTMhYxwKV7QMhV8oSSdCHkyyL4kFCclnj8G3ImqAreU/iPchcEuiSdvh6oh/2R2zPkE8
	YiLz2WF0faFHYtqLE0KukzoPN4dcrOOTtJkdOzgx2VhuALM9MfOLEN1x0J0pf2nfpes9
	+goglIQRnjUwrMsW2Pq3ht9osRpB3+fraDBxPTd0Vitxfel2cK+AUp4bv9nxdhocrPZa
	Xuag==
Received: by 10.14.53.76 with SMTP id f52mr287673eec.79.1338505289288; Thu, 31
	May 2012 16:01:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Thu, 31 May 2012 16:00:59 -0700 (PDT)
In-Reply-To: <CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
References: <CAOHjBZsptjefvQA3od1HV4s_fVcoHidWs5qUm-2A5+Fr9ZrRLg@mail.gmail.com>
	<CAMKF1spunqV3__K7_jEt5oQwg=J0v+TwZSUtGOv=DeipCPkzSA@mail.gmail.com>
	<CAOHjBZv9jC9pVwxS9CCjvY0wFo8_9sOaFeUQwMxPEuF8EJDuiA@mail.gmail.com>
	<CAOHjBZvGY9BWkyS+9V4OtGFcQpCC2SdzKwG9pQ0wq_oeqU=uTw@mail.gmail.com>
	<CAMKF1so8aA=s7wfo9k9wGNSwyuGYXmd5Ec9x=5Bp0YJbaiJoFA@mail.gmail.com>
	<CAOHjBZvZmXugpmxypMamZbm1LYdOqTAp4Z+1CBPn1DyohjO3Yw@mail.gmail.com>
	<4FC7818E.3030704@mlbassoc.com>
	<CAOHjBZsD06ABMP5VRRcmXd-8jiF7VDD=UJUrswPJyGDqObPV2Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2012 16:00:59 -0700
Message-ID: <CAMKF1soREavpCfcGKqZM_hQwNVXydjzKg3qHRjTzJbP9Y-N5hg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: target rpm build failure
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
X-List-Received-Date: Thu, 31 May 2012 23:11:49 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 31, 2012 at 7:47 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Have new suggestions?

I found a bit of time and fixed rpm compilation on uclibc. Its only
compiling though I don't know if it will run on target. Try it out.
The patch is here

http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/misc&id=3b7ab8bbaca0c7ce122e897a11370dd215b0eddd

This should get you going. Please test it out and I would prefer if you can
also try it out on target and see if it really runs too.

-Khem


