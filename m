Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 4F7437CAC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 17:19:42 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id j36so15759430qta.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2019 09:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=33SxZLbOq7Uls2J6vHPHwbDc6Mzg9vn+9rZSJzcC/No=;
	b=oC0fm3lzHuQTgOdMERiW2/qefPbnS6Txu/bbJecmoyXvSd55e398BoazV/q1jgyiq2
	TMRfy2Kf9/HgRPpfR4DETuzwOgcvjj2tGRK2EPJW3ZBTmPWL2w65SjlfHrZ6+g2AyRe/
	KUV5KJOWSOHh9oHsl65a5+MjjkUAnVvoWRrjHnMR19Vf3iVumj/dbxc/WmetcMjTTGg9
	j6O8lw2COWPR4odtTOGSOiio3giGiVcoQF2hrD+Rtmt0eYpoS5lG69lK/0dGOjKbvOUD
	nWhX9fexqmjL8ikMXgr3C6hT/vvtLm7/a3xlQcEzBBs2AB4IX25exsThNa5uVRogHJbH
	PcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=33SxZLbOq7Uls2J6vHPHwbDc6Mzg9vn+9rZSJzcC/No=;
	b=PPP7xaiHKEJUn/OGLHG/ByOzCItxfnoJvPZLHNaEwRAB/0BQy/Eh1tutccbQYixWKu
	wjfUV2OQe/gpkvMOoQ7vUgTLodWohMqTpu3J7KFChGlSyfuBs6AlB+HXI3VDJVun4LKO
	Bx80Suu0uzcDqYE9deZXNcfTaidY9k6Qyd5HWuSdpsDv3CHvUXIRQzt0f8o0Eddz3t5b
	vbUIsVovoncHK5pPcUZiPIdgI/ZA70QxCK96wEt5pivwOOHTGglzPexlz9k/IS/xmys3
	GsC7wLZXpY4kG0ADB0pIDs9NqBZLt/llmhTCeQITi5nZVYCbTfyDXkCqOqtibsnkcHpq
	yZwA==
X-Gm-Message-State: AHQUAuYsojldeEgYGWLJhlLg3EIKm2ZE8BNTvKlqVBP/0+CcjM/Xstvx
	6PncJI5gV7FotF5akE+5CrtEdD7YcGW+Lsw+Vv0=
X-Google-Smtp-Source: AHgI3IapNV6WvN8uCqP4xdpV+66cdOcuStQ2cqu9W9twe1hxX8v+OvqTPutlje+gHHnsv4pLbXGNLl6yCn7OJLGyt6Y=
X-Received: by 2002:a0c:8971:: with SMTP id 46mr18544951qvq.224.1551201582561; 
	Tue, 26 Feb 2019 09:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
	<CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
	<CAJTo0LaugPSscMvBwJz+ezbp7DMF9rs59Svkr8WnFb3+oM-KwQ@mail.gmail.com>
	<CAJTo0Lah677v4+3Q+acN8WEOF-r9bopn0OVw+icfCX5Jy7pxvQ@mail.gmail.com>
	<CAJTo0LZsdUCjKe9nR4ypj3x_ddR7XPBEvduUHDiE9esWa=X-jg@mail.gmail.com>
	<CAP9ODKqXDQkV8xHmTTmvs6GWUWNJrWB5XSnb37B=6-JjCci37Q@mail.gmail.com>
	<CAMKF1sqynSYK=u_qTXkteuSk1s951JAXucnN9r=8=CVOCUD=SA@mail.gmail.com>
	<CAP71WjyHDmhfM=zNaCL6V+YNuW_eumLfFk8iVapxC9iP+k=iiQ@mail.gmail.com>
In-Reply-To: <CAP71WjyHDmhfM=zNaCL6V+YNuW_eumLfFk8iVapxC9iP+k=iiQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2019 09:19:16 -0800
Message-ID: <CAMKF1sqBf-W_xAadC7sMY3eGF89aGuYVf9hekgY=RTKNPRMwVw@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Tue, 26 Feb 2019 17:19:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 26, 2019 at 7:36 AM Nicolas Dechesne
<nicolas.dechesne@linaro.org> wrote:
>
> On Tue, Feb 26, 2019 at 4:08 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Feb 26, 2019 at 4:26 AM Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> > >
> > > On Tue, Feb 26, 2019 at 8:58 AM Burton, Ross <ross.burton@intel.com> wrote:
> > > >
> > > > Patch has been accepted, so we need to cherry-pick the patch I mentioned.
> > >
> > > We will wait for 19.0.1 to be out to go to meson, so it will be
> > > applied there for sure.
> > >
> >
> > I am still seeing fredreno build failure with master-next
> > https://errors.yoctoproject.org/Errors/Details/230466/
>
> I was about to suggest that the right fix would be to get rid of that
> recipe, since it's been deprecated, see:
> http://bloggingthemonkey.blogspot.com/2016/11/a-quick-note-for-usersdistros.html
>
> So i checked the Layer index to find which layer has the recipe just
> to realize it's my own meta-qcom layer... oops.
>
> Are you ok, if I remove it, or do you need it for anything?

Deleting is fine

>
> >
> > > --
> > > Otavio Salvador                             O.S. Systems
> > > http://www.ossystems.com.br        http://code.ossystems.com.br
> > > Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

