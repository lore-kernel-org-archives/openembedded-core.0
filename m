Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3EF607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 19:23:36 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id s5so11523892qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 12:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OqXmKcr/4xR/1TaPsP0Rz5L/AsQ+SnC3VqU1nN5r/nE=;
	b=dzqprzHsn0Qq4M8INMpBxD1hlJuONr8D/+2odVUMD02CUnbMNUtTyZTTRKLuNC5Qa1
	JadJaXrS+ODZt3cAjyHMJps+YBncXAjUoF8v2pda7lnNbpqSjuvBWjcsfuvDrA91NXgK
	cm3kSKVzRuai3bO8mmeXs87dXyIR+r0J4q33QZWOsjNIPEHiCruognE5k8VfVZPB0UPj
	LuEytlvf/vTwgVDxS/jeO3V60uIaEu1hyyfjiIB4Np6wewiFlA4RgS50o2b+3gdD174c
	6UAlCe4fESNzmgSAyNG59wch2xcR1UyLZm3kWM1SMQmv2/7zojEruD8VS5zjoolvWkzR
	MKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OqXmKcr/4xR/1TaPsP0Rz5L/AsQ+SnC3VqU1nN5r/nE=;
	b=UrMf8YHH4P2zrFNh9bGg45YkNCfmb/ZtVQVzGv3Bga7eltYUJI6y3Bd5gwJUbhPr4v
	BX29kWhlFEaKAHU4eK6bxor2PeWh77/HDHqatkZ++jOFZK4H+jJt34mJTpiyOgrxtuvl
	P74jsvH7khq36BQAI9RwA0GhLT3pm3DLHsj26kB+Lk6hab60ZW2S5MH3j8rmZtN8dhNr
	gJtd3s1RBfsqZrJz8G4/X91iixGeeT5iTfMnIc82OKAruqixfg/q7hVg0WTyFZ+h9i+Y
	Nn230eEMxgLNEVsT5q5si0Jzz1rk994rMFfBT7pScnP+OiV4HHht8w9ajI8o3S6KxTX2
	Anpw==
X-Gm-Message-State: AD7BkJJ+y6KxGstJCNW+AsoRrF6zPBjRhTtz5FHrNirWc0dtUjvBHMGHOK7724g25WsgrMQnNP3BCw+lflrXAw==
X-Received: by 10.55.74.197 with SMTP id x188mr40769154qka.104.1458069816954; 
	Tue, 15 Mar 2016 12:23:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Tue, 15 Mar 2016 12:23:07 -0700 (PDT)
In-Reply-To: <56E8315D.2080906@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<15c0b6ce47e45b3be9db55c6b32bb2830766e932.1457535622.git.alexander.kanavin@linux.intel.com>
	<CALbNGRSZXjynMUy2B3Ke9k4g=DwFnhb2eO=xpJj4fGXHT2HBMw@mail.gmail.com>
	<56E8315D.2080906@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Mar 2016 12:23:07 -0700
Message-ID: <CAMKF1srbyaUBZO0Lu49x0FKoZR+-6CQcMX6h5ze8r4z9Yu6oHw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 02/24] python3-native: use the previous version of python-config script
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
X-List-Received-Date: Tue, 15 Mar 2016 19:23:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2016 at 8:59 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 03/10/2016 11:24 PM, Andreas M=C3=BCller wrote:
>
>> This one seems to report host's python3 version:
>>
>> [superandy@localhost sysroots]$
>> x86_64-linux/usr/bin/python3-native/python3-config --ldflags
>> -lpython3.4m -lpthread -ldl -lutil -lm -Xlinker -export-dynamic
>>
>> We are at 3.5
>
>
> This is because python3-config does not contain the version within itself=
,
> it reports the version of the python interpreter that it is run with. So
> NOTABUG.

If its supposed to report the version of python pack its coming with
and not the interpreter its run with
then how do you decide its not a behavior change ?
Lets keep the semantics as they were. I am perfectly fine to revert to
python 3.4 if thats what it takes.

