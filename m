Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by mail.openembedded.org (Postfix) with ESMTP id 92A3B607A4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:40:09 +0000 (UTC)
Received: by mail-io0-f174.google.com with SMTP id f89so48194310ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EuYaiO5rf6VcP2l03E6oUQgUpVvHml2moKzdIeqWp4U=;
	b=AcnPlc68gLspS/yYDt4MJDNMIszOMROS08yLQA4Wu2ulb1HGVhHhMOjFP9HrvwBXIe
	XLSo/VxoAnTBb+Np06/odwdGTJTSCW133Ddu/3aOxUXJz89ACWfBcuRZZwsoHODwWSbc
	3J0z0qkMBUHpNLF7nqv2mhSTASrToaw/XVbJ3ytoyl0GYSqQp2oNUdLSnLx1GwSyd1DJ
	swGoxybz1b3RHKeecJmxypvp/urf/IurwlOwmSDqqL9DheP+CVkCGDbCjmtAyfaqFpXP
	zKYu/t8LVUSh/GNKfL+WXODquOTKJSV9QJlnPuY82EC4o88FCby98AlGuJgqrtocss0F
	IDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EuYaiO5rf6VcP2l03E6oUQgUpVvHml2moKzdIeqWp4U=;
	b=NAkTHuTrc4NTuDkoRLKjhkA7WFTMgLtgy6lLnF4TSGDh82BCAPWIrpyc3aMeYpi3QB
	PpRkPrVPXvTsEkV3eFLbhU6TA4Zqu5hk+6DkmoUKarw54xagmijUMCG6jQATFxgZ9J0b
	Zi9Xu6rxUSMNktasUbPT0Borae1JELp0Wjjy9TJvcZPtQIu1uTAFNgc0Bt5YtdC3BqGQ
	0gz9L7EPPqNR2uNsixEsOYhxfIf5nMh2kOy4WcEOHAdIffmSLzxs/UPIHqOe3oMGvqlp
	URvn/J7HmbpguWjbzNe3UUvUlXGUCA7CyavL+4C8pULpWZn9Q0YP59vP672iNkVUcJZG
	4YBQ==
X-Gm-Message-State: AOPr4FXfiTKjnPTqha6hAjxhmSFFGbFplduqVzXKx1oEnPtJE2JlAuegmmCZ1gDPB6aZQbf4osF+FAjWHm8IUSHD
X-Received: by 10.107.135.211 with SMTP id r80mr11479843ioi.133.1461768010083; 
	Wed, 27 Apr 2016 07:40:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Wed, 27 Apr 2016 07:39:50 -0700 (PDT)
In-Reply-To: <CAGgRHJohN6OXYd8hSSiAChMaCxiaFmu=cXiYP+EK9RV6GMmj8A@mail.gmail.com>
References: <1461760323-27285-1-git-send-email-matt@madison.systems>
	<1461760323-27285-2-git-send-email-matt@madison.systems>
	<1461762212.31320.182.camel@linuxfoundation.org>
	<CAGgRHJohN6OXYd8hSSiAChMaCxiaFmu=cXiYP+EK9RV6GMmj8A@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Apr 2016 15:39:50 +0100
Message-ID: <CAJTo0LawbhSmPT_1DpcMFEMD7q9AMc29EKQMj0AGpn77amRc_w@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] image.bbclass: don't expand IMAGE_CMD when setting do_image task
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
X-List-Received-Date: Wed, 27 Apr 2016 14:40:11 -0000
Content-Type: multipart/alternative; boundary=001a113ed20afc49e70531786259

--001a113ed20afc49e70531786259
Content-Type: text/plain; charset=UTF-8

On 27 April 2016 at 15:19, Matt Madison <matt@madison.systems> wrote:

> There are other variables that can cause this, too - ${DATE} and
> ${TIME} by themselves, for example, which aren't deleted.
>

If DATE and TIME were removed would the variables you're using stop
changing?

Ross

--001a113ed20afc49e70531786259
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 April 2016 at 15:19, Matt Madison <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:matt@madison.systems" target=3D"_blank">matt@madison.systems</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":59o" class=3D"a3=
s aXjCH">There are other variables that can cause this, too - ${DATE} and<b=
r>
${TIME} by themselves, for example, which aren&#39;t deleted.</div></blockq=
uote></div><br>If DATE and TIME were removed would the variables you&#39;re=
 using stop changing?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113ed20afc49e70531786259--
