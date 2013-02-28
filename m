Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UAy34-0003sU-Nh
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Feb 2013 08:37:09 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so301728obq.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ZwcaqvNF+VwhOh8yidenaAhAt14getJZwP0ijlhN0to=;
	b=KGT+HJ9blHDGTo1SSsra87NU/csHYO762bZ7oRh4TG2wGYRDYkRY8wLmgJw+td3Pqu
	ppYB32YNVSzGWvgpxJrhpMZwT1Amt7kJKv3HB8bDfzVs5vYY6QAzIcWNmJrj5+Z5xYI3
	A7yqpNcgWTLl9cEaRR9BEbEBzEHY+sp3KfYyjdIlJ2ZdZZmUJ23wTMTUsG7fYyOt/ODp
	PIhXb2G98XDk+fO2nab6dk/7mR5QOLBcJ2r3qjVFZWKQ0YgQ2oepz7a85pz4mIFOApyq
	b9nY6B1RNogVtnxK5GYR8RfsJcYXO+gUpYEUnDIdtSdgMg4hNl8/sm7lpo+Ay5AvNHLd
	EZfw==
MIME-Version: 1.0
X-Received: by 10.182.202.73 with SMTP id kg9mr695838obc.95.1362036040556;
	Wed, 27 Feb 2013 23:20:40 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Wed, 27 Feb 2013 23:20:40 -0800 (PST)
In-Reply-To: <1361990771.1809.16.camel@rrMBP>
References: <CAGiJk9drhuVo1AfCsHEc3jbevtzaYcONQwHQ2qfE=HuJjUCbSw@mail.gmail.com>
	<CAJTo0Lbnt78ssmdTmTh2CoFfDMHq_SpoV9qYEX+2kPod4EW9Jg@mail.gmail.com>
	<1361990771.1809.16.camel@rrMBP>
Date: Thu, 28 Feb 2013 08:20:40 +0100
Message-ID: <CAGiJk9cKru6BD3oQmfb+J1WE-f3-K+pvbdi2HkjKS3-3_4=ciw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gst-plugins-bad and EXTRA_OECONF
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
X-List-Received-Date: Thu, 28 Feb 2013 07:37:14 -0000
Content-Type: text/plain; charset=UTF-8

2013/2/27 Koen Kooi <koen@dominion.thruhere.net>:
> On Wed, 2013-02-27 at 16:09 +0000, Burton, Ross wrote:
>> On 26 February 2013 08:57, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>> > This is caused by sdl-config from my buildhost, though gst-plugins-bad
>> > has EXTRA_OECONF += "... --disable-sdl ... --disable-orc"
>>
>> I tried replicating by bitbaking libsdl and then gst-plugins-bad, but
>> it still disabled the SDL plugins.  What version of oe-core are you
>> using, and do you have any other layers that could be involved?
>
> I know angstrom overrides the OE-core recipes to enable or and other
> plugins:
>
> [koen@rrMBP meta-angstrom]$ cat
> recipes-tweaks/gstreamer/gst-plugins-bad_0.10.23.bbappend
> PRINC := "${@int(PRINC) + 2}"
> DEPENDS += "orc orc-native"
> EXTRA_OECONF =  "--disable-directfb --disable-examples --disable-vdpau
> --disable-apexsink --enable-experimental --enable-orc"
>

Seems like I missed the missing "--disable-sdl",
should I send a patch that adds libsdl to the DEPENDS of this
.bbappend? Or would you prefer a "--disable-sdl" here?

This issue was a bit irritating, since I built the same image for some
time now and suddenly it breaks without any changes in the related .bb
or .bbappend...


-- 
Regards
Samuel


