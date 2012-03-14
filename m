Received: from mail-wi0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1S7o8Y-0005iY-6J
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 14:21:06 +0100
Received: by wibhm17 with SMTP id hm17so5919615wib.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=cK0s9edbdvEaU4YTaEzJyS7oMC5jJ0eTdbsNPlhTB5Y=;
	b=uASGGP2oofJgmSno2z9tzRfBrpCXNkL766FgQDT2H9Aq9c5hoPFCDKwx4PD0QjjkKO
	g1DwgS/Z63zZsYff6GIYFzVdulLFsrsLDDTd69v1lg67rqMTirpOZVCyizb6HZWBk1qS
	4B7ia55dzyTccZpI616ixzjqtxKwg1k/0tntowcNS2E+DmyZkv9xGncJy+asZ5ww6lEn
	TIKx/ApQzFZmZUDKNpc8CkKpE4E7zznWsZ2nehPH8TV7TaMH1A8aoNbpbKCi1/c6yP3a
	WHa2MxwFfl6lfgYJNDN/fKWhfC9TzyeC3KGBFQEUqLFRbSXq2XJT3E7ekrYMWrqdqy7H
	g1Pg==
MIME-Version: 1.0
Received: by 10.180.88.164 with SMTP id bh4mr16757864wib.22.1331730740795;
	Wed, 14 Mar 2012 06:12:20 -0700 (PDT)
Received: by 10.216.28.196 with HTTP; Wed, 14 Mar 2012 06:12:20 -0700 (PDT)
In-Reply-To: <1464522.1Gj9RCK92m@helios>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<2970280.1QavEf7R15@helios>
	<CADkTA4OdMwB4gPNaYF7paaY9TLZV5YuQgqAVXzK4wT1pCxtrCw@mail.gmail.com>
	<1464522.1Gj9RCK92m@helios>
Date: Wed, 14 Mar 2012 09:12:20 -0400
Message-ID: <CADkTA4OjJgjGHVPB-qCFcrVyUXBoBApfmK+NCiAa8t9tH=ce9w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 13:21:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 14, 2012 at 9:03 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Wednesday 14 March 2012 08:59:34 Bruce Ashfield wrote:
>> You could audit the constructed .config as well, since that's the final word
>> on whether it actually makes it into the kernel build, but also not really
>> required here.
>
> This is what I wanted to do, but I'm assuming the config construction happens
> far too late to add the dependency.

Hmm. probably, I admit to not looking too deeply while trying to get enough
coffee into my system to properly think :)

Cheers,

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


