Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RwpG5-0002Tz-D3
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 07:19:29 +0100
Received: by lbol12 with SMTP id l12so2317577lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Feb 2012 22:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=6W+hasJ8dJVBYKBrap7ldaiqwpLzzmfPFdPmIe9lVgE=;
	b=wxAlNAWCo40eiWTkNhpGDhexB3XgYjHgBshdS2Lt/4VU4Qf8Zxr3MQYNbWMCuNfQx2
	NRB/npjKQKMXq3mamKf3wmI2PC81/HcNocqp5gANiYvgQro4qmKFUZ8OQcP49kB6BqOf
	u0DDnRv3nXVET+nG29CM+x4OrN+rQpQWTixG8=
Received: by 10.112.28.169 with SMTP id c9mr5125500lbh.42.1329113480349; Sun,
	12 Feb 2012 22:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sun, 12 Feb 2012 22:10:50 -0800 (PST)
In-Reply-To: <CAJG6M_Pc6rKvdG2iTr6ws-4Rw1XmpwG8Hqu3LTpXt2NxcDA5Gw@mail.gmail.com>
References: <CAMKF1srTMHyV+2eDaJKuZs9=2VUYkqhJoqfFqZxrdTCCooWMXA@mail.gmail.com>
	<CAJG6M_Pc6rKvdG2iTr6ws-4Rw1XmpwG8Hqu3LTpXt2NxcDA5Gw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 12 Feb 2012 22:10:50 -0800
Message-ID: <CAMKF1so-b6LTbc98oU9RY0F8aO4jYVagH0wneqfo8CLC1w3NHQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipes with disabled parallel make
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
X-List-Received-Date: Mon, 13 Feb 2012 06:19:29 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Feb 12, 2012 at 1:56 PM, Yury Bushmelev <jay4mail@gmail.com> wrote:
> 2012/2/10 Khem Raj <raj.khem@gmail.com>:
>> Hi
>>
>> Just grepped for the occurances of disabled parallel make and I see
>> around 40 cases on oe-core
>>
>> git grep PARALLEL_MAKE.*=.*\"\" recipes* | grep -v "#"
>>
>> If someone has time to kill then it would help to see if some of these
>> are fixed by time or can be fixed
>>
>> it can help in paralleling the build a bit more.
>
> I can run set of builds to check is P_M still needed for that recipes or not.
> But I need suggestion - what MACHINE/DISTRO/IMAGE to build?

usually it wont matter. parallel builds are not dependent on any of these
so choose whatever you wish

>
> --
> Yury Bushmelev
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


