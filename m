Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
	[209.85.167.196])
	by mail.openembedded.org (Postfix) with ESMTP id 32BB574623
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 19:34:57 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id p125-v6so3242430oic.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2018 12:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fCCgGa7Y7AW9xjX1rcBGW8aDjgRXgmF6MMhkmyX61AU=;
	b=Q2jkQzd2rl605jOvxZQ2CUpKqlXUm0s+yn94IM/4F6zib+FTFlb/aauwASmztMu7w6
	ciVH78v92q/pv5XOA6xMqvLUBFo6LU7s1VXJEmF+S7KKGue0s9dC41ER0ngGQVwghErq
	uan64Ja0cxG1JFrQI2eoC78LkpqA2wg7dAlexp5duV2VMaeM8lyPTyuEN8vosDEvgP2/
	2W/BS0oA+W+36yklMTiUdl05Pet1P2rOHSjeDr5+DSmD9h7G7LrYudFENQppVu7Vb+8j
	RFTBs0vDpsTyVrDwt06b3DFPaS9wnopsODZrn7SfHOxPbavGjyO2iZ0RdE62L45fYImH
	PR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fCCgGa7Y7AW9xjX1rcBGW8aDjgRXgmF6MMhkmyX61AU=;
	b=nwdR+VhfKe8hL6sEtnsFRGRkVDDby2UdpKbc03Jrjp21oD+T86AjwSk+vJm/cyp0Zn
	nqK94S33P6Fj8ZskoAA4ztgZ20zSFC5U+k5BnyQXESz+nMvGaCcs0Ai4ha2N6DaMACdL
	3qiE+vfy/2DqKpzJ4Tta5LJmFMBAysMttE+BUc2mpOgRudXE2ipg+jE6tY5+43aL3np3
	LwQ3V0cG0to8SDg7yr4T0EshSabL1skbyfx9+yoSNy1i2TiHzowpNnXiyfKBIcWDnEzd
	SliCZU8r6SLtY6Q4uWX1nVPaXFTfyxkOD42NM/r7+yB1fvRyR9C3MsBZDykSvaeJlVbO
	cpVw==
X-Gm-Message-State: ABuFfogh9BgS85jBEq6zvUxQfoJySWkyda/k1zlDPMpDginQcAiBfqDk
	BnioL9q1k2Cuwpl94CYX83Qe2Z2ddvJ03Ekqkua7Z1+i
X-Google-Smtp-Source: ACcGV60BCS9Dj5NvQp84vCWf77R2LH88PEmEOjdkmt6vCZRnD2wsUmMNAoW0Kvan9Xfa7MEgyuRcEOPH2+fCOVfGZsY=
X-Received: by 2002:aca:42c4:: with SMTP id
	p187-v6mr3941222oia.306.1538073732776; 
	Thu, 27 Sep 2018 11:42:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:490c:0:0:0:0:0 with HTTP; Thu, 27 Sep 2018 11:42:12
	-0700 (PDT)
In-Reply-To: <CACS+7ZQngcTuxFbyq9Ydb=unRp0raKomB4UbutKNWTHtC2V-cw@mail.gmail.com>
References: <CALbNGRSPiWuTyLqaWbiH3UDF-maBQusnrbPCH_eWCxzm7n5rPA@mail.gmail.com>
	<CAMKF1sqGCuANwBQH6ZKuNUs1L+7N=WQSxAu1RmWjUooVs5bvxg@mail.gmail.com>
	<CACS+7ZQngcTuxFbyq9Ydb=unRp0raKomB4UbutKNWTHtC2V-cw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 27 Sep 2018 20:42:12 +0200
Message-ID: <CALbNGRTWz-_FPAuCZZRr2baakz99h+3UJpJAF--H0d_jx1od3A@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Run experience with security flags enabled
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
X-List-Received-Date: Thu, 27 Sep 2018 19:34:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 27, 2018 at 2:57 PM, Dan McGregor <danismostlikely@gmail.com> w=
rote:
> On Wed, Sep 26, 2018, 15:47 Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On Wed, Sep 26, 2018 at 2:25 PM Andreas M=C3=BCller <schnitzeltony@gmail=
.com>
>> wrote:
>>>
>>> Hi,
>>>
>>> from oe-core perspective my images are build on sumo (glibc 2.27). To
>>> see what to expect, I enabled security flags (and yes some recipes in
>>> my layers needed rework).
>>>
>>> Now that I have an image, I thought: let's give it a run. Apart of
>>> other issues (maybe later) I get on every startup an error message for
>>> ldconfig.
>>> systemctl ldconfig says:
>>>
>>> =E2=97=8F ldconfig.service - Rebuild Dynamic Linker Cache
>>>    Loaded: loaded (/lib/systemd/system/ldconfig.service; static;
>>> vendor preset: enabled)
>>>    Active: failed (Result: core-dump) since Mon 2018-09-24 19:05:04
>>> UTC; 2 days ago
>>>      Docs: man:ldconfig(8)
>>>   Process: 136 ExecStart=3D/sbin/ldconfig -X (code=3Ddumped, signal=3DS=
EGV)
>>>  Main PID: 136 (code=3Ddumped, signal=3DSEGV)
>>>
>>> Sep 24 19:05:04 raspberrypi3 systemd[1]: Starting Rebuild Dynamic
>>> Linker Cache...
>>> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Main
>>> process exited, code=3Ddumped, status=3D11/SEGV
>>> Sep 24 19:05:04 raspberrypi3 systemd[1]: ldconfig.service: Failed with
>>> result 'core-dump'.
>>> Sep 24 19:05:04 raspberrypi3 systemd[1]: Failed to start Rebuild
>>> Dynamic Linker Cache.
>>>
>>> Again somebody else seeing similar / remembers a fix?
>>
>>
>> I see similar issue in sumo as well
>> I do use security flags too and was not sure if that was the reason I
>> think its a good data point
>> Sadly I don=E2=80=99t yet have looked into the issue in detail
>
>
> GCC 7 and glibc don't play well together with static PIE. The real soluti=
on
> is to use GCC 8, but Ross made a workaround for this issue:
>
> http://git.openembedded.org/openembedded-core/commit/?id=3D5f64946b8740a5=
d944f48ec430470265703bfe5e
It seems I can confirm this: Debugging shows that the crash happens in
dl-relocate_static-pie.c _dl_relocate_static_pie line 41.

Will send this to sumo as soon as tested.

Andreas

