Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id EE8CE6162A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:06:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BDKB5e001706; Wed, 11 Sep 2013 14:20:11 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gaEeWM7QQo31; Wed, 11 Sep 2013 14:20:11 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8BDK8pd001643
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 11 Sep 2013 14:20:10 +0100
Message-ID: <1378904780.3484.183.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Wed, 11 Sep 2013 14:06:20 +0100
In-Reply-To: <CAP71Wjw7-7FX39-baCq+opPry1rpV9UqNDjX8MZRrJ6+qAKtSw@mail.gmail.com>
References: <CAP71Wjynkd=CGry-YKvEetsuGvoXmhwhVAF1rXuOuo-nh7V2CQ@mail.gmail.com>
	<1378900852.3484.179.camel@ted>
	<CAP71Wjw7-7FX39-baCq+opPry1rpV9UqNDjX8MZRrJ6+qAKtSw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Linaro Dev <linaro-dev@lists.linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: OE gcc-cross with builtin sysroot, BUG?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2013 13:06:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-09-11 at 15:01 +0200, Nicolas Dechesne wrote:
> 
> On Wed, Sep 11, 2013 at 2:00 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:

>         Not really, its actually intentionally designed like this
>         since its
>         pointless rebuilding gcc-cross multiple time just because we
>         want to use
>         it with a different sysroot. We therefore just pass in the
>         arguments to
>         the compiler to ensure it uses the right one. If you remove
>         them, you
>         hit the problems you describe.
>         
>         We should probably compile in a bogus sysroot so it never
>         works and
>         makes this kind of issue more visible.
> 
> hmm. ok. i see. it would certainly help to have a better 'error'
> message... i suppose that not having a builtin sysroot at all, would
> be an even bigger problem as it would default to /usr/include... 
> 
> 
Right, that would be even worse than a poisoned one...

Cheers,

Richard
> 



