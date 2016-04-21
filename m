Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id C7967700F0;
	Thu, 21 Apr 2016 03:07:20 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id x7so21070420qkd.3;
	Wed, 20 Apr 2016 20:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=99nbgXsXmrFLAkD3riYZQLZ9+k9OaekLdBFN9w3Du2k=;
	b=uCyzHNlBobMEa7ypxJ4vCRAsoy7dfVnR8y9EZ4jYif3MpaDC5LL9UnbsOLJG7jDnfO
	8/NFCsWHn6JJxDx40fj6RMnY0thuabEzwR8N6n4di3SvHJ3p1UUMboOvXCzYqZIQt/gM
	qQTh8jA7ItXOV7O1O38mug30ttqHHyESJFEz4aSxU4YWz2slRiV+MwBAhxEKxJejhh64
	PH7FYIUTcQHaOXOfA3E5vUHmM/QsXmQMcMwIF+E+1dsZnaGBRIHSfWc4XYAo5oDOy58+
	d9Z63RMWsfmpy2QvARpZiJorKbV483RoI3ZTAiuZX3wrMw4wKeKm+zpu9Au73rHu8ttG
	pAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=99nbgXsXmrFLAkD3riYZQLZ9+k9OaekLdBFN9w3Du2k=;
	b=IOFWeqK25T8X49cwDnww6cO6+5gp5NPkBd4Li6OnJ4pwHsvRFtE0f5SuieuI+ngSX2
	Bb+dDui6T7EC4L1GBuCKv5+AUVQj3IM7+OG48k156Z7tf2OORJv+TJcG485pEzH01oXB
	bPxXYWe2VSleCoqC4uhTAzGSNRe4F/aDnmZN9sYgn3zI9C8rGYuEI2bTRi5drpys6/2x
	dmr5HKb/vzXIZNRGlJsHvUBCywD6tIMX8bq9kf1sNaiWmpbOO0/7dJ1cHCwwWxsUGfSm
	0OgYfBMnQL+mGT7u2zvPMzOIPV23TTNXX8dRHFPQ+fYj1krK0sUVOe/pZTa/Hx6rJBe0
	ie7w==
X-Gm-Message-State: AOPr4FUxNloAtmFSonvQX5SJ0uZeDl8U8JgEtD8rQweE1pWa+0epTFBGdN+3NmfODa9FgjG0NJ2es+bVUVVB1Q==
X-Received: by 10.55.78.131 with SMTP id c125mr16264359qkb.71.1461208040881;
	Wed, 20 Apr 2016 20:07:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Wed, 20 Apr 2016 20:06:51 -0700 (PDT)
In-Reply-To: <CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
References: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
	<CACS+7ZSpWgziO+GF++25dM7kgP4SZ_GDV+-DcEMQ_YUGyEEnfQ@mail.gmail.com>
	<CAMKF1spQn114r9dCAk9z7c3hw-NJp3pVoVP+f3gao2mhLTBHYg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Apr 2016 20:06:51 -0700
Message-ID: <CAMKF1spwimpQwSE38B5jWmyZXwMKy6znMEF9p-NmTM4mGGr+4g@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 6 Recipes
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
X-List-Received-Date: Thu, 21 Apr 2016 03:07:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I have updated

http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-6

With few more patches added now. Most of packages in OE-Core are
building fine except linux-yocto on mips and ppc

ppc
http://errors.yoctoproject.org/Errors/Details/60423/

mips
http://errors.yoctoproject.org/Errors/Details/60427/

and musl builds needs few more packages to be fixed. but things are
looking good.

Thanks
-Khem


On Mon, Apr 18, 2016 at 6:13 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Mon, Apr 18, 2016 at 12:48 PM Dan McGregor <danismostlikely@gmail.com>
> wrote:
>>
>> On 17 April 2016 at 23:15, Khem Raj <raj.khem@gmail.com> wrote:
>> > Hello all,
>> >
>> > I have put together a potential gcc6 upgrade recipe set, and pushed th=
e
>> > branch to tree here
>> >
>> >
>> > http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gc=
c-6
>> >
>> > and also at github fork of mine.
>> >
>> > https://github.com/kraj/openembedded-core/tree/kraj/master
>> >
>> > You need to set
>> >
>> > GCCVERSION =3D =E2=80=9C6.%=E2=80=9D
>> >
>> > in local.conf to enable it.
>> >
>> >
>> > There are few recipes in OE-Core which still don=E2=80=99t compile e.g=
.
>> >
>> > see
>> >
>> > http://errors.yoctoproject.org/Errors/Build/14782/
>> >
>> > any help in fixing them or otherwise fixing other layers is appreciate=
d.
>> >
>> > gcc6 is a major release for some info see
>> >
>> > https://gcc.gnu.org/gcc-6/changes.html
>> >
>> > and porting guide
>> >
>> > https://gcc.gnu.org/gcc-6/porting_to.html
>> >
>> >
>>
>> I haven't built an image with gcc6 as the compiler yet, but I did
>> check out your branch to try building with gcc 6 as the host compiler
>> (Fedora 24). I needed a few more fixes, available at
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=3Ddankm/gcc=
-6.
>> I fixed lzop, pkgconfig, and disabled werror on binutils.
>> core-image-minimal appears to be well on its way to building.
>>
>
> I had fixed lzop locally meanwhile. I cherry-picked the pkgconfig and
> binutils fixes into my branch
>
>>
>>
>> > Thanks
>> >
>> > -Khem
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >

