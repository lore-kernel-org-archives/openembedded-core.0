Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 825EC602D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 21:42:23 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id r145so72496486ior.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 14:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+HGqibMgc7j5vp9pEECrwUYeiFaQa4h5657qqQ3xVlM=;
	b=Y9T7FNoh5CumRrqcEnet0ZWgo5geW54JvPZe5YDQlxwr40c8D/e9EuiQo1DySSzJum
	oNbHo2U/StbOhYo2ZYm1MkG3MfHY8vwD5BbqKliImr0S7gDmaZrpqaBFKTPPJYeAicaq
	8aVZ2asm7F/N+7JsoIROY0vtPKcohEV5MtXpdmiMwNir56xgAq091f2WCAvnR9ocBDgN
	VNV7eeVmLk8+3AxuAVosPPeCL5grECnOYiqWenWl5PT5Fk6GL79s7gLlsFwuy8kGKrux
	ICzUglLH+xTicztJtjOSaSjQKumqWfl1vK02dClkkC+B2wL3gApqNbwYRDK/dFF80mWO
	TwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+HGqibMgc7j5vp9pEECrwUYeiFaQa4h5657qqQ3xVlM=;
	b=i74ggI693tao3b5QIl65S5Eopsz/WVdHrEuiXSStb0vSkpKITiNOiW0Rm3QFOdeLPP
	BrxNFIj2YafPxGNp4BJ2VpD/Tm2udREOsqX2ooqMn6pNvzN5flypXkorkM7wXcpGPdxX
	mEfbcG6+6nwGcBWGGlXt61KOGAe1PD9W/2115q4Jq3gO8DkCEDZlPaRDIoWi1gL6ZQQu
	Rj1+N3rUToYeFpV3cdQCUvshFu84M5T05AXZX4Ft4OokBAULcH0zefdVKRuIak5txwom
	mgeAX5MPOrJYyYKSLJHFYtQbPtMUcx4tvnU/FuTjpQiJyE1EUl9tZiaOEHzvEq1jF14u
	w+ng==
X-Gm-Message-State: AA6/9RlOndRQj14iRDTqRSEpq8q+Rfy8MIRh8GuTE3IGP9gKjguPwDyjTIXH2hy7j8BRuAxYo1EMAobphbCcZi89
X-Received: by 10.107.138.42 with SMTP id m42mr7166407iod.127.1475271744533;
	Fri, 30 Sep 2016 14:42:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Fri, 30 Sep 2016 14:42:04 -0700 (PDT)
In-Reply-To: <20160930221813.4209-1-mateusz.cz.nowakowski@gmail.com>
References: <20160930221813.4209-1-mateusz.cz.nowakowski@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 30 Sep 2016 22:42:04 +0100
Message-ID: <CAJTo0LZLygmJSSKQpt2Aa2-yKyjimy2OnK0BdOJ5W1YQDgjmLg@mail.gmail.com>
To: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gmock: fixed installing pkgconfig file and libraries on x86_64 architecture
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
X-List-Received-Date: Fri, 30 Sep 2016 21:42:24 -0000
Content-Type: multipart/alternative; boundary=001a113e8c4847edf1053dc07823

--001a113e8c4847edf1053dc07823
Content-Type: text/plain; charset=UTF-8

On 30 September 2016 at 23:18, Mateusz Nowakowski <
mateusz.cz.nowakowski@gmail.com> wrote:

> Signed-off-by: Mateusz Nowakowski <mateusz.cz.nowakowski@gmail.com>
>

As this is for meta-oe, the patch should go to
openembedded-devel@lists.openembedded.org.

Thanks,
Ross

--001a113e8c4847edf1053dc07823
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 September 2016 at 23:18, Mateusz Nowakowski <span dir=3D"ltr">&lt;<a =
href=3D"mailto:mateusz.cz.nowakowski@gmail.com" target=3D"_blank">mateusz.c=
z.nowakowski@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div id=3D":14q" class=3D"a3s aXjCH m1577cc015d756bda">Signed-off-by: M=
ateusz Nowakowski &lt;<a href=3D"mailto:mateusz.cz.nowakowski@gmail.com">ma=
teusz.cz.nowakowski@gmail.<wbr>com</a>&gt;<br></div></blockquote></div><br>=
As this is for meta-oe, the patch should go to <a href=3D"mailto:openembedd=
ed-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org<=
/a>.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">T=
hanks,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113e8c4847edf1053dc07823--
