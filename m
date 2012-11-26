Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Tcww5-0001o1-0y
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 12:33:13 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2446612pad.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2012 03:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=YmmVl3f+kSwmFmazuldSW21sRT+d5KusHKiUbsBTgyk=;
	b=VkM3zYvTaNCIIjgS8bZbmtJ/AXpMNQxqH9FhhMt0/NfZZcocT3W9/cHNfJFx68whwF
	oVXmePVPu14m+WAdVDrdfQRM9T1ISJiN9K9OV5tU4tKSDqvqV1IBF5l/E/2WTP0OX9Hd
	CavPjFkD3ciFQDvv/mJPE1ygiyKnqS59hdW2i1CQbbgTerYMxM3DhqIKsdBb47ezGvRR
	DNsxAODFiax+f4QsQ3szwPZ9T7jIepROXWIWqJ7xzFOn4+9miG0lF0w3+kUocBN5uwY4
	bAT1hjbpbMDM4UlovOjFVWL5+gN0alYzC8J3NSaAKr6Fu9tAFstcNASl+WNbgnyKTuIx
	QoLg==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr37397318pbc.24.1353928740656; Mon,
	26 Nov 2012 03:19:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Mon, 26 Nov 2012 03:19:00 -0800 (PST)
In-Reply-To: <1353928626.21863.56.camel@ted>
References: <1353874980.21863.20.camel@ted>
	<CAP9ODKrCMHknzX62fb23=AXaKT8-CD2o6Pgmu1PV8T2wwKdh1g@mail.gmail.com>
	<1353928626.21863.56.camel@ted>
Date: Mon, 26 Nov 2012 09:19:00 -0200
X-Google-Sender-Auth: dLnkRdQQXrLa1zmJ_s5AX5M7B8Y
Message-ID: <CAP9ODKpjfvi-xZPG3+wJGVzv7n704dsSYDs-mcKrbhQQ5EvbAw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] allarch: Allow class to be included but overridden
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
X-List-Received-Date: Mon, 26 Nov 2012 11:33:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Nov 26, 2012 at 9:17 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2012-11-26 at 09:08 -0200, Otavio Salvador wrote:
>> On Sun, Nov 25, 2012 at 6:23 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>> > We have cases where we'd like to inherit this class by default but allow
>> > special cases to override it. This change makes the code of the class
>> > conditional on PACKAGE_ARCH remaining set to "all", allowing it to be
>> > overridden. packagegroup usage is one case this is desirable.
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > ---
>>
>> Richard, I fail to see the usecase of packagroup. Can you clarify?
>
> packagegroup.bbclass previously set PACKAGE_ARCH = "all" which was
> confusing other code. Anything using the all package arch should really
> use allarch so we are consistent about how we set the various variables.
>
> Even though packagegroup.bbclass now uses allarch, we need specific
> packagegroup packages to be able to override the class e.g. marking
> themselves machine specific. This is why we need to make this change.

My only concern is if we could make allarch to raise an exception if
you inherit it and set package arch to another value?

The only bad effect about it is we won't be able to change something
in a bbappend which makes the package arch specific that way.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


