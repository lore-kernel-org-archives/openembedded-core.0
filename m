Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RUQFH-0004iw-AJ
	for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 22:57:15 +0100
Received: by faat2 with SMTP id t2so3882804faa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Nov 2011 13:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=BX0S+uUfUH4WlSzM4Uko0oKgVAvPcZrQR2ls6I7/aLc=;
	b=Exaa+IShQhMsouSSmiNjqD68fKBGfbnMpz/IndHnM9XGn+QWdeDZmoqXiDz+jpL0c/
	jwpPWTAePQYwNBobF8BFXCLbtKvMFMtrGJDN0H1sKB/Gxw6V40yS3aAqpCNvuTNob7eM
	KpYNVxMFCmrdM0fu4Yq1+FIz15cXmGvQs6CZE=
Received: by 10.152.105.226 with SMTP id gp2mr23657741lab.28.1322344239048;
	Sat, 26 Nov 2011 13:50:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Sat, 26 Nov 2011 13:50:08 -0800 (PST)
In-Reply-To: <1322302567.25382.6.camel@ted>
References: <1322233577.22654.0.camel@ted>
	<CAMKF1sqynERGyJ_1AGVkqjvEwswoC1w6BuEVJyuKiX=HMmMzhA@mail.gmail.com>
	<1322302567.25382.6.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 26 Nov 2011 13:50:08 -0800
Message-ID: <CAMKF1sr93K9y0=eLh_TFdhXai3FyV1aG44JGx625=EV1F_2oxg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript-native: Ensure the sys/time/h fix is applied for native builds
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
X-List-Received-Date: Sat, 26 Nov 2011 21:57:15 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Nov 26, 2011 at 2:16 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Fri, 2011-11-25 at 18:39 -0800, Khem Raj wrote:
>> On Fri, Nov 25, 2011 at 7:06 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > On my system, the sys/time.h header is in a subdir off /usr/include
>> > which causes a build failure. Apply the target CFLAGS fix to native
>> > builds as well to address this.
>>
>> hmmm I thought CFLAGS would be automtically translated with
>> BBCLASSEXTEND = "native"
>
> For native recipes, CFLAGS is replaced by BUILD_CFLAGS...

yes I see. A little niggle I was thinking of is that at present for a
target recipe if something gets changed in CFLAGS or TARGET_CFLAGS
that makes to the compile phase as combined CFLAGS

for native we rewrite CFLAGS = BUILD_CFLAGS

So either CFLAGS += BUILD_FLAGS for native CFLAGS += TARGET_CFLAGS
will make it consistent or just override CFLAGS with BUILD_CFLAGS or
TARGET_CFLAGS depending on recipe type



>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


