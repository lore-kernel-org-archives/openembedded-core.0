Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sljzp-0004yM-Ab
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 19:01:09 +0200
Received: by eekd49 with SMTP id d49so2200789eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 09:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=V4SxKhDx86IeLGWxYZv+z6yMWG1eH/IC8eAxOixskas=;
	b=aoz/gWz12fLaBW62eeOy8E4n1gX/L0xVnPmBr2g73h7lBEouk15/x6pKTYn0Oja7sU
	p0K453gHyJ+cr9ed90lUzZOUgKXN+qe0zhibLllzTtG82y8we62fkHvzf1rVJEeACFab
	LkclLXzGHIJJVnQk7C1KuLFgqJS/a4MuS4gJ3miUNHuY/+HEQFCKl/AWh1lAJisS8qKU
	Oxaw7d2taf10vdmXQdO8d+vKwlfr9NpdiYKeVM4ZkfIqrkI98Hx9vhFqqCpVg6cAGoMT
	9vw+zkFgMPedjqjC2qn2y4jKBF63Rzvtx+YwxZzbwAW1WwRo2vpCwQ+U1+/HVOkFGDj/
	D0Eg==
Received: by 10.14.119.202 with SMTP id n50mr3341400eeh.33.1341247808483; Mon,
	02 Jul 2012 09:50:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 2 Jul 2012 09:49:38 -0700 (PDT)
In-Reply-To: <1341243322.23146.255.camel@ted>
References: <1341243322.23146.255.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 Jul 2012 09:49:38 -0700
Message-ID: <CAMKF1soaYn3NLakZR-iMU0SP=P+nZpU0pb0RCdO+W1EMv5iorA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: When configure fails, dump the config.log files the logs
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
X-List-Received-Date: Mon, 02 Jul 2012 17:01:09 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 2, 2012 at 8:35 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> When configure fails, it usually says "see config.log" yet nobody ever shares
> the config.log file meaning the person trying to help invariably has to ask
> for more information.
>
> This patch dumps all the config.log files into the main bitbake log files when
> configure fails, meaning all the information is present to help someone debug
> such failures. It does make the log rather larger but this is preferable to
> not having enough information in most cases.

thats really a good improvement.


