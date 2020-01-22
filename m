Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66])
	by mail.openembedded.org (Postfix) with ESMTP id 988DF7FE43
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 08:13:35 +0000 (UTC)
Received: by mail-qv1-f66.google.com with SMTP id x1so2819153qvr.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jan 2020 00:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=d38SXwRyGh8mLImGkxu9ssNHwCxnK9qjHhHOmmels4U=;
	b=FX3hH22ze/SsecHbQeHguRWykd1W2qNWrMepcw+M7zSop69aeSP8KiDEOnqRvVZsNl
	apJpHoi+5wzZiNPtNGNTH+eSqK/EL8LhTSYvh6Rp7mhe8VnyEYqQIfK1Ww57sn1I1+M5
	EeJjDjA3xr8YO6oX3TMZZB93K8+5j7OMglZ+PVAmBl4JtbCFcn0c9lEYdgaHU4nvRhlm
	Io0/2DbtpBHU3/BpBXLfRtTTVVZANkpZEj/V+GQFixbN1q2W5s3t2xUkaPY55cd/DEme
	CA55+jFKTjcjageIO+9NSacOdSucL6UZLYN/KFkCCF515xZ+zusZh3bJzb50GjqNMQoE
	u0Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=d38SXwRyGh8mLImGkxu9ssNHwCxnK9qjHhHOmmels4U=;
	b=M88J9p7C+PhuaZ4Y5ELwe7q5V2flv4RLhS+fjn8a8ToDv6OFAG4yGdSGD5aH+2lUoL
	4iCXPeAUiItrWf4gUvcXYn//aUOPZih2p+ng1mKVgWw8bIyhPUyq1eFXcoSCvtn3mCl5
	f39u83xXpJenjJv3dUZbXkO9eGJ1OgKKlQabKNH9UOSL+AOFif7trNy26ng+27mpL+xw
	qTxbD8HqtEjcmO01OVp//UjO6p0yyL1HK/ZLOCDTlBo0AXnO/CEHdE17ooV1R8E02D2q
	sHuXWP5PmPc8lN3++Pg2CWq3Ff2UM/9nSKN9ig/u1O5MTm9TTVkEhHV0CZ0MFQFo2g2L
	ARMQ==
X-Gm-Message-State: APjAAAWw+zQSnjC6A4mfrZe/mKUkZpPmK2AK653iEj43x+5IUVu6euu2
	cSLQhgLeL5Lcy0Irk2q1dwIse8pmuPZia+IsbAA=
X-Google-Smtp-Source: APXvYqzQqTTRggsjYu+JJn9Gnjhk9+MZnoCIUpDrQ5/oRSW63ZpG3WR7fHo6vMlU95C3qBLAXh0ERTA8zrcY+B+cupI=
X-Received: by 2002:ad4:4389:: with SMTP id s9mr8839838qvr.99.1579680816298;
	Wed, 22 Jan 2020 00:13:36 -0800 (PST)
MIME-Version: 1.0
References: <20200120172510.22648-1-alex.kanavin@gmail.com>
	<20200120172510.22648-5-alex.kanavin@gmail.com>
	<CALbNGRTcVRb7obS2g8d6fipNUervDr0ZYvJ+izLmCJH4h5QRyQ@mail.gmail.com>
	<1ccb46bd9806f74f4c61b774754e314ca72c368c.camel@linuxfoundation.org>
	<CAMKF1srhnkkSETdWK0Jb0V8OV-4bwpCLJ7MhJuJ9dOx5T3VzUQ@mail.gmail.com>
	<1776d7f035ce96fa5a1b3759e83fdd6c611dca15.camel@linuxfoundation.org>
	<CAMKF1sqvV4xj1p+h6Yjt08L4h9w2YfVSDqLF9J7yW7N8t2-HLA@mail.gmail.com>
In-Reply-To: <CAMKF1sqvV4xj1p+h6Yjt08L4h9w2YfVSDqLF9J7yW7N8t2-HLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jan 2020 00:13:09 -0800
Message-ID: <CAMKF1sqL5LP-h6y583ma48U=kD2-tKATf-=dSGRize3yM_73dw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/24] nss: update to 3.49.1
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
X-List-Received-Date: Wed, 22 Jan 2020 08:13:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2020 at 2:02 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Tue, Jan 21, 2020 at 12:22 PM Richard Purdie <richard.purdie@linuxfoun=
dation.org> wrote:
>>
>> On Tue, 2020-01-21 at 11:35 -0800, Khem Raj wrote:
>> > This is failing on qemuarm btw
>> >
>> > http://errors.yoctoproject.org/Errors/Details/307410/
>>
>> That is odd as it passed testing on the autobuilder. It must be
>> something tune specific :(
>
> Thanks
>
> While my builds are dealing with py2 things this seems not related but I =
do have gcc10 in my mix
> So it could be future build break I need to triage it a bit more and see =
what=E2=80=99s going on
>

It was not a compiler issue but another issue in the patch proposed to
disable crypto, I have not sent a patch on
top of this one which should fix the problem and make the patch to
disable crypto on arm disable it fully.

see
https://patchwork.openembedded.org/patch/169340/

>>
>> Cheers,
>>
>> Richard
>>

