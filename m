Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6C865CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Aug 2016 19:59:47 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id q83so223678370iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Aug 2016 12:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7uGq889RuElWHaHpZ4YcaP8L/E/0qu+QpXpBcx/TXkA=;
	b=WqybAyYj/akPPb/Qby+6mzBw6mARjo25Ut38H6Sp/v87y28q34a9fKfi2ZqhN7yTSl
	Z/g7axic3LoUYD4O4Z3bidMbSaCF/JJTNzA6fl3qqtXA0pm9kJBawaIeszJJnoHzRWa1
	Ct52hw8i0Cuggd/ZXYPVTPjTestyL9smfMW0YOeeXiJsTyxmyT6g6ZfUajbl29OwwkvV
	NNsV36NeBQsBA/giVMQsgO94KjmggsGB6XtZkrXMKH3nTCvvqh/rgo+vWpBJD8RoJJC9
	Q9JWN7+9B4VHejYYvmaT8FyF+lnRCTVLGTj8H5wrJVkaAW07UtkJCKdSQRuMYM5RVEG4
	68XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7uGq889RuElWHaHpZ4YcaP8L/E/0qu+QpXpBcx/TXkA=;
	b=dj6BcZoryDB14b68CFAO1gAJpUUj+JbGEsRmiVt2jW8hYa+4WxxcCe20JKc4+hGHZX
	Qn2w/aqh65NeuwMWsGKZk2XxS3FUesTNiLGR8dksUQWkQtxEf8kInvdSB5Oy2RGcJ6IW
	BunftygQqiuR//8O9q2caLBlD0xkqBqvmtoA8qAeojQLerxhl23cjDkwebJcUcUB1/Dn
	eZG7awcSHNDucL40RE7qZ7sXTjLL1dzmk15Vis1jWpQ8w7ArAcj4prPQAcbYYgJtGoFN
	ATnGakoFmEVVru8MGL8zUlytyuW0U/bqQhpcd5ipNs4VwsESpQ1vA8cAQ0Dog6K0UkKA
	4P9w==
X-Gm-Message-State: AEkoouv5iZGHq6rYqMlDfy0gVtOFJwAUiOD7nNUjqYpduepPOuNlO9QVRcMrzblTDv9tf0aHo2TmN1DtJAtY0n9e
X-Received: by 10.107.135.142 with SMTP id r14mr70520891ioi.133.1470167988382; 
	Tue, 02 Aug 2016 12:59:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Tue, 2 Aug 2016 12:59:28 -0700 (PDT)
In-Reply-To: <1468332463-4154-7-git-send-email-maxin.john@intel.com>
References: <1468332463-4154-1-git-send-email-maxin.john@intel.com>
	<1468332463-4154-7-git-send-email-maxin.john@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Aug 2016 20:59:28 +0100
Message-ID: <CAJTo0LbsL7GrGM2uoQJegg_=bzFRbGDeWN2KcaxwkaMGnC7GDA@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/8] packagegroup-core-x11-base.bb: replace pointercal with pointercal-xinput
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
X-List-Received-Date: Tue, 02 Aug 2016 19:59:48 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcb5633405391c28d9

--001a113eccbcb5633405391c28d9
Content-Type: text/plain; charset=UTF-8

On 12 July 2016 at 15:07, Maxin B. John <maxin.john@intel.com> wrote:

> Replace pointercal with pointercal-xinput since we removed pointercal
> recipe.
>

This exposes the fact that pointercal-xinput doesn't set ALLOW_EMPTY for
BSPs that don't ship a pointercal.  I'll send a patch :)

Ross

--001a113eccbcb5633405391c28d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 July 2016 at 15:07, Maxin B. John <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:maxin.john@intel.com" target=3D"_blank">maxin.john@intel.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":2my" class=3D"a3=
s aXjCH m155df70923c0d412">Replace <span class=3D"il">pointercal</span> wit=
h <span class=3D"il">pointercal</span>-xinput since we removed <span class=
=3D"il">pointercal</span> recipe.<br></div></blockquote></div><br>This expo=
ses the fact that pointercal-xinput doesn&#39;t set ALLOW_EMPTY for BSPs th=
at don&#39;t ship a pointercal.=C2=A0 I&#39;ll send a patch :)</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbcb5633405391c28d9--
