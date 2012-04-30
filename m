Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOtZl-0001Y4-8a
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 18:35:49 +0200
Received: by lagw12 with SMTP id w12so1937910lag.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 09:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=qGrhQbc09CTOUvbKMx+PKSHwRMWoA+G4j02Ey2kPJKU=;
	b=RgLL2o6VBlJB8HNyYMUV8U9yyUS4SrQgTb4VBu50XKdJzGt5UGEdH479R8mizfjYpN
	CCSvzrYcuz8C80SNPmqeVg6Z1VFxgrDYdsEwoCjPOowYIAHdf4gNt2y9fORI8UdDT7VS
	GRHRtNjX3HIQQygCHROm5sEyfDnifccXibckPj9AHi/olEkImEid41z3qBkumvOmjma2
	Apv9EEmDtsP1urjGEc9l02jWeRW3kSzajcGwmpIzfM2Cx6jpjEnOYx+XCHqKPYl9A0Gm
	xpvOlj4XLIwKlbNzk6Y7akbyD7wIWz2BgUyRFzuyFgvtmvkLqjM9PK+tJVp6T9SeADyH
	Ng/w==
Received: by 10.152.133.144 with SMTP id pc16mr20657396lab.0.1335803167140;
	Mon, 30 Apr 2012 09:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Mon, 30 Apr 2012 09:25:36 -0700 (PDT)
In-Reply-To: <1335800393.7415.26.camel@ted>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
	<1335796919.7415.20.camel@ted>
	<CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
	<1335797635.7415.22.camel@ted>
	<CAMKF1sofwSqoCOeaLAb9fPZ7HMQH49OsCZ37wYLJkGz_doCkEw@mail.gmail.com>
	<1335800393.7415.26.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2012 09:25:36 -0700
Message-ID: <CAMKF1sryCSAUMCt-VNu++JTmqNaiehzDqiYSH2oayjOOz3LjHA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Mon, 30 Apr 2012 16:35:49 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 30, 2012 at 8:39 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-04-30 at 07:59 -0700, Khem Raj wrote:
>> On Mon, Apr 30, 2012 at 7:53 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> >> hmmm. Whats the error ?
>> >
>> > http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/42/steps/shell_24/logs/stdio
>>
>> that should not happen. Its seems to be issue in eglibc option group
>> handling somehow its asking for regexp which should be isolated in
>> option groups
>>
>> Did this work fine with 4.6 ?
>
> Yes, it worked fine with 4.7 too. Only when we changed eglibc 2.13 ->
> 2.15 did it show up.

ah definitely a eglibc config issue here. I will take a look at it.


