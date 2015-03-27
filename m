Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id BA3BA723B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 12:38:44 +0000 (UTC)
Received: by qgfa8 with SMTP id a8so124623574qgf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 05:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZzyDlDsMBFtnwd8PBAc1pHGddSnsNiSIPyNNEb90mfc=;
	b=WO9t8Asg1uY+tzbESdO6RkQF/75yS+g572I1I0ubyeQF6nyLBje1CK01U8eRccmKX7
	QaKpG9ivj2WDCDM5sE9Et6BZjB0aYRgA/iuVKuNYtQXF7/tdjkdaS5ZRscO6Oh4eZFFJ
	x3OTWDCeot9HFh9kybMUJd94STBCMCx//q0ZkyxXWBPR93q354pPODhgUGAHvQWI8nbU
	3l0jr8owj57DWcMV9izIm9OgfI8rxfLp86yeplLNOie9/yjXzGTIh+MfrYHwnc+BCxse
	XG8UXjWycXiCyu+KLMo9HQmYWhxk7R+zCiIBgGINEkvVLtnvGIT0MO//jzK15Lq01tEW
	CfBQ==
X-Gm-Message-State: ALoCoQmedP9/F3qgJdNXdPEJroeTVgLXyMJFiRXULbbmfnNlK5XzafSfCXjkNNlxRXeqxvDnRZLh
X-Received: by 10.55.24.159 with SMTP id 31mr39588715qky.74.1427459925236;
	Fri, 27 Mar 2015 05:38:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Fri, 27 Mar 2015 05:38:25 -0700 (PDT)
In-Reply-To: <1426714844.6733.7.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1425935453-15437-1-git-send-email-bruno.bottazzini@intel.com>
	<1426170396.16718.0.camel@bottazzini-ThinkPad-T430>
	<1426618681.2828.0.camel@bottazzini-ThinkPad-T430>
	<CAMKF1sqB_aYJOBJX-nmfLEsfDOEvHfKFWxEXjg7kkoV3DeG=gw@mail.gmail.com>
	<1426714844.6733.7.camel@bottazzini-ThinkPad-T430>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 27 Mar 2015 12:38:25 +0000
Message-ID: <CAJTo0LbhjqhELYWxueoBVxn8K8o_A0B3vdjrnM9kP_jrPEJehw@mail.gmail.com>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 0/4] systemd and dbus split into packages
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
X-List-Received-Date: Fri, 27 Mar 2015 12:38:45 -0000
Content-Type: multipart/alternative; boundary=001a11441908c66bc2051244699f

--001a11441908c66bc2051244699f
Content-Type: text/plain; charset=UTF-8

On 18 March 2015 at 21:40, Bottazzini, Bruno <bruno.bottazzini@intel.com>
wrote:

> Sorry, I didn't get why we can't consider this patchset to be included
> into master now.
>

Because when Khem said that, master was freezing so that we can make the
1.8 release.  We've now branched off the release branch so master is open,
but the current focus is on the release.

Ross

--001a11441908c66bc2051244699f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 March 2015 at 21:40, Bottazzini, Bruno <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bruno.bottazzini@intel.com" target=3D"_blank">bruno.bottazzini@i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":4my" class=3D"a3s" style=3D"overflow:hidden">Sorry, I didn&#39;t get w=
hy we can&#39;t consider this patchset to be included<br>
into master now.<br></div></blockquote></div><br>Because when Khem said tha=
t, master was freezing so that we can make the 1.8 release.=C2=A0 We&#39;ve=
 now branched off the release branch so master is open, but the current foc=
us is on the release.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11441908c66bc2051244699f--
