Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <swaplinker@gmail.com>) id 1RNYVI-0000hN-Eh
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 00:21:24 +0100
Received: by vcbfl17 with SMTP id fl17so1602083vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 15:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=V7qCRJD6kRjLj+gnDrOpQPWwAtkTA85B+XrTeTwjHXM=;
	b=BMNrQxdvqD8IKalsQYZXt7L1MVPej4rfCKRhPHO1iRWqs6CZxcpRACf3pVOkwZq7Bg
	awmsOuNrP4fdXcQxA2yRpEuXFIZfFufl/qwUlDRE+OzYsR45buHszZb446+UMyZ55EEP
	pexFKsXNv8w2ubW+9pkV/PsD166ZVizPQEisM=
Received: by 10.52.114.232 with SMTP id jj8mr28714510vdb.94.1320707709205;
	Mon, 07 Nov 2011 15:15:09 -0800 (PST)
MIME-Version: 1.0
Sender: swaplinker@gmail.com
Received: by 10.52.106.198 with HTTP; Mon, 7 Nov 2011 15:14:48 -0800 (PST)
In-Reply-To: <CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
References: <1319505532-23199-1-git-send-email-julian.pidancet@gmail.com>
	<CAEsOVNen8kUVPge_jZDq5LjhC7BAG0YKx=wxO+ZysNGAd_KwQg@mail.gmail.com>
From: Julian Pidancet <julian.pidancet@gmail.com>
Date: Mon, 7 Nov 2011 23:14:48 +0000
X-Google-Sender-Auth: zlUvYOAIGJvSVJ7P1PqSX77dJwY
Message-ID: <CAKZ=5EVjCrBdH2NBrVD_4UD52h6ZG=p6m-QS5L9K8xfpUcUr1g@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Introduce biarch DISTRO_FEATURE
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
X-List-Received-Date: Mon, 07 Nov 2011 23:21:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 26, 2011 at 3:09 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Mon, Oct 24, 2011 at 8:18 PM, Julian Pidancet
> <julian.pidancet@gmail.com> wrote:
>> This patch introduces a distro feature which enables gcc to produce
>> both 32bit and 64bit code, and enables binutils to operate on both
>> 32bit and 64bit binaries. It differs from multilib toolchains in
>> that it does not require to compile a version of the libc for each
>> architecture variant. However, the code produced for the secondary
>> architecture will not be linkable against the libc.
>>
>> This patch only works with x86 and x86_64 architectures, but can
>> probably be extended to support other architectures as well.
>>
>> One use-case would be when one wants to compile a system which runs
>> 32bit userspace applications with a 64bit kernel without having to
>> deal with two separate libc.
>
> What happens with the native gcc on the root file system. And what
> about meta-toolchain? Any effect?
>

Hi Matthew, sorry for the late answer.

I'm affraid I don't quite see what you mean by "the native gcc on the
root file system". Are you refering to the version of GCC present on
the build machine and built by OE ? Or are you refering instead about
a potential version of GCC running on the target ?

This patch should only make gcc-cross, and gcc running on the target
"biarch". It would also probably make sense to build a biarch GCC in
the meta-toolchain case.

To be honest, I have not really considered the meta-toolchain case as
I've never used it before and not quite sure how it works.

I can respin a patch to handle the meta-toolchain case. But in the
mean-time, it would be nice if I could get an opinion on wether this
"biarch" feature is a good idea or not, or, if not, maybe some
suggestions about how to address this specific 32bit/64bit use-case
differently.

-- 
Julian


