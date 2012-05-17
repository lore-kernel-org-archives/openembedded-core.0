Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SV2Ks-0005uM-Ms
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 17:09:51 +0200
Received: by qcso7 with SMTP id o7so1309625qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 07:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=/PdKiO2657VCPZk/amkcOVkZUtLx+RXmfyerv1Tlv6M=;
	b=J2zcMXVICKwN4l8Rc482SYvwbHu44mvl9mqPNGU985VD2qogXbKQbP4Q7uv+D9QgdB
	XSZnvITDqkBPAU6jJtUr4PfCIfamscNTmc0Jrf5KllymferM84tVBoQJL0BnPUhX77Tw
	p9roNW2EmXX6YGyouphgC8AUaz57fJ+VSL/5h/leKE2KfUPbI1P+RhtU+SAhKOAz6A+F
	X6xjOkmelbWE0T4EyMu8/TVVKbEzfwe7uk/KIO3Jl/ejaazkLB7gmXLcMs+EAkwj1Jmo
	ir9tb9+x5ihnCLhpV7nmP+MogguFvO7x71u6KaygdmFWyeB4gsU7w3wiGerEL1LktrWA
	6CBQ==
Received: by 10.50.169.65 with SMTP id ac1mr14114974igc.54.1337266786823; Thu,
	17 May 2012 07:59:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.25.18 with HTTP; Thu, 17 May 2012 07:59:26 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
References: <CAK18fxECi+PxHhW8pAm2URRE1ZF=h2_gEPXMvvioTQnhKGWYHw@mail.gmail.com>
	<CADkTA4MXvMJt=JhDKdjDR9o3nkYVWmfnEmRnC1cheju6Tbh0Sw@mail.gmail.com>
	<4FB50005.7000807@gherzan.ro>
	<CAPhnLPDzZfuRBKxR3Ru+2nvozRy4evhmtFUf2d-NmqNwY4RjZw@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 17 May 2012 17:59:26 +0300
Message-ID: <CAK18fxH5H5En0H+k7VccgGUCPApwcL7Xs+RV=1=pvRu_wRYXVQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkI+47T9mcu4rBW7RA8nKG2lNYM0E/S6PQPL2WFIv3/BdIkO129cBpA1Xo+3K42PXzCUGxq
Subject: Re: Linux-yocto 3.0 crashes at do_patch...
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 15:09:51 -0000
Content-Type: multipart/alternative; boundary=e89a8f3bac1fcc6f6104c03caf0d

--e89a8f3bac1fcc6f6104c03caf0d
Content-Type: text/plain; charset=ISO-8859-1

Today i just gave another try.... same result.


On Thu, May 17, 2012 at 5:56 PM, Flanagan, Elizabeth <
elizabeth.flanagan@intel.com> wrote:

