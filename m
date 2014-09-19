Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f42.google.com (mail-yh0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id CAF7460030
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 14:01:31 +0000 (UTC)
Received: by mail-yh0-f42.google.com with SMTP id b6so574351yha.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 07:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=nWu/8VaSOfbeg/2mwWJvCWz2+kg3zZkwQfYJ6VMDvOE=;
	b=fJ0ZKIC7yXMR3zoKFTRW7obQpATnWAASBoikognSdF4iPLpXVWT0CbfF6yVGLKkNwK
	TEQtLmb4L72m7Pfnj/J3/duUpl1b+CInJUygpCXw2nXMMi4sO41mPEJXYkW9DlHeRKGO
	vYf1zSdVfVthv3jubNHqjzjWBiSSwCg/F8p+b28OR8T6BCjN+jshVTFEHN6/kioCiCV6
	EKxtrUjffXqvsGX4LACP7tuQTUvv3FSYbJs1bfb3GCJORGsxZtDVem3hxkCyHlYOkHD+
	ddpmUIANQR45BRN0r06Cj4H2LOzTVuUl7M+kvO39MydftJCjqtQn0CYUIkgJ/DRFhYeU
	Mj6A==
MIME-Version: 1.0
X-Received: by 10.236.228.100 with SMTP id e94mr819127yhq.8.1411135293116;
	Fri, 19 Sep 2014 07:01:33 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.44.19 with HTTP; Fri, 19 Sep 2014 07:01:33 -0700 (PDT)
In-Reply-To: <541C35ED.9040503@balister.org>
References: <1410964399-31077-1-git-send-email-philip@balister.org>
	<CAMKF1spggZ4tP2A6oOq_-mw9bPhrdYj9dWR9n5dr-5YNFyP_EQ@mail.gmail.com>
	<541C35ED.9040503@balister.org>
Date: Fri, 19 Sep 2014 11:01:33 -0300
X-Google-Sender-Auth: YSXFlzAreYa2z3XvPPDNfffpUQw
Message-ID: <CAP9ODKpLius2TySzb+mXLFrfmPWwuEtvCm=Fw1iLh_tPuLnTLA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Philip Balister <philip@balister.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass : Add support for cmake projects that use .S files.
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
X-List-Received-Date: Fri, 19 Sep 2014 14:01:37 -0000
Content-Type: multipart/alternative; boundary=001a11c2cad4e0584005036b8950

--001a11c2cad4e0584005036b8950
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 19, 2014 at 10:55 AM, Philip Balister <philip@balister.org>
wrote:

> On 09/17/2014 07:07 PM, Khem Raj wrote:
> > On Wed, Sep 17, 2014 at 7:33 AM, Philip Balister <philip@balister.org>
> wrote:
> >> UHD and GNU radio use the cmake build system. The toolchain file made
> >> from cmake.bbclass does not set the variable needs by cmake projects
> >> that use .S files. UHD added some .S files and these changes are
> required
> >> to build recent UHD.
> >>
> >
> > I dont know if this is right thing to do in a generic bbclass. Since
> > some packages might use bare assembler to compiler assembly files
>
> If a cmake project enables assembler and doesn't set the CMAKE_ASM_*
> flags to some sane defaults, the build fails. Settings these vars in the
> toolchain files fixes the problem.
>
> I am not a cmake guru, but it seems like we should be able to build code
> that builds OK natively.
>

I agree with Philip;  I think a sane default makes more sense than a broken
build.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--001a11c2cad4e0584005036b8950
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Fri, Sep 19, 2014 at 10:55 AM, Philip Balister <span dir=3D"ltr">&lt=
;<a href=3D"mailto:philip@balister.org" target=3D"_blank">philip@balister.o=
rg</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>On 09/17/2014 07:07 PM, Khem Raj wrote:<br>
&gt; On Wed, Sep 17, 2014 at 7:33 AM, Philip Balister &lt;<a href=3D"mailto=
:philip@balister.org">philip@balister.org</a>&gt; wrote:<br>
&gt;&gt; UHD and GNU radio use the cmake build system. The toolchain file m=
ade<br>
&gt;&gt; from cmake.bbclass does not set the variable needs by cmake projec=
ts<br>
&gt;&gt; that use .S files. UHD added some .S files and these changes are r=
equired<br>
&gt;&gt; to build recent UHD.<br>
&gt;&gt;<br>
&gt;<br>
&gt; I dont know if this is right thing to do in a generic bbclass. Since<b=
r>
&gt; some packages might use bare assembler to compiler assembly files<br>
<br>
</span>If a cmake project enables assembler and doesn&#39;t set the CMAKE_A=
SM_*<br>
flags to some sane defaults, the build fails. Settings these vars in the<br=
>
toolchain files fixes the problem.<br>
<br>
I am not a cmake guru, but it seems like we should be able to build code<br=
>
that builds OK natively.<br></blockquote><div><br></div><div>I agree with P=
hilip; =C2=A0I think a sane default makes more sense than a broken build.=
=C2=A0</div></div><div><br></div>-- <br>Otavio Salvador =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 O.S. Systems<br><a href=3D"http://www.ossystems.com.br" target=3D"_b=
lank">http://www.ossystems.com.br</a> =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D=
"http://code.ossystems.com.br" target=3D"_blank">http://code.ossystems.com.=
br</a><br><span>Mobile: +55 (53) 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0Mobile: <span id=3D"gc-number-27" class=3D"gc-cs-link" title=3D"C=
all with Google Voice">+1 (347) 903-9750</span></span><br>
</div></div>

--001a11c2cad4e0584005036b8950--
