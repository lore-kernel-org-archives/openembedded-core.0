Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id 60E9D6C1F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:27:39 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b29so24582334lfq.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 05:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ADFDCeQuUaB/CX66pjM03OLVUXeO0ja9xb6XyhVcep4=;
	b=C+tknT0Qg8WSeAlUl7UtTXOIiJF5HGnhM3gHz2bPtN4promh0FLR5Kr5peTQjc89Y8
	dQ+2Y62SpXHUPHV4M/SGNCnjIILoV2Vc6PRkmfUOKn8dPU9Q6fNMiycS0PjYcAjfRBJI
	AxTGNT06z+OoqzuQUGW0+oR52qw75jq8uvzBkjgopSO+P+DUOXlkCutsD5qxKC1XmVGq
	5hIEZ1xKYANgW6eDNXSLRAXfiO2rRsPUcotPus9XNX1w9FIXr3yOoRX7xZngx1sViJoA
	UEfJ0L0188iZ8+2lQCyT48Eb7LqSq3WDSE3H/irACQWfCVFhVg71REqtBdPDtJTfVWQp
	HZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ADFDCeQuUaB/CX66pjM03OLVUXeO0ja9xb6XyhVcep4=;
	b=kczo47u0ZgSDzs6jIkVbQ/vmNGNducqqQIU2CUPvhbQqtDMncAjoRGURdgULvG4HEB
	y0QIka4mt+QUHxai7EaDvSG2ZTDUietkO9idmXOVvDu5s5ipKRoGHV7X6+nU+NeZvHsw
	ZjtzuJunOtJDqki816gepqrytiKIPJnz3ihH4cSIzIO4GtLf4p4cFZbs3oKGIWcwdZ0+
	kT7DS/8D37cxlMEA9rzYl6ZRl9rHH0gGCFsgS77+erObZO/o/DnkKPJZjpq/6XaA8FhH
	19XWUWE43JpJbhfmCBC9i3RUCzbvzYP50GiQGajrhnMsLnJali0qowGnKbj2EBmOSMde
	FYtA==
X-Gm-Message-State: APjAAAVyN/JvuevM3uJM3vesOvqVTjOjXNiW/zJ7SW8j63j4r8VQrYdt
	Rv2gS3ALNCZnkHyX2kpuiDCD9+1PijKIZIbIAig=
X-Google-Smtp-Source: APXvYqzNfEhrUH3+sMa/NxouXf3Yg9vuQ5xsauxsHlunLY82pY3tuMWUgn0gzR7RY7j4v8jhYD07lZdNmmj283H1ELE=
X-Received: by 2002:a19:f24e:: with SMTP id d14mr39705042lfk.184.1563971259662;
	Wed, 24 Jul 2019 05:27:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190724023833.13718-1-Qi.Chen@windriver.com>
	<CAJTo0LYZ-hVc9VW=LuSCDo1L-0DVXpnPdKEdzqR54fVrsqMa1A@mail.gmail.com>
	<8e654160-bb32-59dc-0c35-1bcdfc3da2a3@windriver.com>
In-Reply-To: <8e654160-bb32-59dc-0c35-1bcdfc3da2a3@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Jul 2019 08:27:28 -0400
Message-ID: <CADkTA4NdBzR9HR2viSZS8v0rKY=7ap+_5M0VDbg1Mtk91q++WA@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] container-image-busybox: add a reference container image
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
X-List-Received-Date: Wed, 24 Jul 2019 12:27:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 6:00 AM ChenQi <Qi.Chen@windriver.com> wrote:
>
> On 07/24/2019 05:38 PM, Burton, Ross wrote:
> > Are you aware of container-test-image.bb?  Curious what the point of this is.
> >
> > Ross
>
> Yes. It exists in meta-selftest, having an empty /usr/bin/theapp, for
> the purpose of selftest.
>
> I think we could have some reference image for container. So I added
> this small reference image, from which users could create container and
> use shell.
>

And you do realize that such references already exist in several other
layers ? So it would be best to do a study of those options, talk to the
interested folks and then we can propose something to oe-core.

> I expect it to be like busybox:glibc or busybox:musl in Docker Hub, with
> the major difference that we use symlinks to /bin/busybox.nosuid and
> /bin/busybox.suid while official ones use separate binaries.

Have a look at the ELCe presentations from 2018, this has been covered
in great detail at those events.

We can't just drop an image into core without documentation, examples,
test cases, etc. That's what I'm talking about as points of collaboration.

Cheers,

Bruce

>
> Regards,
> Chen Qi
>
> > On Wed, 24 Jul 2019 at 03:39, Chen Qi <Qi.Chen@windriver.com> wrote:
> >> Add a small busybox based container image.
> >>
> >> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> >> ---
> >>   meta/recipes-core/images/container-image-busybox.bb | 8 ++++++++
> >>   1 file changed, 8 insertions(+)
> >>   create mode 100644 meta/recipes-core/images/container-image-busybox.bb
> >>
> >> diff --git a/meta/recipes-core/images/container-image-busybox.bb b/meta/recipes-core/images/container-image-busybox.bb
> >> new file mode 100644
> >> index 0000000000..a4d63b0eea
> >> --- /dev/null
> >> +++ b/meta/recipes-core/images/container-image-busybox.bb
> >> @@ -0,0 +1,8 @@
> >> +SUMMARY = "A small busybox based container image."
> >> +LICENSE = "MIT"
> >> +
> >> +IMAGE_INSTALL = "busybox"
> >> +IMAGE_LINGUAS = ""
> >> +IMAGE_FSTYPES = "container"
> >> +
> >> +inherit core-image
> >> --
> >> 2.17.1
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

