Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9BE71B48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 20:31:50 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id x84so268551oix.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2017 12:31:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pzcHyQ2WGots73z1QiexV34WUK4pnsJbnhSR2PDsIpk=;
	b=oSv5VPSHorxitN41FY0cpLELFQNE7s3FpD9avcXlRWKDmeIKhdvZnjGVKeuZ/cp6wD
	JQZfuHfKiJUQMdL/RQz1PYEhFTytUGWKt7cLTWhqnV/PO9h1wfN3bePTf2G2eclwMfu9
	DT0CsCZ0lS1h80jhpAI5o4qR3iSUP9x6aS9NJGXEZgUrIprb/XijJGGmSlNWtCtXZCJy
	f3Rmodj0wotwndflAU2IeLSnAHLhOf7afhRrKLqs1UAWdKJacy4NLPWBc8joFpOSugTa
	aVtKyoYIHpUvK/SRpqFRa7njXB0qXicQd+zXDsPgdnAeICsTJUIwrSSYrq8YAgwnqwSG
	NLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pzcHyQ2WGots73z1QiexV34WUK4pnsJbnhSR2PDsIpk=;
	b=J8z4T+qWYCS5nZZu9z84Zza55cZIitN0NdS5xhf9dMUlilJ4k3dOURf+Uy12PsSHMa
	EqqCNPqEFPSxvrCecyr5GMj/hpuVQab4dc9irF/1MYFZmI37T/6IiGjpAlgK6/nTs9AR
	sOl5XW/C4i9/HOK4j7Ut21nRwDIAYslb9OGCC/unHcivVlTr5ofIbBhw6u2PRPMUGWX3
	HReq830gdwo45YvLmaZhqvRaB63Ocn56TMlF9qDt0sHL9AmUyEToDBMUDAIn28cUScvc
	zmApQzc8pzlrRNJbv81c66Vb/DxU+OVUxsCWxyGHvbakXs6KPQ8GiK8EAIDB+H5DIA93
	l2Mg==
X-Gm-Message-State: AIkVDXL60SMG3TAJ+BrrEZKVv2tB9dJaRSVqUhnWDvK6D2S7H9n22jCAJKl7wAKLobnsNMy7z2TSredDEtK78g==
X-Received: by 10.202.117.84 with SMTP id q81mr1988922oic.163.1483648311365;
	Thu, 05 Jan 2017 12:31:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.19.10 with HTTP; Thu, 5 Jan 2017 12:31:31 -0800 (PST)
In-Reply-To: <CAJTo0LYBOGw_KFb4+X=97FBmcUnc-uv-kW63ritDBkSMR0DOyQ@mail.gmail.com>
References: <cover.1483645446.git.chris_larson@mentor.com>
	<719dfc6d6e21c3493d0d67deab963e06f1897d6f.1483645446.git.chris_larson@mentor.com>
	<CAJTo0LYBOGw_KFb4+X=97FBmcUnc-uv-kW63ritDBkSMR0DOyQ@mail.gmail.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Thu, 5 Jan 2017 13:31:31 -0700
Message-ID: <CABcZANkkR-xd+b0zCaY4bRVSPrcHS-LS1_MOBkF-dTdj23UYbg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/16] boost: drop flags bits, fix for x32
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
X-List-Received-Date: Thu, 05 Jan 2017 20:31:51 -0000
Content-Type: multipart/alternative; boundary=001a11c17c1a92164b05455ecae3

--001a11c17c1a92164b05455ecae3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 5, 2017 at 1:29 PM, Burton, Ross <ross.burton@intel.com> wrote:

> On 5 January 2017 at 19:46, Christopher Larson <kergoth@gmail.com> wrote:
>
>> +Upstream-Status: Pending
>>
>
> I think Inappropriate is more fitting here, but you're brave for daring t=
o
> look into bjam. :)
>

That=E2=80=99s a good point, I=E2=80=99ll fix it on the branch. Thanks!
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--001a11c17c1a92164b05455ecae3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Jan 5, 2017 at 1:29 PM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">On =
5 January 2017 at 19:46, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;</=
span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">+Upstream-Status: Pending<br></blockquote><div><b=
r></div><div>I think Inappropriate is more fitting here, but you&#39;re bra=
ve for daring to look into bjam. :)</div></div></div></div></blockquote></d=
iv><div><br></div><div>That=E2=80=99s a good point, I=E2=80=99ll fix it on =
the branch. Thanks!</div>-- <br><div class=3D"gmail_signature" data-smartma=
il=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christopher L=
arson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZ=
aurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></div>
</div></div>

--001a11c17c1a92164b05455ecae3--
