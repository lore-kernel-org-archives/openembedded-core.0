Received: from mail-ea0-f174.google.com ([209.85.215.174])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1UTBqS-0005E0-O3
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 15:59:25 +0200
Received: by mail-ea0-f174.google.com with SMTP id m14so1742665eaj.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2013 06:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=T/c8LLF9G5q/T9UsFQE7n2RkTzaTOXIwo/bsMdUmz5c=;
	b=dGpm65tmITxrNhXB3gyFlJmzUlIzvrW9EiZkmhTbxnY4JNhyX+YR2nahjVRPgWVwiT
	oFLEDq3hFFO9OYJHbTyzWboq6T3XDaUCBtSdvWTMVbKzu5xXfSImiCcZZRORW2LwdL0E
	HcMC2Bo6NcWfkGhXkhlLZdnds+6LeM4uvZmaV0Qn5n4tEGtI5RHrnUTrwWEUtgt40k1W
	wdhvKVyFijaJ3j6nluZZ1mzTwpFjSHifgGqhJ/4QNh/iNNPFM9Q5z6VRNZFDAoZE4TEB
	bd35pLZKpLXZh7b8kcca8Yhh8jfIK7DmKgCMplU+7qZ28PqQDrJUgo3e9F9F0f2okO4f
	R4lw==
X-Received: by 10.14.5.72 with SMTP id 48mr41990025eek.19.1366378906256;
	Fri, 19 Apr 2013 06:41:46 -0700 (PDT)
Received: from ?IPv6:2001:610:612::15cb:73fc:27f0:4e75?
	([2001:610:612:0:15cb:73fc:27f0:4e75])
	by mx.google.com with ESMTPS id u44sm23148514eel.7.2013.04.19.06.41.43
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 06:41:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1366376397.10502.126.camel@ted>
Date: Fri, 19 Apr 2013 15:41:42 +0200
Message-Id: <3286324B-9629-4783-AEAB-C7D920313B1A@dominion.thruhere.net>
References: <1365848719.16702.74.camel@ted>
	<1365944532.5651.12.camel@localhost> <1365953596.8670.9.camel@ted>
	<1366020508.2896.16.camel@localhost> <1366025504.8670.30.camel@ted>
	<1366027932.32176.4.camel@localhost> <1366028557.8670.34.camel@ted>
	<1366030768.32176.9.camel@localhost>
	<1366376397.10502.126.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQnB2JlBVu5F2qHZL2I7OSfwJ+DQPEmnv6nSkYmcPv23jyKxiKsch/rL0P5sM5keUsrf8p2R
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	mclasen@redhat.com
Subject: Re: [PATCH] gdk-pixbuf: Fix libpng determinism issues
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
X-List-Received-Date: Fri, 19 Apr 2013 13:59:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 apr. 2013, om 14:59 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Mon, 2013-04-15 at 08:59 -0400, Colin Walters wrote:
>> On Mon, 2013-04-15 at 13:22 +0100, Richard Purdie wrote:
>>> On Mon, 2013-04-15 at 08:12 -0400, Colin Walters wrote:
>>>> On Mon, 2013-04-15 at 12:31 +0100, Richard Purdie wrote:
>>>>=20
>>>>> It will make our builds work again for now until the next time =
someone
>>>>> upgrades libpng and and then it will potentially silently start =
using an
>>>>> old version in some builds :(.
>>>>=20
>>>> So something like the attached on top of the previous patch?
>>>>=20
>>>> If this looks good I'll push both to master.
>>>=20
>>> Looks good to me, thanks!
>>=20
>> Both pushed to git, thanks.
>=20
> Much appreciated!
>=20
>> <nag>
>> If OE was building from git as it should, your original patch could =
have
>> been a ready-to-upstream "git format-patch" style instead of the =
default
>> "Upstream-Status: inappropriate" non-git patches =3D/
>> </nag>
>=20
> Noted, although I doubt we'll be using git SRC_URIs for everything any
> time soon for a variety of reasons. I would love to see the option of
> building most things from bleeding source but that would require a lot
> of work which we don't have the bandwidth for.

And would introduce some dependency hell (gtk-doc-native needed for =
every little gnome thing *and* udev) but more importantly it will expose =
us to that stupid, stupid, stupid practice of using git submodules to =
drag in autoconf stuff. Gstreamer is the worst offender, but there are a =
lot of others.

I try to have recipe build from a git tag instead of a tarball whenever =
possible, but it hurts a lot if it's one of that gtk-doc users, you =
can't disable that completely.

regards,

Koen=


