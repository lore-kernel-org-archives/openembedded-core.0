Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id A41D17F79C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 20:43:28 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k24so8660617ioc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 12:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qNHoJu4PTOULl9TsZn06UodnYp45yJjX+8MGDnJJ35k=;
	b=Lat54buh2TqA/cJuGED/nhc8xbfJFsp+Ym+1RshaK/S0LYtiGTzAZHz0vLYclLEh9Z
	9u3jABkg8wr9BDy2CO7TKcTS7LTQHhOQ6Mk+w60qxLKZNNTyRQy73Ia/2Pz+Y/HULnPS
	ba4q/kmYEIfY7NQXURX6NBzLM39qTQJndtMP7gSwmh2KPh0PISnfR0nRDdKAN8d/FnMz
	aD5kruzJQfZOqOWaI5aC3sr+yU8jYwHUJNiLqqqu25ErygesHhst5mAtxixRoqlEqyIi
	B+3Ks8EtlDiqLuIKWvEaIrinmHyT2nSlB048KjHQH9h56JQxTgrkeSGwl2a/0aSTsxuH
	WKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qNHoJu4PTOULl9TsZn06UodnYp45yJjX+8MGDnJJ35k=;
	b=fgc6KiHhhkUaF49NPnOKuJDLvILw7uB+OZBm88Tz3PyXrbt7AxIRrDDY0iwfESh5fY
	ci+Nm2cMELu/WKhbzHqj1oXPEZiIse6XnmMsITnwHgTKGDqz6q3DU5rDvoZbp9VmHyvQ
	mBpvGK+m5wJXg/+ch+gdGPcFwT5ZJ4Sh59EqRVX8+X4xXtd0/k88a7kpcf4OJ6Jw/Zy6
	lAC0XRE6kxKefYfpwqoxvuoVv5O0OGit9cOmjaHApCsLPhbGlZK+BpwqqQzqMebBEtAg
	yVL5FTDh7hdsqH2lKhLQ4rt8L+nuYRZId886Xxgk40iloa3eIYl1knG2e5JG3MGN/fan
	eGNQ==
X-Gm-Message-State: APjAAAUJ2AiVianf4ESH+VCUlduCiVMDUfzblGwPRN4fDWdPoLv9qB+k
	rmqneXpsopjw13x9h7UYCR3TlD+d3inOTAr7+n0=
X-Google-Smtp-Source: APXvYqyinYvcgAAQK6rTuGWp/VE0/nKpCr/ASwrptTCK8J5TpYaFyQ2UkX+uY5Bryqz+sdRQnqdaNRpBIDyh4Povbec=
X-Received: by 2002:a5d:9ecc:: with SMTP id a12mr9593574ioe.267.1578602609763; 
	Thu, 09 Jan 2020 12:43:29 -0800 (PST)
MIME-Version: 1.0
References: <20200109202623.28936-1-schnitzeltony@gmail.com>
	<20200109202623.28936-4-schnitzeltony@gmail.com>
	<CANNYZj_h_e2JKm6FV__b1+HNg6H20ewMtn+Qvdpy1YJHSXUPKw@mail.gmail.com>
In-Reply-To: <CANNYZj_h_e2JKm6FV__b1+HNg6H20ewMtn+Qvdpy1YJHSXUPKw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Jan 2020 21:43:18 +0100
Message-ID: <CALbNGRT1VYbmDus-mApMcWn+w5wGEbNkVU7dzmnhpR=Pq=Jj=A@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/11] shared-mime-info: upgrade 1.10 -> 1.15
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
X-List-Received-Date: Thu, 09 Jan 2020 20:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 9, 2020 at 9:34 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> On Thu, 9 Jan 2020 at 21:27, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>>
>> -SRC_URI =3D "http://freedesktop.org/~hadess/shared-mime-info-${PV}.tar.=
xz"
>> +SRC_URI =3D "https://gitlab.freedesktop.org/xdg/shared-mime-info/upload=
s/b27eb88e4155d8fccb8bb3cd12025d5b/${BPN}-${PV}.tar.xz"
>> +SRC_URI[md5sum] =3D "5215f3d679a817de97eb8b0b911e9393"
>> +SRC_URI[sha256sum] =3D "f482b027437c99e53b81037a9843fccd549243fd52145d0=
16e9c7174a4f5db90"
>
>
> The changing hash in the URI will make automated upgrades impossible unfo=
rtunately. How about building from git repo?
>
> Alex
OK - V2 will come shortly

Andreas

