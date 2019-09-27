Return-Path: <alex.kiernan@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 77D2D7E544
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 19:48:29 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id q10so19477516iop.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 12:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lH0fKQqSYgavqM0C815uhqCG968JfjOo82QpXflyR7s=;
	b=HFVnAcqjGG6QGMEGuuua+dy2WQfxRJCDSi19XcWxODkdRfT8L5mCHEiYgRmZzueYdw
	Hu7FlwEjs4rMI+6WNGVuq1rgRlQ9pwTVpEUDMMPB7ohPVIUjx0xlDMO65b/ZJyvtrP6r
	rG/m5nrRbCTuSD+j7fa3Lm3cy9G5pR6/otuTFjksHL27k5L22WAZhfGRIUVj5IvKpnpB
	YsLWW/mytmMXK+TNLN5gaHIRfaCwkNIPBri+68Zzvzh9SgyE3ZlxGCotq5KndCqYkefT
	pOMQE6cs5z+/EWjIa7p7HgutCGMNEwmLM+XkrlTv50lO6wegT4GFqNFt0ryiCjl3UFMG
	XI2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lH0fKQqSYgavqM0C815uhqCG968JfjOo82QpXflyR7s=;
	b=CECD0GHuKS+7eJFdidkDp2JBph4tcH5Cx0SwZCJaaKaMu+U3cw9BUZPs10WE7VnLKO
	NXJ5tV5A76S5D47yh/z7vBIS7uoaCa/YoJOR2yPXkr7B3aHlPMyjeMTJlmKfBZVT9QNe
	DgqSsU5OI4r3zdKr4Wk5gYNhUyOjAjGNN1fgJeCjXMW1EPvoovyPHtER2iE5TyXjfMxh
	Nxf+E3Yvmts/OdKGqXLkCwv5hyC9A3zFZ4bzOFojRKPW71ONmEt7TKZnMilP8eh0ZjGi
	X4M5IUHzQZ2K8N1ACjdf1Gjx9eHHjFDJd5vHIRk8mwfXfm52pPkBn++IA3azM53mGQFz
	4D6g==
X-Gm-Message-State: APjAAAVxnIzlkLg5XdICeXUiq2NE5HjR+5sda4v86TCLxuevG55TbSD3
	S7ccV4TP3/MhQRv6EkZiTQiYTrVjNCcRhxM3njc=
X-Google-Smtp-Source: APXvYqyKAjtm/U1cki4Zy8fW6JUlX0NXQpSw86tPDec13v1h41dIpqnHZU8ZnXLHCcT2VElHtFNzef4yYt79sBAgFtg=
X-Received: by 2002:a92:603:: with SMTP id x3mr1070768ilg.295.1569613710156;
	Fri, 27 Sep 2019 12:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190916182114.17200-1-JPEWhacker@gmail.com>
	<20190926175751.12195-1-JPEWhacker@gmail.com>
	<CAO5Uq5TPxmXq0NWQixMLKmH9goUCXm8Ov=BaB8S_9Pmy8DPCYg@mail.gmail.com>
	<85ca2995-11fe-99e1-e2fa-866110a9f6b8@gmail.com>
