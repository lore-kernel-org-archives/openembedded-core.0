Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RAnvt-0007bX-MG
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 21:12:09 +0200
Received: by yxj17 with SMTP id 17so3761149yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=I1oe3om0YvyduQR5PiZ1BagnUabQaORw3pZ4bCJJkU0=;
	b=BUPLt3ZtZyCjyWlYQy1+pPQhq6OtERUTDIO6HhjF2fCRIlJkXESRL9PFK07+4oFdWY
	yc6ARUU+/1rD3qAyy1WsYeXUS1qaziUvMROr2WJT7EnEdszfRHiYADIHewkN6aHfdxFy
	aW63MfeTkq+C++PovGdLHAe2eIfpQwpbAtHYQ=
Received: by 10.101.175.1 with SMTP id c1mr291722anp.27.1317668795514;
	Mon, 03 Oct 2011 12:06:35 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id 15sm873403ans.26.2011.10.03.12.06.33
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 12:06:34 -0700 (PDT)
Message-ID: <4E8A07B8.8090009@gmail.com>
Date: Mon, 03 Oct 2011 12:06:32 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317297541.12332.85.camel@ted>
In-Reply-To: <1317297541.12332.85.camel@ted>
Subject: Re: help2man
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
X-List-Received-Date: Mon, 03 Oct 2011 19:12:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 9/29/2011 4:58 AM, Richard Purdie wrote:
> The more I look at and think about help2man, the more it looks like
> something we just shouldn't need/use.
>
> In summary, it runs a binary and captures its --help output. This rules
> it out from being useful in most cross compiling scenarios, i.e. all
> target packages.

right. This should be disabled for cross builds. May be it should be
disabled in autotools bbclass do_configure itself.

>
> In the -native/-cross cases, we don't really care about man pages.
>
> I'm therefore thinking we should really just drop the dependency and
> symlink help2man to /bin/false. The missing script in autotools should
> then just silently touch the man page files instead of regenerating
> them.
>
> I tried to figure out which recipes actually use help2man:
>
> $ grep HELP2MAN * -r --exclude=Makefile.in 2>  /dev/null | grep -v missing
>
> and against a core-image-sato this gave:
>
> libtool
> libtasn1
> gettext
> automake
> autoconf
> flex
> bison
> m4
>
> which isn't that many recipes to go and beat up manually if necessary.
> It certainly doesn't warrant a global include in autotools.bbclass IMO.
>
> Cheers,
>
> Richard
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



