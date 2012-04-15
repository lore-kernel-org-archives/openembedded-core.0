Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SJZFF-0007oo-9y
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 01:52:37 +0200
Received: by lbjn8 with SMTP id n8so171644lbj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Apr 2012 16:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=GE1+JDp8wHj2Rnzr6vog4AwF283Sobq+KWOG07aYFqI=;
	b=YZkQbXlzghDQJlxt9BFqwjv3i0TZML+EscolE29PbuYjCnYWdd1ZKQZWtd7vsYV7lh
	yxXLAMYDRLjSrRKc+VK4FLHd7vqeoIvz3g4CAtJOo8ocs9qcA8iP3e4aeU7YCEQB83oj
	uA0tgfvwfZTfktgh+lxa+znL1/iVO2M3Mgu8ND/MPYPtFfP/S2z7AmaeOlDo5egEA7im
	+6Ffb6771DNgsF+WlVE2/L0aau91dsEPhPhn3NbPuVKQvumt0wEaoniUkVN4ykMTn38f
	cSyrrxzGxfon0p01z1D0aDjnAUYM1iXaujpsOGTLv5bCRTCsQpKZ4R5J4/vdwgF3hcxj
	mbOw==
Received: by 10.112.83.105 with SMTP id p9mr4276919lby.43.1334533392180; Sun,
	15 Apr 2012 16:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sun, 15 Apr 2012 16:42:41 -0700 (PDT)
In-Reply-To: <1334509553.16992.34.camel@ted>
References: <1334509553.16992.34.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Apr 2012 16:42:41 -0700
Message-ID: <CAMKF1srUybfieu7yw8NGy5b9myojC=KZXRuue7xB0ELZObgHHQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-configure-common.inc: Stop gcc looking at build system paths
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
X-List-Received-Date: Sun, 15 Apr 2012 23:52:37 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 15, 2012 at 10:05 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> gcc_cv_collect2_libs

is it the /usr/lib/cmplrs/cc2.11 access issue ?
in that case the fix it fine. However if its something in LTO
then we need to dig deeper


