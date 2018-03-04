Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0932C6FF9F
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 02:28:46 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id a16so5708423pfn.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Mar 2018 18:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=dpMsVBf1aGRUi+BB3AwqF18HEh1ry7U9usCGx8QCB0E=;
	b=popwECZ3Y4PPiHd4VceAm4G0ejx41r0eNSDGZlp+hRYDBLrnBucjyefaWLcgUvnEeQ
	RHLoiTUYePwPZuPbrgpFBkg/fGeEsxZ+HdnpH5mD0aIUd2XM4Y2wiRwCYGBhVXz4H9VP
	Vic7FV5Fk5awIyEcGNuBb1fioNK4hf7Dt1joDyc5p8JeKwW/h8zU9LVs3lXeBtQo23jd
	qlzslUOTyJuUTzForv3agEYsb0W+zvjUI6UxNWjXL7eySbrsOTBlsI4im/gdobuywNcy
	b8S6k233XDgUV2sWVaRVM8MMdz9dZqHgHq4br/yzV+H7AVsNfjMK59j2YbpIvBDoaqOQ
	bLCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=dpMsVBf1aGRUi+BB3AwqF18HEh1ry7U9usCGx8QCB0E=;
	b=DZaGdYJWpnAEMZJS9ViwIXil8dXe1jhHXJHggIL/05NN1JVE9uFJB7VNbsnc5SewQT
	PuIblvdlzMv/Z4z/8mm6jmv0Yk+lm3XD/3RUPe0xz53EAH5M8+yyQbasOEKad4lBdYA6
	n2ZgmGH/9QzmRC+3r8MjcPUd7gwC/kl440pZUvgPnlR52YisDX+TijKKefAbM7b8SjnZ
	WwzOoVgeMd+buwFye9f8duoYQP3ZiqIA7qPKae4aUbdWg2D3xKRNUrVQKPVf7YEKPS73
	UGQERt/XhY+ttT1+EsGnvB1716UIQdDJ1U+CIIS8sZKi7RsqE8vPPAS/mQo3aLBRS4/4
	+4Mw==
X-Gm-Message-State: APf1xPDKDtKVNlsbxa+c/i3XXO0U04gBEWTHrqEAVqllEElQIVQ7qiOQ
	di2PtEOJIY2VIhvJ2Fjc3H2IqqPXiLT98uspdm0=
X-Google-Smtp-Source: AG47ELtWiPnqqNPBOAjQiNeDJ99gWg1HnOaszIQltefYVJhfMzknZX1iRuY+9qc/DrqPHAWI6+VMbrMemZ5cgKlv608=
X-Received: by 10.101.97.175 with SMTP id i15mr8447594pgv.55.1520130527815;
	Sat, 03 Mar 2018 18:28:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.170.69 with HTTP; Sat, 3 Mar 2018 18:28:17 -0800 (PST)
In-Reply-To: <CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
References: <20180302203314.32737-1-matt@madison.systems>
	<876d96e7-1425-df8e-621c-b2dd3c263d88@gmail.com>
	<CAGgRHJoNhQTyVN7ww5BAoQLs1GPkxO3rsdujLttH8V-84vFiAw@mail.gmail.com>
	<CAMKF1sqZr+tBB9wVR_aVp0U8X2v25_LX1fuRHSaH=JqAiOUPmg@mail.gmail.com>
	<CAP9ODKokRKXqyec5QCU1z5vaHut5a4kSJ9Zq=eAY=V_APirV7Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 3 Mar 2018 18:28:17 -0800
Message-ID: <CAMKF1sp5tRPs7yB9bCZShJnozK_cHTskcSSTUP-=Vag72sZZRg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/13] go1.10 update and misc improvements
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
X-List-Received-Date: Sun, 04 Mar 2018 02:28:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 3, 2018 at 2:45 PM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> On Sat, Mar 3, 2018 at 4:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sat, Mar 3, 2018 at 9:44 AM, Matt Madison <matt@madison.systems> wrote:
>>> Since it looks like I'll have to do a v5 on my series anyway, I can
>>> pull in that backport for the aarch64 issue.
>>
>> sure,  I would suggest we keep 1.9 around as well.
>
> I am against. Go is good to provide backward compatibility and keeping
> both just causes people to delay the update. We have some time to
> April release and thus any regression will be ironed out. Possibly
> wait until 1.10.1 is out but keeping two releases I am unsure it is
> needed.

Your disagreement is acknowledged.
There are larger systems written in go which haven't moved to go 1.10
and I know for sure influxdb and grafana are not working with 1.10
and there might be many more real world programs which will be in same
boat. This is no different then what we do with gcc releases where we
overlap them for couple of releases to smooth out transition.

