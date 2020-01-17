Return-Path: <maxim.uvarov@linaro.org>
Received: from mail-yb1-f194.google.com (mail-yb1-f194.google.com
	[209.85.219.194])
	by mail.openembedded.org (Postfix) with ESMTP id A50ED7FC1C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 21:26:51 +0000 (UTC)
Received: by mail-yb1-f194.google.com with SMTP id k128so6791203ybc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=6VU+zddjSDeZ8YOflwj7x9LnzxpxiRTp1TOllaSdLfo=;
	b=lsJet6Ij1sX88/oF+FgZgqpOA9X/m6BQkJvYSMyS2A1SuhpoBiKpjKOPnz6zLF4XuD
	2yMhb0xYnLh82TkS4oeZIeGPeD46gARC2T++7aEhYYxLRRih4SmB66LLexv9xAzXhDkL
	Xq6IfU0Int0JPqaBuEiI4xyrTSrs41BUHYuxkeHFUQCz1DUfb9RBsni8N40dDFa6gQUu
	uKVTI910ffCK6EaxHB3FkhZPHF5g/1buBRKFW/1reOMCp4cCs/EFcX8U1/jmjf+r70vW
	/7yjwnLBG5fesOfE/K9GTBox+VuJuKp2i7SBQxyMDo7zrCw+jjV4+GVSaBSfvspRWlka
	MnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=6VU+zddjSDeZ8YOflwj7x9LnzxpxiRTp1TOllaSdLfo=;
	b=gDBLMumVb3Z5Cngcws34uq/XXndovjQTOAymUb/j7W4QRFzSWhTEqPeGy0wxyVYyqw
	vM6A12fQM5wviFjFGhHRaa8JvtOldPCUDCNEHqmrhRk/QuAxGGN4CdxrZOzMYmgT/deu
	KTIGOXp9QWwZfvNXnJgONQqLJkEFO5IHh21Kx37OUlbiqqe4gaLi32ktthPA6OAm2+pQ
	EKLhjgjDNhJ9YNupQaT07DhPXeIRrQOrqJ3zQZjEMJ1Rj5MHYIo1a7QqFnubLo+79YGd
	55KR6VM6Mh2P1h1XslcZ1LFFcuwM5EisDM7hvvfRbIkUxlzmoa15OLTBQczz+yQkxen6
	lVRw==
X-Gm-Message-State: APjAAAVCcQFeVq0d1kDBVykL2lU+U1B+ezTENEcuwKEJospdkHcP5rOP
	QlXATZkFUaLjK54tau8ztF0dlMOZ9wq90SuF7zIDJA==
X-Google-Smtp-Source: APXvYqzQGzdNTA8v1jQUY/XqYl/aus4mFwhVzbFv81625boq8hmS5WIDK+JII+7RezHj90rlympjzO98AwGli/vWNgI=
X-Received: by 2002:a25:3481:: with SMTP id b123mr33562227yba.16.1579296412475;
	Fri, 17 Jan 2020 13:26:52 -0800 (PST)
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
	<CAD8XO3ay-B71BNHQLtkj7WhZDe5s6vhpV79aZfjmsRYGJZZNxA@mail.gmail.com>
In-Reply-To: <CAD8XO3ay-B71BNHQLtkj7WhZDe5s6vhpV79aZfjmsRYGJZZNxA@mail.gmail.com>
From: Maxim Uvarov <maxim.uvarov@linaro.org>
Date: Sat, 18 Jan 2020 00:26:41 +0300
Message-ID: <CAD8XO3ZfZbFUZKbwD7-gpUqCEX_Aw=4Y6sQbHWK__Gmau6DzOA@mail.gmail.com>
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
X-List-Received-Date: Fri, 17 Jan 2020 21:26:51 -0000
Content-Type: text/plain; charset="UTF-8"

works.  v3 is on the way..

