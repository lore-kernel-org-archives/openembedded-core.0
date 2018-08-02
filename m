Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 05A6574603
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 22:50:28 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id y207-v6so6447381oie.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 15:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zHKy1ZKXxy8s8LARPyDUD/dL6k1zDR8Le5yORkqBW4w=;
	b=rWymgiS/jX3sfUOBoYe8hi8hZc6Bbg2a10f1JQlI89geZ7iNjWCAvQ6aPFg4ZHfco5
	gZefC76Uz0VltEtTcl+OJN/UNZdbG4jKMguZk6B6Awt8ZBsbTefJKewaWPH3kjtsqyhf
	B4KU5OFjS3D1C4as5MHgZuBrt8QBtS83XZE038Oh5ott4+qmC6KKCocBSkZWZQ/nOZkl
	aKJySqU5nvlsPKGnJSFvs8nqDOB65uKUst5HevDBZxDmytFwwCh4BJ8CRfaGpXPb8s0T
	11LAYxP0PnMmIQt568PU9QSud0G11FRaUzZUO6sjtOTagE1BuFMDvD3re551C0+2vARh
	729g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zHKy1ZKXxy8s8LARPyDUD/dL6k1zDR8Le5yORkqBW4w=;
	b=hq4Nft1nLt6fyJJDPVr1tvt9J7W+U+zNLhFQQl0dlOv2koLYEauLQdMs75w9mRdMfc
	5TSSucfA3WLaV7/348ZFgRCj8/ocjI+ZNpZ8tJ1Rg8W0id7AAiw1dNhPpvZeV8ozVxNd
	tNjOUfQkP+0BW8JHQxtzKDxtGmLzKbbCChftgQdFHkgAbcIdbUVDHtoEe5R6qNM4lkLI
	bDOkhExIHpAyyvB6arEuFpTFxXZOWZyvlTZXWD9o42ZnGHbhudhziwz0v1UY+ifuKj+X
	HFrDLv81TU1c/hGqhtQYo9nWvYm/kH9915EaRNCeAf6xyGYWsNafMwpToztwVTF6L4N7
	mRrQ==
X-Gm-Message-State: AOUpUlE40PV5OB+jh18g2HXpIcM4G/gP1tY32n5xXzujwhAtqLbzW9Jj
	ltXz41f3OWSSeWMuF882rRW0HAQgorIZBG3EO77cuA==
X-Google-Smtp-Source: AA+uWPyMrichLXSeB+XG+lcB2W5iU6HGiuAmBis/fMsKD7V+7rla23D7yE/rfAKGen75UKG2TEMS8HhQHOnZNl8Bjvg=
X-Received: by 2002:aca:e185:: with SMTP id
	y127-v6mr807802oig.245.1533250230058; 
	Thu, 02 Aug 2018 15:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:6845:0:0:0:0:0 with HTTP;
	Thu, 2 Aug 2018 15:50:09 -0700 (PDT)
In-Reply-To: <CAMKF1sog84TTX8f9kmzx9o3e8LciAMp6SxVh+MwE4OX=NYm_SQ@mail.gmail.com>
References: <20180731170541.13620-1-ross.burton@intel.com>
	<20180731170541.13620-2-ross.burton@intel.com>
	<CAMKF1sog84TTX8f9kmzx9o3e8LciAMp6SxVh+MwE4OX=NYm_SQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Aug 2018 23:50:09 +0100
Message-ID: <CAJTo0LaKWwanR0zKSh2NtpE15yp6qfF7rtXdNFSJ7HfNqR1huA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] python[3]native: allow use of both native Python 2 and 3
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
X-List-Received-Date: Thu, 02 Aug 2018 22:50:29 -0000
Content-Type: text/plain; charset="UTF-8"

The last to be inherited behaviour?  That's the same as the current
behaviour, apart from after my change both pythons are available via
PATH.

The only change is that inheriting the second class doesn't wipe out
the first class.

Ross

On 2 August 2018 at 22:05, Khem Raj <raj.khem@gmail.com> wrote:
>
>
> On Tue, Jul 31, 2018 at 10:06 AM Ross Burton <ross.burton@intel.com> wrote:
>>
>> Instead of both classes using ${PYTHON_PN} (which is set by python-dir and
>> python3-dir), hardcode the right values so that it is possible to inherit
>> both
>> pythonnative and python3native at the same time.
>>
>> If both are inherited then both native Pythons are available, but the last
>> to be
>> inherited will be the one to set PYTHON.
>
>
> Not particularly thrilled about this usage it seems error prone
>>
>>
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/classes/python3native.bbclass | 6 +++---
>>  meta/classes/pythonnative.bbclass  | 6 +++---
>>  2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta/classes/python3native.bbclass
>> b/meta/classes/python3native.bbclass
>> index 89665efee8b..da12a714703 100644
>> --- a/meta/classes/python3native.bbclass
>> +++ b/meta/classes/python3native.bbclass
>> @@ -1,8 +1,8 @@
>>  inherit python3-dir
>>
>> -PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
>> -EXTRANATIVEPATH += "${PYTHON_PN}-native"
>> -DEPENDS_append = " ${PYTHON_PN}-native "
>> +PYTHON="${STAGING_BINDIR_NATIVE}/python3-native/python3"
>> +EXTRANATIVEPATH += "python3-native"
>> +DEPENDS_append = " python3-native "
>>
>>  # python-config and other scripts are using distutils modules
>>  # which we patch to access these variables
>> diff --git a/meta/classes/pythonnative.bbclass
>> b/meta/classes/pythonnative.bbclass
>> index 4cc8b2769c2..ae6600cd155 100644
>> --- a/meta/classes/pythonnative.bbclass
>> +++ b/meta/classes/pythonnative.bbclass
>> @@ -1,11 +1,11 @@
>>
>>  inherit python-dir
>>
>> -PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
>> +PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
>>  # PYTHON_EXECUTABLE is used by cmake
>>  PYTHON_EXECUTABLE="${PYTHON}"
>> -EXTRANATIVEPATH += "${PYTHON_PN}-native"
>> -DEPENDS_append = " ${PYTHON_PN}-native "
>> +EXTRANATIVEPATH += "python-native"
>> +DEPENDS_append = " python-native "
>>
>>  # python-config and other scripts are using distutils modules
>>  # which we patch to access these variables
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

