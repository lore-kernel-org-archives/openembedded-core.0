Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id B880E731F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2016 23:09:07 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id u10so30644135igr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2016 16:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=T4wRd6AWGaedW90LXrRn0QEDJfawJya8mxsEXIBOKK4=;
	b=tMSLMRO1Ukkie1c4cTOYtXwVuRFVUyKnNc/LDTA3JTMGaA5CiQc9GlVtuwy4RZTbqH
	yD8USjLd9rw5v32lA0nmGeTbbppJQClD9XzxpGhK0hA4yuzbLdDtcVBP0YzH03E0vm5M
	f2qOKG9/n/jaY/CKE4h/KSTb6NWIr1m1luwvR7bKsr9R7VX2EITNhHLyO4Eu6W2psnsv
	Pmrs9UQmiCUbnA4b4G4PubowFp/9q+DFkatG5eS6rY/lg+MkGtA2sTtB6GE4cf2iRiEA
	ICFx+WjfbFp4bvVnnFRAiKt2cweYZRg2B5CLdTvqbF10CFv/oGIp87woOLqj5avuxQGL
	3EOw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=T4wRd6AWGaedW90LXrRn0QEDJfawJya8mxsEXIBOKK4=;
	b=LLPOj64Ixlm3+hzl+GZLJiVl9fyW7QGXxt0c1CofwtAJCxco5jgmsA/HBQAEWDsb7u
	MmarbmrOPR5EvnuBqg7uObFO7jzEyk2fCYKSSYPdqUD+bPzMoJMA991AcxZLQf4O3R1h
	G12kRiShGUkRa37hp0uzDMXD5B+x/eVI2Nm5tarSHjK5zCu2uQplGsdSvxaDVtLHyVCr
	P2hyj3maOT5lnil4GQNh8TtpWpuZbKd0q75MtA/Wr4kGVeh8fnICtH9e8aXc+AIk0OTi
	b0EeG9NLRIFYcnKSZf0QdVaCQTyfHWqZZD+Ag4KSkeRsMDfzgf5uea/65H1oY5KSg7S1
	3LNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=T4wRd6AWGaedW90LXrRn0QEDJfawJya8mxsEXIBOKK4=;
	b=HWafncFkqzrGZH3GF21EnHsipzNm0PYVRFFGvZe4NrqXwe9eRdOnugTEhUFoHxPZjr
	UYS5k/IGIs/r/6yulbE+L/KC4tw7eKOqg9Wg3z5o8UZlujm6ElkuTrLmgEI5r9d/ekdu
	yb9TN9Tez3wDUL+daqrzUCwsWK2RboG+q5DhJAkMbTbmlIahhDHfTXDopqkTOnt0d9oN
	9IH+vcxcK4BobxWazppOHKjFcJZJv3B8dfnj1t9Lb1vK2hn355eO9zz5lCrN7TSKNW6k
	UJwsmdmTQ0cO9ZVNMve5dYlMSg22yCdnuZ+iViLL4QCST6jGFVr0VXgUKlg0Z8T02/zA
	zZLA==
X-Gm-Message-State: AOPr4FXrARtQda52yOzkTbUYDfYn945l8v6r9Lv4/UaSDNiCzkljz9Tw8OeUEMGf1fM7Q1OnQ0lmcukamJnJtQ==
X-Received: by 10.50.65.42 with SMTP id u10mr6881298igs.13.1462489747938; Thu,
	05 May 2016 16:09:07 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Thu, 5 May 2016 16:08:48 -0700 (PDT)
In-Reply-To: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
References: <DBXPR07MB23993DC9B9946851B629E21F97C0@DBXPR07MB239.eurprd07.prod.outlook.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 5 May 2016 16:08:48 -0700
X-Google-Sender-Auth: rCBcpj1aQT_Ln9V0rOo26-JBMxo
Message-ID: <CABcZANniNW9XRsATUvu=D0nSMWh2paEWPED2xZRjo2z6VBKvBg@mail.gmail.com>
To: "Kucharczyk,
	Bartlomiej (Nokia - PL/Wroclaw)" <bartlomiej.kucharczyk@nokia.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: How to force BitBake to track dependency to METADATA_REVISION?
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
X-List-Received-Date: Thu, 05 May 2016 23:09:09 -0000
Content-Type: multipart/alternative; boundary=047d7b414330e9e67c0532206db7

--047d7b414330e9e67c0532206db7
Content-Type: text/plain; charset=UTF-8

On Thu, May 5, 2016 at 11:48 AM, Kucharczyk, Bartlomiej (Nokia -
PL/Wroclaw) <bartlomiej.kucharczyk@nokia.com> wrote:

> I am trying to use METADATA_REVISION variable (defined in
> metadata_scm.bbclass) in my recipe, but BitBake does not rebuild the task
> when git revision of the repository changes.
> Setting [vardeps] does not help.
>
> I suspect this may be related to the fact that METADATA_REVISION is
> defined this way:
>         METADATA_REVISION ?= "${@base_detect_revision(d)}"
> And BitBake does not expand this to the proper value, thus does not see
> any difference.
>
> Does anyone have any suggestion how to tackle this issue, and force
> BitBake to properly track dependency to METADATA_REVISION value?
>
> My original task is:
> Package feeds/SDK installers are versioned (git metadata revision). I am
> trying to create an opkg.conf file which will contain such versioned
> package feeds URL in SDK installer. For build reproducibility, and user
> convenience.
>

Bitbake tracks unexpanded forms of variables, not expanded. So it's
literally storing '${@base_detect_revision(d)}" in the checksum, not the
actual revision.

METADATA_REVISION[vardepvalue] = "${METADATA_REVISION}" in your recipe will
do it.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7b414330e9e67c0532206db7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, May 5, 2016 at 11:48 AM, Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw=
) <span dir=3D"ltr">&lt;<a href=3D"mailto:bartlomiej.kucharczyk@nokia.com" =
target=3D"_blank">bartlomiej.kucharczyk@nokia.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1u2" class=3D"a3s aXjCH">I am tr=
ying to use METADATA_REVISION variable (defined in metadata_scm.bbclass) in=
 my recipe, but BitBake does not rebuild the task when git revision of the =
repository changes.<br>
Setting [vardeps] does not help.<br>
<br>
I suspect this may be related to the fact that METADATA_REVISION is defined=
 this way:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 METADATA_REVISION ?=3D &quot;${@base_detect_rev=
ision(d)}&quot;<br>
And BitBake does not expand this to the proper value, thus does not see any=
 difference.<br>
<br>
Does anyone have any suggestion how to tackle this issue, and force BitBake=
 to properly track dependency to METADATA_REVISION value?<br>
<br>
My original task is:<br>
Package feeds/SDK installers are versioned (git metadata revision). I am tr=
ying to create an opkg.conf file which will contain such versioned package =
feeds URL in SDK installer. For build reproducibility, and user convenience=
.</div></blockquote></div><br>Bitbake tracks unexpanded forms of variables,=
 not expanded. So it&#39;s literally storing &#39;${@base_detect_revision(d=
)}&quot; in the checksum, not the actual revision.</div><div class=3D"gmail=
_extra"><br></div><div class=3D"gmail_extra">METADATA_REVISION[vardepvalue]=
 =3D &quot;${METADATA_REVISION}&quot; in your recipe will do it.<br>-- <br>=
<div class=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot=
 com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<b=
r>Senior Software Engineer, Mentor Graphics</div>
</div></div>

--047d7b414330e9e67c0532206db7--
