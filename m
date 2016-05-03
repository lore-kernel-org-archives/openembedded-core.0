Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FBB57317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 15:20:15 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id rc4so2587692igc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 08:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Gvw7J1TwWWTKdQUQwipoUBePUzAWTTLHvkzwjyDA34w=;
	b=oneYlFTFGiImp1E+SEX+/68WQVz8NDp9yzMQeDvsg9okgJN0aKPwImgVMETQRElzoy
	dOAxf1QarnkkPedf+9mbO+0QNb+qNKa05esRrtvNpNJh0JWmnd0muQysXDlEakxagr1j
	24Y7ZvGQwHQ2rn69j41YnBFTFYG58tZsdOWVy+bneKHZCRItQcqKQqf1bVTMLPdcZ/n5
	xrZEtTxGcE02VNqFoLTEh88qZkVBL/EJV0qn+g49LdkZQcNUM+YqarsQ04YQhSs8cmme
	HXy9qSBvZfQNHs6SM7VcFIDtjJ3Dc/naCA3FQr3pbfihDc5iNolzguveqrrF1vD+y2In
	OImg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Gvw7J1TwWWTKdQUQwipoUBePUzAWTTLHvkzwjyDA34w=;
	b=huAwWPM0WvyRe/Q0iaxKhyEXpOUK4TST19105QEktbg+fQggL7BjHjO5+nb2hG5INd
	oSeZodSMKu4SbHq4KohTLXaQgMCrcU58r/L1oybYwD7P+hjwlcojCEfAJzTqLOFRtEG3
	o79DbOJDp9zpmzdosymY2ZAIbfgzOiI9/cttXcdFtIPDl6jtSY02sbbizgkITlZiqNzC
	60+BBPKmArdeuCRjiSDdNLd/c8un/3naL7PDUhpy9wfUl9EWYbuNjEIYKz7TM4k7dp1y
	K4yCnsOnwDKEajsLS/Wqxc4zUqrtgOJ6VK/cVZ3u426GEcUZEZK5/Y2Yz3JuDPO2FPgB
	xoMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Gvw7J1TwWWTKdQUQwipoUBePUzAWTTLHvkzwjyDA34w=;
	b=hykSNngmld1XYiOB+TKR05tzepQsQWOIdywAri4xbn0sCngPF3/syzYzW293mUSt9K
	PknRAhB7IW0kJ2QqZnQzF29GDGrk213GqvOyxOzcQGEmblbai7+kn45tdXJhMMinTvgg
	M7s9EzSJwI58hbHbgZWpNSqU3ettudkW3hgfBVgeuH7wePdHT2UDodGz1XWRUVWIjjPB
	/vLhm7mz2VLJkPsgtjkNNO8uVDLFfMrYaLObHI3W2aj4upSQ2gidGQ0O6RJ4WimcUffF
	IYMkgAP4WPzMZ1Xjwn7VlJI1CJm7TOVOUCvLyPdrLGwdTQHalGTe9TB+zfXf5Ynp1zb1
	h0qg==
X-Gm-Message-State: AOPr4FW9rNy3WPAxOu6oVyseH5KOb7H1uLpx5Ip6FKh4Y3ITco4IW5iCqCiL3RxmlpwOBormN6eiDfS3/CbpWg==
X-Received: by 10.50.29.76 with SMTP id i12mr26225156igh.87.1462288815882;
	Tue, 03 May 2016 08:20:15 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Tue, 3 May 2016 08:19:56 -0700 (PDT)
In-Reply-To: <CAFUnDm_fLLocYWVPAx3YfSdgiyXPYbd7gpzjT=LXJq=Z1ixaHA@mail.gmail.com>
References: <CAFUnDm_fLLocYWVPAx3YfSdgiyXPYbd7gpzjT=LXJq=Z1ixaHA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Tue, 3 May 2016 15:19:56 +0000
X-Google-Sender-Auth: m6SA5WbDHiRRnpSm21jJw-Hrqwg
Message-ID: <CABcZANmg90UHeWQdT1p0bNEjMKEWA+LrUB76YzZbixq_cp=1gg@mail.gmail.com>
To: mubin syed <mubin10@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe]: Run time dependencies(i.e. Python package/modules) are not mentioned in dstat recipe
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
X-List-Received-Date: Tue, 03 May 2016 15:20:15 -0000
Content-Type: multipart/alternative; boundary=047d7bd759846e0c400531f1a57e

--047d7bd759846e0c400531f1a57e
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 1:48 PM, mubin syed <mubin10@gmail.com> wrote:

> Hi,
>
> I am beginner to the yocto recipes.
>
> I have following observation regarding dstat recipe,
>
> 1. dstat utility requires some python modules during it's execution(i.e.
> run time dependencies).
> 2. As per my understanding, yocto recipes should mention their run time
> dependencies under RDEPENDS variable.
> 3. But I observed that, dstat recipe(from meta-oe layer) doesn't have any
> package assigned to RDEPENDS variable.
>
>
> Is there any specific reason to not to mention any run time dependency for
> dstat utility?
> Please correct me if i am missing something.
>

You aren't missing anything, it was most likely just an oversight. There
are quite a few python recipes which are missing needed python module
runtime dependencies at the moment. Patches welcome.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--047d7bd759846e0c400531f1a57e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Tue, May 3, 2016 at 1:48 PM, mubin syed <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mubin10@gmail.com" target=3D"_blank">mubin10@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Hi,<div><b=
r></div><div>I am beginner to the yocto recipes.</div><div><br></div><div>I=
 have following observation regarding dstat recipe,</div><div><br></div><di=
v>1. dstat utility requires some python modules during it&#39;s execution(i=
.e. run time dependencies).<br></div><div>2. As per my understanding, yocto=
 recipes should mention their run time dependencies under RDEPENDS variable=
.</div><div>3. But I observed that, dstat recipe(from meta-oe layer) doesn&=
#39;t have any package assigned to RDEPENDS variable.</div><div><br></div><=
div><br></div><div>Is there any specific reason to not to mention any run t=
ime dependency for dstat utility?</div><div>Please correct me if i am missi=
ng something.</div></div></blockquote><div><br></div><div>You aren&#39;t mi=
ssing anything, it was most likely just an oversight. There are quite a few=
 python recipes which are missing needed python module runtime dependencies=
 at the moment. Patches welcome.=C2=A0</div></div>-- <br><div class=3D"gmai=
l_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - =
BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software =
Engineer, Mentor Graphics</div>
</div></div>

--047d7bd759846e0c400531f1a57e--
