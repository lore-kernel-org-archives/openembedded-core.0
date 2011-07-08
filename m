Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QfBxK-00007w-2y
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 16:24:21 +0200
Received: by pwi1 with SMTP id 1so1198718pwi.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jul 2011 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=301M7AdyyRI91fpFFHBxrFDfrR4xvuAO4+CYtbVljWM=;
	b=xYq4LAUdQx7qVmpvpYoX8yUP2Njq8hZGO7Vy805IJ7FjwokXHQH0SzYCkh4EVftVDs
	+Esc1m7ySRKsFtv2Le9PxDeg98bwI14hPf9QtRQckg/9XNINtVytXIGKBxc11PHA7Lmd
	Hr4FXk8CkdQlybtNOsK+Cfl7gR0J03JnuFz5I=
Received: by 10.68.0.200 with SMTP id 8mr2730091pbg.163.1310134655177; Fri, 08
	Jul 2011 07:17:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Fri, 8 Jul 2011 07:17:03 -0700 (PDT)
In-Reply-To: <201107080938.37370.paul.eggleton@linux.intel.com>
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107071534.51372.paul.eggleton@linux.intel.com>
	<4E1693CC.8080403@gmail.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jul 2011 07:17:03 -0700
Message-ID: <CAMKF1sqqYk60t5_CTOx8ueAWyZ5X0KmESLMqy+wjv_W7vr0WOg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 14:24:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 8, 2011 at 1:38 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 08 July 2011 06:21:16 Khem Raj wrote:
>> If oe-core never supported older kernel than 2.6.37 then setting it to
>> 2.6.37 would be better IMO
>
> It's not necessarily just about oe-core - it's about what layers get used on
> top, and some of those will be using kernels older than 2.6.37.

Its similar to  a situation where some of the layers might be using
gcc older than 4.6.0 but we still chose 4.6.0
in default distro vars. There always is a possibility to override it
if user has to.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>


