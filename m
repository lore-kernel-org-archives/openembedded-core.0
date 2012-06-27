Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dennis.yxun@gmail.com>) id 1SjmP4-0004Tx-Sn
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 09:11:07 +0200
Received: by obcva7 with SMTP id va7so1096197obc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jun 2012 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=upw+uGe2JiFE4ctF5NU+p/6qZIEts5R2+e//dpkNW6I=;
	b=ilDqMZhMHeCU7xU2bZFBvfLoirMPpUGxZtCF9mhbgef3FPNzQSYGcIDPU7oEIJHVPz
	hSvoY6uwO+Jq9+4CUS9d7y2Ob4Wg5LBVCaeyMxcGHSLkjhi0N8RfDSmuCq/mU5axF4ZF
	AAvSEQJihQc2gque8Vex++IzYs3053uZvKh4xzLLuIgrysJsMhKnRDacgARiOkSa3sw4
	u7RWamtJz1K3AvJ4ZUnnpJU1lqvsdXA+q7vOL5vbW5+3Pa7GoXUimHj1zBtXhOQf3nQt
	xtzMvZ1p0CQQzwr0Bxs0/ryPmQhSxB/mwJ+jUbgguidhTaQTutcbcHc5dJQH7Mh8d9zH
	MjQg==
MIME-Version: 1.0
Received: by 10.182.72.42 with SMTP id a10mr18960565obv.22.1340780413317; Wed,
	27 Jun 2012 00:00:13 -0700 (PDT)
Received: by 10.182.37.134 with HTTP; Wed, 27 Jun 2012 00:00:13 -0700 (PDT)
In-Reply-To: <CAMKF1srKXavMswBxM+E_-HHGXdDphYuPfNKbXHAZf4=w1nsMUw@mail.gmail.com>
References: <CAF1ZMEcMxTQUhyHdmMWV_PA6TY=RTz9rq-EahKU0p=DFFPw+Ew@mail.gmail.com>
	<CAMKF1srKXavMswBxM+E_-HHGXdDphYuPfNKbXHAZf4=w1nsMUw@mail.gmail.com>
Date: Wed, 27 Jun 2012 15:00:13 +0800
Message-ID: <CAF1ZMEeRi6a=pmRkHwy0yLDCJume6nCv-YAV1BcAeBWgXhaefA@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: yocto@yoctoproject.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] bring mipsel support (little endian mode)
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
X-List-Received-Date: Wed, 27 Jun 2012 07:11:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi Raj:

On Wed, Jun 27, 2012 at 2:40 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jun 26, 2012 at 11:25 PM, Dennis.Yxun <dennis.yxun@gmail.com> wro=
te:
>> HI ALL:
>> =C2=A0 Sorry for crossing post, but I'm quite new here, so if I did
>> something wrong, please point me the right direction. thanks
>> =C2=A0 I'm using oe-core, and notice that mipsel support(o32, little
>> endian mode) is missing (current available choose is: qemumips,
>> qemumips64, qemumips64el).
>> =C2=A0 So, here I'm trying to bring up qemumipsel support . My first
>> attempt would just make qemumipsel work,
>> further would make it running on real board, thus maybe mips4kec,
>> mips24k, mips74k chips.
>> =C2=A0 What I achieved here current:
>> =C2=A01) toolchain/basic libs, utilities should works ,only one changes,
>> see my patch [a]
>> =C2=A0 for mipsel we also have to filter out -march=3Dmips32, previously=
 we
>> only handle mips (the big endian?)
>> =C2=A0 don't have the error message now, but if you request, I can provi=
de.
>> =C2=A02) attempt to =C2=A0compile kernel to support qemumipsel, unfortun=
ately it fail.
>> The point here is linux-yocto doesn't support qemumipsel, but merely
>> support those other three mips arches,
>> So here is my attempt patch [b], and the fail log [c], complied out
>> binary still big endian.
>>
>> =C2=A0 Could my patch [a] be accepted? or should I send with another mai=
l
>> for better review?
>> =C2=A0 Is it better to request a ticket in yocto's bugzilla? or just
>> report here, I'm not quite sure.
>>
>> Dennis
>>
>> [a] 0001-eglibc-support-mipsel-little-endian-filter-out-march.patch
>
> This patch is appropriate for OE-Core, I will add it to my tree.
>
>> [b] 0002-qemu-attempt-to-add-mipsel-little-endian-support-but.patch
>
> This looks good to me but I will leave it to Bruce to decide.
>
>> [c] build_log.txt
>> [d] log.do_package
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

I'm quite confident with patch [a], but not sure with patch [b], since
it should point to a sanity SRCREV which works for "qemumipsel" -
little endian side, but here I'm simply duplicate from qemumips (the
big endian port). should confirm?!


