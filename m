Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QbqWs-0008UO-FD
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 10:53:50 +0200
Received: by fxh10 with SMTP id 10so1101392fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 01:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=JsQhN7BPwZ1baWs7pbkhMwjsRADButNuCA6ZZ3YnHVg=;
	b=Ad83Y8b7jlYegYaxmxO4dnWbu4y/8H+7fIs45pXbKOX4w49XlQh7xWv3E1UpsnST3o
	x/jktNOkU8tVCIBgUUqDv/tSQRM7bNJqMaBsdvjXhVlI2Yr8k06EncM+rKcOnLTxPV0T
	ivCQTBT+CdvcnHEeY8c3Wbe0GEgAYbXJAo/Kk=
MIME-Version: 1.0
Received: by 10.223.98.204 with SMTP id r12mr887179fan.74.1309337408466; Wed,
	29 Jun 2011 01:50:08 -0700 (PDT)
Received: by 10.223.111.130 with HTTP; Wed, 29 Jun 2011 01:50:08 -0700 (PDT)
In-Reply-To: <AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<AFF7B511-46CF-4CDF-96CA-763678BF57C7@dominion.thruhere.net>
Date: Wed, 29 Jun 2011 10:50:08 +0200
Message-ID: <BANLkTi=3_0NHcyWydFjp7a3sBr00u-54YA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Conflicting providers for ssh/sshd (dropbear and openssh)
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
X-List-Received-Date: Wed, 29 Jun 2011 08:53:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 29, 2011 at 10:24, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 29 jun 2011, om 00:41 heeft Khem Raj het volgende geschreven:
>> If they are independent then may be the openssh recipe should be
>> divided into openssh-ssh and openssh-rest so one can use openssh
>> provided daemon or dropbear provided as they wish
>
> Dividing the openssl recipe would gain us little and the gains would be only for the power companies since you'd have to build openssh twice to get both sftp and ssh. The decrease in build time for only sftp is neglible.

Hm, speaking against what I've often been advocating (reducing build
time by factoring out dependenies etc)...

I think the simplest and most straightforward solution is to just
split the packaging into
openssh-ssh and openssh-sftp, where openssh-sftp packages just what is
needed for handling
the sftp-server in cooperation with dropbear. It could possibly also
include the sftp-client if
desired/needed.

The openssh-ssh package could then depend on the openssh-sftp package;
then there would
be no difference today for the distros using the complete openssh package.

I read the
>> If they are independent then may be the openssh recipe should be
>> divided into openssh-ssh and openssh-rest
part as just splitting the package. But now when I re-read it, it could very
well have implied creating two recipes; which I agree wouldn't be the best
option.

Regards,
Anders


