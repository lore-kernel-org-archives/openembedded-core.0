Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SB8hJ-0001Lm-2a
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 18:54:45 +0100
Received: by wera1 with SMTP id a1so2854060wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 10:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=JEign9/lOabw0wL6hyoKkC1SjbNAT3GXmjzQkmxqhcU=;
	b=Jc0+1emKVZvDbKpb3K6CL5ceSmpcnI7C0agAPoFS8ZSzw7U9CoiXhUWfHis6X07Trl
	yMewgonE8CnMQlqsoZnm3KgeeKkhHLsMt86Gi/jN0I7nxqRoJp8R/QM+7oezjJ5KnZEd
	jrI39z4d8YW1GlsQ5bU6yoFGg5rq6R5HQmNPYLwIC9LSPQyP/LZdLYoUCW46eZRzQ0S0
	JXEI/vcSaDKyCyIVsHO055IjKZe/skLrgrJ6rywJIQd3T2AeEApgPpS3HQmLQwhKrD/W
	QzTVkkzDIoBiAREs6GRNAzbGMX1dUmlsAYW5D+/fsJ9nyAExkhg/rPCCedFWnvZKPBex
	8+Pw==
MIME-Version: 1.0
Received: by 10.180.102.129 with SMTP id fo1mr8331234wib.6.1332524748778; Fri,
	23 Mar 2012 10:45:48 -0700 (PDT)
Received: by 10.216.38.135 with HTTP; Fri, 23 Mar 2012 10:45:48 -0700 (PDT)
In-Reply-To: <C7DE296F-975E-4CCE-91BD-5C562C50CC8D@dominion.thruhere.net>
References: <cover.1332522200.git.bruce.ashfield@windriver.com>
	<C7DE296F-975E-4CCE-91BD-5C562C50CC8D@dominion.thruhere.net>
Date: Fri, 23 Mar 2012 13:45:48 -0400
Message-ID: <CADkTA4O6s6BoCoKxh6ncBqvTJFP=T9Qvv+WAa7-HQdcY=GuVJQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/3] linux-libc-headers: 3.2 and linux-libc-headers-yocto movement
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
X-List-Received-Date: Fri, 23 Mar 2012 17:54:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 1:22 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 23 mrt. 2012, om 18:07 heeft Bruce Ashfield het volgende geschreven:
>
>> Richard/Saul,
>>
>> As discussed on the mailing list here is a libc-headers series. I've kep=
t it in
>> three parts so you can pick what you want (except for the minor detail o=
f
>> needing to split patch 1/1 to keep 3.1 around if you don't want 2/3).
>>
>> I've built and booted this on all the emulated targets, and have some ot=
her
>> builds running against larger numbers of packages as well.
>>
>> Cheers,
>>
>> Bruce
>>
>> The following changes since commit bb1d7fad7ff8515939f2b5f0b540b9b09604b=
e3c:
>> =A0Richard Purdie (1):
>> =A0 =A0 =A0 =A0Revert "bitbake.conf/sstate.bbclass: Change PATH when ins=
talling sstate files to avoid issues"
>>
>> are available in the git repository at:
>>
>> =A0git://git.pokylinux.org/poky-contrib zedd/libc-headers-oe
>> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dzedd/libc-hea=
ders-oe
>>
>> Bruce Ashfield (3):
>> =A0linux-libc-headers: add 3.2 headers and remove 3.1
>> =A0linux-libc-headers: set default LINUXLIBCVERSION to 3.2
>> =A0linux-libc-headers-yocto: remove from oe-core
>
> Would it make more sense to move to 3.3 or is that too risky at this poin=
t? I'm fine with the patchset either way, though.

I thought about it as well, but since I've been building a booting 3.2 more
often than 3.3, I took it easy with this change.

But a 3.3/3.4 bump makes sense in the not too distant future, and obviously
if there's consensus, I wouldn't argue strenuously against 3.3.

Cheers,

Bruce



>
> regards,
>
> Koen
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


