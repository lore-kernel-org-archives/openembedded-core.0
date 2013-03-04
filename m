Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UCbs6-0004f2-D0
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 21:20:30 +0100
Received: by mail-ie0-f175.google.com with SMTP id c12so6729072ieb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 12:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=vz9iYGpFDOZQi/bRFVleolz6PN/IvJl6wR4oNidwcTs=;
	b=AMHYxBApnslcKGqRD2P0vdF1XsKeZLkzoA3SfI7nSSikE4mx7n1rB2iwdynkLCZWMI
	S40KKxIs2Hm8BLl7FS02OZrAA7Q9orDqquNnn1cUf2X6vqozL0nV1BpMjeOkO/21IGsv
	xNOeYaZm0PcCpRcHCZBZKPdbRJPzNv61ujuUGHkMVOjidNV1EpyWy19SBRzc6sBvwGEl
	Uq8AWcuIE9EGZ6VfwIRr+ySo3funBoBzXPjtzZntvrdcSRif8A5UAAfKeai3vaSazcCe
	UkCJZbr6HFcy0gkEf5VRbt0JSGk74sKfDxyUgeCiJeoIQwmQ6rw6nqzR3IhA/OIdiayY
	Mcew==
X-Received: by 10.50.17.131 with SMTP id o3mr3671840igd.112.1362427441666;
	Mon, 04 Mar 2013 12:04:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.74.163 with HTTP; Mon, 4 Mar 2013 12:03:31 -0800 (PST)
In-Reply-To: <1362330514.4325.30.camel@ted>
References: <ly628a8z00.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAMKF1sp7G1S-B5N-HR-2P_PEhkmeJnjDtskRe6EcubxiHah=nQ@mail.gmail.com>
	<1362330514.4325.30.camel@ted>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Mar 2013 12:03:31 -0800
Message-ID: <CAMKF1sr=v5uKWLsYHmB9oY8gaP_UBDK4ktx+UquKVpDjuzk6cQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: libgcc_s.so not stripped
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
X-List-Received-Date: Mon, 04 Mar 2013 20:20:30 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 3, 2013 at 9:08 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2012-08-22 at 13:25 -0700, Khem Raj wrote:
>> On Wed, Aug 22, 2012 at 1:15 PM, Enrico Scholz
>> <enrico.scholz@sigma-chemnitz.de> wrote:
>> >
>> > I just noticed that libgcc_s.so.1 is not stripped in the .ipk.  Is
>> > there any reason to keep the debug symbols?  Uncompressed, this makes a
>> > difference of more than 1 MB.
>>
>> I dont see a reason to have debug info there. Symbol table probably
>> should be left in.

yes as long as symbol table is left intact it should work fine.

>
> I noticed this when clearing out old emails and I've just posted a patch
> for it.
>
> Worryingly, there are other non-executables in the lib directories which
> aren't getting stripped. I've opened a bug:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3973
>
> Cheers,
>
> Richard
>


