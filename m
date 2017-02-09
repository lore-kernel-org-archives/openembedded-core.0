Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 94C1273208
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 17:22:37 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id s140so11799542qke.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Feb 2017 09:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VpCR+G54ICbXnGkKXq7bRLmF/8lmodjU8q+SyY3pxv8=;
	b=KIyLfQ0vrXTGn9t/2tAkQ1i74F7INujnCsDhqTbvjzqf35No3i7GQP2/PatOd051rr
	SlDypLVsWfma/UfcH6bb4U/BMidFnqt1FJFIUPBD2g4T6SQGcA7IeH8FAUB2k3I4j12p
	0VaJovIDIuopGIwyXZ3N9T2GNiIS+Lz141VaU4QvAFvwmhSIDSuxctJuXtTjIs/etucg
	CKGHBEEu0XlEV5BowKBvLY9RDdLExNfBpaCK0mVitrNB/Iy623fenqrz6a21//Sys5S0
	v1Av/o6ZUMKxPenJrzdJvr2Iqtjak03q5U8NEswP5DW1IwEmvVtevSqpmGSQZ5x0min2
	1bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VpCR+G54ICbXnGkKXq7bRLmF/8lmodjU8q+SyY3pxv8=;
	b=nEMsINz/GMYA9O9jch71lETukup64fKU+CKMtqoTccRLK24KfRsfqTV28vRA7WIyQl
	RtAGKQ17JLvgTZizCzNdcAk+jysXUOY98FypQvqHRVrUiHks7nHGywNKBMPF27xbtDL8
	P86Oe6yCvIGDbWVYIRBasI68OBNeO4bUthnjE1+gp5UtOH8rm2mBY9/JxHfziXrRIdYg
	PehIrgJYgXaubqVxtQJ847Fy0b9YkSd6esgRvP6GT1n9VOAOC1Lss6bBuXQTqJIzTWkR
	QdcHf5inc6Qec9M+LIuAgg12SL9TSXnVh/PmbuGEnnewV5TJZpC6pzkBs4uwxfibrqnz
	H+Rg==
X-Gm-Message-State: AMke39lTcS25GaQgYmPb0OFEulFjm8OYgYnYMr4s5adGD/3YdCZqbG8QXOxcokEP64Ye/DUUoc+UhTAIp11HMbqU
X-Received: by 10.55.47.4 with SMTP id v4mr3991870qkh.77.1486660957513; Thu,
	09 Feb 2017 09:22:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 9 Feb 2017 09:22:17 -0800 (PST)
In-Reply-To: <34f90a06027ceb777ba34f65b42ab98214623935.1486501999.git.mariano.lopez@linux.intel.com>
References: <cover.1486501999.git.mariano.lopez@linux.intel.com>
	<34f90a06027ceb777ba34f65b42ab98214623935.1486501999.git.mariano.lopez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 9 Feb 2017 17:22:17 +0000
Message-ID: <CAJTo0LagKEp-Y2qLEK5ow76operoNcKZ46+teuM2YPx2YXyQJw@mail.gmail.com>
To: Mariano Lopez <mariano.lopez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] insane.bbclass: Add prepare_recipe_sysroot dependency for package_qa
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
X-List-Received-Date: Thu, 09 Feb 2017 17:22:37 -0000
Content-Type: multipart/alternative; boundary=001a114f41084658ed05481c3a5d

--001a114f41084658ed05481c3a5d
Content-Type: text/plain; charset=UTF-8

On 7 February 2017 at 21:14, <mariano.lopez@linux.intel.com> wrote:

> package_qa task requires some tools installed in sysroot; with
> the introduction of recipe specific sysroot this task won't
> have such tools installed if it's forced to run.
>

This isn't the right fix.

Please add dependencies to the tasks, similar to
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=b0f70c5f9e423b37260bf3f3c105095ba4c39afb
(and fixed up in
http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=f66f1af4b165d713b2e0bb0b8f6123cf82fad456
)

Ross

--001a114f41084658ed05481c3a5d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 February 2017 at 21:14,  <span dir=3D"ltr">&lt;<a href=3D"mailto:maria=
no.lopez@linux.intel.com" target=3D"_blank">mariano.lopez@linux.intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D"gmail-:59z" class=3D"gm=
ail-a3s gmail-aXjCH gmail-m15a1a6ccfe1d205a">package_qa task requires some =
tools installed in sysroot; with<br>
the introduction of recipe specific sysroot this task won&#39;t<br>
have such tools installed if it&#39;s forced to run.<br></div></blockquote>=
</div><br>This isn&#39;t the right fix.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Please add dependencies to the tasks, sim=
ilar to=C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/commit/?i=
d=3Db0f70c5f9e423b37260bf3f3c105095ba4c39afb">http://git.yoctoproject.org/c=
git.cgi/poky/commit/?id=3Db0f70c5f9e423b37260bf3f3c105095ba4c39afb</a> (and=
 fixed up in=C2=A0<a href=3D"http://git.yoctoproject.org/cgit.cgi/poky/comm=
it/?id=3Df66f1af4b165d713b2e0bb0b8f6123cf82fad456">http://git.yoctoproject.=
org/cgit.cgi/poky/commit/?id=3Df66f1af4b165d713b2e0bb0b8f6123cf82fad456</a>=
)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross=
</div></div>

--001a114f41084658ed05481c3a5d--
