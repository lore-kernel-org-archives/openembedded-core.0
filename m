Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4E4D46E650
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 20:08:10 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id d8so2192704pgt.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Sep 2017 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WhKTzlqZQq+YBFGL6dpvlat1zB1kq4WkNj6/MFBY1Zs=;
	b=W/BI8EHbnoNIfM/MzK2BO10Y+o89d7z9VVE67XoxX/zkVH2vStDyc17sN9ozPFpyzw
	fvZZTsEHCJ33eJaF9J2+VpKha9zE6qEhS9Lqm5GIKhUqRG3E7vxuLgObMFp+a8eCxAvt
	R3wHrOSv0488biGMrqrrqhP0P611r9n7pVMFD1eNdfggzpuzsM++3NY0JmO7tlZI0rUa
	laxM6n2uFRKn+2Q0W43/8pU0OH/9lNUhFtoiMZlz2kLTgNiidxT8jpb2JYNZLgA/l6sS
	BgMFX74S7te1xuPcaDduU9ZDBM784vIOmdHZ2xCvAtRmlEGxJB7kVDV/Peu4BNl/1hff
	HkUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WhKTzlqZQq+YBFGL6dpvlat1zB1kq4WkNj6/MFBY1Zs=;
	b=j9TSbog0ZrFn40cVU15Mv3qc3r0b9LiEyJCETH72qUmyJdu0Vgk3eSnIXX0CpBdwww
	Ub3xc3gDpPUmeFh6V9CWWKyLkvdqe/6H6ruNyUBUNjrwNZICE1TVyFmnkLOehybFqTd+
	0wLWU+3+Wr7OjRLOQA5eOiqhqhk/dhzP/stjfvt5Gk2wswGL3/Jrai4Js4HU5hpro9NH
	xQ9txMqg0BfXOLZJuw95h4Oui3yxNhG8EPW/GuPsBMDjJT5MU5FROKQFLLxkUGDznzjG
	Wqp8OE1hE7KqPmlu4mO7hRMXs27gnLNP3vbVX9v1l8y1p5yskRbD5WKPmAHxJ5s8Ux64
	yLkQ==
X-Gm-Message-State: AHPjjUiZzJ3kgat0d9qsVfkRbXYiDLbqgu/nsnfsFUY/QwhYnU5qh/8r
	f9ZthbpuwbnmoxKQs+OBsLry/T4H1gp1gvEe/B8=
X-Google-Smtp-Source: AOwi7QBmlw0jtLS5Z7mHx0blgyURwEOix52bwNrqx/bB0qDX4VvT9UBfvzvA7N5BTw1kk1WHxktPLosuiGr8qhaTpZ4=
X-Received: by 10.99.111.9 with SMTP id k9mr3261686pgc.439.1505938092408; Wed,
	20 Sep 2017 13:08:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.149.73 with HTTP; Wed, 20 Sep 2017 13:07:41 -0700 (PDT)
In-Reply-To: <2eedee2e-f768-8470-1647-ea0c98c4e55c@windriver.com>
References: <007BD92917A2324FA403BCF9A464CF84CF41E3E8@ALA-MBC.corp.ad.wrs.com>
	<20878500-1BB2-43F0-A6A5-087775FC0FAB@madison.systems>
	<b8a7eae3-2b65-e17d-efe0-f7efb113fd38@windriver.com>
	<CAMKF1spd-DuNQLT+iGCTVWDXcWzpsXyEGtUCeHFz953jF5e2Sg@mail.gmail.com>
	<CAGgRHJp27mt4P2pPRkJEQgoUnmD4VAbj83=dCSrZT=X=53NFEQ@mail.gmail.com>
	<2eedee2e-f768-8470-1647-ea0c98c4e55c@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Sep 2017 13:07:41 -0700
Message-ID: <CAMKF1srnH9eQ-03KJuMKkf+59WZX97K7_mijrQZd_sJ4AUuCgA@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: go-runtime does not build for mips32r2 tune
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
X-List-Received-Date: Wed, 20 Sep 2017 20:08:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 20, 2017 at 11:32 AM, Randy MacLeod
<randy.macleod@windriver.com> wrote:
> On 2017-09-19 07:47 AM, Matt Madison wrote:
>>
>> On Mon, Sep 18, 2017 at 4:26 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> On Mon, Sep 18, 2017 at 3:52 PM, Mark Hatle <mark.hatle@windriver.com>
>>> wrote:
>>>>
>>>> On 9/18/17 5:50 PM, Matt Madison wrote:
>>>>>
>>>>>
>>>>>> On 18 Sep 2017, at 2:11 PM, Slater, Joseph <joe.slater@windriver.com
>>>>>> <mailto:joe.slater@windriver.com>> wrote:
>>>>>>
>>>>>> This is the default tune for qemumips.  It appears that the problem
>>>>>> does not
>>>>>> occur for an oe-core checkout just before the split creating
>>>>>> go-runtime.
>>>>>>
>>>>>> Before the split, go-helloworld will build, but after the split it
>>>>>> will not
>>>>>> because it needs go-runtime.
>>>>>
>>>>>
>>>>> There=E2=80=99s a TUNE_CCARGS_remove in go_1.9.bb to remove the
>>>>> =E2=80=98-march=3Dmips32r2=E2=80=99 flag
>>>>> that probably either needs to be moved to a .inc file or copied to
>>>>> go-runtime_1.9.bb.  Missed that when splitting out the runtime recipe=
.
>>>>
>>>>
>>>> That seems wrong.  We should be using the TUNE_CCARGS, and -not- using
>>>> the
>>>> arguments that 'go' has decided must be right.
>>>>
>>>> Otherwise the optimizations may or may not be compatible... and if
>>>> someone
>>>> selects different arguments, they won't get filtered.
>>>
>>>
>>> go supports mips32r1, and needs fpu or kernel FPU emulation enabled
>>> so using mips32r2 might be fine back when I was adding it to oe-core it
>>> did not work, things might be different with 1.9 release where mips
>>> support is complete in golang.
>>
>>
>> It's still mips32r1, though, and the go build tool explicitly adds
>> '-march=3Dmips32 -mabi=3D32' when invoking the C compiler for cgo.
>>
>> -Matt
>>
>
> Is someone working on a fix or should I open a YP defect?

Open a defect regardless.

