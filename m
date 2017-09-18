Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2586011F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 20:18:22 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id c195so2210999itb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Sep 2017 13:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=voIeLiIFwiDY7EqA67odL5SVEpiaXl3vMnbd+qOC+lM=;
	b=zpCy+3elA8d5ofGumYZWZLpmqm+Obco8ROkcRx9S3ib9MOKC9Aed9I/XfIJqbfBEOW
	N6DXzHgawLVlDGTF1vd7gwlW5TXDycrf4mmzqTS1sKCs5YTnosB+pU0gMYH8D3WXRc+g
	x4Ix1kcAvcZU9ZOuMBAF1aWspz/pp2rvfJDEl0xzs0Rd2eu4UjeZ8g2K11vMlgqF9kUN
	SulZYgXif4Fklkh2TSA6xXuujU0v8ljAcEGUWM+U0TAFqORw4eHmvWB9OmZ7GWZYH88O
	womybg/ZK3eMq+hUsiOJC+5zNr+30E7o4w54f7uZ4t4cEagQvuUXM7NTrnXIljVgKJZi
	B78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=voIeLiIFwiDY7EqA67odL5SVEpiaXl3vMnbd+qOC+lM=;
	b=N9mKUjs91s/qBd0pquuvaK+x9jW6Rvyis4/xmt3lplqsMP+oqpDHRn85w529s3PCcz
	bcdQTKW0r7I6ZeUCX7CuvlsI1LatZ44np6PrtAbbH9evgrlP6DnFGltL58uZ/f0K0R1L
	s8Wb8siDT5OBm6PqL55nLGe4DgyS7fywg3iAkoiefpW8be6Ses1UPQEYpMHGislH4jAq
	8YwupGJypnNOpotf/sMrSIW3ReIJZDTEK2Bdd82EtkXkiB1//uRBgL8cBN+FR2hLPGiD
	Q9/W/Zhwa4GE1KbyVTYsFj+YFlPtK652uvqBe73cb5m5+B98DrWWXATe2PXjYFfgl6qa
	yFAg==
X-Gm-Message-State: AHPjjUhnNh2mtsfQ6h5l6L3qPcKA4g5psNn5jYuzH6H3dA3tIvoXUkKE
	MdqqHlKTUxgR7LkVs2ZCBpRFXCekmNKcalwpRvK2TA==
X-Google-Smtp-Source: AOwi7QAKh7CcHFUd6NPwbMMdIpySh8rr+r7+jIckyXguGYKYYOaGc8ZIlgl3rAorwEYMp4+qhNzdY2CDDHUSUvWSZ+U=
X-Received: by 10.36.26.129 with SMTP id 123mr13821587iti.38.1505765903472;
	Mon, 18 Sep 2017 13:18:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 18 Sep 2017 13:18:02 -0700 (PDT)
In-Reply-To: <CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
References: <1505723966-17120-1-git-send-email-mike.looijmans@topic.nl>
	<da35387ee5e44bd0a4248c41b79d1512@XBOX02.axis.com>
	<660382f7-55b7-39cc-ae2a-afab46301b3c@topic.nl>
	<CAJTo0LY=JnUkd7XMvkpNppc2drcSB8AF9dj_CyxHJRjixZ1uFA@mail.gmail.com>
	<1505743634-13500-1-git-send-email-mike.looijmans@topic.nl>
	<a6389819751745fb864af89806f86b5d@XBOX02.axis.com>
	<CAJTo0LaZo2Jhh7Jj=RAUzOzXq_FcXnobu-idL7RFnbq84iR_VA@mail.gmail.com>
	<CAJ86T=UqdDrT2ApxMiM=g__pTftCc5g0-gzs20vd-jV06+6x7w@mail.gmail.com>
	<CAJTo0LZrPSoVNAX6onFFsGgkD1LEm=2DLdBOecnhNEQBRDnS6A@mail.gmail.com>
	<CAJ86T=X5xAtSL4bK9tGLxrdxqtNh6ewG0n8rLfeiewL=cWA6xA@mail.gmail.com>
	<CAJTo0Lag_GCyfHCcEnNbfLOXSB+qyDhQHxUkdTF5RacgfxQEWg@mail.gmail.com>
	<CAJ86T=XFBTNtAg2_xPEFGTiH2Y_gZnRS_LZWkBWL2kPiUYARpA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Sep 2017 21:18:02 +0100
Message-ID: <CAJTo0LbOtfMY7mo5ASNZY0g3yd8+cwLEoWyMc4HifHH_nnyrjw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base-files: profile: Get rid of "resize"
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
X-List-Received-Date: Mon, 18 Sep 2017 20:18:22 -0000
Content-Type: multipart/alternative; boundary="001a114463eccad4e805597c713b"

--001a114463eccad4e805597c713b
Content-Type: text/plain; charset="UTF-8"

On 18 September 2017 at 20:30, Andre McCurdy <armccurdy@gmail.com> wrote:

> On Mon, Sep 18, 2017 at 12:19 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> > On 18 September 2017 at 20:01, Andre McCurdy <armccurdy@gmail.com>
> wrote:
> >>
> >> > The question is does it do something useful *now*?
> >>
> >> I don't have a board with a serial console to test at the moment.
> >> Busybox hasn't changed in recent memory though, so as long as the
> >> resize command does actually get run I presume it's still going to
> >> work.
> >
> > Re-read the code.
>
> I've never read the code before, so don't make any claims to know
> *how* it works or worked :-)
>
> > There's a call to ioctl with TIOCSWINSZ which I'm
> > *guessing* is set window size.  Google is not useful for this!  It does
> all
> > this on stderr.
> >
> > So yes it *should* work, but not if you redirect stderr to /dev/null.
>
> We don't redirect stderr to /dev/null, only stdout.


One of the many patches here does.

I'm holding off applying any of them right now. :)

Ross

--001a114463eccad4e805597c713b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 18 September 2017 at 20:30, Andre McCurdy <span dir=3D"=
ltr">&lt;<a href=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy=
@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Se=
p 18, 2017 at 12:19 PM, Burton, Ross &lt;<a href=3D"mailto:ross.burton@inte=
l.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; On 18 September 2017 at 20:01, Andre McCurdy &lt;<a href=3D"mailto:arm=
ccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; &gt; The question is does it do something useful *now*?<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t have a board with a serial console to test at the mome=
nt.<br>
&gt;&gt; Busybox hasn&#39;t changed in recent memory though, so as long as =
the<br>
&gt;&gt; resize command does actually get run I presume it&#39;s still goin=
g to<br>
&gt;&gt; work.<br>
&gt;<br>
&gt; Re-read the code.<br>
<br>
</span>I&#39;ve never read the code before, so don&#39;t make any claims to=
 know<br>
*how* it works or worked :-)<br>
<span class=3D""><br>
&gt; There&#39;s a call to ioctl with TIOCSWINSZ which I&#39;m<br>
&gt; *guessing* is set window size.=C2=A0 Google is not useful for this!=C2=
=A0 It does all<br>
&gt; this on stderr.<br>
&gt;<br>
&gt; So yes it *should* work, but not if you redirect stderr to /dev/null.<=
br>
<br>
</span>We don&#39;t redirect stderr to /dev/null, only stdout.</blockquote>=
<div><br></div><div>One of the many patches here does.</div><div><br></div>=
<div>I&#39;m holding off applying any of them right now. :)</div><div><br><=
/div><div>Ross</div></div></div></div>

--001a114463eccad4e805597c713b--
