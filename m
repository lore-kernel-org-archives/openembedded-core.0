Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com
	[209.85.218.53])
	by mail.openembedded.org (Postfix) with ESMTP id EC4C660745
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 17 Jun 2016 06:38:18 +0000 (UTC)
Received: by mail-oi0-f53.google.com with SMTP id w5so103956021oib.2
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 16 Jun 2016 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cxRpwHDmrxwgN6SpuzY3wAb3YeYsPQoHqSZTHC9GjVM=;
	b=mmJlY4lM2CntAZ+rYtMSbBxfQIL87x6VX6z2PYM7EwQ6RJ3TNhlsSubGWjKqCNc+2f
	er9666SpoM1GlLHPDSFogdX+a/ncaNmG3tEaX61XayYqZBS5/LR33iDTmouELSAasGvd
	hP9Epc61bPOODpAQvWo0aRd/cQ8V8tuwsCW4PxNGJx+/aN0hVLFhYX26MQDmSiNKpQk9
	US9A0aKuKP3+XTeB4czRPoydOn2iPfpPu5AwQg//ed1idF27cWOkLQKLQm4bicn3FPfJ
	8hqWkQ9wCjxqWUZu4nj6oCi7JR08A08Aa2Utz2+8uQquPPLmpjBsSb5itFsFzcgU1nw8
	WBhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cxRpwHDmrxwgN6SpuzY3wAb3YeYsPQoHqSZTHC9GjVM=;
	b=EN5xv9jDF0EV51v1EMRNJfIs2tC3z7MiylZxftDxSRG/gJ+IucuDh+FXxCBecLFj+R
	Ea8h7IR6j5cQRsl8Jo2l/mDBbsRf66jlHyYNIXdYKB530K+RYoOa6pDYADpjnM9JOFbH
	VNyzNqOXG+wZk+78SOBj23x1EzCsMfnKWSJKCvGhztvnnf93xvD3Fsf0VbMrYTtXUayL
	8TCiieG4fvNe0ZEsbyz+N9pqO3bAwziANhc1YdYX4UrdHew5C1w3CQJef8LR/2o48c6g
	s15hLWud7CzuwSlJjY91Rjc3wjvcYryMGSeeJrXtcTh7Swy1LHJSOOimmdv8qv1sWO5a
	W9Sw==
X-Gm-Message-State: ALyK8tKyZ9ttvi6hKrMsPVDJ9oYLAjSfWJPCoBLrJIowXmaXoz/K2wDfP+8G57XJLme/Ih55QtXg+i6WCBf5C4+N
X-Received: by 10.157.14.174 with SMTP id 43mr438380otj.83.1466145498974; Thu,
	16 Jun 2016 23:38:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.61.5 with HTTP; Thu, 16 Jun 2016 23:37:49 -0700 (PDT)
In-Reply-To: <CAJ86T=VA5n8==dM4v-AdToxkKfgTH3vTgOBijpJBYjcvygp_Jw@mail.gmail.com>
References: <1466099108-25355-1-git-send-email-mark.asselstine@windriver.com>
	<1466110195-5473-1-git-send-email-mark.asselstine@windriver.com>
	<CAJTo0LaEQgDLM2vxL7tGW8oefR6Jc1gEkWoHz4J7DkAD7N=sEA@mail.gmail.com>
	<CAJ86T=VA5n8==dM4v-AdToxkKfgTH3vTgOBijpJBYjcvygp_Jw@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 17 Jun 2016 09:37:49 +0300
Message-ID: <CAHiDW_Fg2tZFYWxewuNFJakxfd_2iHVcp2KgUJnWPdZqxTKZRw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] vte: bring back old version to support xfce4-terminal
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
X-List-Received-Date: Fri, 17 Jun 2016 06:38:19 -0000
Content-Type: multipart/alternative; boundary=001a113db4baa7e6370535739991

--001a113db4baa7e6370535739991
Content-Type: text/plain; charset=UTF-8

On 17 June 2016 at 04:10, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Thu, Jun 16, 2016 at 2:47 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >
> > On 16 June 2016 at 21:49, Mark Asselstine <mark.asselstine@windriver.com
> >
> > wrote:
> >>
> >> While waiting to hear back about my inquiry I did take some
> >> time to put together this patch that allows things that
> >> require the older vte to continue to build. Since xfce4-terminal
> >> lives in meta-openembedded this might make more sense to carry
> >> over there. I am sure folks will have an opinion so sending this
> >> out as an RFC.
> >
> > That's certainly a good argument for putting the old vte in meta-oe.
>
> The meta-oe layers generally have a higher priority than oe-core, so
> having an older version in meta-oe and a newer version in oe-core can
> lead to unexpected results.
>
>
As far as I know the versions are parallel installable so that should not
be a problem. I removed the old one as there was no need for it in oe-core.
Should have checked meta-oe as well, but there were just so many moving
parts to juggle here... The right solution should indeed be to add the old
one into the layer where it's needed.

Jussi

--001a113db4baa7e6370535739991
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On 17 June 2016 at 04:10, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Thu,=
 Jun 16, 2016 at 2:47 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@in=
tel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 16 June 2016 at 21:49, Mark Asselstine &lt;<a href=3D"mailto:mark.a=
sselstine@windriver.com">mark.asselstine@windriver.com</a>&gt;<br>
&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; While waiting to hear back about my inquiry I did take some<br>
&gt;&gt; time to put together this patch that allows things that<br>
&gt;&gt; require the older vte to continue to build. Since xfce4-terminal<b=
r>
&gt;&gt; lives in meta-openembedded this might make more sense to carry<br>
&gt;&gt; over there. I am sure folks will have an opinion so sending this<b=
r>
&gt;&gt; out as an RFC.<br>
&gt;<br>
&gt; That&#39;s certainly a good argument for putting the old vte in meta-o=
e.<br>
<br>
</span>The meta-oe layers generally have a higher priority than oe-core, so=
<br>
having an older version in meta-oe and a newer version in oe-core can<br>
lead to unexpected results.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br></div></div></blockquote><div><=
br></div><div>As far as I know the versions are parallel installable so tha=
t should not be a problem. I removed the old one as there was no need for i=
t in oe-core. Should have checked meta-oe as well, but there were just so m=
any moving parts to juggle here... The right solution should indeed be to a=
dd the old one into the layer where it&#39;s needed.</div><div><br></div><d=
iv>Jussi</div></div></div></div>

--001a113db4baa7e6370535739991--
