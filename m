Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f171.google.com (mail-yk0-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 77F0E76FD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 12:20:31 +0000 (UTC)
Received: by ykek143 with SMTP id k143so41028424yke.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Sep 2015 05:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=d9LCctLDEYyUGMM/iUshLHbH3zwTyBkkH2pmlDxpazE=;
	b=mJ93xNk4tSptDh7RQGtDFBQu5R45rYYUCRNTOkE/WJncDip/IEhQ1vAngdkxd/JkOH
	rvjntHdKK3Rh1USP7oIahlmD6qRT7ut2zzufpU0sFftjywnDyTnc6CuYKYuvOkaloUae
	Cd2QKjkF26x8D7KlGTc0B+6VUFAC4xweYiQJX7iJaAOKDhuVLVf9IWkLUzRlt71YQnBb
	VyeGaoZHYQbffmQ4sADKljpD6PyP6b2/eqi0KI3qfdWvuHmKIO6pvwaVsczR9+S9l0sm
	Kw9VVjQTe3i0BgBWFKrA1718rMwu8QpIP/KgfKZLKmKhrsNGrtXFJmsj5vDPqRkQcCxv
	KqBg==
MIME-Version: 1.0
X-Received: by 10.170.169.66 with SMTP id l63mr9914189ykd.60.1441282831865;
	Thu, 03 Sep 2015 05:20:31 -0700 (PDT)
Received: by 10.129.34.212 with HTTP; Thu, 3 Sep 2015 05:20:31 -0700 (PDT)
In-Reply-To: <1441282288.24871.113.camel@linuxfoundation.org>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
Date: Thu, 3 Sep 2015 08:20:31 -0400
Message-ID: <CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Joe Slater <jslater@windriver.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 12:20:34 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 3, 2015 at 8:11 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2015-09-02 at 16:23 -0300, Otavio Salvador wrote:
>> On Wed, Sep 2, 2015 at 4:09 PM, Randy MacLeod
>> <randy.macleod@windriver.com> wrote:
>> > On 2015-09-02 11:55 AM, Otavio Salvador wrote:
>> >>
>> >> On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
>> >>>
>> >>> Implements ifup and ifdown.
>> >>>
>> >>> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
>> >>> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
>> >>>
>> >>> Signed-off-by: Joe Slater <jslater@windriver.com>
>> >>
>> >>
>> >> I think this belongs to meta-networking. Also, what this one provides
>> >> which is not provided by the busybox one?
>> >
>> > We're trying to make busybox optional for larger systems
>> > that want to only use the full-featured/bloated packages.
>> > It's not a large tax to carry busybox in a 50+ MB image but
>> > it would be nice to not require it.
>>
>> I see; I still think this belongs to meta-networking as it will allow
>> this to be done however won't add new recipes in core.
>>
>> If many people start to use this, we can move this to core.
>
> To put this another way, I think it is probably reasonable that we
> should be able to build an image from OE-Core with basic functionality
> like networking without busybox?

That's what I'd support. If everything you need for the functionality with busy
box is in oe-core, to me, it doesn't make sense to go outside core to get that
same functionality without busybox.

Cheers,

Bruce

>
> Cheers,
>
> Richard
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

