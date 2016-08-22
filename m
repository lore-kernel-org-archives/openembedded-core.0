Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7FE70016
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 13:25:17 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id 38so109508407iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 06:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xRQbMOp/T9R2rQs2vXqIKMV1yzZs6Pu28cysCrkDcOU=;
	b=UCL3DN5fMNkkFcPOIXolS6e4hXTS2CiJ+uYbRKOVgx601KM49pG5yR0fTRonaSr/7X
	f6HTw6YeUo5/2RipIVsj2s2OKtch8TinyzrmlIwHmhPrgjkFXx1hhO7FBSMHCf3tVQKw
	sqfLWrH791OXbf8p4a8nBv2Wqt5UTVIdO4i+8iRnSlbfHqMbTz/1/UUkI4n9FpVOo9Fh
	hlfUHH7LzV2eMc3ZL4ght02FiGhfjFU8Dj947RP1IfMe85pd1VcF1w2nlihmRl2a0pXd
	5RK8xePqpNEZsslsEetONJUi3jVGZr+hrcnmUL2+huJTt3lSfWp0IVOL5zJCMtvEwC2I
	KW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xRQbMOp/T9R2rQs2vXqIKMV1yzZs6Pu28cysCrkDcOU=;
	b=gMEI5fS6EfjOJlk3K2WqDVy3Dl9hwx5zkP/4ADjqz5err6Ca1lEtPNKaBuN1bNDvsg
	r73+n+Sa12plsZs6qe26wBTYpd3Q+XVowz04DnHGcCEqcOqjg6LObzkBo4AyYhGuKEFZ
	hwkzlmPGBh1351LW0aX57wb2E3eRlNQKd13gUisQRHC9dp/aeALWirgwcv/MTWgGytn/
	bym+K3JY3LCu3v5eZaAZtifJteKaKiSuAg8E5Wiqb2sod97JaGuHabawhdXl1gWCLWtI
	wIonvIbRbriNUsGQOjK1nncH7ICGtxkIlH25xNO1/2xNjvszlkO5TpTAGvkgZs/5Zrjj
	mGEw==
X-Gm-Message-State: AEkoouuSo9W4SRgBk/pk5AGYd2af8Mu4kAl0l5PZS6Wytr2w9nWgzAgWOyJWUWmBznH3xGL8LbF3xGrMDIwAJWAd
X-Received: by 10.107.154.196 with SMTP id c187mr22722590ioe.99.1471872318000; 
	Mon, 22 Aug 2016 06:25:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 22 Aug 2016 06:24:57 -0700 (PDT)
In-Reply-To: <84941321-4129-4a17-7eea-2fbea6513369@embed.me.uk>
References: <20160822130516.5719-1-ml@embed.me.uk>
	<84941321-4129-4a17-7eea-2fbea6513369@embed.me.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 22 Aug 2016 14:24:57 +0100
Message-ID: <CAJTo0Lb6fi9Xa1oeEb4KjsBNM0Hh9nfaWpp4L1ap+Z1_j6aUvQ@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake: install path variables should be relative to the prefix path
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
X-List-Received-Date: Mon, 22 Aug 2016 13:25:18 -0000
Content-Type: multipart/alternative; boundary=001a1140e81eab67fd053aa8fab3

--001a1140e81eab67fd053aa8fab3
Content-Type: text/plain; charset=UTF-8

On 22 August 2016 at 14:23, Jack Mitchell <ml@embed.me.uk> wrote:

> On second thoughts this isn't doing quite what I expected, how would one
> remove the prefix from a variable when it's expanded in this manner?
>

You curse cmake for needing install paths to be relative to the prefix?

Ross

--001a1140e81eab67fd053aa8fab3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 August 2016 at 14:23, Jack Mitchell <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ml@embed.me.uk" target=3D"_blank">ml@embed.me.uk</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":84i" class=3D"a3s aXjCH m1=
56b26ba8a4c883a">On second thoughts this isn&#39;t doing quite what I expec=
ted, how would one remove the prefix from a variable when it&#39;s expanded=
 in this manner?<br></div></blockquote></div><br>You curse cmake for needin=
g install paths to be relative to the prefix?</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1140e81eab67fd053aa8fab3--
