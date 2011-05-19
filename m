Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNCdM-0004SD-0L
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 01:28:01 +0200
Received: by eye27 with SMTP id 27so1084041eye.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 16:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=Luqu5JVHVUAvJ18yOw5kBfgu6gEyBPTooRsZqYppiSs=;
	b=uP93OswVoED80k7nrLSA3HeG/Hlw0zW9UnH6vH9v4nodOByxBgTc/n9wtyammdKPXR
	nqft4MniBvUpPdpItdVdHx4nhujDbA6vfb96NnWz/rd/rHMQQxbKHCJVxPznEjbOIqsK
	RDfx3iCyUP/oHw4LZmiKtlmuvKdEIDyU3hFQg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ljC7O06thW8FdAkrXwjc0QvJKACWmp5kcF6fYnZlNCCk+lycu2Y84flkQgfvrI6G4E
	3RMRWvwTAIQgdY//dZ3efj/nT4YTenQK7nJc4BpqM94sTirLY5CdTXmvxUp0W5uO4vdt
	6QVQfGZJerGSRaML6NZNiZxOffSSnU+bTIRog=
Received: by 10.14.49.210 with SMTP id x58mr1390235eeb.12.1305847503585; Thu,
	19 May 2011 16:25:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Thu, 19 May 2011 16:24:33 -0700 (PDT)
In-Reply-To: <1305842878.3424.557.camel@rex>
References: <cover.1305839225.git.raj.khem@gmail.com>
	<1305842878.3424.557.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 May 2011 16:24:33 -0700
Message-ID: <BANLkTi=5xOzNZt5c=heWNBJyEygMRoAABA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Let opkg-build allow uppercase letters
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
X-List-Received-Date: Thu, 19 May 2011 23:28:02 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 19, 2011 at 3:07 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-05-19 at 14:09 -0700, Khem Raj wrote:
>> Majority of the changes are backported from OE
>> one additional patch is to opkg-utils/opkg-build to allow
>> uppercase letters.
>
> Upperspace package names are a violation of debian packaging guidelines
> (which OE has aimed to roughly follow) and will break the debian package
> backend. At the very least some kind of translation is needed there
> before this gets enabled.
>
> Where did this requirement come from?
>

I was building kernel for efikamx wich has some uppercase chars
appended to version
but I think I can patch the kernel for that and we can drop
uppercase-letters.patch

Do you want me to update the patch ?

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


