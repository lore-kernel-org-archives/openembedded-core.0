Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD627BDB1;
	Thu,  3 Jan 2019 23:21:36 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c21so4684081qkl.6;
	Thu, 03 Jan 2019 15:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WvVDdGYiHJOi+gKag2tmLZPxTu1//oH9tpca0/Qg5mY=;
	b=JEvmigDJRD60CztcyzsjzV150x6gfpwCGgJXa2KsfXLMCLE1Bjfy7ROyUFnyaRll/Y
	OsDsnG2R5uiqcxNZCy0BoWHNdhpR+90RYGPYp/b/FnNqmQlB8x12gAneAtj6y90Fy04g
	AT193BoLALcWc2USDEPWBNxsV+AWsK7UxMrYwtXNNXZIJSMP5wh45UC14Cd2lliYFLku
	yZbJ1Od7TXfUCcp4Up/UO3ovYXw2vxB1M8qaKRhsy7DbgJNijg7Stb7h44o+3acK6u+Y
	wl6+GCEDxJ/B/7wr2RcQH+0oVsl09OyMLjCzg5kldeg86+krC9uBatnrPPSl5+5nLuvT
	bscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WvVDdGYiHJOi+gKag2tmLZPxTu1//oH9tpca0/Qg5mY=;
	b=h/llX57/vvjD6l1uaapc+fbfSo2CUApYESqn1BUz61gIvbtsoWqJn2Efk4VdLpR0MF
	b3oTped1oQUVbSEcdooyrMZXscFYwE8BhEQ96shJ06zcAF/l9Lv6YR741+W6NscsxiDx
	gcvmnAnryhyjc0c73tOExyJ3qegutR7oPDWThc41ZNEtSwKN4CKXDUycy/7qBO4hMZbR
	YuNu6mOOhrkW9yORS6O1ZhNt/NvN5m/r3HEtho6DN8/aVo1XRSIeMhpXJcD5aZDcUdss
	ma4UKYAcUHoYobHdtHUOPs5t4/RyR+FdHmL0V5O/22KVrg69hq7yhVZ2B7P96qQX0xQD
	3+GQ==
X-Gm-Message-State: AJcUukeerTAg7PcuPYa1iq1NCaTmUPVIweuYKwzgajqAumI7iXhIf1GS
	zxpXon24433fCKNESmPSIZlK/FW8+GsFZjHS1HI=
X-Google-Smtp-Source: ALg8bN6cNwk6kk6xyH1q1UdWzGk4bKWCYWF6bgUSyrGj4Th2Bnr4ebQbxy/04FrtRfWsMUmztKMvxboUP7sYON/D+Rs=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr45328456qka.206.1546557697105;
	Thu, 03 Jan 2019 15:21:37 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1sooPOtN-Y=0_cZ=Qv2viS5mwJAsm+yVsHpOJ5gpN65eZw@mail.gmail.com>
	<20190103225915.GB29139@localhost>
In-Reply-To: <20190103225915.GB29139@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 Jan 2019 15:21:11 -0800
Message-ID: <CAMKF1sqhDzQL9P1Vaw5Xczo0co_=NcP1-efnzW=tDnJT9cAq_A@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Yocto Project <yocto@yoctoproject.org>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] Dropping armv5 and armv5e tunes in 2.7
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
X-List-Received-Date: Thu, 03 Jan 2019 23:21:36 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks Adrian

On Thu, Jan 3, 2019 at 2:59 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Thu, Jan 03, 2019 at 02:01:42PM -0800, Khem Raj wrote:
> > Hello All
> >
> > You might have noticed a recent commit in gcc trunk
> >
> > https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=b232e6b58e3766bc66fe08fdb7bcba1bdadda8a2
> >
> > Which removed support for deprecated -march=armv5 and armv5e, this
> > will be released along with gcc-9 release which is upcoming and we
> > might be able to add gcc9 to 2.7 release or 2.8 release for sure.
> >
> > We still have non-thumb tunes for armv5 and armv4 in our tune pack, I
> > would like to propose a patch to remove them.
> >...
>
> Note that gcc 9 does *not* remove non-thumb armv4 support.
>

yes that's right. However, I was taking this time to find out if we can drop all
the ones besides armv5te even if gcc supported it unless there were OE users
who are still interested in supporting them and had devices running OE
which need them

> Non-thumb armv5/armv5e have been removed due to
> "have no known implementations".
>
> Non-thumb armv4 support was deprecated in gcc 6 together with armv2/armv3,
> but there are still people using recent gcc on StrongARM - which is
> non-thumb armv4.

OK, that's a fair point, however, in OE's case I only have reports from users
with armv4t devices, but it we can keep the armv4 arm-only tunes around along
with the arm-thumb v4 ones

>
> > Thanks
> > -Khem
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

