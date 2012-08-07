Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SyaBV-0008IJ-Ow
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 05:10:17 +0200
Received: by eekb57 with SMTP id b57so1074776eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 19:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RaS5+0Ne8FCRKX/ls6HHcftGPf2rTB2tsXFR6ReObjg=;
	b=YnLj7JHxEJDbZC49S8mRUewPByyW3/BxD5lYCM4wAiMs85tlHmHpLV5drKp13Ur4H9
	kosjytSNzuKHf81+HBe4fEqrzxBQv2pYp6IXAeCHtAZAT4tnQERIhwQvu3vVsoVhLdzE
	MMuTUHQU0ulqYMwn/OfGehP2jDMgNpvOV39ki/Py4iCGEs603Pi46Kb/6Kbi/vuhUDVp
	8XxqsqJdppnGUvCS6shPF3jQtt8II7Qhg9k2jI/TDrBhPbn7cu+zQTpw6sdELw3UL42v
	cV8s+DZjD+18ngzdwEpkWzTtfFqZQMe+4PtAMzruepjIu106FvJoOcekdX8+lDHqHWcn
	4rZg==
Received: by 10.14.219.198 with SMTP id m46mr15688252eep.18.1344308312555;
	Mon, 06 Aug 2012 19:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.97.141 with HTTP; Mon, 6 Aug 2012 19:58:02 -0700 (PDT)
In-Reply-To: <20120806141351.8D649203FD8@gemini.denx.de>
References: <1343997523-4117-1-git-send-email-radu.moisan@intel.com>
	<20120803161915.399D1203B3D@gemini.denx.de>
	<501F63FF.1070401@intel.com>
	<20120806074542.A63C0203FD8@gemini.denx.de>
	<501FC96A.8000400@intel.com>
	<20120806134641.E98B3203FD8@gemini.denx.de>
	<501FD013.5040000@intel.com>
	<20120806141351.8D649203FD8@gemini.denx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Aug 2012 19:58:02 -0700
Message-ID: <CAMKF1sr8GKMJ3_UeW9+Cw-guOk=RO_t+XX8vxGawg4=B81TSDA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] u-boot: Upgrade to upstream stable 2012.07
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
X-List-Received-Date: Tue, 07 Aug 2012 03:10:17 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 6, 2012 at 7:13 AM, Wolfgang Denk <wd@denx.de> wrote:
> Dear Radu,
>
> In message <501FD013.5040000@intel.com> you wrote:
>>
>> CROSS_COMPILE is set in EXTRA_OEMAKE which is used in oe-runmake()
>> within do_compile()
>> Running devshell is achieved in do_devshell() which is run after
>> do_patch() but before do_compile(), that's why in devshell CROSS_COMPILE
>> is not (yet) set.
> But CROSS_COMPILE _is_ set (and apparently has the value
> "i386-linux-".
>
> The problem is that PATH is not set such that it contains any such
> file as i386-linux-gcc.
>
>
> Best regards,
>
> Wolfgang Denk
>
> --
> DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
> "Beware of bugs in the above code; I have only proved it correct, not
> tried it."                                             - Donald Knuth
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


Hi Wolfgang

If the fix proposed here
http://lists.denx.de/pipermail/u-boot/2012-August/129828.html is
accepted into u-boot
then we wont need these glues.


