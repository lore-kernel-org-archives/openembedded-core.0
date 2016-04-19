Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id B6C566014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 13:23:49 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id fs9so6805738pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=DZOpRFb8f/KeaI7oAqHwaORo5saVmK7cJ2jGfbtpmzU=;
	b=tFbsooHkJscDPmNZ3WpkAZcZXL00iu39XqIVum5Z3uAZRbUSlGw5YH7WLBnr4vCllW
	n07pQDBQMqds7hUpm/3TuzHIkCkJCz9tNrU9Kk6mL+Ade8O6PiGR3v50yTwpiiaixnjD
	s9LvzDojK3VbRQNxeBCggqzIyf+zx3Ok1s65/veeRccDoFTMPME8jHmbyJR+Yinhwvm4
	m/OzIRlAgEXZXc4SFJgPEhNwIqVnm88QfCS6P3vGSD+JBeZN2V2fx3PMEb+QLRl2h+0c
	JO/89CiFKJg+7N7Jf+Hp6hHN+fV6CUxO0ae4Gz4UyVDEZSlccDA3mW9Y2i+ktUzdQ6C9
	1bbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=DZOpRFb8f/KeaI7oAqHwaORo5saVmK7cJ2jGfbtpmzU=;
	b=QVpKqIfUHzA7oWeU4jPa8sVaOiDAwmdulm/czqDAhZRDdnAxw/Zndy3+naF/7NgvND
	88dqK1eVlg1ct/1f1/Xg4Ra9SUJHex2Goh5FqLZ1ygDcsihhVqBuONEXNJJ1DMfgbKMi
	LmKTlptkzKT/1iEnRnOmdtDODf6QZJBM0ySNPz8fCsa1mlIv125H3d0EDNIHQ7ec75Tu
	KaoWkA7ZMCIsgiJBqz6NeBNA0wLT1JuvlcLEvOzQ3yufcQ8hodeGyKDwDrjEF+vFWPnc
	3nzn+bfhtd3l8jPoCeTMk1v/AoHKlIS+sHRu18VtFLfau5Ak4SkO8sanuJGDNeNZZzdy
	w0Cg==
X-Gm-Message-State: AOPr4FXFH+4GmiguWmeWLmMWwK8LTwiJYFWdTmKG5QKtVvRynwu/CLrn2F1qhuIW4fngjA==
X-Received: by 10.66.164.39 with SMTP id yn7mr3995538pab.107.1461072230278;
	Tue, 19 Apr 2016 06:23:50 -0700 (PDT)
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com.
	[209.85.192.178]) by smtp.gmail.com with ESMTPSA id
	t126sm18750600pfb.73.2016.04.19.06.23.48
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Apr 2016 06:23:48 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f178.google.com with SMTP id c20so6891821pfc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:23:48 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.80.10 with SMTP id e10mr3985078pfb.141.1461072228258;
	Tue, 19 Apr 2016 06:23:48 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Tue, 19 Apr 2016 06:23:48 -0700 (PDT)
In-Reply-To: <1461061900-27444-1-git-send-email-Martin.Jansa@gmail.com>
References: <20160419095052.GB2562@jama>
	<1461061900-27444-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 19 Apr 2016 10:23:48 -0300
X-Gmail-Original-Message-ID: <CAP9ODKq6sPuBCe3NkDT1v1OxHPwkMwi1Na4qGgtacm1qukLkww@mail.gmail.com>
Message-ID: <CAP9ODKq6sPuBCe3NkDT1v1OxHPwkMwi1Na4qGgtacm1qukLkww@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: Introduce PACKAGECONFIG_CONFARGS variable
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
X-List-Received-Date: Tue, 19 Apr 2016 13:23:51 -0000
Content-Type: text/plain; charset=UTF-8

Hello Martin,
Hello Richard,

Martin, thanks for updating the patch to comply to Richard's suggestions.

On Tue, Apr 19, 2016 at 7:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> * add separate variable for configuration options generated from
>   PACKAGECONFIG setting, this helps other bbclasses and recipes
>   to take advantage of PACKAGECONFIG mechanism, without including
>   other options from EXTRA_OECONF
> * e.g. meta-qt5 recipes are abusing EXTRA_OECONF to get options
>   from PACKAGECONFIG:
>   EXTRA_QMAKEVARS_PRE +=
>   but with
>   conf/distro/include/no-static-libs.inc
>   it means getting --disable-static as invalid option inside
>   EXTRA_QMAKEVARS_PRE as reported by Alexandre Belloni who tried
>   to use poky with meta-qt5.
> * once we migrate all bbclasses and recipes to PACKAGECONFIG_CONFARGS
>   we should also restrict EXTRA_OECONF append only to autotools.bbclass
>   like I did for cmake.bbclass
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Richard, I understand we are late in the release cycle however this
change is indeed required to fix our build of Qt5 using Poky
distribution.

The patch seems fairly safe and should have no impact for current
metadata, while it allow for meta-qt5 to fix the Poky support. The
patch has been sent on Feb and ended being forgotten in the merge
queue however it is being used daily by the World Build test from
Martin, which includes it so static libraries can be disabled.

Please consider it for 2.1.

Best Regards,

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

