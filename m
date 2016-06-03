Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 894BE77443
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jun 2016 19:19:25 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id t40so85263157ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Jun 2016 12:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2YgxrcvybFbrTMjvXgEdx75qgonqbIbyu5vK2cP7G8o=;
	b=o6c3yoi0SQxqQ1tKiEp1Oy6BSw8jxSyttW3MIes13xNKrkSqbnXw9T+K+EdepRusHt
	Gv7VoO1OMRd5mApjJULSHwN6w08hyAh3kVD+TG4hk05xdsyk25oX0rYXNf1Ixg8ZLzjY
	+zD+RXlv/l2JFMLm+8gudz2OqF8R/Bute+rJJxPM565pGLHXbRlAoDqWZ2qvBCOGWYmt
	YH1oRj3YYZypr88XQqS2clAllYQa+oeowUGziQ17p9J0l+Z5a6uyFIbEzLUBPPJpKqFb
	kJc4iLJtUPXpsdyt6qBogxieCU98OR4VWG+zmTCqQMaVjVppYT6RfActll7kddUSs3CT
	GZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2YgxrcvybFbrTMjvXgEdx75qgonqbIbyu5vK2cP7G8o=;
	b=UiqFTgjVQshaKMmPBxEmfJmyRxSltGGLN7ybhjigrxwUM9d7VNFoo7BiJ4k/dN67rt
	6aUbSNRmJBGkdZ4Zk9gnBd8SgdsTTOjTJOK4u0lqJ6WiPl1cB9uWEfwXKPMi32/yvRAq
	ptWu6fZMBKijRRRK6QyoINajUox91906pKPjibQ09xfpKv17muCQvZr0/C0S0x3oLka2
	/zSSQGn6HGSVrx9TYOZQq3HHePTFkv/G5Ez3PqCVk2xnQtf/fRG6Xg1KkrT5sgExZvml
	jm0RcUTGIwXkKiafB973n7o9elBZ70LYWSLD8j65Z5a9CcaX9xW9FjAWy2d811rJM0gi
	4TPQ==
X-Gm-Message-State: ALyK8tKteNj34gqe59iJ/oQJRyPgBOLVD8LcV2eMINCPzgX4vASVfZCQmnarm0hBxjymuyo9jU4yIF+1DrpwrlYc
X-Received: by 10.36.2.71 with SMTP id 68mr1909054itu.38.1464981565644; Fri,
	03 Jun 2016 12:19:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 3 Jun 2016 12:19:06 -0700 (PDT)
In-Reply-To: <e0e0244c-0099-8c8c-0e47-5077b67ab22d@windriver.com>
References: <1464953991-4125-1-git-send-email-maxin.john@intel.com>
	<cf6e48c8-4fc8-aaec-87d2-940623951477@windriver.com>
	<54951.10.252.18.48.1464982415.squirrel@linux.intel.com>
	<e0e0244c-0099-8c8c-0e47-5077b67ab22d@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 3 Jun 2016 20:19:06 +0100
Message-ID: <CAJTo0Lbr178XE=WwospWH25DKgDEGB-dLsAz-U8T_swkVbFdSg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] rpm: update patch to support db-6.2.23
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
X-List-Received-Date: Fri, 03 Jun 2016 19:19:26 -0000
Content-Type: multipart/alternative; boundary=001a1144b1d0d2c917053464998f

--001a1144b1d0d2c917053464998f
Content-Type: text/plain; charset=UTF-8

On 3 June 2016 at 19:53, Mark Hatle <mark.hatle@windriver.com> wrote:

> On 6/3/16 2:33 PM, alexander.kanavin@linux.intel.com wrote:
> >> On 6/3/16 6:39 AM, Maxin B. John wrote:
> >>> Refresh the rpm-db60.patch to support db-6.2.23
> >>
> >> NAK NAK NAK
> >>
> >> Please do NOT merge this set.
> >>
> >> 6.2.23 does NOT work with the version of RPM.
> >
> > Should db be updated to the latest 6.1 release then?
>
> Latest 6.1 release has the same problem unfortunately.  So it needs to
> wait as well.
>

They changed locking behaviour in a micro release?!

(more disappointed than surprised at this point)

Ross

--001a1144b1d0d2c917053464998f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 June 2016 at 19:53, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailto=
:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 6/3/=
16 2:33 PM, <a href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.=
kanavin@linux.intel.com</a> wrote:<br>
&gt;&gt; On 6/3/16 6:39 AM, Maxin B. John wrote:<br>
&gt;&gt;&gt; Refresh the rpm-db60.patch to support db-6.2.23<br>
&gt;&gt;<br>
&gt;&gt; NAK NAK NAK<br>
&gt;&gt;<br>
&gt;&gt; Please do NOT merge this set.<br>
&gt;&gt;<br>
&gt;&gt; 6.2.23 does NOT work with the version of RPM.<br>
&gt;<br>
&gt; Should db be updated to the latest 6.1 release then?<br>
<br>
</span>Latest 6.1 release has the same problem unfortunately.=C2=A0 So it n=
eeds to wait as well.<br></blockquote><div><br></div><div>They changed lock=
ing behaviour in a micro release?!</div><div><br></div><div>(more disappoin=
ted than surprised at this point)</div><div><br></div><div>Ross</div></div>=
</div></div>

--001a1144b1d0d2c917053464998f--
