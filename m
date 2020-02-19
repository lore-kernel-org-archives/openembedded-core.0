Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id 36CB66159D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2020 02:17:33 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id n27so14491530vsa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2020 18:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PUz9L9dZh9YqpcT/D7Wo4XIgciqIbea4WAAZaJxZVNU=;
	b=GFKSZ4/vGfhHWLwvcUwxW133Wl0/zJfcZiTj9FN+Y5WFVH0im87k7C9Jojwm/ijkF5
	N63RGFuwA+YfRPN3y/i4Gvzq0aRyE76QXOj+l0iC97QTWTfki+d2LWkAqEpju6ph637M
	rTz5A/kPwjgwDBRu1Fug0+KgjGz5BHDErHYuux2AKJGP5esOb3bzzkpun2dNfp4SRPCS
	furXbqY7ajLIDP1GfzgsVNBZoHomYj5oUHtH/4UvbH/VSs71lEgYKj8lOjEZsm7ES4d2
	tI8FuZBRFbTtnC7boS4Xib14NcrElbbPxi+J4e6tfSxKt+m89NqNBKi5DWdBM4ndwVY1
	cg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PUz9L9dZh9YqpcT/D7Wo4XIgciqIbea4WAAZaJxZVNU=;
	b=W3ucw0czkqndtKDPFVIAuYSm25RbSUHd/cRyEWijyMToN8d/GwNsPBHzUQHW4TbJW7
	I4xyS2zFM4+7J02HI287dP/Mstxk8/9KDFEim4slvz+EfWwwDYQ6DZwrJsdanAmpCohI
	OF2ZvVAi+1mtaXYUCfEACuvN5d07SNAbgi3I5SZ0sI/CcwNOtVOJbRUsScxLsfpggTLK
	wSQkBwzXhBsmlm1Zk1XDbmIUw22ibl4I947lvSrZXUDXHcacJshtyeTslXtNtzyPVOBr
	97UXgzznt1JPKzUP6ICt2a2ygpvfpuVNYUCFC6AY8P1wy9n7Nh1+8nUFVTyM7UtsSD1+
	W8Cw==
X-Gm-Message-State: APjAAAU+hbvibDe4MhpCVQ2qHQaWFCOZArJ/FDKeu188W2aWXS5G0S+S
	77MfGWDxPFEcjRZBL2fbwbB3e+J/47GAJJc/I+Q=
X-Google-Smtp-Source: APXvYqzxDx5JgMr3y6iD6h9kqJV3dxDU5ed6Ih01ES8ThxP1ju7D8s/mB29XBFMzDII63IJQTYPCufTLxxkflgnOmHo=
X-Received: by 2002:a67:f41a:: with SMTP id p26mr13380732vsn.222.1582078654042;
	Tue, 18 Feb 2020 18:17:34 -0800 (PST)
MIME-Version: 1.0
References: <20200218224455.14551-1-scott.branden@broadcom.com>
	<20c4646f9a30462bb6c9ae0f49b71092@XBOX03.axis.com>
	<CAJ86T=XXS=3Mzj3sc_M3UjCar6-+EHR8ZkkA6LJm+VrLsdsXYw@mail.gmail.com>
	<9dde2b9f-e709-a7dd-df85-70af5e720af6@broadcom.com>
	<6868a2dc-13c0-dad0-c3ca-ec29ca085d94@broadcom.com>
