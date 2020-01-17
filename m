Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yw1-f66.google.com (mail-yw1-f66.google.com
	[209.85.161.66])
	by mail.openembedded.org (Postfix) with ESMTP id DF1A47F7A3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:39:25 +0000 (UTC)
Received: by mail-yw1-f66.google.com with SMTP id h126so14277069ywc.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3ASy16U4BPS+6agR2n1JX/OGXieGZbhYK6O4MH0rXG4=;
	b=wV8FHp9ZaFxwSNBAVhosO+qbZ5ZLUa3SPb061CQagg9ct4Ust51bflw0jta7Mj5J7U
	9OMDtzsxwLzBWltNVdubv/iDWz+Doa9IopDt3tWOb34CLrrrjzPu+TT1nzYhZx2jNG5E
	CC02Y9HM+Fppz7aYcYTdPDNJ7PRdhaxoYWK4pH5xvapRdX5hRYr5+A4cNux49gfXq2X0
	l/f3ffR/TeomzIwvJCXmVBfj0Q2ck+zDJQYgL4xdjSJs2ZbFS1iHQeDxzml+NbbVlCul
	mUKjxmCKX1IcC3OqYsE88lI7hWYIrMbglOVRJa+RKo3kzIuPb8EUc8dBewkLuOAoBuWZ
	ehJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3ASy16U4BPS+6agR2n1JX/OGXieGZbhYK6O4MH0rXG4=;
	b=E4g/zZHtMnTkQrPFey/kEyuRjhZgvJUYPxvvN8KX4tgEpZC5kXujKN9Z4MaTHFZ969
	1CJSV1F/srxLSvLK+IsBgpfhi/08Q5PHe29Al4g8LBSNSa+Xsn+FYcaYyhQ7/nXYTFB0
	r3H+abRwA2tOlAs8vK4WLU4scn/apIyogvnY1gPXO3ZWs3hkBh7vdsgLa4WrdgToLmIA
	2ydTlbWO5ATVHzwl2aHUtfDrD6oU0xiJDG3dfMe7jY6yXGJluk8r0sl4PsZO9Qbk4jCw
	qXZYoPDpvwuN/WXo8jXXstlZFj89tRMyjzD1XSJREWhj77BsQhdvOSXewIl7QGgEHBCX
	f6aw==
X-Gm-Message-State: APjAAAW7C/KZlcjFGd57U4ajQKMEiQoCLOdVcpUMtdSQ+Q25sJwTe7zS
	LUb5TESQ/GH2VsVY9uqbJIPoDEs/SpeeP0GxKgi8fA==
X-Google-Smtp-Source: APXvYqzlLnpQpA+AnxRE5nttlA0hoPtJs9CNmBk8J5L2zQdLv//+j9WsBS2abrR8yV3roTe7TJQZxqKMs0HfNlt+eoo=
X-Received: by 2002:a81:1c15:: with SMTP id c21mr27172930ywc.408.1579264766665;
	Fri, 17 Jan 2020 04:39:26 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
	<CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
	<CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
	<CAD8XO3bz8S2S5LzNpJgNuOrQB__LqdWNt2-k0rn8+sdxG3UcLA@mail.gmail.com>
	<CAM9ZRVvqkd_eqnkuCsqRGwQceoiwN-XO_xWLZaN4KwTQfeNnRA@mail.gmail.com>
	<CAD8XO3aeDxrACL9Tf1ng4cR7AiUCQuqz+fjhyPKdonqZQq8Gvg@mail.gmail.com>
	<CAM9ZRVsqxRzsndf3MDkGLHnzxDRv3aF+P8McMq96W11rDAF5_g@mail.gmail.com>
	<CAM9ZRVs6axWKQENqLCA2Pr=nusuyia8jNEic+HPLN5zKyhR1OQ@mail.gmail.com>
