Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 60B16748AB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 02:26:28 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d14-v6so3572923pgv.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g/uEKzwovtsyso2kx5tRjGYxU4pSfiRfSnDXhyJ4CkQ=;
	b=LGruKJ2nZ37gxfGg9NSb4RdQwOedf5RuYqEc+RS9D5GsO1XfGKsrg1I/kS0m+Ee4XL
	QgKe/qkCPrbByZAjN86bcalroUcuDBwfvIptddTLFZIJ4slsrtghcU+ViphbgARd3B85
	HJgjC2lbh1xRDRivgaIrL2X7v1TF2rjHbfY7kIuovvAQoO0T0vdDeGzYDDuiKtLqjRk3
	VL9xi8ZI1Nn/mpjb2ScYZKlXItomsVKbY3ptdkSnMrWxyNI61fs2hnU6x2sziqErKS4+
	g09NBGexD/46eqOe8UIFGqffSfmQdUyAFckYU+qbCyFmDoByvwapO/LOwOMCHkeTOCfK
	PtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g/uEKzwovtsyso2kx5tRjGYxU4pSfiRfSnDXhyJ4CkQ=;
	b=pi5xbg7goDpoZggyjmYOqEvWg2uroc/30db/W47IJNLvkWw9NzlbM+FfaDXFpPvKYC
	N5akmMVt0iDD0LUE67/Gf9DEtc2lCsJsTNyeJrAWf9TUADkRqd7Ykq3JJcZ7U9nhbvmd
	U/ehZ51wcl4F5Sk/POlaeBpkXNJC2pkxpIdpxol+6x6vH9m40dgLqDBbGWvS89otkurg
	Ivn2G3gl00w/kakEUn+ZOcNL0iA7wLe8DxI5nrv/9kfMCu0lAiJ0z7o7M8ia1g/MKTqg
	TCEVle5L+NqdoS+8zrg6A3DvgWSdzd0seavVyYbAbq2afrjriR0Z8PvIXhn5/IRsPQou
	Usxw==
X-Gm-Message-State: ALKqPwcL4ICEnHAJEA7OG9BHGRCzUbjrRGJ1jybyO3y4rvYrlk3byRO/
	6HhQECuJRkreHi4K50WGZXTMjbnPdRXtGRbXAoM=
X-Google-Smtp-Source: AB8JxZoH7mbSPIUfQkqTleO/KgQRow30a7FiZKOETeufFPeSBaA+QC9tM5LmcpBzHaW9D/GYG+ybndhxuYf9tmx8oLo=
X-Received: by 2002:a63:7b10:: with SMTP id
	w16-v6mr13705509pgc.55.1526955990054; 
	Mon, 21 May 2018 19:26:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Mon, 21 May 2018 19:25:59
	-0700 (PDT)
In-Reply-To: <8523df99-ce1f-c99e-0379-4b72df9d58ad@gmail.com>
References: <1526931828-20358-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spByqR0tuCeY_iW549mK6K6A9nFd1PcEzebFVCDvpVUOg@mail.gmail.com>
	<8523df99-ce1f-c99e-0379-4b72df9d58ad@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 22:25:59 -0400
Message-ID: <CAMKF1so+vefznkou750crbUntgOhzfJ_RXSn+E91bEb4HbjTUA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bind update req. new pkg in core
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
X-List-Received-Date: Tue, 22 May 2018 02:26:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 9:30 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 05/21/2018 06:06 PM, Khem Raj wrote:
>
>
> On Mon, May 21, 2018 at 3:44 PM Armin Kuster <akuster808@gmail.com> wrote:
>>
>> With this update, the python-ply package is required.
>> I copied the one from meta-python to core. Once this hits master,
>> I will send a patch to remove the same recipe from
>> meta-python.
>
>
> Can this be turned on/off using packageconfig ?
>
> Yes we can and it is already in the PACKAGECONFIG options.
>
> If we do disable python, then the python binaries that are currently being
> installed will not. Someone decided: dnssec-coverage dnssec-checkds  where
> important to install in the current Bind solution.   A new one is being
> added; dnssec-keymgr. If we don't want dnssec support, thats easy to
> exclude.
>

these all seem to be additional utilities so probably should be
packaged into a separate package
may be bind-utils

> BTW, pthon-ply  exists in 4 other layers besides meta-python and  at
> different versions.

thats less than ideal, and probably should be consolidated, moving to
oe-core probably will not
solve that problem

>
> let me know which way you want to go.

I dont have any strong opinion either way is fine.

> - armin
>
>
>
>
>
> If so then it would be ideal
>
> If not then please send the removal patches for meta-python regardless so it
> can be tested together
>>
>>
>>
>> Armin Kuster (2):
>>   bind: update to 9.12.1
>>   python3-ply: add package needed by bind 9.12 update
>>
>>  ...0001-build-use-pkg-config-to-find-libxml2.patch | 13 +++---
>>  ...-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch | 13 +++---
>>  .../0001-lib-dns-gen.c-fix-too-long-error.patch    | 13 +++---
>>  .../bind/bind/bind-confgen-build-unix.o-once.patch | 48
>> ----------------------
>>  ...-searching-for-json-headers-searches-sysr.patch | 13 +++---
>>  .../bind/bind/dont-test-on-host.patch              | 17 --------
>>  .../use-python3-and-fix-install-lib-path.patch     | 36 ----------------
>>  .../bind/{bind_9.10.6.bb => bind_9.12.1.bb}        | 21 ++++------
>>  meta/recipes-devtools/python/python-ply.inc        | 18 ++++++++
>>  meta/recipes-devtools/python/python-ply_3.11.bb    |  2 +
>>  10 files changed, 49 insertions(+), 145 deletions(-)
>>  delete mode 100644
>> meta/recipes-connectivity/bind/bind/bind-confgen-build-unix.o-once.patch
>>  delete mode 100644
>> meta/recipes-connectivity/bind/bind/dont-test-on-host.patch
>>  delete mode 100644
>> meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
>>  rename meta/recipes-connectivity/bind/{bind_9.10.6.bb => bind_9.12.1.bb}
>> (86%)
>>  create mode 100644 meta/recipes-devtools/python/python-ply.inc
>>  create mode 100644 meta/recipes-devtools/python/python-ply_3.11.bb
>>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

