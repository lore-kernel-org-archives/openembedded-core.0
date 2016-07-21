Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 68ADC605BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 19:47:39 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id j124so28172960ith.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2016 12:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sr1yv8pMLG1mdHBI/ZkhoqQl9fpmZ/RJcmBfV5+Qeco=;
	b=D+deSUk5eiH938+O6hm/fGY2m9uWEdoVo30RO8ElYp/UJXOQDry0qE8QcTtcXVjnkc
	EyRwqQvBu+/fD4/g9HDveyQNk0AMKP0ylxDqEIa9J7+iwNG6F+jZxuScy14ZQnEjB3Hp
	KLtUhNhX8nC7QlSCvrkuDNMilCakmM2TxgQFm5nNc5UUahO7ClTVjkNjTKbg0bJPd6PQ
	Uk3Kf861fVAwDtBjL472x4mDeyqbllozEM4S7atHFIrVCVL03yko+Waz8FW4lhEUK6rw
	cd2nOgXHRdkyloemMYItElxxJesv46SpwZlt4M3m30z1PPvEi96SEDEE7YzXz8bIpkuB
	rSBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sr1yv8pMLG1mdHBI/ZkhoqQl9fpmZ/RJcmBfV5+Qeco=;
	b=WB6BApv2JFticntr81wfwt9waL2DtmhQGZKRYxoQkZwnWjhnmENuYZ/Si8VFDNLcXA
	eG3XLDMETs+JfHbpxBSAtNdXoQVRmeb8EKGNwit70nFC84ND+uHS4K13Om7OowxOIE/D
	nuGuwro99f924MvFcDFWTX/35SliOmTEbDQl2o4Z7h1Rz4/DfGq2b37SP3iHzRN7X/Y1
	zai69hIANkoiK0fgFyGm4QSDcrhfJylpysjGpQmh9tvAotV/b8Poh1aqi+Bfi8FHHOVE
	9AwX7RQMzd69E3br8RlsjngBxyLbzEsAqTL0CbiQZ1d1QBIhn0fU5vZqo1XPUdq+L0dG
	IQmg==
X-Gm-Message-State: ALyK8tKv7hFupQEylWRP1v/NURlzV5HOjHF5+MAwYY4avSyarr10YzwTpnmn/twRWWYy1NBRXNdhxNvY5DwMEgv2
X-Received: by 10.36.19.75 with SMTP id 72mr17127057itz.83.1469130460214; Thu,
	21 Jul 2016 12:47:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Thu, 21 Jul 2016 12:47:20 -0700 (PDT)
In-Reply-To: <1469109659-3336-1-git-send-email-mario.goulart@bmw-carit.de>
References: <1469109659-3336-1-git-send-email-mario.goulart@bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Jul 2016 20:47:20 +0100
Message-ID: <CAJTo0LY8HHRqgZ385S-mb2N8uB21ZvE64Cew903TC37D5sF51Q@mail.gmail.com>
To: Mario Domenech Goulart <mario.goulart@bmw-carit.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] insane.bbclass: Typo fix in do_qa_unpack's bb.note
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
X-List-Received-Date: Thu, 21 Jul 2016 19:47:44 -0000
Content-Type: multipart/alternative; boundary=001a1145180a35fd5f05382a9730

--001a1145180a35fd5f05382a9730
Content-Type: text/plain; charset=UTF-8

On 21 July 2016 at 15:00, Mario Domenech Goulart <mario.goulart@bmw-carit.de
> wrote:

> -    bb.note("Checking has ${S} been created")
> +    bb.note("Checking if ${S} has been created")
>

I actually just sent a patch to delete this line entirely as the log will
say its entering that function anyway. :)

Ross

--001a1145180a35fd5f05382a9730
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 July 2016 at 15:00, Mario Domenech Goulart <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:mario.goulart@bmw-carit.de" target=3D"_blank">mario.goulart@b=
mw-carit.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":5ht" class=3D"a3s aXjCH m1560dce86dc943ab">-=C2=A0 =C2=A0 bb.note(&quo=
t;Checking has ${S} been created&quot;)<br>
+=C2=A0 =C2=A0 bb.note(&quot;Checking if ${S} has been created&quot;)<br></=
div></blockquote></div><br>I actually just sent a patch to delete this line=
 entirely as the log will say its entering that function anyway. :)</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv>

--001a1145180a35fd5f05382a9730--
