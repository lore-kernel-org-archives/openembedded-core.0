Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9409977F70
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 22:00:13 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id v36so22692518ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 15:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=80vqoD10rXLdWeuXUBTxa2D7aQfvPeXWCGnfz9i5izo=;
	b=gGnlBXOoVpcrjl0n52gJXatoBIHCIgENWvObqi2Jv1Dons6cL65qG3CA/vMKjFi7As
	fhsTNsCef4WaJjyqeUPaZSX84RbEGVILwcEw4fShIC7DfOwVdH1TAH4jViaAGpoIzlJy
	uRScRCuoxmy7mWm5zqr2CjfK7hlAhM5VyNI9YOhyoPBkeFPaa6x0N00RzG+E5O94qv86
	mXuoPdzSLSvLC07XvUFuvm/er5tKUSMs5IdQwMhWuQ7ffj8WI7hj5m/3Q6h3iq5p7gOQ
	YPCf9OvARR2fw9/bc7KEXnh+O6UrGO0wDH57rADtRa1jvTvwW8RL6fLJoWZp5RiEztnj
	nFyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=80vqoD10rXLdWeuXUBTxa2D7aQfvPeXWCGnfz9i5izo=;
	b=Unmz6akKSIbdt3q1AkAmT1wUmVG7OLWvAfvOa3BfFibhELpvjzVaievm1UOtvkZSvH
	oQpDRh8h0fn2OdOwTB/ng1hcMw1Z+rOit+Xii+EPlxEAMuPYaSQxMqbj+fzUibDhRZmx
	UIZo8OC6G0BL+WtVq0pjfQPr1hyq2XcVCF5fyghSYKB/YnCMvM0w7D8k/lkkO+zZjhWg
	vT8qi1rYoZVfO+lMOn7oTmT7+Fq9vrHyZ5uSqYxrFbeNW2H3KC/1cXEeu2+ye+naM3cz
	yq6hzakF7YsFVfEcKSZCQ1HERlD0sP+GMpojAwsLxeaWJ5kpTmW70ZjXFgUNiAUUGQu/
	Bnvw==
X-Gm-Message-State: AHPjjUi32eGrqyo2eJ6segcfDaJ1wgbcqsGE3MoPREIcX9pG03pse/SE
	m0Zm8D9StKiTDgNwGY1X3Egf99NvYIMD
X-Google-Smtp-Source: AOwi7QDnMxlO1pF+x4volB2gpCAE5NGRUiHNJGX5ZSAdEoCw9Af7GNChqTN2ftwBXLLSFe8hHhUIag1euhV9Ue88M1I=
X-Received: by 10.107.32.70 with SMTP id g67mr8958379iog.77.1505167213702;
	Mon, 11 Sep 2017 15:00:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 14:59:53 -0700 (PDT)
In-Reply-To: <CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
References: <20170911213326.3480-1-california.l.sullivan@intel.com>
	<CAJTo0LZgBgWL0c9ZaDRFvvKxfULKeDkvGOhAiczGWMXWNrL=Yg@mail.gmail.com>
	<CAP9ODKpmxcObf-re-298t_uLu2HNCnByi+ic_b8EEJDJ-227iQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 22:59:53 +0100
Message-ID: <CAJTo0Lb42b-PT3_u-1vS-apadje4+ZYpP=8jB4q9oc2jmzjgPw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] initramfs-framework: bump PR and fix install-efi and setup-live modules
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
X-List-Received-Date: Mon, 11 Sep 2017 22:00:13 -0000
Content-Type: multipart/alternative; boundary="001a1140ae2c19c75c0558f10d66"

--001a1140ae2c19c75c0558f10d66
Content-Type: text/plain; charset="UTF-8"

On 11 September 2017 at 22:58, Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 11 September 2017 at 22:33, California Sullivan
> > <california.l.sullivan@intel.com> wrote:
> >>
> >> Bump initramfs-framework PR, as it was missed in the previous
> >> initramfs-framework patch.
> >
> >
> > There's no need to bump PR.  In the ideal world, the PR isn't assigned at
> > all.
>
> there is, the package moved across arches so adding the PR makes sure
> it is upgraded.
>

Surely the PR service handles this if you're running a feed.  If you're not
running a feed then this isn't a problem.

Ross

--001a1140ae2c19c75c0558f10d66
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 September 2017 at 22:58, Otavio Salvador <span dir=
=3D"ltr">&lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"=
_blank">otavio.salvador@ossystems.com.br</a>&gt;</span> wrote:<br><div clas=
s=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Mon, Sep 11, 2017 at 6:49 PM, Burton, Ross &lt;<a href=
=3D"mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 11 September 2017 at 22:33, California Sullivan<br>
&gt; &lt;<a href=3D"mailto:california.l.sullivan@intel.com">california.l.su=
llivan@intel.<wbr>com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Bump initramfs-framework PR, as it was missed in the previous<br>
&gt;&gt; initramfs-framework patch.<br>
&gt;<br>
&gt;<br>
&gt; There&#39;s no need to bump PR.=C2=A0 In the ideal world, the PR isn&#=
39;t assigned at<br>
&gt; all.<br>
<br>
</span>there is, the package moved across arches so adding the PR makes sur=
e<br>
it is upgraded.<br></blockquote><div><br></div><div>Surely the PR service h=
andles this if you&#39;re running a feed.=C2=A0 If you&#39;re not running a=
 feed then this isn&#39;t a problem.</div><div><br></div><div>Ross=C2=A0</d=
iv></div></div></div>

--001a1140ae2c19c75c0558f10d66--