In-Reply-To: <85ca2995-11fe-99e1-e2fa-866110a9f6b8@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 27 Sep 2019 20:48:19 +0100
Message-ID: <CAO5Uq5R+iGwF2CXu=yp=b6rzXf8BU+Mb8ECu0ed_Kn+jDVW38A@mail.gmail.com>
To: Joshua Watt <jpewhacker@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] classes/reproducible_build: Move SDE deploy to another directory
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
X-List-Received-Date: Fri, 27 Sep 2019 19:48:29 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 27, 2019 at 7:50 PM Joshua Watt <jpewhacker@gmail.com> wrote:
>
>
> On 9/27/19 1:03 PM, Alex Kiernan wrote:
> > On Thu, Sep 26, 2019 at 6:58 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >> The deployment of the source date epoch file had a race condition where
> >> any task attempting to read from the file would race with creation of
> >> the sstate archive for the do_deploy_source_date_epoch task. The
> >> creation of the sstate archive requires moving the directory to a
> >> temporary location, then moving it back. This means that the file
> >> disappears for a short period of time, which will cause a failure if any
> >> other task is running and trying to open the file to get the current
> >> source date epoch.
> >>
> >> The solution is to copy the source date epoch file to a separate
> >> directory when deploying so the file never disappears. When the file is
> >> restored from sstate, it is moved to the correct location after being
> >> extracted.
> >>
> >> [YOCTO #13501]
> >>
> >> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> >> ---
> >>   meta/classes/reproducible_build.bbclass | 12 ++++++++++--
> >>   1 file changed, 10 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
> >> index 8788ad7145c..99b749a9ee2 100644
> >> --- a/meta/classes/reproducible_build.bbclass
> >> +++ b/meta/classes/reproducible_build.bbclass
> >> @@ -39,19 +39,27 @@ inherit ${@oe.utils.ifelse(d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1', 'repr
> >>
> >>   SDE_DIR ="${WORKDIR}/source-date-epoch"
> >>   SDE_FILE = "${SDE_DIR}/__source_date_epoch.txt"
> >> +SDE_DEPLOYDIR = "${WORKDIR}/deploy-source-date-epoch"
> >>
> >>   SSTATETASKS += "do_deploy_source_date_epoch"
> >>
> >>   do_deploy_source_date_epoch () {
> >>       echo "Deploying SDE to ${SDE_DIR}."
> >> +    mkdir -p ${SDE_DEPLOYDIR}
> >> +    if [ -e ${SDE_FILE} ]; then
> >> +        cp -p ${SDE_FILE} ${SDE_DEPLOYDIR}/__source_date_epoch.txt
> >> +    fi
> >>   }
> >>
> >>   python do_deploy_source_date_epoch_setscene () {
> >>       sstate_setscene(d)
> >> +    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'), '__source_date_epoch.txt')
> >> +    if os.path.exists(sde_file):
> >> +        os.rename(sde_file, d.getVar('SDE_FILE'))
> >>   }
> >>
> >> -do_deploy_source_date_epoch[dirs] = "${SDE_DIR}"
> >> -do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DIR}"
> >> +do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
> >> +do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
> >>   addtask do_deploy_source_date_epoch_setscene
> >>   addtask do_deploy_source_date_epoch before do_configure after do_patch
> >>
> > This seems to have broken builds with reproducible builds enabled and
> > sstate downloaded from a mirror - I just get a blizzard of:
> >
> > ERROR: Logfile of failure stored in:
> > /home/akiernan/nanohub/build/tmp/work/x86_64-linux/automake-native/1.16.1-r0/temp/log.do_deploy_source_date_epoch_setscene.113823
> > WARNING: Setscene task
> > (virtual:native:/home/akiernan/nanohub/build/../poky/meta/recipes-devtools/automake/automake_1.16.1.bb:do_deploy_source_date_epoch_setscene)
> > failed with exit code '1' - real task will be run instead
> > ERROR: autoconf-native-2.69-r11 do_deploy_source_date_epoch_setscene:
> > Error executing a python function in exec_python_func() autogenerated:
> >
> > The stack trace of python calls that resulted in this exception/failure was:
> > File: 'exec_python_func() autogenerated', lineno: 2, function: <module>
> >       0001:
> >   *** 0002:do_deploy_source_date_epoch_setscene(d)
> >       0003:
> > File: '/home/akiernan/nanohub/build/../poky/meta/classes/reproducible_build.bbclass',
> > lineno: 58, function: do_deploy_source_date_epoch_setscene
> >       0054:python do_deploy_source_date_epoch_setscene () {
> >       0055:    sstate_setscene(d)
> >       0056:    sde_file = os.path.join(d.getVar('SDE_DEPLOYDIR'),
> > '__source_date_epoch.txt')
> >       0057:    if os.path.exists(sde_file):
> >   *** 0058:        os.rename(sde_file, d.getVar('SDE_FILE'))
> >       0059:}
> >       0060:
> >       0061:do_deploy_source_date_epoch[dirs] = "${SDE_DEPLOYDIR}"
> >       0062:do_deploy_source_date_epoch[sstate-plaindirs] = "${SDE_DEPLOYDIR}"
> > Exception: FileNotFoundError: [Errno 2] No such file or directory:
> > '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/deploy-source-date-epoch/__source_date_epoch.txt'
> > -> '/home/akiernan/nanohub/build/tmp/work/x86_64-linux/autoconf-native/2.69-r11/source-date-epoch/__source_date_epoch.txt'
>
> Sorry about that. It looks like destination directory isn't getting
> created. You can try giving
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=jpew/hash-equivalence&id=7177bb4c4c174f0852b984b9b2d2d23de92e70cd
> a try to see if it resolves the issue.
>

LGTM.

-- 
Alex Kiernan

