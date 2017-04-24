Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id 70B21606CA;
	Mon, 24 Apr 2017 00:30:37 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id m36so102243566qtb.0;
	Sun, 23 Apr 2017 17:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vHzFzJIQMTN7otudSoG5cWLJ9HIxCl6dXTXwF4LfwEE=;
	b=ud5W0Rw+1dawx6XvgNPLxGO3nv/2kfCUKmHtZx5RjrPl0IxNY/ku2RF5cOkRFe7kuq
	/5iF8ddr0sMxP9CcGUxFHx7xV5Qu+VLgUUzU22EjSYUqr5tS1TCCYcH3IuYQZIgFb6Gf
	DXEbsSq5MPoY/mdHBSdZ/KuKWUan11a/dYpsDkAYZ3HovdV/Xwsiwn+iqFFutwrNlSa6
	UDY0Uo3Yug7tlygCOT9qS75YdmTkVlKXbzysRIhczs+mE+EkZlg0F9HSw0znKdpX+fPk
	ex4PmYKX8osnGyftfSGOh8cD1bWOII+W5Q8JQFgAdCVAT2o6K7Oms7Aj90bjqH+Em90X
	7Q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vHzFzJIQMTN7otudSoG5cWLJ9HIxCl6dXTXwF4LfwEE=;
	b=hVAk6PaSAvGn3YY7XuIeU7aCMlBK7Dl1UPtF3bHNwGrmi6y7rjAeDiBwrnf1SPO1HU
	SLY+/+JSJOrrW6N5imHvkTZCqYE08lcekFxEGMAbH4u6g8w4U01aLlcOMBAUgILXO8gP
	G3mWw612bfJzM81vVyk2cnbH1QkIY8uWaecDMOg3f6OaUygKYJiU/Blh19Nt7Wd2OPWp
	nLquH9dyEnedz3ZdYeb4Y1D4hTKmJJeskkATdzMTeLBUS0sR0vhi9JJWolfBFjozLmWX
	SQgtHWv6YqI/LIuLCMCijP2YoVXC2ScKXxcmtQ6jqbCiFcNLTSSrz67tbP6IR5DWPyCN
	sMtw==
X-Gm-Message-State: AN3rC/5chLL4CoiYj6AWFc1bIRrnH4RwTrAuJ1O73GdjqcToRZBAKuwo
	kcnSVxQIn+7+CVXKTW6dj1mIGYYTCg==
X-Received: by 10.237.53.139 with SMTP id c11mr22897870qte.285.1492993839071; 
	Sun, 23 Apr 2017 17:30:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.145.143 with HTTP; Sun, 23 Apr 2017 17:30:38 -0700 (PDT)
In-Reply-To: <CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
References: <CAMKF1spGM+kugUDOB4kF7NAgSCt9vCw8GFT0nLKFRd2tHei=pw@mail.gmail.com>
	<CAJTo0La0mtVGyLysCnqi9EQmT+4L1eYRxgE-TV=3Va45jnt=Xg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 23 Apr 2017 20:30:38 -0400
Message-ID: <CADkTA4MjffrJ13GxaEAQusEU10jj0dUcUsyea36Y2gCy7HCVmA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [RFT] gcc7 and glibc-2.26 recipes
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
X-List-Received-Date: Mon, 24 Apr 2017 00:30:39 -0000
Content-Type: multipart/alternative; boundary=001a11c008ba6e08fa054ddeb7c8

--001a11c008ba6e08fa054ddeb7c8
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 23, 2017 at 6:04 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 16 April 2017 at 16:50, Khem Raj <raj.khem@gmail.com> wrote:
>
> > I have put together recipes for upcoming gcc-7 major release as well
> > as glibc 2.26 release, which we would target for next release ( 2.4 )
> >
>
> I threw these at the autobuilder and the errors are starting to appear:
>
> http://errors.yoctoproject.org/Errors/Latest/?filter=
> eddf6362e17899113f10cf53ed0db8a4b13ff3fc&type=commit
>
> Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I
> have your grub fix already).
>

I wasn't able to bring up the linux-yocto one .. but the 4.10 linux Yocto
should be at a high enough stable
release to build with gcc7. So if there's a direct link to that error, I
can take a closer look.

Bruce


>
> Ross
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c008ba6e08fa054ddeb7c8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Apr 23, 2017 at 6:04 PM, Burton, Ross <span dir=3D"ltr">&lt;<a =
href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
>On 16 April 2017 at 16:50, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.c=
om">raj.khem@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I have put together recipes for upcoming gcc-7 major release as well<b=
r>
&gt; as glibc 2.26 release, which we would target for next release ( 2.4 )<=
br>
&gt;<br>
<br>
</span>I threw these at the autobuilder and the errors are starting to appe=
ar:<br>
<br>
<a href=3D"http://errors.yoctoproject.org/Errors/Latest/?filter=3D" rel=3D"=
noreferrer" target=3D"_blank">http://errors.yoctoproject.<wbr>org/Errors/La=
test/?filter=3D</a><br>
eddf6362e17899113f10cf53ed0db8<wbr>a4b13ff3fc&amp;type=3Dcommit<br>
<br>
Repeated diffutils and rpcbind failures, but linux-yocto and grub too (I<br=
>
have your grub fix already).<br></blockquote><div><br></div><div>I wasn&#39=
;t able to bring up the linux-yocto one .. but the 4.10 linux Yocto should =
be at a high enough stable</div><div>release to build with gcc7. So if ther=
e&#39;s a direct link to that error, I can take a closer look.</div><div><b=
r></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-devel mailing list<br>
<a href=3D"mailto:Openembedded-devel@lists.openembedded.org">Openembedded-d=
evel@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-deve=
l" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>=
mailman/listinfo/openembedded-<wbr>devel</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a11c008ba6e08fa054ddeb7c8--
