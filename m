Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 07E4E76710
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 00:44:33 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id j35so167311787qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2016 17:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=a8TMtvqP9k6NTrU/ln+QXWYsK32CsD5zKS+tbo1k/o8=;
	b=rw+ZeoMepVqwvyAdbQU8EELdYdrF+fx1a42oLyjgoc06Z1M7eum0ySzfWBXBMvp91y
	5nP2vhbymV5LKhkdQZdkoUx+mUeEDsZxdmWI6shHjLA5DNaJj7zRd1GWoKn08oVTXb2K
	1SsMzpoPirloy4aDZi2Njz+KzQDEvbbUFLAF/I8jZhkm/oxhTgz36oVKz4UOfhZxK8e2
	70hRp7SXwvnN4yRf2jzIowWcoKi53Stxl7bENgw7eh2ExcCEHXd1W2x4c6WVSJbdrhhI
	W9M7Ac95TdhzdBirWHZw+kAeloBNNhY1SuBtVkV5LHapsqN7jOfbqDAvEnWqucfSx2FB
	inZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=a8TMtvqP9k6NTrU/ln+QXWYsK32CsD5zKS+tbo1k/o8=;
	b=UdfMoxUWcnzL3FrdP2kH9UmGj1XNWlxWTqH/bNz4D65Oi8YPbFCAEhFSJhkqfZyld5
	QBPdXzI5tGT4Ke315Sq7pb866eJ2+b/VtBiDuMe46KUf8zwgrWCdytAx6a3/k+HaFPZu
	JLZJDwNBejzR28Dvw3Etw4Tu5qtvNssp3pX8OWh3RYE7s0+RnP2vMBqx/fnjMPtabqK+
	Akc66bF1hvdFajmSqg585bkUI1czVIReXo8X2iuMuMroCVE6jwUU5EVINigN4hmtEsIL
	PEtNnK5uEZsibFXPWIllv/gUlvdguvDWl9Uk99wwj5JzbjAG/xVrG6Wl2QXDajyHLSYi
	KxyQ==
X-Gm-Message-State: AD7BkJKrNC4rxpcEqUBcyk/corh1xhZ6mAlpI9x011l3a+GAgeUcfUVGyZahNCL5JxIULXSBw3I8FjemeH5Nng==
X-Received: by 10.140.196.74 with SMTP id r71mr15926407qha.41.1459817074319;
	Mon, 04 Apr 2016 17:44:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Mon, 4 Apr 2016 17:44:04 -0700 (PDT)
In-Reply-To: <CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
References: <1459717038-10549-1-git-send-email-max.krummenacher@toradex.com>
	<1459719934.7348.141.camel@linuxfoundation.org>
	<CAEHkU3VUnh78uOWRT2gYhAR5QOxYGDnc6J8RAsqkEkyj31HWfA@mail.gmail.com>
	<1459724450.7348.146.camel@linuxfoundation.org>
	<CAMKF1spSnyYGJWZOG6vs8kW7y3JjZBo7J843jWhOZzq-RYCeww@mail.gmail.com>
	<CALbNGRS7NEOTpCdV+Y-ZFzwTk-k9w2DPV_t9_VMP_4J6zM5CaQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Apr 2016 17:44:04 -0700
Message-ID: <CAMKF1srW021jUR3uPLiLcXRGBEGzCioA1EwpSMBCOHb9CF_q6A@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe][Patch] package.bbclass: fix host contamination warnings for source files
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
X-List-Received-Date: Tue, 05 Apr 2016 00:44:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 4, 2016 at 12:56 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Mon, Apr 4, 2016 at 4:36 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, Apr 3, 2016 at 4:00 PM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>>> I added some text to bugzilla. The gist is: In poky the sources are
>>>> not deployed.
>>>
>>> I don't understand that. If you mean playing sources in the -dbg
>>> packages, poky does that too. Is there some specific configuration
>>> Angstrom makes which triggers this?
>>>
>>> There was a bug in master recently which broke source file deployment
>>> into -dbg packages but that was a bug everywhere which was then fixed
>>> when we realised.
>>
>> Max, somewhere in thread you indicated angstrom 2015.12 release which
>> would be actually using jethro
>> and if it has been recently fixed in master than it would explain why
>> it worked on poky/master and not on angstrom
>> may be this fix should be cherry-picked to jethro.
> I checked Angstrom master but did not find matching commit. Which
> commit are you referring to?

Just ensure that angstrom master is using master of OE-Core ( latest )
and if problem still is there then second thing would be the toolchain it u=
ses
might be coming from meta-linaro, now see if there are any gcc patches
that are in OE-Core but not in meta-linaro which could cause this kind
of stuff

>
> Andreas

