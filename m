Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tasskjapp@gmail.com>) id 1ShEDt-0003sa-VO
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 08:17:02 +0200
Received: by lbol5 with SMTP id l5so126635lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 23:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=gth9SnuaOx8oNAGxKDTKJpK0ii7DuSXjBNGRmtrv2RM=;
	b=ZS6kD+N1ML8cvQ10EEBI8mGrsYU9QA7A1Muv7iYDFhH4S1OiAiyvhn/GgouyzKuFol
	ebp61SsCD3SgEDFP5yJw/PppV/fCdsXfv6rfb8jtaiiantZENHtfx18orCatmQf/Qwao
	Oa6eKJ9DI9dzLV829Rs8Dc39ZSdF+VQoM8P5sEhDDzZNDu+nVAlp2lO4X9oKfEk+1vP/
	ZsQO54CQjg3IQD5upp62Ylc/gdngkh/MQxiaktfFOoe7Tu5UPeBAcmTPawy/uSm1mBCS
	YX5Ls6NZFZu2AjM1zrH/epPrMfqrAoUjrg1XZI2qMCjkoESMJRtMfi16rbxLUiKm52xe
	wbZw==
Received: by 10.152.124.45 with SMTP id mf13mr1245038lab.44.1340172377647;
	Tue, 19 Jun 2012 23:06:17 -0700 (PDT)
Received: from [192.168.0.121] ([84.49.231.147])
	by mx.google.com with ESMTPS id h9sm15441393lbi.9.2012.06.19.23.06.15
	(version=SSLv3 cipher=OTHER); Tue, 19 Jun 2012 23:06:16 -0700 (PDT)
Message-ID: <4FE167B4.3020802@gmail.com>
Date: Wed, 20 Jun 2012 08:03:32 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <CANrdZLjpmXK5j+jr=fTD43je2Ni6exWGcrCkejKgE1ZZXe5TGQ@mail.gmail.com>
	<CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
In-Reply-To: <CAMKF1spWqFCoXRbnevoKz+ftThQf41nObpMQ6N46YQ6_fucznQ@mail.gmail.com>
Subject: Re: Generating a movable SDK
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
X-List-Received-Date: Wed, 20 Jun 2012 06:17:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2012 10:33 PM, Khem Raj wrote:
>
>
> On Tuesday, June 19, 2012, Steve English <steve.english@navetas.com
> <mailto:steve.english@navetas.com>> wrote:
>  > Hi,
>  > I've generated a cross compiling ARM SDK
> (angstrom-eglibc-x86_64-armv7a-v2012.05-toolchain.tar.bz2) that works
> great if installed in /usr/local/oecore-x86_64. I would like to move
> these binaries and run them from under my home directory (on this and
> other host machines).
>  >
>  > I can tweak the PATH and use --sysroot where appropriate, but the ELF
> binaries themselves specify a loader of
> /usr/local/oecore-x86_64/sysroots/x86_64-angstromsdk-linux/lib/ld-linux-x86-64.so.2
> in their .interp header. Is it possible to generate an SDK that uses the
> standard host loader, or at least uses a relative path for the built loader?
>
>
> Sdk is not install time relocatable yet there is a feature enhancement
> request in yo to bugzilla for the same
>
That request is mine, I think. I have gotten around this by making 
/usr/local/oecore-i686 a symlink to where I want to keep the toolchain 
(in a vcs). Works like a charm.

- Tasslehoff