> On Thu, May 17, 2012 at 6:41 AM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> > On 05/17/2012 04:38 PM, Bruce Ashfield wrote:
> >>
> >> On Thu, May 17, 2012 at 6:09 AM, Andrei Gherzan<andrei@gherzan.ro>
>  wrote:
> >>>
> >>> Today i ran into an issue that Florin Sarbu signaled sometime last
> week.
> >>> It
> >>> seems like do_patch crashes while compiling linux 3.0:
> >>>
> >>> ERROR: Logfile of failure stored in:
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
> >>> Log data follows:
> >>> | Branch meta-temp set up to track remote branch meta from origin.
> >>> | git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc
> >>> | Deleted branch meta-temp (was 620917d).
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> >>> line 434: yocto/standard/beagleboard-standard.scc: No such file or
> >>> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> >>> line 436: yocto/standard/beagleboard-standard.scc: No such file or
> >>> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> >>> line 437: yocto/standard/beagleboard-standard.scc: No such file or
> >>> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> >>> line 438: yocto/standard/beagleboard-standard.scc: No such file or
> >>> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/updateme:
> >>> line 441: yocto/standard/beagleboard-standard.scc: No such file or
> >>> directory
> >>> | readlink: missing operand
> >>> | Try `readlink --help' for more information.
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> | /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Function
> >>> failed:
> >>> do_patch (see
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpressa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_patch.10864
> >>> for further information)
> >>> | p/sysroots/i686-linux/usr/bin/scc: line 399:
> >>> yocto/standard/beagleboard-standard: No such file or directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> |
> >>>
> >>>
> /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i686-linux/usr/bin/scc:
> >>> line 399: yocto/standard/beagleboard-standard: No such file or
> directory
> >>> | ERROR. Could not find an excutable target for yocto/standard/base
> >>> | ERROR. Could not locate meta series for yocto/standard/beagleboard
> >>> | ERROR. Could not modify yocto/standard/base
> >>> NOTE: package
> >>>
> >>>
> linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:
> >>> task do_patch: Failed
> >>>
> >>> I didn't have time to understand were is the source of this problem
> but i
> >>> suspect that is a sever-sided issue as this was reproducible yesterday
> >>> even
> >>> if i didn't change anything in layers.
> >>
> >> I should remember to read all the way to the bottom :) I just
> >> configured and built the beagle
> >> board here, out of master. But my kernel is already fetched and
> >> complete, so I didn't
> >> run into any issues.
> >>
> >> We've got other reports of the servers pushing out a zero byte file
> >> for the kernel tree
> >> (again), so that very well could be what is happening here as well.
> >>
> >
> > That's my opinion as well. I think what we got from server is corrupted.
>
> I've seen reports of this but haven't been able to replicate it. I'll
> look at the server today and see if there is something going on from
> that end, however:
>
> 518M May 15 23:21 git2_git.yoctoproject.org.linux-yocto-3.0.git.tar.gz
> 620M May 16 00:13 git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz
>
> So at least as of yesterday, the tarballs exist and were not 0 byte
>
> -b
>
> > Anyway i'm was talking about a vexpressa9 machine based on beagleboard
> > kernel.
> > Hope somebody will find the fast fix for this. We need it asap.
> >
> >
> > @g
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> Elizabeth Flanagan
> Yocto Project
> Build and Release
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--e89a8f3bac1fcc6f6104c03caf0d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Today i just gave another try.... same result.<br>
<br><br><div class=3D"gmail_quote">On Thu, May 17, 2012 at 5:56 PM, Flanaga=
n, Elizabeth <span dir=3D"ltr">&lt;<a href=3D"mailto:elizabeth.flanagan@int=
el.com" target=3D"_blank">elizabeth.flanagan@intel.com</a>&gt;</span> wrote=
:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb"><div class=3D"h5">On T=
hu, May 17, 2012 at 6:41 AM, Andrei Gherzan &lt;<a href=3D"mailto:andrei@gh=
erzan.ro">andrei@gherzan.ro</a>&gt; wrote:<br>


&gt; On 05/17/2012 04:38 PM, Bruce Ashfield wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, May 17, 2012 at 6:09 AM, Andrei Gherzan&lt;<a href=3D"mail=
to:andrei@gherzan.ro">andrei@gherzan.ro</a>&gt; =A0wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Today i ran into an issue that Florin Sarbu signaled sometime =
last week.<br>
&gt;&gt;&gt; It<br>
&gt;&gt;&gt; seems like do_patch crashes while compiling linux 3.0:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; ERROR: Logfile of failure stored in:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpre=
ssa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca4=
3f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_pat=
ch.10864<br>


&gt;&gt;&gt; Log data follows:<br>
&gt;&gt;&gt; | Branch meta-temp set up to track remote branch meta from ori=
gin.<br>
&gt;&gt;&gt; | git reset --mixed 620917de59eeb934b9f8cf35cc2d95c1ac8ed0fc<b=
r>
&gt;&gt;&gt; | Deleted branch meta-temp (was 620917d).<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/updateme:<br>
&gt;&gt;&gt; line 434: yocto/standard/beagleboard-standard.scc: No such fil=
e or<br>
&gt;&gt;&gt; directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/updateme:<br>
&gt;&gt;&gt; line 436: yocto/standard/beagleboard-standard.scc: No such fil=
e or<br>
&gt;&gt;&gt; directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/updateme:<br>
&gt;&gt;&gt; line 437: yocto/standard/beagleboard-standard.scc: No such fil=
e or<br>
&gt;&gt;&gt; directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/updateme:<br>
&gt;&gt;&gt; line 438: yocto/standard/beagleboard-standard.scc: No such fil=
e or<br>
&gt;&gt;&gt; directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/updateme:<br>
&gt;&gt;&gt; line 441: yocto/standard/beagleboard-standard.scc: No such fil=
e or<br>
&gt;&gt;&gt; directory<br>
&gt;&gt;&gt; | readlink: missing operand<br>
&gt;&gt;&gt; | Try `readlink --help&#39; for more information.<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; | /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmERROR: Func=
tion<br>
&gt;&gt;&gt; failed:<br>
&gt;&gt;&gt; do_patch (see<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/work/vexpre=
ssa9-poky-linux-gnueabi/linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca4=
3f0dc71a7ee23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4/temp/log.do_pat=
ch.10864<br>


&gt;&gt;&gt; for further information)<br>
&gt;&gt;&gt; | p/sysroots/i686-linux/usr/bin/scc: line 399:<br>
&gt;&gt;&gt; yocto/standard/beagleboard-standard: No such file or directory=
<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; |<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; /media/HDD-WRS/yocto/2012-05-10-discovery-vea9/tmp/sysroots/i6=
86-linux/usr/bin/scc:<br>
&gt;&gt;&gt; line 399: yocto/standard/beagleboard-standard: No such file or=
 directory<br>
