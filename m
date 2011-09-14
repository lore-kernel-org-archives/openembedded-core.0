Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1R3rt6-00058L-TF
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 18:00:36 +0200
Received: by bke11 with SMTP id 11so1608178bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Sep 2011 08:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=z912tOZNiFIa5RaIUWlsljykXFiaUDMCRlydI0sa/kY=;
	b=boKiF2JmroQotGBBH0AYC5fmuHittw7DvYVNesGJigAu7+cVPJoahgwVhjXbtKF7qx
	PuVjkfqhoR1jcvoz8gefIx59ptU+0FMWvS+bmkm0tKDJjZ3XmVE/UwKJPFgqQFVT+6eO
	QiFwV97jEYl3YAi4d4sc+Oq+Dr9yZR8uku5x8=
MIME-Version: 1.0
Received: by 10.204.139.71 with SMTP id d7mr19654bku.41.1316015726468; Wed, 14
	Sep 2011 08:55:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.65.194 with HTTP; Wed, 14 Sep 2011 08:55:26 -0700 (PDT)
In-Reply-To: <1316015141.26879.2469.camel@elmorro>
References: <1315978760.26879.1858.camel@elmorro>
	<CAP9ODKrn8ZZZFFZPwuMU-Jto5X9On3A5p8wKeEU7ZcQAa9GoHg@mail.gmail.com>
	<1316015141.26879.2469.camel@elmorro>
Date: Wed, 14 Sep 2011 12:55:26 -0300
X-Google-Sender-Auth: azE9sS1PjSr3lBQs9nPjkgp4khw
Message-ID: <CAP9ODKpsEx=05bVBVYvxLhuDfb=14gdZ2KaERrWCkHQYQOfHpQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add new recipes for grub2
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
X-List-Received-Date: Wed, 14 Sep 2011 16:00:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 14, 2011 at 12:45, Tom Zanussi <tom.zanussi@intel.com> wrote:
> On Wed, 2011-09-14 at 05:30 -0700, Otavio Salvador wrote:
>> On Wed, Sep 14, 2011 at 02:39, Tom Zanussi <tom.zanussi@intel.com> wrote=
:
>> /> A future patch will factor out the common parts of init_install_2.0.s=
h
>> > with init_install 1.0 - this initial patchset essentially just fixes
>> > what's necessary for YOCTO bug #1428 in order to get things working ag=
ain.
>>
>> Wouldn't be better to drop 1.0 completely?
>>
>
> You're right, and the original did do that essentially - on second
> thought it was much simpler - I'll resubmit something like that...

I prefer to have 1.0 dropped since it avoids duplicated maintainence
work and support. Besides, since this is gonna be a base of newer
Yocto we ought to ensure that the layers do get their bsp updated
(even thought I think the only user of it is meta-intel at this
moment).

Nice that you agree with it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


