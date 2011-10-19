Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1RGLYJ-0008MC-JY
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 04:06:43 +0200
Received: by wwf10 with SMTP id 10so1482043wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 19:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=uE6faGCBANHB81L7fTbTkOQu6hzKsqxE4Gqv/hIutVY=;
	b=a6ipvrEKXFHIDYcbPrhkED6uc8IO6X2nPkxVHyGsirWaIIiGOTSvdnVvNihaPX8p73
	MrngoBaRR4ltYaWVrECIJbGwH6StVvisLZrche78fKkyRICUiLvNLLkdfdyOzJiH2eub
	dlfRSvpgmWWgEz7/B0hetFGziyx8KY9imDlek=
MIME-Version: 1.0
Received: by 10.223.5.3 with SMTP id 3mr7903098fat.4.1318989653196; Tue, 18
	Oct 2011 19:00:53 -0700 (PDT)
Received: by 10.152.12.136 with HTTP; Tue, 18 Oct 2011 19:00:53 -0700 (PDT)
In-Reply-To: <1318061333.8533.58.camel@ted>
References: <D3F85958-4E8C-4D2C-B8BD-C7AF341FAF47@dominion.thruhere.net>
	<1318061333.8533.58.camel@ted>
Date: Tue, 18 Oct 2011 21:00:53 -0500
Message-ID: <CAD=GYpbYm8=N6aPJV4UxKoi8QeG9Xbv=GSsh4+W9G44ZSvc=Sg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bitbake dependency failure with git fetcher
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
X-List-Received-Date: Wed, 19 Oct 2011 02:06:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Richard,

On Sat, Oct 8, 2011 at 3:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-10-08 at 01:29 +0200, Koen Kooi wrote:
>> Everytime openssl and a git recipe get changed at the same time, I end
>> up with:
>>
>> | /angstrom/build/tmp-angstrom_2010_x-eglibc/sysroots/x86_64-linux/usr/bin/git.real: error while loading shared libraries: libcrypto.so.1.0.0: cannot open shared object file: No such file or directory
>>
>> Why is bitbake not resolving the git-native -> openssl-native dep
>> before invoking the git fetcher?
>
> I suspect you're using rm_work?

How does using rm_work result in this problem?

Thanks,
Joel


