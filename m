Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q0dDE-0001be-J9
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Mar 2011 18:11:44 +0100
Received: by fxm19 with SMTP id 19so3827138fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2011 10:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Tmur5HOm5zp3PizsxOeUsTAW0F8rvcBOdqCI4DXZFPM=;
	b=DFKmh4foz60pVPn2iHWnuDVhnUU2LW79yuWAKGTtfYwjAUfgGja9D/NrOszw5zzh3V
	NCce/8OWuyeaQhm37TQ9YYIzN0l6x6WhYqDqS1jlTgOCh7gWPX4AmZDpIfWeoiH+hEiN
	9GYQ79/Gn99vK5WMOfDfK9QEKGqNwM6/OOQio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=I2kKGl7zXptzqSbLpr4c1HX4Ce9EegKWCBIlrqWO5zY9ehy8UT+vIZ2pcNFCVHI9Qz
	3fxrZ7JDKeSMCzhK40Kv3EdBFdIzQYHKO4TKBX2vTaLWvgEEJLA9CFNrMZCuDN/o3JP5
	9H1Xre3QV/4HoUb9oIBE99ztDz42klE1VFe2I=
Received: by 10.223.26.205 with SMTP id f13mr1539749fac.49.1300468185154; Fri,
	18 Mar 2011 10:09:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.109.12 with HTTP; Fri, 18 Mar 2011 10:09:15 -0700 (PDT)
In-Reply-To: <1300441629.30423.2186.camel@rex>
References: <20110318035922.GA4083@sakrah.homelinux.org>
	<1300441629.30423.2186.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Mar 2011 10:09:15 -0700
Message-ID: <AANLkTikVHvfGVYyVVLDMppHD38jNwCAy-d3_k6P3AJf8@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: cleaning perl-native catch 22
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
X-List-Received-Date: Fri, 18 Mar 2011 17:11:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 18, 2011 at 2:47 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-03-17 at 20:59 -0700, Khem Raj wrote:
>> Hi
>>
>> Ubuntu 11.04 decided to put libc in /lib/`uname -m`-linux-gnu/ so
>> perl-native failed and I patched it and all fine. But here is
>> interesting thing. When perl-native failed (this is build from scratch)
>> then I fixed it and as usual tried to do
>> bitbake -c cleanall perl-native
>>
>> and it started to build perl instead since I guess its a dependency for
>> pseudo (may be) and pseudo is not build yet. So whats the way out here
>> so is it a catch-22
>>
>> So I had to delete the whole tmpdir
>
> perl-native is not a dependency of pseudo-native...

hmmm then I wonder why it goes on to build/do_compile it when I ask
bitbake to clean it

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


