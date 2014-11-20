Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 1FA8865C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 20:37:20 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so2797828qcy.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 12:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Be5nIn6DZF68QEq7mNsB2ErZR0i/TyS3l6lR6tnI6js=;
	b=lbTx7dDIRWKEu4oZszuOVB/Y2xOekfLeIQGKMJ4FGIWrJ/VQK/gvqKe3Fn5+OM1XqA
	xFHvhxDiF+fgbUk0x+c7YyiZmcSYnaAm8fwJHRxP1IUqrbhhwFBevrWLb7fPLZkVKmOv
	uKl2xkABf5pBpv9wI6Llwb7Jpah8gEs9wP9KVAke/iO98H4XE4ZPkInj8CydU15270Cn
	vZS/UdFuWdUTMTMxupkpLbdo42qw9t6HitPUWQGFrdLSSVqSRVELQWmriUNgQz3+G7kQ
	ekvOH0i9wZ8HyWMbk9JRXpkxDtblLL5eeNlCKfQcjLxqteHyRx2Kfg4PCMNNikIDdzbm
	RTtA==
X-Gm-Message-State: ALoCoQlTWpG6y869S+NAwfmQCEBd/PcrXy2d0Js6N+sDoaTS4A4tGWjsOB1u32He4TbxycF0prBZ
X-Received: by 10.140.17.67 with SMTP id 61mr354791qgc.59.1416515841236; Thu,
	20 Nov 2014 12:37:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 12:37:00 -0800 (PST)
In-Reply-To: <CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com>
References: <1415958217-16545-1-git-send-email-jian.liu@windriver.com>
	<1415958217-16545-4-git-send-email-jian.liu@windriver.com>
	<CACS+7ZTbE9Tggdpu2g3CyvtpZmyeGw2p5rzha67xZxyMpP2=Jw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 20:37:00 +0000
Message-ID: <CAJTo0LZnk9_mhigga3oU0yn8+U3j7GcOBdGCCdpCG0S+w+r0pw@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] logrotate: files will be over written when updating using rpm
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
X-List-Received-Date: Thu, 20 Nov 2014 20:37:25 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa2889693b0508504ba2

--001a11c0fa2889693b0508504ba2
Content-Type: text/plain; charset=UTF-8

On 19 November 2014 17:54, Dan McGregor <danismostlikely@gmail.com> wrote:

> > +CONFFILES_${PN} += "${localstatedir}/lib/logrotate.status"
>
> Part of me thinks this shouldn't be an installed file at all; instead
> it should be created by a post install script if it doesn't already
> exist. Thoughts?


Agreed - a file in /var/lib doesn't sound sensible considering it's often
on a tmpfs.

Ross

--001a11c0fa2889693b0508504ba2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 19 November 2014 17:54, Dan McGregor <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:danismostlikely@gmail.com" target=3D"_blank">danismostlikely@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&=
gt; +CONFFILES_${PN} +=3D &quot;${localstatedir}/lib/logrotate.status&quot;=
<br>
<br>
</span>Part of me thinks this shouldn&#39;t be an installed file at all; in=
stead<br>
it should be created by a post install script if it doesn&#39;t already<br>
exist. Thoughts?</blockquote></div><br>Agreed - a file in /var/lib doesn&#3=
9;t sound sensible considering it&#39;s often on a tmpfs.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11c0fa2889693b0508504ba2--
