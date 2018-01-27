Return-Path: <francescogiancane8@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 7D58078093
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 19:28:02 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id 141so26687332wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 11:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=YbUpUYuTePuB6P9bpWqgl9XkmGgd3AczftYvhtWIblk=;
	b=r8UuEprPwqc5dqIgkKqVx+bXMKmrK9Ze2OWDenGvH+Get9fqRrHVn4d8CwqNV8sCUj
	ILfDcS8LL2UEp3eo/AjGVhYjslGbz1uWZOVFTrhBO6VhK1WP9mhQ21jjju0OL8wsg1Vi
	E4JWscQmFCjStbsepUNPCSXdD4tgc04H2aCiT9LXJvGpKRJV2k2M9UUOontXUeDXVw9G
	KCS2fUoKJc8BPmtXWDs3t1BsJeh6gu1++/adR+gDM0uz2yGLflEvgGWug3ofbbSkWLik
	2Ie5Doz2ITUkK8TxRexx94suSqx52+Tsl4o7Pc5EDo2qlzj8Jgi0RuAmE6fk15ZzEsio
	34cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=YbUpUYuTePuB6P9bpWqgl9XkmGgd3AczftYvhtWIblk=;
	b=pTMXsCnJ/zpjkPSWwO4kTAy3C3u0Wvcq47Z6DqHwCGyyF9hGLpe0q4VAWftV9W2MMm
	H8gIc2MgbsvFrJq1/9oKLL400x3hPsPg3OlJdODz5PNtMBlMP36fhMRaOG/DQjVcbVm3
	50T/SK142Ss7xlUcD01g+GoV+QoTo+fvgBUa0P+cvKBWCZaSHu4mN9aPmPt3j0LUREgD
	alQs+AlpTwB7i3YL/njMKENqpFIn/4ohszKKVSFD76irNdHneTJAx9T1MOLgJeXUobj5
	AUH2MtBgUhtFHHymdqozV1uP6ec7xyHiLagOQfzEbdbBrKBicvWiNIP1lcg84rTwdGZ4
	9aAA==
X-Gm-Message-State: AKwxytegYCkn6MpRBZRsSESlhVrGj2yRk+LljeKye+YS/6r8GKiuuN4C
	0l8MJzMqwzcMqaIKl4MeeAKQ29y5Kxec+J0UKSAf+w==
X-Google-Smtp-Source: AH8x227YfKpS1IjkJ1xsLfftpIvIMybgXwBcxD34EYZKABLUOTwHnANn7/FHY4HckOBPkxeJacKx8o6X4gQEXhRkMdk=
X-Received: by 10.80.146.81 with SMTP id j17mr40327011eda.205.1517081282580;
	Sat, 27 Jan 2018 11:28:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.143.131 with HTTP; Sat, 27 Jan 2018 11:28:01 -0800 (PST)
Received: by 10.80.143.131 with HTTP; Sat, 27 Jan 2018 11:28:01 -0800 (PST)
In-Reply-To: <CAEQ58sjNMVASuDU5GaSKqf3Xp6-UC_8gZZEdM-mtQ_pRFNwR8A@mail.gmail.com>
References: <CAEQ58siiwEqY-KuFZDuCxyBOZnA2d-Bo8MFWTF9X_AGMfOxmzw@mail.gmail.com>
	<CAEQ58sjaushTPi=PBy-ttCL9XBtsmHN-p=XjZXA1VW-_4aKZRA@mail.gmail.com>
	<CAEQ58sje+LCZnqDykHQ_gvQoNvgCH5QFCa_k2tGfnCd__Y07Ww@mail.gmail.com>
	<CAEQ58sgADk0b5O_7vv=Y6Ru6zX151e3pPREYY2p6fuXEOuqZ9Q@mail.gmail.com>
	<CAEQ58sh+bBzbOxf+dv90jeAe91Pf4J30=VqT2LuFyZfnjwVoog@mail.gmail.com>
	<CAEQ58sivWmT-mnB=zAZRhzgnQFiV3KP9aNioyKu2k2RvDyjW3A@mail.gmail.com>
	<CAEQ58sjNMVASuDU5GaSKqf3Xp6-UC_8gZZEdM-mtQ_pRFNwR8A@mail.gmail.com>
From: Francesco Giancane <francescogiancane8@gmail.com>
Date: Sat, 27 Jan 2018 20:28:01 +0100
Message-ID: <CAEQ58sjBMsMhg4a_TWiKH8Vvo7UaGodtPO1GsXCcU0fxqFSa7A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: kernel-devsrc fails to install the rpm package
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
X-List-Received-Date: Sat, 27 Jan 2018 19:28:02 -0000
Content-Type: multipart/alternative; boundary="f403045c28b2f197170563c702aa"

--f403045c28b2f197170563c702aa
Content-Type: text/plain; charset="UTF-8"

Hi guys,

I am trying to build an image with kernel-devsrc in target and sdk
(teaching purposes, no production here) but when packages are to be
installed, bitbake fails, telling that nothing provides /bin/awk.

Looking at kernel-devsrc.spec,it seems that the requirement is added, but
following the inheritance chain, there is no trace of this dependency in
recipes.

Can someone tell me what is happening here?

I am using rocko and building for raspberry pi3 64 bit. No other layer is
added.

Thanks,

Francesco Giancane

--f403045c28b2f197170563c702aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi guys,=C2=A0<div dir=3D"auto"><br></div><div dir=3D"aut=
o">I am trying to build an image with kernel-devsrc in target and sdk (teac=
hing purposes, no production here) but when packages are to be installed, b=
itbake fails, telling that nothing provides /bin/awk.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Looking at kernel-devsrc.spec,it seems that t=
he requirement is added, but following the inheritance chain, there is no t=
race of this dependency in recipes.=C2=A0</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Can someone tell me what is happening here?=C2=A0</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">I am using rocko and building f=
or raspberry pi3 64 bit. No other layer is added.=C2=A0</div><div dir=3D"au=
to"><br></div><div dir=3D"auto">Thanks,=C2=A0</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Francesco Giancane=C2=A0</div></div>

--f403045c28b2f197170563c702aa--
