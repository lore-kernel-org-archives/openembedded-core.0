Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 49B2673755
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 22:49:49 +0000 (UTC)
Received: by widdi4 with SMTP id di4so39262260wid.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 15:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zHJrF4Schdot36H/0vIiLRxWCpMhZK3Eo2eS3Z53NDk=;
	b=JVuU40vv/2QW3so9F+hh/w0Qw6RbhcgD/zyYsVEtlD3i9mXFhqwZs8SjemXIevBOq8
	Rp4iah7GFpwhKaW7onQMnA8EO2abqGkYjir8Jl8BSvsCTipolMLn6YVliEep4ogAYdqo
	3Qoy3hZ7aoxLQz15rViDkS1q70D5kwvVbPd8I+jurFq2Ly4laDCz8m+sJj3cOcjnFhx1
	bSmRlO1QcVdRzTLWE6FktlyetlvyRYPdBYLDKdf3DQgRFJl4Yru8bNPyPwbwWQGMrJWd
	nAVLOMB98YxKPqq7Rs1avzD2Y40z4f2LONoNyAN+SF2Kxe2RpBg6yTNJg9MKSeskYdWf
	Tg0A==
MIME-Version: 1.0
X-Received: by 10.194.57.109 with SMTP id h13mr1615323wjq.67.1430952590483;
	Wed, 06 May 2015 15:49:50 -0700 (PDT)
Received: by 10.28.157.193 with HTTP; Wed, 6 May 2015 15:49:50 -0700 (PDT)
In-Reply-To: <1430947966.8074.108.camel@linuxfoundation.org>
References: <cover.1430443583.git.bruce.ashfield@windriver.com>
	<1430521154.18360.28.camel@linuxfoundation.org>
	<55440C90.5060605@windriver.com> <20150502081346.GD2366@jama>
	<55458D0D.6070904@windriver.com> <20150506144241.GA2067@jama>
	<554A2C1C.5040304@windriver.com> <20150506153325.GB2067@jama>
	<1430927086.8074.65.camel@linuxfoundation.org>
	<20150506160708.GD2067@jama> <554A536C.5060608@windriver.com>
	<1430947966.8074.108.camel@linuxfoundation.org>
Date: Thu, 7 May 2015 00:49:50 +0200
Message-ID: <CA+chaQfarqYbkkfZyCpFfNm9qLXkOPf4HAnnmygDmBAVYt3BXw@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 06 May 2015 22:49:50 -0000
Content-Type: multipart/alternative; boundary=047d7ba96ef0d8a7b60515719c30

--047d7ba96ef0d8a7b60515719c30
Content-Type: text/plain; charset=UTF-8

I use tmpfs in most of my builds, so in most cases when I see the error
from the build, tmpfs is already gone (purged by next build executed on the
same sever).

On Wed, May 6, 2015 at 11:32 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2015-05-06 at 13:46 -0400, Bruce Ashfield wrote:
> > On 2015-05-06 12:07 PM, Martin Jansa wrote:
> > > I've used master-next week or two ago (mostly to test bluez4 and
> python3
> > > changes) and soon after that dropped all linux-yocto related changes
> > > from it assuming that it's indeed cause for the issues I'm seeing, but
> > > it's not and it's still failing with master as well (and my
> > > jenkins/world builds are just small portion of my builds executed
> > > elsewhere where I see similar issues).
> >
> > Richard: How can we sort out the differences between the build
> > environment that Martin uses versus what the autobuilder is showing?
> >
> > There's nothing particularly complex happening during that build,
> > it's a checkout and generation of a config.
> >
> > I'm unable to reproduce any of the failures, and neither is the
> > autobuilder.
>
> This is a tough one and I'm struggling a little. We could try looking at
> the tmp/stamps/qemux86-poky-linux/linux-yocto/* files (sigdata in
> particular) as well as
> tmp/work/qemux86-poky-linux/linux-yocto/*/temp/log.task_order
>
> Martin, would you be able to share the above somewhere? I'm hoping this
> would give us a clue as to what the difference is between the builds and
> allow us to reproduce the problem.
>
> Cheers,
>
> Richard
>
>
>

--047d7ba96ef0d8a7b60515719c30
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I use tmpfs in most of my builds, so in most cases when I =
see the error from the build, tmpfs is already gone (purged by next build e=
xecuted on the same sever).</div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Wed, May 6, 2015 at 11:32 PM, Richard Purdie <span dir=
=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><span class=3D"">On Wed, 2015-05-06 at 13:46 -0=
400, Bruce Ashfield wrote:<br>
&gt; On 2015-05-06 12:07 PM, Martin Jansa wrote:<br>
</span><span class=3D"">&gt; &gt; I&#39;ve used master-next week or two ago=
 (mostly to test bluez4 and python3<br>
&gt; &gt; changes) and soon after that dropped all linux-yocto related chan=
ges<br>
&gt; &gt; from it assuming that it&#39;s indeed cause for the issues I&#39;=
m seeing, but<br>
&gt; &gt; it&#39;s not and it&#39;s still failing with master as well (and =
my<br>
&gt; &gt; jenkins/world builds are just small portion of my builds executed=
<br>
&gt; &gt; elsewhere where I see similar issues).<br>
&gt;<br>
&gt; Richard: How can we sort out the differences between the build<br>
&gt; environment that Martin uses versus what the autobuilder is showing?<b=
r>
&gt;<br>
&gt; There&#39;s nothing particularly complex happening during that build,<=
br>
&gt; it&#39;s a checkout and generation of a config.<br>
&gt;<br>
&gt; I&#39;m unable to reproduce any of the failures, and neither is the<br=
>
&gt; autobuilder.<br>
<br>
</span>This is a tough one and I&#39;m struggling a little. We could try lo=
oking at<br>
the tmp/stamps/qemux86-poky-linux/linux-yocto/* files (sigdata in<br>
particular) as well as<br>
tmp/work/qemux86-poky-linux/linux-yocto/*/temp/log.task_order<br>
<br>
Martin, would you be able to share the above somewhere? I&#39;m hoping this=
<br>
would give us a clue as to what the difference is between the builds and<br=
>
allow us to reproduce the problem.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div><br></div>

--047d7ba96ef0d8a7b60515719c30--
