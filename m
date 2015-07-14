Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7BF1165C78
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 09:50:08 +0000 (UTC)
Received: by qgy5 with SMTP id 5so1671631qgy.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 02:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OioIer+uB5PNHH7P4NQKBT4D6dEkCk51lIXRnFfwBVc=;
	b=bILtqeMmAzXQ+IcJeK5cXd6T7pzcXEHVuO+fuJTV6zrHzfc5491bTsq4hE1+IyNk5x
	QOhSA+x2SqZimug9OoJ5V3Kb+kMJUCyCcTM+Ar0OzcBxQWXJwBfgiiDGHYBabWr/M32S
	UXcoR9H8C/HIJRCFm7PlFm1JlH5xgzlvCNoz1xZKQWn5fB6j3t6jXC/Jb0PReeDLLHyr
	Zs3kLw/xLvR99SDp5B+rmgcwJEGj2uM4vjtfnBJyRn4HBEDdlySoCEuFlfQT0ROX+HuE
	nxABBN5fNv+ApZTEz9k3FyZNOKy4SOBpm2hXsLQFwT96Y+Y938UwiojLYqBN9382Vaul
	NAqw==
X-Gm-Message-State: ALoCoQnHyI5sIqxOdzNUMgW5Fhe028iaenBBPcaC3wyMybTIHVGV1HsWPj7/BbEvEvxCBBejI2eK
X-Received: by 10.55.43.95 with SMTP id r92mr36130446qkh.67.1436867408110;
	Tue, 14 Jul 2015 02:50:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Tue, 14 Jul 2015 02:49:48 -0700 (PDT)
In-Reply-To: <871tgbyk2s.fsf@weregild.amer.corp.natinst.com>
References: <1407178549-8464-1-git-send-email-ben.shelton@ni.com>
	<871tgbyk2s.fsf@weregild.amer.corp.natinst.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jul 2015 10:49:48 +0100
Message-ID: <CAJTo0LZF6fogQd6YhTbkY9adXGOhiZONqwWLc909AUF4fBUapg@mail.gmail.com>
To: Richard Tollerton <rich.tollerton@ni.com>
Cc: Ben Shelton <ben.shelton@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] create-pull-request: Fix error on 2.0 versions of git
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
X-List-Received-Date: Tue, 14 Jul 2015 09:50:09 -0000
Content-Type: multipart/alternative; boundary=001a1147b8dc73416f051ad2c322

--001a1147b8dc73416f051ad2c322
Content-Type: text/plain; charset=UTF-8

On 13 July 2015 at 19:43, Richard Tollerton <rich.tollerton@ni.com> wrote:

> Ben Shelton <ben.shelton@ni.com> writes:
>
> > On 2.0 versions of git, the create-pull-request script exits with the
> > warning "No match for commit... Are you sure you pushed 'HEAD' there?".
> >
> > This is due to a change in behavior where git used to guess the branch
> > you meant, but no longer does.  See the thread at
> > http://www.spinics.net/lists/git/msg233050.html for more information.
> >
> > To accommodate the new behavior, if the COMMIT_ID is set to the default
> > of "HEAD", make it point explicitly to $BRANCH instead.
> >
> > Signed-off-by: Ben Shelton <ben.shelton@ni.com>
>
> I still need to apply this patch in order to use create-pull-request.
> Bump?
>

Not sure how this got missed, and I can't even find it in my archives, but
it's queued now.

Ross

--001a1147b8dc73416f051ad2c322
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 July 2015 at 19:43, Richard Tollerton <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rich.tollerton@ni.com" target=3D"_blank">rich.tollerton@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":zw" clas=
s=3D"a3s" style=3D"overflow:hidden">Ben Shelton &lt;<a href=3D"mailto:ben.s=
helton@ni.com">ben.shelton@ni.com</a>&gt; writes:<br>
<br>
&gt; On 2.0 versions of git, the <span class=3D"il">create</span>-<span cla=
ss=3D"il">pull</span>-<span class=3D"il">request</span> script exits with t=
he<br>
&gt; warning &quot;No match for commit... Are you sure you pushed &#39;HEAD=
&#39; there?&quot;.<br>
&gt;<br>
&gt; This is due to a change in behavior where git used to guess the branch=
<br>
&gt; you meant, but no longer does.=C2=A0 See the thread at<br>
&gt; <a href=3D"http://www.spinics.net/lists/git/msg233050.html" rel=3D"nor=
eferrer" target=3D"_blank">http://www.spinics.net/lists/git/msg233050.html<=
/a> for more information.<br>
&gt;<br>
&gt; To accommodate the new behavior, if the COMMIT_ID is set to the defaul=
t<br>
&gt; of &quot;HEAD&quot;, make it point explicitly to $BRANCH instead.<br>
&gt;<br>
&gt; Signed-off-by: Ben Shelton &lt;<a href=3D"mailto:ben.shelton@ni.com">b=
en.shelton@ni.com</a>&gt;<br>
<br>
I still need to apply this patch in order to use <span class=3D"il">create<=
/span>-<span class=3D"il">pull</span>-<span class=3D"il">request</span>.<br=
>
Bump?</div></blockquote></div><br>Not sure how this got missed, and I can&#=
39;t even find it in my archives, but it&#39;s queued now.</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147b8dc73416f051ad2c322--