&gt;&gt;&gt; | ERROR. Could not find an excutable target for yocto/standard=
/base<br>
&gt;&gt;&gt; | ERROR. Could not locate meta series for yocto/standard/beagl=
eboard<br>
&gt;&gt;&gt; | ERROR. Could not modify yocto/standard/base<br>
&gt;&gt;&gt; NOTE: package<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; linux-yocto-3.0.24+git1+34e0d2b4b4e9778b31f9ea99ca43f0dc71a7ee=
23_1+6b4bf6173b0bd2d1619a8218bac66ebc4681dd35-r4:<br>
&gt;&gt;&gt; task do_patch: Failed<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I didn&#39;t have time to understand were is the source of thi=
s problem but i<br>
&gt;&gt;&gt; suspect that is a sever-sided issue as this was reproducible y=
esterday<br>
&gt;&gt;&gt; even<br>
&gt;&gt;&gt; if i didn&#39;t change anything in layers.<br>
&gt;&gt;<br>
&gt;&gt; I should remember to read all the way to the bottom :) I just<br>
&gt;&gt; configured and built the beagle<br>
&gt;&gt; board here, out of master. But my kernel is already fetched and<br=
>
&gt;&gt; complete, so I didn&#39;t<br>
&gt;&gt; run into any issues.<br>
&gt;&gt;<br>
&gt;&gt; We&#39;ve got other reports of the servers pushing out a zero byte=
 file<br>
&gt;&gt; for the kernel tree<br>
&gt;&gt; (again), so that very well could be what is happening here as well=
.<br>
&gt;&gt;<br>
&gt;<br>
&gt; That&#39;s my opinion as well. I think what we got from server is corr=
upted.<br>
<br>
</div></div>I&#39;ve seen reports of this but haven&#39;t been able to repl=
icate it. I&#39;ll<br>
look at the server today and see if there is something going on from<br>
that end, however:<br>
<br>
518M May 15 23:21 git2_git.yoctoproject.org.linux-yocto-3.0.git.tar.gz<br>
620M May 16 00:13 git2_git.yoctoproject.org.linux-yocto-3.0.tar.gz<br>
<br>
So at least as of yesterday, the tarballs exist and were not 0 byte<br>
<br>
-b<br>
<div class=3D"im HOEnZb"><br>
&gt; Anyway i&#39;m was talking about a vexpressa9 machine based on beagleb=
oard<br>
&gt; kernel.<br>
&gt; Hope somebody will find the fast fix for this. We need it asap.<br>
&gt;<br>
&gt;<br>
&gt; @g<br>
&gt;<br>
</div><div class=3D"im HOEnZb">&gt; _______________________________________=
________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a><br>
<br>
<br>
<br>
--<br>
</div><span class=3D"HOEnZb"><font color=3D"#888888">Elizabeth Flanagan<br>
Yocto Project<br>
Build and Release<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</div></div></blockquote></div><br>

--e89a8f3bac1fcc6f6104c03caf0d--
