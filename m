Return-Path: <paul.barker@konsulko.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by mail.openembedded.org (Postfix) with ESMTP id C41AC7CBD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 12:27:20 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id p125so22000730oif.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 04:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wiSUqCTqwfYCNLSOs1NflO3txbdOqZ46IfCnXxDg9uo=;
	b=rn2RbYEeDibCVLqD634JwwBneettH0Xgr6aZScUWYuXoPFZ3VSFd8cYoq8QMx/Sok7
	Sox9vQLRZai7x1Cr7zpWb0QGQlHJCKuwlp7Ax33kMoIiaUdgwO8/vfNtOB5aOJwvQevf
	8DSrzc+sLfD+Ff+QthiT0ev2D+IW4yOIEbQKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wiSUqCTqwfYCNLSOs1NflO3txbdOqZ46IfCnXxDg9uo=;
	b=PKyDTFcvsjFl4gvJ4GuMnFBTy0pYxIeWilGEBejSpa5PTQ7ttY2Xc0TQcYeXCTNy9r
	iaMSjQY3kQTaTatbsNl0PYP52CSJK767lheeVFcPyqJyU+j6R/V+V2ZXVyYxsLOMtDmz
	UWcYcl2kpRjDVSgzxLTekd4knJzAnsJKdOVXv56uxKflcoDJrCb4iDSoAxtG6W+SBR6K
	vBU6B1tUz++E50nsnRdLeN5Ckur4OnoxgEDZ1yuzUNA1gOHSDI1j7NqjnvBzKEygpdTN
	lTM60LMOPI2TD8AtYmTPw9dTAhBnXw7IxWi2XZwV3tlrv2nunLy6qbX4M6kjnCI5vjNZ
	kj2w==
X-Gm-Message-State: APjAAAXX8AgVmRXKdHXmd3aPfRvnIIh6uOXW17kG3xYSfGjNOI0sbXBr
	mg/LAsR0ASpG1KE0OqmWuUEwIPe28cXmapnu9SFw9w==
X-Google-Smtp-Source: APXvYqyQteR/eomiJN8xZUrRw+QkIR4sK2z9DhGHZIqxHR7xSYdYzqxgKO4URZRLmZ6dT0tlDmOorOGGh89ueJXO3Ms=
X-Received: by 2002:aca:d985:: with SMTP id q127mr3067613oig.132.1579264041745;
	Fri, 17 Jan 2020 04:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20200113130827.7409-1-maxim.uvarov@linaro.org>
	<CAM9ZRVt00houpaZaKirGYgu1w_WRm1yqoio_G-wAgdyyGwuAAg@mail.gmail.com>
	<CAD8XO3a66v27ohEbrjEC=+XanfD1Fo_zXXo9TaFYSr+C+9+jDQ@mail.gmail.com>
	<CAM9ZRVut=Wu37sJ5A8fi3be-Bm3vWYepK4Sp2x=r7Et0xoy3WA@mail.gmail.com>
	<CAD8XO3bz8S2S5LzNpJgNuOrQB__LqdWNt2-k0rn8+sdxG3UcLA@mail.gmail.com>
	<CAM9ZRVvqkd_eqnkuCsqRGwQceoiwN-XO_xWLZaN4KwTQfeNnRA@mail.gmail.com>
	<CAD8XO3aeDxrACL9Tf1ng4cR7AiUCQuqz+fjhyPKdonqZQq8Gvg@mail.gmail.com>
	<CAM9ZRVsqxRzsndf3MDkGLHnzxDRv3aF+P8McMq96W11rDAF5_g@mail.gmail.com>
In-Reply-To: <CAM9ZRVsqxRzsndf3MDkGLHnzxDRv3aF+P8McMq96W11rDAF5_g@mail.gmail.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Fri, 17 Jan 2020 12:27:11 +0000
Message-ID: <CAM9ZRVs6axWKQENqLCA2Pr=nusuyia8jNEic+HPLN5zKyhR1OQ@mail.gmail.com>
To: Maxim Uvarov <maxim.uvarov@linaro.org>
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
X-List-Received-Date: Fri, 17 Jan 2020 12:27:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, 17 Jan 2020 at 12:17, Paul Barker <pbarker@konsulko.com> wrote:
>
> On Fri, 17 Jan 2020 at 11:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> >
> > On Fri, 17 Jan 2020 at 13:18, Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > On Mon, 13 Jan 2020 at 14:12, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > >
> > > > On Mon, 13 Jan 2020 at 17:00, Paul Barker <pbarker@konsulko.com> wrote:
> > > > >
> > > > > On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > >
> > > > > > On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > > >
> > > > > > > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > > > >
> > > > > > > > OE wic plugins create temporary file with the index of the line
> > > > > > > > tmp file name. This causes race in case several builds run in time.
> > > > > > > > Add more entropy as timestamp to remove this race.
> > > > > > >
> > > > > > > How would two wic images to be built in parallel with the same work
> > > > > > > directory? To my understanding an image recipe only supports building
> > > > > > > a single wic image.
> > > > > > >
> > > > > > > Thanks,
> > > > > > > Paul
> > > > > >
> > > > > > bitbake image1 image2 image3
> > > > > > all images build .wics and use about the same files, like firmware.
> > > > > > Issue is similar to that:
> > > > > > https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html
> > > > >
> > > > > Each image has its own work directory though.
> > > > >
> > > > > I'll take a look in more detail later today or tomorrow, if wic is
> > > > > writing temporary files outside of the work directory then that's a
> > > > > bug and should be fixed.
> > > >
> > > > Thanks. I saw bug in rawcopy plugin. All other places were patched due
> > > > to the same code.  I guess then for rawcopy temp files are in
> > > > DEST_IMAGE_DIR (which is common) instead of WORKDIR.
> > >
> > > I can't see how these files can possibly collide across parallel image
> > > builds. In the lines you changed in your patch, cr_workdir passed in
> > > as an argument set to imager.workdir (in
> > > scripts/lib/wic/plugins/imager/direct.py) which is a temporary
> > > directory created under options.outdir. image_types_wic.bbclass passes
> > > the -o option to wic to set the outdir to something under ${WORKDIR}.
> > > And different images have different WORKDIR paths. So things should be
> > > safe.
> > >
> > > Which branch & version of poky or oe-core are you using?
> > >
> >
> > zeus
> >
> > > DEST_IMAGE_DIR is not defined in openembedded-core. Are you sure
> > > that's the right variable name?
> > >
> >
> > DEPLOY_DIR_IMAGE
> >
> > > Could you provide full bitbake output showing the exact error message
> > > when this collision happens?
> >
> > See traceback here:
> > https://ci.linaro.org/job/ledge-oe/357/DISTRO=rpb,MACHINE=ledge-stm32mp157c-dk2,label=docker-stretch-amd64/console
>
> I think I'm starting to understand now. Is this the wks file?
> https://github.com/Linaro/meta-ledge/blob/zeus/meta-ledge-bsp/wic/ledge-stm32mp157c-dk2-optee.wks.in

Got it. Nasty little bug there!

In the rawcopy source plugin, dst is set as follows:

    dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'],
part.lineno))

If source_params['file'] is an absolute path (as it is in the wks file
above), the cr_workdir prefix is not applied by os.path.join(). So
instead it writes to a ".1" file next to the original image - this is
outside the WORKDIR and at risk of collision.

The solution is to fix dst above, maybe use
os.path.basename(source_params['file']). Could you give that a try or
do you want me to propose a patch?

Thanks,
Paul

