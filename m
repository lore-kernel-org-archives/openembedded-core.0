Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 75AA572001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 22:26:12 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id n21so30585434qta.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 14:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=t5NvlJ0ksaXonAOSwmsLAyXtuepPDaZLc+nv6V4A24s=;
	b=Q3HcrKTCc/w8+coHt5ZYbgc6LM8tk5g7b8nBtZv+0pZRxULsXbxR4TQf6hiDIG0sEC
	L5h8CQ4xtWgoVWi07YFBbLJ0s8qv1HK+FVqVCTOe/8l/4SFGoV2VQ+alCyES1uwBn3zS
	6zXKTWsSSIlRFyc4sjSswcBvIkh06JxDVOix/+3OizzHlvLLKMLJh0cYiSpVXM3gdMbe
	eb8mpwXYRKZKQlhcZntbu0mWePEXRYhNOXp7u9pYT2c7wA1CvtPydhP+jGXLOCe4F9fm
	0tESChBx0QBdDjWsMU2hku6kCclJ4WRa+bFqYBqLqB93oJbyrnDzxlrGu8mt0yaeR8v9
	YqwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=t5NvlJ0ksaXonAOSwmsLAyXtuepPDaZLc+nv6V4A24s=;
	b=Fyc2RSiCbAgBt0m31mhZj0D4EiZjBlE0a7N0XnPjCzF0EAf9ZeX7cHaG6j3ViajWFX
	UMMimhROaQFuB81OORgH3GG7HtpRDlbZ6objrP20JkbuTQ7XL4eyujY28kMoRLw5Nb/T
	86HAi+wOiySIvbAk2wEwtoYtzpyzk7leB9hQ4d08kjUtYH5Dn9iL8lsvGwXpsw+JCnwt
	pF5weOBxyFj9rs8QYw9lBh3lscBSJULsv2Jj+oTL2HZSzrumUA2aMP90ivvD6vs1+uHg
	8DpgEEWaneobDjhnh/LmMLgl0KZo2p+Wi6YRMlmcRGKpc5z30VD2CGeWm2Yzx0w5XcV0
	6r0g==
X-Gm-Message-State: AMke39nPN9CiP3/nIlU0a19RaGanQjjUwThUItvjvoq1VLDrnnKvNjlhaLgPjavaHwHWQakQ3EBTzU3SB/PU6jqX
X-Received: by 10.237.36.208 with SMTP id u16mr23827197qtc.105.1487629574336; 
	Mon, 20 Feb 2017 14:26:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 20 Feb 2017 14:25:53 -0800 (PST)
In-Reply-To: <1487627189.4285.58.camel@intel.com>
References: <CALbNGRQNaoktrh_Jk75DxkV-qVv4B9T57oCP3js5k=JApbO+pw@mail.gmail.com>
	<CAJTo0LbtbBawLavjDkbxo4xWpqZZMp=ACDmwiLP=ab2DRHZ7xA@mail.gmail.com>
	<1487627189.4285.58.camel@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Feb 2017 22:25:53 +0000
Message-ID: <CAJTo0LZjAJnoB=qTf38Ayqw+WKfD9H=WuizsPR8t92b7KQ8FhA@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe specific sysroot: handling recipes creating same files
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
X-List-Received-Date: Mon, 20 Feb 2017 22:26:13 -0000
Content-Type: multipart/alternative; boundary=001a114104ce5636ac0548fdc0dd

--001a114104ce5636ac0548fdc0dd
Content-Type: text/plain; charset=UTF-8

On 20 February 2017 at 21:46, Patrick Ohly <patrick.ohly@intel.com> wrote:

> So it is still considered an error when two recipes produce the same
> file?
>

Only if they both installed to the sysroot.  As you say, RSS makes the
build and use of these deterministic, so some of the checks need to be
reviewed - we're obviously missing some and possibly some can go away.

Ross

--001a114104ce5636ac0548fdc0dd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 February 2017 at 21:46, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D=
"mailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3s4" clas=
s=3D"a3s aXjCH m15a5d7dd61e5fc3e">So it is still considered an error when t=
wo recipes produce the same<br>
file?<br></div></blockquote></div><br>Only if they both installed to the sy=
sroot.=C2=A0 As you say, RSS makes the build and use of these deterministic=
, so some of the checks need to be reviewed - we&#39;re obviously missing s=
ome and possibly some can go away.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a114104ce5636ac0548fdc0dd--
