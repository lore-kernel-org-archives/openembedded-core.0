Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QbpTP-0006zP-57
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 09:46:11 +0200
Received: by fxh10 with SMTP id 10so1052941fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2011 00:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=GAcFB+aNk32zPQH441yyz+78f67bmENBCkfLQDv+98k=;
	b=DCAqxEHygT+snV+zQU+3Hzcj76zJaNnnlDaZ1aCEhel1GLU3e98IOSZBzMNWOeozRR
	R3HFGDoAZY2k2xPUdMvSrX9l1ggA4/Amjaz1M4cY1Gug14M2Pm55JDXi3GI/ug+RrDsU
	FjmOWVkU2Xru9qEpdJmQgfKG/QzKORiIw2X9k=
MIME-Version: 1.0
Received: by 10.223.99.153 with SMTP id u25mr779442fan.112.1309333348784; Wed,
	29 Jun 2011 00:42:28 -0700 (PDT)
Received: by 10.223.111.130 with HTTP; Wed, 29 Jun 2011 00:42:28 -0700 (PDT)
In-Reply-To: <4E0A5AE5.7000509@intel.com>
References: <BANLkTim9UBhi90OLd7UVxiRnxcWdkP=mqg@mail.gmail.com>
	<4E0A5AE5.7000509@intel.com>
Date: Wed, 29 Jun 2011 09:42:28 +0200
Message-ID: <BANLkTin3KKFJFEm7E-0qbZL0axLXRNRk-g@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Jun 2011 07:46:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jun 29, 2011 at 00:51, Scott Garman <scott.a.garman@intel.com> wrote:
> On 06/28/2011 03:41 PM, Khem Raj wrote:
>> reason is that dropbear only provides ssh and sshd packages openssh
>> provides a few more e.g. openssh-sftp-server which is demanded by
>> some images and at same time wants dropbear to provide sshd and ssh
>>
>> Now both recipes are to be built but are in contention for providing
>> ssh and sshd
>>
>> How to solve this problem. ? Are other packages that openssh provides
>> strictly depending on ssh/sshd from openssh ? or will they work on
>> any ssh/sshd ?
>>
>> If they are independent then may be the openssh recipe should be
>> divided into openssh-ssh and openssh-rest so one can use openssh
>> provided daemon or dropbear provided as they wish

Sounds good. I'd probably suggest openssh-ssh and openssh-sftp, where the
latter one only includes what's necessary for the sftp-server to work. (Or maybe
that was similar to what you meant?)

> I've run into that and have been wondering how to resolve it as well.
>
> If there are currently existing images which are pulling in dropbear's ssh
> and sshd while using openssh's sftp-server, then that would imply they can
> work independently, even though that combo seems like an aggressive space
> optimization that I would tend to avoid.

I wouldn't say that it is a very common practice, but it certainly
isn't too uncommon.
I've seen it a number of times, and also used it in a few occasions.

Regards,
Anders