In-Reply-To: <6868a2dc-13c0-dad0-c3ca-ec29ca085d94@broadcom.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 18 Feb 2020 18:17:22 -0800
Message-ID: <CAJ86T=Uwgi-f4AP9=xaprO6O4ZkDa2hBF6CKSevqJ4JTVVCu4A@mail.gmail.com>
To: Scott Branden <scott.branden@broadcom.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"OE Core \(openembedded-core@lists.openembedded.org\)"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] iproute2: add devlink support to iproute2
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
X-List-Received-Date: Wed, 19 Feb 2020 02:17:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 18, 2020 at 5:08 PM Scott Branden
<scott.branden@broadcom.com> wrote:
>
> On 2020-02-18 4:26 p.m., Scott Branden wrote:
> > Hi Andre,
> >
> > On 2020-02-18 3:36 p.m., Andre McCurdy wrote:
> >> On Tue, Feb 18, 2020 at 3:19 PM Peter Kjellerstedt
> >> <peter.kjellerstedt@axis.com> wrote:
> >>>> -----Original Message-----
> >>>> From: openembedded-core-bounces@lists.openembedded.org
> >>>> <openembedded-core-
> >>>> bounces@lists.openembedded.org> On Behalf Of Scott Branden via
> >>>> Openembedded-core
> >>>> Sent: den 18 februari 2020 23:45
> >>>> To: openembedded-core@lists.openembedded.org
> >>>> Subject: [OE-core] [meta-oe][PATCH v2] iproute2: add devlink
> >>>> support to
> >>>> iproute2
> >>>>
> >>>> Add devlink support to iproute2 recipe.
> >>>>
> >>>> Signed-off-by: Scott Branden <scott.branden@broadcom.com>
> >>>> ---
> >>>>   meta/recipes-connectivity/iproute2/iproute2.inc | 8 ++++++--
> >>>>   1 file changed, 6 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/meta/recipes-connectivity/iproute2/iproute2.inc
> >>>> b/meta/recipes-connectivity/iproute2/iproute2.inc
> >>>> index fc31b8444e..98793af88e 100644
> >>>> --- a/meta/recipes-connectivity/iproute2/iproute2.inc
> >>>> +++ b/meta/recipes-connectivity/iproute2/iproute2.inc
> >>>> @@ -15,11 +15,13 @@ inherit update-alternatives bash-completion
> >>>> pkgconfig
> >>>>
> >>>>   CLEANBROKEN = "1"
> >>>>
> >>>> -PACKAGECONFIG ??= "tipc elf"
> >>>> +PACKAGECONFIG ??= "tipc elf devlink"
> >>>>   PACKAGECONFIG[tipc] = ",,libmnl,"
> >>>>   PACKAGECONFIG[elf] = ",,elfutils,"
> >>>> +PACKAGECONFIG[devlink] = ",,libmnl,"
> >>>>
> >>>>   EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR}
> >>>> DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
> >>>> +                ${@bb.utils.contains('PACKAGECONFIG', 'devlink',
> >>>> 'devlink', '', d)}                                               \
> >>>>                   ${@bb.utils.contains('PACKAGECONFIG', 'tipc',
> >>>> 'tipc', '', d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
> >>> You can simplify the above to:
> >>>
> >>> EXTRA_OEMAKE = "CC='${CC}' KERNEL_INCLUDE=${STAGING_INCDIR}
> >>> DOCDIR=${docdir}/iproute2 SUBDIRS='lib tc ip bridge misc genl \
> >>>                  ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc',
> >>> d)}' SBINDIR='${base_sbindir}' LIBDIR='${libdir}'"
> >>>
> >>> but I also recommend to reformat it to make it more readable:
> >>>
> >>> EXTRA_OEMAKE = "\
> >>>      CC='${CC}' \
> >>>      KERNEL_INCLUDE=${STAGING_INCDIR} \
> >>>      DOCDIR=${docdir}/iproute2 \
> >>>      SUBDIRS='lib tc ip bridge misc genl
> >>> ${@bb.utils.filter('PACKAGECONFIG', 'devlink tipc', d)}' \
> >>>      SBINDIR='${base_sbindir}' \
> >>>      LIBDIR='${libdir}' \
> >>> "
> >> You could take the cleanup one step further by merging the recipe and
> >> the .inc file (and then including CCOPTS='${CFLAGS}' directly in the
> >> definition of EXTRA_OEMAKE).
> > Sounds like a more involved change that should be taken up in an
> > unrelated cleanup exercise?
> Actually, I see the reason to keep the inc file is so that you can
> support different versions of iproute2 if needed.
> Each recipe version would just require the inc file.

Yes, that's been the historical argument. However we don't typically
support multiple versions of a recipe at the same time in oe-core any
more and the maintenance effort and potential for bugs (e.g. in this
case, casual readers may not realise that the definition of
EXTRA_OEMAKE is split between the two files) means we've been
gradually cleaning up and merging .inc files into recipes.

