Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q79kC-0005s7-0Q
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 19:08:44 +0200
Received: by fxm19 with SMTP id 19so470018fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Apr 2011 10:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uWBroutCBNUtpVIxp0QFAgvORIVNXFncCzP4ml35m+4=;
	b=caSvAdhsMUUbeiuDhd9uYlZdKRreeH1oQOIERmEcC0k0FwTkPT+mAl1H+EEWvMQLI/
	ZKGUfTt6uRia7sEYXCNW5z07qtg5LcgzTHD/ApkidDBaOISoMtxkC6jxkGUOIeTy5Gtr
	kwGUMDODPrxsrz6UrQHO5YRwuyIExzcaxzyOE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=IGZoZ2fEEEGLC0Y8Dnkob1KW3Fpt3fQ2LgRF51KhxLCZVR590j39muO4hrtnyU9wyC
	FRcTXIwycx1dUZ4PfUzeE7k05FMPz/J6UkI1l07HA0Koqz4qRhGmqA9jkRnaLrGYZ96D
	uk6Oc3J37Xq0f3PviVxkrYCYAp10QVzPSnXVY=
Received: by 10.223.54.148 with SMTP id q20mr3259370fag.84.1302023197297; Tue,
	05 Apr 2011 10:06:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Tue, 5 Apr 2011 10:06:03 -0700 (PDT)
In-Reply-To: <7AD8211B-5C4C-4A3B-8F7C-0A64D1481E07@dominion.thruhere.net>
References: <7AD8211B-5C4C-4A3B-8F7C-0A64D1481E07@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Apr 2011 10:06:03 -0700
Message-ID: <BANLkTin0DYebPZKUqvsDmEhhsiK-FZJY0Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Best way to build avr-gcc for ARM?
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
X-List-Received-Date: Tue, 05 Apr 2011 17:08:44 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 5, 2011 at 12:51 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Hi,
>
> I'd like to build an avr toolchain (avr-binutils, avr-gcc and avr-lib) to run on an ARM platform. What would be the best way to do this? I can manually change host and target in EXTRA_OECONF or I can use the canadian class. Which is best?
> And if I want to target x86 on ARM does that change things?

I guess you need real canadian here. build = x86/x86_64 host=arm target=avr

>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


