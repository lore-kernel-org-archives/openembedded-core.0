Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1THF4B-0008CT-VC
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 16:27:52 +0200
Received: by eeit10 with SMTP id t10so824719eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 07:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=6IWheI3lTUfmzu93zTVxabZwoix3IJw4y9f7XRIqItY=;
	b=kJXvtdajatEnd072kzKsbAfi6jNg6iMuDUiEAUJrKaNoyRGO9zWcJzXsaHY8RtV901
	+7ZVxfsAQd3Y0USSkBhi+yIEdstxWJGaWIFlsR2So1719pO9us71r6iZHSRTIY51DbO8
	vfwiKSS+kSpZVnVqqCzTsXmFgIogs7OPLLnLH7GqZERUG6yDWxARLcvuXt6Vhsg1sHTh
	SFxYsQaEDjQnsnN8hYQyBVcFva9I+z4rdAZQ2h9hwdwj3Dn3oAJ2osvzT5rdS93Fw7ci
	501m7KZaje7+chvFHskmMx+Xct0YQq5SB5H85KDWjV48n/YD6fhgK3W+pOmfv6aGR7Qa
	Wn5A==
Received: by 10.14.202.131 with SMTP id d3mr6100718eeo.32.1348755300278; Thu,
	27 Sep 2012 07:15:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Thu, 27 Sep 2012 07:14:29 -0700 (PDT)
In-Reply-To: <1348667991.8662.108.camel@ted>
References: <1348530910-9917-1-git-send-email-raj.khem@gmail.com>
	<1348560878.8662.29.camel@ted>
	<CAMKF1srWM46Jofrjd8xxX22waY1b7O3a0Nwr-Av+B_mid9fSfw@mail.gmail.com>
	<1348667991.8662.108.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Sep 2012 07:14:29 -0700
Message-ID: <CAMKF1sqFe+8xmEg6r+g9+2xLo0TYyfGQp0aYOCT+kp-WHE03+A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] jpeg-native: Do not use libtool-cross for native recipe
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
X-List-Received-Date: Thu, 27 Sep 2012 14:27:52 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 26, 2012 at 6:59 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2012-09-25 at 06:27 -0700, Khem Raj wrote:
>> On Tue, Sep 25, 2012 at 1:14 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > This wallpapers over cracks. Why is libtool-native/libtool-cross broken?
>> > Shouldn't we fix whatever is breaking libtool?
>> >
>>
>> it is not broken. But we were ending up using cross-libtool for native
>> recipe that does not seem right.
>
> Looking at your original error message, it says:
>
>  /work/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-linux-libtool
>
> which is libtool-native. I appreciate that the OEMAKE line to use the
> cross version is wrong but it looks like it still manages to find the
> native libtool and that it isn't working.

hmmm I tried and it worked fine when libtool-cross was staged. I guess
my problem was
that it was trying to find native sed in native sysroot. I cant
reproduce it. But I guess
the patch still makes sense. I can send it with commit message changed
if you are ok with that

>
> Cheers,
>
> Richard
>
>


