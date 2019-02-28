Return-Path: <damien.riegel@gmail.com>
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id B55AC7CD24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 18:19:15 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id y4so10077431pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 10:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=erd9mAaPmZNCTiNSZNn1aZOL6rcglMKYvhe9p5p/5rw=;
	b=QmiROtqdnhg96qtOcliY1bwCLH0PaNVyBO+FVJ70voCk+OuuharrnwzwG6As3+tVJv
	lD31dh45hEC731+SlcWq61KoW2VmIicMjFGx0dCbAx3EIk/KYMS+wWsRpWaZfUznU4wk
	Nv81ihKWqv3o6JxYNzduejd7ti+wYS9PS0fgz3RO8rJFqKoTocfQtLdrbJ60F2AR9Dpz
	KOTPs2464bG8r7K9lEVxxHfkXo9wg+6XZuHXcBENIlicJgvgVKhSrfmRSZzQA41R5IzM
	87CWLzNTRKYMinh5q6qHNfTOQXyqUGc8t+TNxMweYfsbC3vKp6VK0JBs7UtqjS0SpDVg
	+BRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=erd9mAaPmZNCTiNSZNn1aZOL6rcglMKYvhe9p5p/5rw=;
	b=DnPKuXJxu11v8+Cc4XKl0yxdcTI43Hw1FDtN9O5GZQ1C84M2r2g0Rzzoi/KnScE8i/
	v4BVgwn7ZCORUBzCEdX/TTX5n0c7XQggUrb8aPVkLYcAcZxxxZZDl1XvKNbLZ7qhMvX+
	fu5CMmT+dU3JvA5UftRPpvluTIlA2Xv/Sg4qmqwWWgcXMUdd6K+HKjcBHscQZyUhEq0A
	6i/mZBGJxJV4xhA/h9akMvt6wOiV6ywqamGQitoLcV3rRbjpSzOVWGP316BMrHFl/xHL
	T4/LAIKIUGY1u8buYqUMLfV3t1+cqEWSVGVXJk4OqCxASZWpjtqBPpMlBblOMegG4D5W
	ma6w==
X-Gm-Message-State: APjAAAXhVcz8oEHVwQzPEnWcYPplN4VTUMT3GHPbUn+3Y7yXfD6ihz6r
	D/MACHnnPezTHd+A/mGtAcFsAhyWfCdLtiw85Y8=
X-Google-Smtp-Source: APXvYqzvENV5Vo+uNIW6LHdlhgMX01HefGAAUpV9otNQWT5FhUV6FoyZXg+mmOTcxf+i48Oyx/+vjW9vZ+aI1Sh5Nk4=
X-Received: by 2002:a63:6841:: with SMTP id d62mr467854pgc.133.1551377956597; 
	Thu, 28 Feb 2019 10:19:16 -0800 (PST)
MIME-Version: 1.0
References: <CAB2nKc9-EgbC729jBkNRbPPvewQUP=Th5WGEGaW-sK0aW=ThBg@mail.gmail.com>
	<CAL4iiOcBT92-jWjQVKZ0vrW7Feu7Tra7ejUdCa0cmscu3sOkWQ@mail.gmail.com>
	<CAB2nKc9MeWts0s=KFgpSpV52LQA2f=cHJuxmHY0Ez1mijpbP-g@mail.gmail.com>
	<CAMKF1srWmVomzmRsFsZQNvJPe3_PvipAUxf1a3sNc1Sx+FXTBg@mail.gmail.com>
	<CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
In-Reply-To: <CAB2nKc_F0qF4Bakg5F6Z9k5vw9u9RF7hnjeTK=SjqUS10Ykbbg@mail.gmail.com>
From: Damien Riegel <damien.riegel@gmail.com>
Date: Thu, 28 Feb 2019 13:19:05 -0500
Message-ID: <CAL4iiOf=EGme65Z3w-2PthTdaDawxXh6=Djq4E=1muSKzYz+tg@mail.gmail.com>
To: Vincent Prince <vincent.prince.fr@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GO runtime crashes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Feb 2019 18:19:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 28 Feb 2019 at 09:04, Vincent Prince
<vincent.prince.fr@gmail.com> wrote:
>
> Hi Khem,
>
> GO_DYNLINK_x86-64 =3D "" solution works as well,
>
> Best regards,
> Vincent
>
> Le jeu. 28 f=C3=A9vr. 2019 =C3=A0 14:14, Khem Raj <raj.khem@gmail.com> a =
=C3=A9crit :
>>
>> On Thu, Feb 28, 2019 at 1:35 AM Vincent Prince
>> <vincent.prince.fr@gmail.com> wrote:
>> >
>> > Hi Damien,
>> >
>> > With GO_LINKSHARED =3D "" it work fine.
>> >
>>
>> Please set
>> GO_DYNLINK_x86-64 =3D "1"
>> to
>> GO_DYNLINK_x86-64 =3D ""
>> in goarch.bbclass

Well, making a change in the goarch.bbclass is way more intrusive than
changing the value in a single recipe, so it would be nice to (at least)
give some justification about this solution.

>>
>> > I'm very new to Go, does it mean that there is a mixing issue in go mo=
dules from Yocto and from node_exporter vendor folder, so it links wrongly =
at runtime?

As to why the GO_LINKSHARED =3D"" works, I cannot tell. I just noticed
that our application was linked differently on my machine (where it
worked) and in Yocto (where it didn't work), so I tweaked link flags
until I got it to work.

Cheers,
Damien

