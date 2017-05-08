Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9CAA665CB6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 10:03:48 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id m91so45243096qte.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 May 2017 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hIe+PGnASNhB6kx9s78Cs0DZDg8rgFaQoRhoYcXuCWQ=;
	b=fdr8dTStSH/Hi/Om0ond1T2aONTCkVQpSzMvo2wl2P/Alom9YBzwt+vmJELI+JAuS7
	iT+6vXnYfteDETRtQBOIy+NXzIyO6Rki2JepPS1X8O7JQi8erKNmicQO4M3Z30ejaG6i
	sPLWT8WWEf+vG7mGSH45K2E17BCQ312UImMBjeIu47l2p1R2OoVmmoP9uRHwPl80J79J
	B+GxUOK7V0oVDCl8muvbgI56WUW7oEL1VKISwA6i2tV/KT93dbYo8ENxb1K4ix2x+iVO
	h0tOFEW+bF55EJKqVks+TU4Yel6++1m+Cptx50Q8HtOM6vjdhBwk7PCG+XwKg1K5JkYq
	NA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hIe+PGnASNhB6kx9s78Cs0DZDg8rgFaQoRhoYcXuCWQ=;
	b=cG+VIBVasDremU0mO3YZmTAwT/3VTEH+4MOohTu3memxE8kuRAV3FASrEjG2H82vi6
	lmvf7707WE/jihdulFeXwQSgd6gJ6ABY58zYq11svWCFhyzz6auzMicNDH98n1CIayot
	InU/fg2UCA5dmQ0KzkcypKK0TWzV0COAvr/fRVwzpPlf5DEuKsW/4fUKPid/RF8z1nAw
	7nvLkEGZdOwgHXOmnpJuhxnm3UWkkWq2yalwJ5ENZtQGqzcmuJ8ppYTs8QL6G5+cehOC
	iIL2rqq+ggQF0zGPNc1pLYud/LHl/9RMbrDu515k2s756MgmEXXiLmRiH0S2VTuNcg5R
	FJKw==
X-Gm-Message-State: AODbwcC+j7J92E6fhXg5H7Gv4NBIwrHYRy7ZH/omtY61dg1AFIEWK2oK
	DvkQF7UDXJm7j5uTx1jjE599Rxl+WqDb
X-Received: by 10.200.34.242 with SMTP id g47mr13116650qta.109.1494237830129; 
	Mon, 08 May 2017 03:03:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.136 with HTTP; Mon, 8 May 2017 03:03:29 -0700 (PDT)
In-Reply-To: <1494238535-8323-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1494238535-8323-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 May 2017 11:03:29 +0100
Message-ID: <CAJTo0LYkJ03+j6pPuGDbVjdKe4zMwWY0X0M8WXKm3vUtOrXYtg@mail.gmail.com>
To: zhengrq <zhengrq.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [jethro] [PATCH] rpm: Fix the Bug of SRPM String error
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
X-List-Received-Date: Mon, 08 May 2017 10:03:50 -0000
Content-Type: multipart/alternative; boundary=001a114037d41341da054f005bd0

--001a114037d41341da054f005bd0
Content-Type: text/plain; charset=UTF-8

On 8 May 2017 at 11:15, zhengrq <zhengrq.fnst@cn.fujitsu.com> wrote:

> Add a patch 0001-Fix-the-Bug-of-SRPM-String-error.patch to fix SRPM bug
>
> When use bitbake to build a SRPM package, some sections of SRPM can't be
> displayed normally.
>

Does this occur in master/pyro?

Ross

--001a114037d41341da054f005bd0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 May 2017 at 11:15, zhengrq <span dir=3D"ltr">&lt;<a href=3D"mailto:zhe=
ngrq.fnst@cn.fujitsu.com" target=3D"_blank">zhengrq.fnst@cn.fujitsu.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5on" class=
=3D"a3s aXjCH m15be5b016b562cd2">Add a patch 0001-Fix-the-Bug-of-SRPM-<wbr>=
String-error.patch to fix SRPM bug<br>
<br>
When use bitbake to build a SRPM package, some sections of SRPM can&#39;t b=
e displayed normally.<br></div></blockquote></div><br>Does this occur in ma=
ster/pyro?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a114037d41341da054f005bd0--