On Fri, 17 Jan 2020 at 15:39, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> On Fri, 17 Jan 2020 at 15:27, Paul Barker <pbarker@konsulko.com> wrote:
> >
> > On Fri, 17 Jan 2020 at 12:17, Paul Barker <pbarker@konsulko.com> wrote:
> > >
> > > On Fri, 17 Jan 2020 at 11:59, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > >
> > > > On Fri, 17 Jan 2020 at 13:18, Paul Barker <pbarker@konsulko.com> wrote:
> > > > >
> > > > > On Mon, 13 Jan 2020 at 14:12, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > >
> > > > > > On Mon, 13 Jan 2020 at 17:00, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > > >
> > > > > > > On Mon, 13 Jan 2020 at 13:57, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > > > >
> > > > > > > > On Mon, 13 Jan 2020 at 16:31, Paul Barker <pbarker@konsulko.com> wrote:
> > > > > > > > >
> > > > > > > > > On Mon, 13 Jan 2020 at 13:08, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
> > > > > > > > > >
> > > > > > > > > > OE wic plugins create temporary file with the index of the line
> > > > > > > > > > tmp file name. This causes race in case several builds run in time.
> > > > > > > > > > Add more entropy as timestamp to remove this race.
> > > > > > > > >
> > > > > > > > > How would two wic images to be built in parallel with the same work
> > > > > > > > > directory? To my understanding an image recipe only supports building
> > > > > > > > > a single wic image.
> > > > > > > > >
> > > > > > > > > Thanks,
> > > > > > > > > Paul
> > > > > > > >
> > > > > > > > bitbake image1 image2 image3
> > > > > > > > all images build .wics and use about the same files, like firmware.
> > > > > > > > Issue is similar to that:
> > > > > > > > https://www.yoctoproject.org/pipermail/yocto/2018-June/041373.html
> > > > > > >
> > > > > > > Each image has its own work directory though.
> > > > > > >
> > > > > > > I'll take a look in more detail later today or tomorrow, if wic is
> > > > > > > writing temporary files outside of the work directory then that's a
> > > > > > > bug and should be fixed.
> > > > > >
> > > > > > Thanks. I saw bug in rawcopy plugin. All other places were patched due
> > > > > > to the same code.  I guess then for rawcopy temp files are in
> > > > > > DEST_IMAGE_DIR (which is common) instead of WORKDIR.
> > > > >
> > > > > I can't see how these files can possibly collide across parallel image
> > > > > builds. In the lines you changed in your patch, cr_workdir passed in
> > > > > as an argument set to imager.workdir (in
> > > > > scripts/lib/wic/plugins/imager/direct.py) which is a temporary
> > > > > directory created under options.outdir. image_types_wic.bbclass passes
> > > > > the -o option to wic to set the outdir to something under ${WORKDIR}.
> > > > > And different images have different WORKDIR paths. So things should be
> > > > > safe.
> > > > >
> > > > > Which branch & version of poky or oe-core are you using?
> > > > >
> > > >
> > > > zeus
> > > >
> > > > > DEST_IMAGE_DIR is not defined in openembedded-core. Are you sure
> > > > > that's the right variable name?
> > > > >
> > > >
> > > > DEPLOY_DIR_IMAGE
> > > >
> > > > > Could you provide full bitbake output showing the exact error message
> > > > > when this collision happens?
> > > >
> > > > See traceback here:
> > > > https://ci.linaro.org/job/ledge-oe/357/DISTRO=rpb,MACHINE=ledge-stm32mp157c-dk2,label=docker-stretch-amd64/console
> > >
> > > I think I'm starting to understand now. Is this the wks file?
> > > https://github.com/Linaro/meta-ledge/blob/zeus/meta-ledge-bsp/wic/ledge-stm32mp157c-dk2-optee.wks.in
> >
> > Got it. Nasty little bug there!
> >
> > In the rawcopy source plugin, dst is set as follows:
> >
> >     dst = os.path.join(cr_workdir, "%s.%s" % (source_params['file'],
> > part.lineno))
> >
> > If source_params['file'] is an absolute path (as it is in the wks file
> > above), the cr_workdir prefix is not applied by os.path.join(). So
> > instead it writes to a ".1" file next to the original image - this is
> > outside the WORKDIR and at risk of collision.
> >
> > The solution is to fix dst above, maybe use
> > os.path.basename(source_params['file']). Could you give that a try or
> > do you want me to propose a patch?
> >
> Nice!
> I can test it today. Compilation will take some time...
>
> Maxim.
>
> > Thanks,
> > Paul

