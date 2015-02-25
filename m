Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id EDD3C71F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 12:23:38 +0000 (UTC)
Received: by mail-qg0-f46.google.com with SMTP id z107so2543564qgd.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 04:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ieNP+Hgglla0Iopj99ePGueUF2KGwq0fCDMQuCn1UvQ=;
	b=SQSgdvpMbrUWAwZLdffn8qqDODCyw/4poloEAb1XndN5GrqV+KgyQ+pAR/okiw6h7g
	ZOuDn/LNjbCBPPxkd1DmSjoebGsoPdLg34F5xfj+L+C4Q/NL8W47WnlBU0j7XNsq9t6y
	2ThVYDVGoMBLSUT0NOxyOs7pmINUHW/vRDktVP2VorJdxm/P1kSjwl44+q6zrohru9OH
	9EXLIOEqIU/DTDglo9eUSy4n+Oyo8dJB3vLz5sk1znqKL5M7CVawsGdIlEkux83eD1ec
	Y20/zWgzFuPrebTl/D72w62onnCTaOJm6QgkpBCU2qcGnB7HzxaQhfd/k/nALyhxC8Pb
	PCPA==
X-Gm-Message-State: ALoCoQkaPNCR+A+Dp1w4sRVpj/FigSSG5osvylOR2R5lZL2fkbJ6DfbGCX9wxKgr0CJ4InEgp6f6
X-Received: by 10.140.94.87 with SMTP id f81mr6162240qge.38.1424867019217;
	Wed, 25 Feb 2015 04:23:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Wed, 25 Feb 2015 04:23:19 -0800 (PST)
In-Reply-To: <1424816244.6730.14.camel@besquive-mobl.amr.corp.intel.com>
References: <1424685241-17960-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<54ECD3C2.8040005@linux.intel.com>
	<1424816244.6730.14.camel@besquive-mobl.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 25 Feb 2015 12:23:19 +0000
Message-ID: <CAJTo0LYsD6SZO71Q6BBnX0td8LZWBeRGWXJ-Ga2LbuWMYN6OHw@mail.gmail.com>
To: benjamin.esquivel@linux.intel.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: 'yes' within the path sets wrong variables
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
X-List-Received-Date: Wed, 25 Feb 2015 12:23:39 -0000
Content-Type: multipart/alternative; boundary=001a113a7fd8887271050fe8b43f

--001a113a7fd8887271050fe8b43f
Content-Type: text/plain; charset=UTF-8

On 24 February 2015 at 22:17, Benjamin Esquivel <
benjamin.esquivel@linux.intel.com> wrote:

> > So the configure file does not get regenerated as part of the standard
> > auto-reconf?
> >
> No, if the fix is only applied at the configure.ac file the unwanted
> behavior still shows up from the configure file.


Yeah, gcc isn't reconfigured.  Presumably there's a good reason for this. :)

Ross

--001a113a7fd8887271050fe8b43f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 February 2015 at 22:17, Benjamin Esquivel <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:benjamin.esquivel@linux.intel.com" target=3D"_blank">benjamin.=
esquivel@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><span class=3D"">&gt; So the configure file does not get regenerated =
as part of the standard<br>
&gt; auto-reconf?<br>
&gt;<br>
</span>No, if the fix is only applied at the <a href=3D"http://configure.ac=
" target=3D"_blank">configure.ac</a> file the unwanted<br>
behavior still shows up from the configure file.</blockquote></div><br>Yeah=
, gcc isn&#39;t reconfigured.=C2=A0 Presumably there&#39;s a good reason fo=
r this. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a113a7fd8887271050fe8b43f--
