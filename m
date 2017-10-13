Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 505BA606A8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 12:27:24 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id n137so8803278iod.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 05:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3gtITamThJnRiNF+yec7j83p56nbCWAU8aOoMTg+uO0=;
	b=YhkWA6s57GHsM/Bpa1uS4DW4uz9ORjJbPt5S9iKz1j2dU4Gr79yd3JM6MLEFbsPdy5
	BonzG9vsne8A64O3txIOmR7ZVzcR/i9gLZ8UXRitbhMEIwKGtzjGirR5i7wTbwPse2c9
	S4L5AOwxPUhju0oDV9HfxDBzG12j9JPmXXBY07lhueWIz3XBmsY3mwC0H5Fxy8+j8hoP
	i4cm5lCE7BqhH7wVnJYHiMIFn2azkDREIo2yURV0p3WYDJQzDrcAnrv/nx755jhFU58Q
	BTP74agBhEZKAAaeBg9G6crgHkW+uVorAOi4ieexeZ6nCOz1f+lHxm+DQszthpbuz4FH
	yT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3gtITamThJnRiNF+yec7j83p56nbCWAU8aOoMTg+uO0=;
	b=PvfSG/CvSxrByooq+cjlsDFy7d43+PbyD5fdzatnAkImhZwuYdPAzgtpt2C/KrJLgo
	WiCbOnN9EI6OLztLtgOsD8LtCkJ0iGjnRqLHyVulpg1krNcAmXR6/klW8ukLgrsZnmRm
	yzWISJ1UZ6iTpyvCfTjkuFvjN7l8TUbksI4HNb3uPZLys6KRdGSmbU6p+mp3yl/eI4Qg
	Wr+s06P/6Wm+GqOB3+9F3Nx8kOMutm+1lulafYG/mJQKJkEAFYBbQlB0O5hE8cZKS6+j
	P8yFFC+L1FXIPqYOpPDwp48vFSiKuJhKF7WPb5stHK8IpOBMfA3oEK8TVtTqqbgc1wav
	tvTQ==
X-Gm-Message-State: AMCzsaUPbT3475hs59Dq5P7rhgpJGiqsfHmmDR8tWJcvHZKUk4aeFZi3
	CkBlCRXqqbzbkrIlo2GwyOSU7WJmjOLUBWeLH3+P7Q==
X-Google-Smtp-Source: AOwi7QBhy8fktBW8PwlwAKJISJQHHT4OO0Gr4X1eX4KgJp+nDB1iS1BfGLoQ1vBokUPqCTtjX9cqkGLy68WoGUKNW68=
X-Received: by 10.107.36.80 with SMTP id k77mr49992iok.176.1507897646283; Fri,
	13 Oct 2017 05:27:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Fri, 13 Oct 2017 05:27:05 -0700 (PDT)
In-Reply-To: <20171012191104.GJ9221@denix.org>
References: <20171012183523.130193-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012183523.130193-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<20171012191104.GJ9221@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Oct 2017 13:27:05 +0100
Message-ID: <CAJTo0LYu+si876jGp3fq6DG8S9bHj+VjK5xC60fQN300dT2iLQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] perl: upgrade to 5.26.1
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
X-List-Received-Date: Fri, 13 Oct 2017 12:27:25 -0000
Content-Type: multipart/alternative; boundary="001a1141909e90934d055b6cc7c2"

--001a1141909e90934d055b6cc7c2
Content-Type: text/plain; charset="UTF-8"

On 12 October 2017 at 20:11, Denys Dmytriyenko <denis@denix.org> wrote:

> On Thu, Oct 12, 2017 at 11:35:21AM -0700, leonardo.sandoval.gonzalez@
> linux.intel.com wrote:
> > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> >
> > Highlights:
> >
> >     * Patches rebased to 5.26.1 and just one removed
> >
> >     * Several configs values taken from upstream script uconfig[64].sh
> were introduced in
> >     config.sh, avoiding pre-processor issues.
> >
> >     * Several libraries paths now included a './' as prefix, because
> @INC does not
> >     include local paths.
>
> https://wiki.gentoo.org/wiki/Project:Perl/5.26_Known_Issues


Such fun!

Leo, have you tried an oe-core world build with perl 5.26?

Ross

--001a1141909e90934d055b6cc7c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 October 2017 at 20:11, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu, Oct 12, =
2017 at 11:35:21AM -0700, <a href=3D"mailto:leonardo.sandoval.gonzalez@linu=
x.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a> wrote:<br>
&gt; From: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzal=
ez@linux.intel.com">leonardo.sandoval.gonzalez@<wbr>linux.intel.com</a>&gt;=
<br>
&gt;<br>
&gt; Highlights:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Patches rebased to 5.26.1 and just one removed<br=
>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Several configs values taken from upstream script=
 uconfig[64].sh were introduced in<br>
&gt;=C2=A0 =C2=A0 =C2=A0config.sh, avoiding pre-processor issues.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0* Several libraries paths now included a &#39;./&#3=
9; as prefix, because @INC does not<br>
&gt;=C2=A0 =C2=A0 =C2=A0include local paths.<br>
<br>
</span><a href=3D"https://wiki.gentoo.org/wiki/Project:Perl/5.26_Known_Issu=
es" rel=3D"noreferrer" target=3D"_blank">https://wiki.gentoo.org/wiki/<wbr>=
Project:Perl/5.26_Known_Issues</a></blockquote><div><br></div><div>Such fun=
!</div><div><br></div><div>Leo, have you tried an oe-core world build with =
perl 5.26?</div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--001a1141909e90934d055b6cc7c2--