In-Reply-To: <CAM9ZRVs6axWKQENqLCA2Pr=nusuyia8jNEic+HPLN5zKyhR1OQ@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Fri, 17 Jan 2020 15:39:15 +0300
Message-ID: <CAD8XO3ay-B71BNHQLtkj7WhZDe5s6vhpV79aZfjmsRYGJZZNxA@mail.gmail.com>
To: Paul Barker <pbarker@konsulko.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] wic: fix images build in parallel
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
X-List-Received-Date: Fri, 17 Jan 2020 12:39:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 15:27, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Fri, 17 Jan 2020 at 12:17, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Fri, 17 Jan 2020 at 11:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > >
> > > On Fri, 17 Jan 2020 at 13:18, Paul Barker <pbarker@konsulko.com> wrote:
> > > >
> > > > On Mon, 13 Jan 2020 at 14:12, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > >
> > > > > On Mon, 13 Jan 2020 at 17:00, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > >
> > > > > > On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > > >
> > > > > > > On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > > > >
> > > > > > > > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > > > > >
> > > > > > > > > OE wic plugins create temporary file with the index of the line
> > > > > > > > > tmp file name. This causes race in case several builds run in time.
> > > > > > > > > Add more entropy as timestamp to remove this race.
> > > > > > > >
> > > > > > > > How would two wic images to be built in parallel with the same work
> > > > > > > > directory? To my understanding an image recipe only supports building
> > > > > > > > a single wic image.
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > > Paul
> > > > > > >
> > > > > > > bitbake image1 image2 image3
> > > > > > > all images build .wics and use about the same files, like firmware.
> > > > > > > Issue is similar to that:
> > > > > > > https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html
> > > > > >
> > > > > > Each image has its own work directory though.
> > > > > >
> > > > > > I'll take a look in more detail later today or tomorrow, if wic is
> > > > > > writing temporary files outside of the work directory then that's a
> > > > > > bug and should be fixed.
> > > > >
> > > > > Thanks. I saw bug in rawcopy plugin. All other places were patched due
> > > > > to the same code.  I guess then for rawcopy temp files are in
> > > > > DEST_IMAGE_DIR (which is common) instead of WORKDIR.
> > > >
> > > > I can't see how these files can possibly collide across parallel image
> > > > builds. In the lines you changed in your patch, cr_workdir passed in
> > > > as an argument set to imager.workdir (in
> > > > scripts/lib/wic/plugins/imager/direct.py) which is a temporary
> > > > directory created under options.outdir. image_types_wic.bbclass passes
> > > > the -o option to wic to set the outdir to something under ${WORKDIR}.
> > > > And different images have different WORKDIR paths. So things should be
> > > > safe.
> > > >
> > > > Which branch & version of poky or oe-core are you using?
> > > >
> > >
> > > zeus
> > >
> > > > DEST_IMAGE_DIR is not defined in openembedded-core. Are you sure
> > > > that's the right variable name?
> > > >
> > >
> > > DEPLOY_DIR_IMAGE
> > >
> > > > Could you provide full bitbake output showing the exact error message
> > > > when this collision happens?
> > >
> > > See traceback here:
> > > https://ci.linaro.org/job/ledge-oe/357/DISTRO=rpb,MACHINE=ledge-stm32mp157c-dk2,label=docker-stretch-amd64/console
> >
> > I think I'm starting to understand now. Is this the wks file?
> > https://github.com/Linaro/meta-ledge/blob/zeus/meta-ledge-bsp/wic/ledge-stm32mp157c-dk2-optee.wks.in
>
> Got it. Nasty little bug there!
>
> In the rawcopy source plugin, dst is set as follows:
>
>     dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'],
> part.lineno))
>
> If source_params['file'] is an absolute path (as it is in the wks file
> above), the cr_workdir prefix is not applied by os.path.join(). So
> instead it writes to a ".1" file next to the original image - this is
> outside the WORKDIR and at risk of collision.
>
> The solution is to fix dst above, maybe use
> os.path.basename(source_params['file']). Could you give that a try or
> do you want me to propose a patch?
>
Nice!
I can test it today. Compilation will take some time...

Maxim.

> Thanks,
> Paul

