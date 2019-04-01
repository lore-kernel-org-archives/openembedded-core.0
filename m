Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id 124C16C129
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Apr 2019 20:41:11 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id y204so1425976itf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2019 13:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WHMdh2ysR/HsNtxVK6CBmJWZUCdPa+tfvcH7kFGxHF8=;
	b=SOavu5mXA3ETFxJAn9M+gmAmJlyssP1SWUmO9nWwix1HZwRc3JUswMrO6O5cTP+EAy
	7WqJBmjZddhJHlJg9b7QaPlReAhmM18TLphZl7+Xe0VKxJUu0PVHbhkEKqq6PD5mO1+O
	UXf64qv6JHfJA+nc02TYmHwxOi/8yYL9bag2rYQ67pdrihIwE9MEAv3TowZFSyh0Xiu3
	cP1RRjYbHZNTBWhffXfDFxa2S18lqMXk4KTw9wcglovvSywyJUWqR55BK6tc6MfU4N/3
	N5MZkW5knchcAHXukYjiNkBUx8Y7kJfSqiWV9LfcqNkCpJoiXVVArEkWdeYfED8VMUpn
	tEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WHMdh2ysR/HsNtxVK6CBmJWZUCdPa+tfvcH7kFGxHF8=;
	b=H/xJGmxxkYmG7lNZbfwLKw50bhjCX2CRo2/ISreZ4DD/jQ3SnyDGihkkdi3rrhqx8b
	Z8063OpqNE2ufp1QQ3ojIPMZp4vjjeWV4H1eTZz7CyI4rL3rOeJTqrksqBiS5AJwgVOR
	GcIHJadMjzr6m5gH0gXze4iucEZtUP0kXA/ycdf92ARpCkjbz18AKSxuUaWgOrljdSaI
	j9toBIYD1fIRpRhr9LyPh2q4lQEfzaDJGTxpvtbIrmrFG1GgjX5UPbwkoj6IfvLxjb7O
	rVJbDYAcjJamcp20S5rTGSuwIjgbHQbyO/IyGhQTtT9VFSZgiZiM89+jjjyaqASSb0Z0
	9Y6Q==
X-Gm-Message-State: APjAAAWk8+/ZDQBCH5EF8svOiJMbGCDoSaczQ/cdvr0SN4SHUusCoRBR
	R6Fw+APLHTBVB9UtRs1D1963OhqMTSRONFWolGk=
X-Google-Smtp-Source: APXvYqyTIHQWVo4qeT/c6CM/UY9IsouUEpBH0CuWnRiIZHktz7kfSNcfgEcr/YVG+3ScEwV00I9dw/MkBb0cG/fXc7A=
X-Received: by 2002:a02:5341:: with SMTP id n62mr46887634jab.57.1554151272987; 
	Mon, 01 Apr 2019 13:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190401160106.22928-1-schnitzeltony@gmail.com>
	<CANNYZj80ZqNn_6i9_Z0_HYJErcKrymQZmpiVGn_B56Jw3c7acw@mail.gmail.com>
	<CALbNGRTccK1a5QuZppiAOR1kG5mgMFzSYYg4+uHANRx3o3kCNA@mail.gmail.com>
	<CANNYZj_=Xwi4P88jqwPbR3xOom-LQkutRY=Vs11UcCpU=WTNtg@mail.gmail.com>
	<CALbNGRSOVaZWcMAVWn5RenYU40Cujvp1E_Jup7nqGW4kbHk-JA@mail.gmail.com>
	<CANNYZj-CwkZz0Z=fuE7BBCf-7mDbEd2T+VRR0hO98isGSn97=Q@mail.gmail.com>
In-Reply-To: <CANNYZj-CwkZz0Z=fuE7BBCf-7mDbEd2T+VRR0hO98isGSn97=Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 1 Apr 2019 22:41:01 +0200
Message-ID: <CALbNGRR+6bNoxiR0rMXQ0tDZeBi_bOhq=JfTsBDuT8dqwdG_Cg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2 V2] gobject-introspection: auto-enable/-disable gobject-introspection for meson
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
X-List-Received-Date: Mon, 01 Apr 2019 20:41:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 1, 2019 at 9:34 PM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> On Mon, 1 Apr 2019 at 21:26, Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
> > What about musl? Am not sure that my information is still valid:
> > Broken qemu or not?
>
> musl is fine with qemu.
>
Just saw glib-networking failing for 'gnutils' option -> yes this
option is not available.

The very first I have to do is fixing fallout by unrecognised meson
options - hurray it seems to work - damn it causes more extra efforts
:(

Andreas

