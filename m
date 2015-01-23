Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8EA9165C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 15:16:33 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id b13so6702302qcw.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 07:16:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tHdUieeo/p/ZudfIpV1DFyRRUvlzgM4k1PCs+RsV5Cw=;
	b=Fz6XRLM8aJ4avgkw9ii7wfk6i0ds4KNLBBHr8BwwBEI4Eyh93eFIOYS6PGv8MLmo9o
	qJhpH11mZ8Fmy74ioQrQO+bGWoc8usLAfL9m4kWhxIJRl/ErGHvtodZmS9zErHbOr8g5
	A1WxnjWT4AHHVqeJN1W40eG3ZzCUPIt4bx1XSum/QNUwmC0IVJRvuBb7gOfdePWyvLP/
	lvdHz4naNRnfXfbR9U72z6mStaQUSA18tXvHBepNh4RCTnIN/+VlwtuawG8wPBeN6kZB
	5P5iyETjUdELpZnPNsuzGgRFj+53q3BzzYF9xCP6xwnZ95hphBO7Usim0yVYL1hI0es4
	78Zw==
X-Gm-Message-State: ALoCoQm/tmavdSnzFWTSIB0LO+rRlt8vApFxAZYlEzjy1T5LrlSGeq+1pV0RIJJwOMD+8vZnH3ik
X-Received: by 10.229.190.65 with SMTP id dh1mr15061277qcb.28.1422026194322;
	Fri, 23 Jan 2015 07:16:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Fri, 23 Jan 2015 07:16:14 -0800 (PST)
In-Reply-To: <20150122160209.2b16dd58@e6410-2>
References: <BLU437-SMTP65FA876B595D639FFD2DD6BB750@phx.gbl>
	<BAY179-W31475BA463A068FF83E83BB490@phx.gbl>
	<20150122160209.2b16dd58@e6410-2>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Jan 2015 15:16:14 +0000
Message-ID: <CAJTo0Lb7A1OsXmaAMb1Pa9a-RW9POT=kzBPCAkh3DwqSjy2Xcw@mail.gmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc-use-option-groups.patch: Various fixups
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
X-List-Received-Date: Fri, 23 Jan 2015 15:16:37 -0000
Content-Type: multipart/alternative; boundary=001a11339bec2ca381050d534615

--001a11339bec2ca381050d534615
Content-Type: text/plain; charset=UTF-8

On 22 January 2015 at 22:02, Peter Seebach <peter.seebach@windriver.com>
wrote:

> > ping.
>
> My memory (which is notoriously unreliable) was that we'd merged these
> changes, but it may be we did thim in our local tree.
>

Yeah they're not in master - I think I merged and then backed them out
locally to bisect some breakage.  I'm testing here now.

Ross

--001a11339bec2ca381050d534615
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 January 2015 at 22:02, Peter Seebach <span dir=3D"ltr">&lt;<a href=3D=
"mailto:peter.seebach@windriver.com" target=3D"_blank">peter.seebach@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:97g" class=3D"a3s" style=3D"overflow:hidden">&gt; ping.<br>
<br>
My memory (which is notoriously unreliable) was that we&#39;d merged these<=
br>
changes, but it may be we did thim in our local tree.</div></blockquote></d=
iv><br>Yeah they&#39;re not in master - I think I merged and then backed th=
em out locally to bisect some breakage.=C2=A0 I&#39;m testing here now.</di=
v><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div=
></div>

--001a11339bec2ca381050d534615--
