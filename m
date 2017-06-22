Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f178.google.com (mail-qt0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id E84E77823A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 16:25:22 +0000 (UTC)
Received: by mail-qt0-f178.google.com with SMTP id f92so15868357qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 09:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lGvzySwlrTkyi3WGTPOBCmGT7HZOrDtmntY1+KowL1o=;
	b=bcNwjEoE6UWe1ySBku5vaT4RVGiCtAIe1fmHkrkjohC/onEuUDiY/VmYhw28wIPxoh
	TSoCejXX1Uf2BU3c53FuKO3FSWSyZLBVASotmR3Rg1ZllQMUu+QCO2SI9GUd7vAYNF1H
	C9+r4tIfhBZ+CEXYVoiIptoHEMw3KL50pl1hPq6jIDGKBj8AZa1o/76sUrLO0g0YXZk1
	U9L3e4sSE6yKby8SRsvFxKxTJoolsMOVr/0YYMCXskYYw35qDIhBsLoNYlASkyULVQMX
	exivfh8nPFeJT5Ko2FEI2pI8GVjJ/unNZUHwshAQo0iPqMpfqWvooxaYtKlekT/21yvX
	95Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lGvzySwlrTkyi3WGTPOBCmGT7HZOrDtmntY1+KowL1o=;
	b=S/ZpG9MxfXH3VcuYsNW7TJr86WLIHJdyfYrcqvRcMSkNw8lli1jnxl0mMVx7Rrk9/n
	vYPuteqbXO7V1OFlzFsNAY/9qUu43jl0f0DmVjFlL/ouLz9WqRfOnqXjmLXsH9Vj5UfW
	DtU/J+whOXCgGQEqALX0Nfap9svXt/0Ihz6gp5po+i5HcE3o4+/WgK4IN05gbxtMH+Ru
	f3/huKtQDavwkhVk4x5hYd3ILBinpwy8p+gSzMEK3IOBxSaIeJxaOnRV/PmOhnrllRKQ
	IP2vAAkSQLQwh8cQh4eUMx+hDP/6j0ZTtuwd34AqDYkCSUTVvr2/0Eah3WzXkoLrD2f/
	pqgQ==
X-Gm-Message-State: AKS2vOz+2cQl7ZWUl7u37Lih0VCLiAy0IEIrnMU6YnQ342bPE5u8XGwO
	ibrA8epT7gdVrp17LDX7wp386nXwRFKR
X-Received: by 10.237.59.134 with SMTP id r6mr3843971qte.47.1498148723512;
	Thu, 22 Jun 2017 09:25:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.35.103 with HTTP; Thu, 22 Jun 2017 09:25:03 -0700 (PDT)
In-Reply-To: <20170616213952.35679-3-nathan_lynch@mentor.com>
References: <20170616213952.35679-1-nathan_lynch@mentor.com>
	<20170616213952.35679-3-nathan_lynch@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Jun 2017 17:25:03 +0100
Message-ID: <CAJTo0La9rcpY8oxxuaWspjLM6NjJNugVopmdVEvps=sH2fMkcA@mail.gmail.com>
To: Nathan Lynch <nathan_lynch@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] lttng-tools: update to 2.9.5
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
X-List-Received-Date: Thu, 22 Jun 2017 16:25:23 -0000
Content-Type: multipart/alternative; boundary="94eb2c1900407c6a4605528eee3b"

--94eb2c1900407c6a4605528eee3b
Content-Type: text/plain; charset="UTF-8"

On 16 June 2017 at 22:39, Nathan Lynch <nathan_lynch@mentor.com> wrote:

> Miscellaneous fixes.
>

This isn't related to the upgrade as it was a problem in the old release
too but I thought you should know:

WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check looks
like a libtool wrapper script [libtool-wrapper]
WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
/usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check looks
like a libtool wrapper script [libtool-wrapper]
WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test looks like
a libtool wrapper script [libtool-wrapper]
WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
/usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_test looks like
a libtool wrapper script [libtool-wrapper]
WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config looks like a
libtool wrapper script [libtool-wrapper]
WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest:
/usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config looks like a
libtool wrapper script [libtool-wrapper]

Ross

--94eb2c1900407c6a4605528eee3b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 June 2017 at 22:39, Nathan Lynch <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:nathan_lynch@mentor.com" target=3D"_blank">nathan_lynch@mentor.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex"><div id=3D"gmail-:23s" class=3D"gmail=
-a3s gmail-aXjCH gmail-m15cb2d9d64a29729">Miscellaneous fixes.<br></div></b=
lockquote></div><div class=3D"gmail_extra"><br></div>This isn&#39;t related=
 to the upgrade as it was a problem in the old release too but I thought yo=
u should know:</div><div class=3D"gmail_extra"><br><div class=3D"gmail_extr=
a">WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-ptest=
: /usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_check loo=
ks like a libtool wrapper script [libtool-wrapper]</div><div class=3D"gmail=
_extra">WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-=
ptest: /usr/lib/lttng-tools/ptest/tests/regression/tools/health/health_chec=
k looks like a libtool wrapper script [libtool-wrapper]</div><div class=3D"=
gmail_extra">WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-t=
ools-ptest: /usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_tes=
t looks like a libtool wrapper script [libtool-wrapper]</div><div class=3D"=
gmail_extra">WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-t=
ools-ptest: /usr/lib/lttng-tools/ptest/tests/regression/tools/live/live_tes=
t looks like a libtool wrapper script [libtool-wrapper]</div><div class=3D"=
gmail_extra">WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-t=
ools-ptest: /usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config loo=
ks like a libtool wrapper script [libtool-wrapper]</div><div class=3D"gmail=
_extra">WARNING: lttng-tools-2.9.5-r0 do_package_qa: QA Issue: lttng-tools-=
ptest: /usr/lib/lttng-tools/ptest/tests/unit/ini_config/ini_config looks li=
ke a libtool wrapper script [libtool-wrapper]</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div></div>

--94eb2c1900407c6a4605528eee3b--
