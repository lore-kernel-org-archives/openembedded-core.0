Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 48BB47882E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 13:11:40 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id n16so1598521oig.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 05:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=zCYyAG3JJNtlACsxmwdtNSzcuh29yq35lSoPeONPtZM=;
	b=XOal5SsUZWZF88SHFXc5f8GG+H4RQXKKX13e0BxPdIJ2FWJerhzJcpT6GpyROEyhMz
	erXef+X8zBQCFKGZZ2SMeVbEmfpOoV+EJercWNnr2idALWTmi6kc9iPVBtIuV7Olj6yJ
	FhbpgqITqvaeWoySiFIlCx9Fhg4kBLR1eovPkIGK+uJ5YZPIMpsJ/+kDvpufgSi+ySRl
	Ku8LRSUNNZNd71OqwE62bKi26S/gVrLnFEsSnySjdVoRTgCHIjD32SGvvH4AnZ6F86GI
	qb1W/eILGDVTgw4hOeaxngKaxZWF5ybI7XtmgnmOFsYBv9MtyNHQ8zexxErD9wslB40D
	dCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=zCYyAG3JJNtlACsxmwdtNSzcuh29yq35lSoPeONPtZM=;
	b=XF0P3elQ4saEXYVQpW1LzqLSo8zswcfU29b5nRiLZQmJFjYqFGxkmmgUzD59KQK2gc
	oh5JhQUrzCq88Vz6bTjMwQrlWnsLCgdiGvmobvuiKXBII4my1W6pef1O+YX4+iWKb6y7
	NtqfUv+92grUvZqyKkgUceBbat+EvLNT5I4NO3pMaOd994wcz/P0WfSIcrYv2/ZEqr6q
	Qx32sbSjU1oHgKnhB4RE3iWzNwNpLDEatPIHWoRdDyB0+OV2n8gD4AhwSnGLVq5D5sbZ
	DNbykCheLoXHamelghGPZ3QvN2teDnAyAT5e4AYzxDtiUDfoZZx9i7ZK9AG3A+L6kcy0
	AlTw==
X-Gm-Message-State: AJaThX7dHfoTpWejI2IuMp7ETPEhGSbtO3ZQ4gtR0X12J24RmNxLW2gL
	7fJ17vtlVILMRJo+HS777fWaZSSt
X-Google-Smtp-Source: AGs4zMZ3HXR+9kohU1mPFFyvkCQKYwh0i3YQJpBdteQ0z29Y+WlAcnng/2I2/ugzvtaJjEU2IqvzCw==
X-Received: by 10.202.117.141 with SMTP id q135mr1260532oic.109.1510924301909; 
	Fri, 17 Nov 2017 05:11:41 -0800 (PST)
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com.
	[209.85.218.45])
	by smtp.gmail.com with ESMTPSA id h7sm1548995oti.76.2017.11.17.05.11.40
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 05:11:40 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f45.google.com with SMTP id a132so1580072oih.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 05:11:40 -0800 (PST)
X-Received: by 10.202.83.131 with SMTP id h125mr1183245oib.329.1510924300384; 
	Fri, 17 Nov 2017 05:11:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 17 Nov 2017 05:11:39 -0800 (PST)
In-Reply-To: <1510875389-6932-1-git-send-email-tom.hochstein@nxp.com>
References: <1510875389-6932-1-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 17 Nov 2017 11:11:39 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrpw=uTymo6Kc8J3yxijxYB5nx+-B2kv1kw_Ys+zRP8jg@mail.gmail.com>
Message-ID: <CAP9ODKrpw=uTymo6Kc8J3yxijxYB5nx+-B2kv1kw_Ys+zRP8jg@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libepoxy: Fix build break for EGL_CAST dependency
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
X-List-Received-Date: Fri, 17 Nov 2017 13:11:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 16, 2017 at 9:36 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> This is a backport [1] to fix the following build error:
>
> | In file included from /home/r60874/upstream/xwayland/tmp/work/armv7at2hf-neon-mx6qdl-fslc-linux-gnueabi/gtk+3/3.22.17-r0/recipe-sysroot/usr/include/epoxy/egl.h:46:0,
> |                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.h:32,
> |                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:24:
> | ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c: In function 'gdk_wayland_gl_context_realize':
> | ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:179:43: error: expected expression before 'EGLContext'
> |                                          : EGL_NO_CONTEXT,
> |                                            ^
>
> [1] https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

