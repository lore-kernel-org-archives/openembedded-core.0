Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 727CB71CA6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 19:58:25 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id 96so20290548uaq.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2017 11:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nJQDIkzVVbagCHvwy5exsDb4HS1irm1RjUpkoiVTh4k=;
	b=syKkyLN7HfI65Y+oMcNK+JFfc1/PYdKUS0E0tfgardRzmrll9lF5k/2WSC/bIzBPLJ
	5j8xzLpYxYEkfPfDP+jfLqOW2mBvSCFoSdPepGmnrEEU9rS5fIZiH8PJYAePOhgISF7d
	k6omk3osvIZ/gk19gXRP0QsZexQH3goxdU6wvRuji73zA4b5xDfkmPJ/HRg7Kmq5NkE7
	o1TZmd23xpYApFrdo4KKJmRy8tNPPs0E030KtedmG8lQ/pDFwIo6DFPtv58iLdtHTj0d
	1OiRa5/pyXDYTlRvGtlqGkZewaHjAWjdr8Uj+iI3+U8rz0hoMnGJkxha9JSaRYYjeNXx
	4Muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nJQDIkzVVbagCHvwy5exsDb4HS1irm1RjUpkoiVTh4k=;
	b=SiTPw/rxp0BteL68LJdVheIMgsuTcDIljTuHaRGl8xzBLXdimUFogHaDAxr49TWYl4
	sEwkGiSfcAdqXivOIyYRnlFvSOqJb/HkOwo2BjS/1pBZn5FWnrvHear1ejJn6C+I1Mhr
	j01j1B96Lq1MRzjIUH9Pd2xsQ5AhCZ4OrwKm5sD96OIitj0Pr6ML36QheP4vw6Cl7iQ1
	uIYrZNwQtOcR97u+Air7dkDhs1bl+wgLr179Ahlts61bv6lVqsmQMHSLmzlptMX9zBET
	xLWinjjE98IGa2m9lTg0irYXXG6IhxyoR+EKSIcm9B5L2R/Vo0coDJwWCToWSGCBYBeH
	Evgw==
X-Gm-Message-State: AIkVDXKibRxlZsNL9qvx4OKGOZKMIRqSBaBxVfR/ehYIiwF85odACWvfz1rTCZlOLbiEveETIbxjWDGbNayVhw==
X-Received: by 10.176.64.168 with SMTP id i37mr21584903uad.60.1485374305325;
	Wed, 25 Jan 2017 11:58:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Wed, 25 Jan 2017 11:57:54 -0800 (PST)
In-Reply-To: <CAD4b0_KNSRXs7mGyePjD1SQHGfb_hpBZ56qJVnSiJS4HfJfrLA@mail.gmail.com>
References: <20161110003935.1858-1-raj.khem@gmail.com>
	<a186e3be-242a-5ba1-36fe-f5f3d561552c@mlbassoc.com>
	<F7334516-0C0C-4709-88ED-8FAB7FFA5548@gmail.com>
	<CAD4b0_KNSRXs7mGyePjD1SQHGfb_hpBZ56qJVnSiJS4HfJfrLA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2017 11:57:54 -0800
Message-ID: <CAMKF1soSCibekfOy1QjpA2Xi0tVYR85qVjvhcqhxD0Ogg6pvag@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Wed, 25 Jan 2017 19:58:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2017 at 11:40 AM, Maciej Borz=C4=99cki
<maciej.borzecki@rndity.com> wrote:
> On Mon, Dec 12, 2016 at 7:02 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Dec 12, 2016, at 4:36 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>> Looking at these recipes and they seem like a good starting point.
>> I did have some issues though:
>>
>> * bitbake go - didn't create any target installable packages, although t=
he
>>  .../image directory seemed to be well populated.
>>
>>
>> Yeah mostly, I was concentrating on cross builds but this is something t=
o
>> look at.
>>
>> * bitbake go-helloworld - had these errors:
>> ERROR: go-helloworld-0.1-r0 do_populate_lic: QA Issue: go-helloworld:
>> LIC_FILES_CHKSUM points to an invalid file: /MIT [license-checksum]
>>
>>
>> Thats new, somehow it did not happen for me. I will check again.
>>
>> ERROR: go-helloworld-0.1-r0 do_compile: Function failed: do_compile (log
>> file is located at
>> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-=
helloworld/0.1-r0/temp/log.do_compile.31170)
>> ERROR: Logfile of failure stored in:
>> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-=
helloworld/0.1-r0/temp/log.do_compile.31170
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | stat helloworld.go: no such file or directory
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at
>> /build/p0382_2016-01-13/tmp/work/cortexa9hf-neon-amltd-linux-gnueabi/go-=
helloworld/0.1-r0/temp/log.do_compile.31170)
>> ERROR: Task
>> (/local/poky-cutting-edge/meta/recipes-extended/go-examples/go-helloworl=
d_0.1.bb:do_compile)
>> failed with exit code '1'
>>
>> I forced the compiler to my target (rsync is _my_ friend) and was
>> able to run 'helloword.go'.  I've not tested much past this point,
>> but I am enthusiastic about getting 'go' into OE-core
>>
>>
>>
>> Thanks Gary for your feedback it will help. I know I have a rev2 due for
>> this patchset. Haven=E2=80=99t yet includes all needed changes for v2.
>
> I would like to revive the discussion on including Go toolchain in
> OE-core. Recipe specific sysroot changes have shown that external Go
> layers may be a bit fragile. At least oe-meta-go, which we are using
> right now, required some changes. Hopefully, the patches which were
> posted today will get merged soon and everything will be back to
> normal again.
>
> There were some concerns previously about including Go in OE-core.
> I''m not sure if these were eventually resolved. If not OE-core, how
> about meta-go in OE layers? Maybe it would be a better match for the
> already existing meta-{python,ruby,perl} layers. As long as there's a
> single go-to layer for Go, everyone would benefit from this work.
>
> Khem, do you need any help with v2 of the patchset you posted
> previously? I think we should be able to spare some hours helping out
> with this in Mender.
>

my changes have been updated after last review cycle. I did not
address all reviews but most of them. The latest changes are here

https://github.com/kraj/openembedded-core/commits/kraj/master

I think this would need the latest adaptation for rss to be included now.
however this was working fine for most of arches and even with musl.
I would love some help in testing and fixing them making them further
worthy of submission as v2

> Cheers,
> --
> Maciej Borzecki
> RnDity

