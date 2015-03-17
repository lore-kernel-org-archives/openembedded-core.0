Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0478065CD0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 08:01:33 +0000 (UTC)
Received: by qcaz10 with SMTP id z10so1484041qca.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 01:01:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VitbNO++jM5lBwAI7FpfXQhpoFUWeFEahNSvdu14k2s=;
	b=J6sbLJCBH28GO4WcXM9FFmN157+M1z3EsNINmwiPUgIuZQoAxRvzb82gORnUdx8pDF
	p013JXujFezfDHP494cgGZbLSQpMTEUlorHFY+0IUApmNy6nUIddvIozlsfUgr/xQ2oV
	xU+RrM5OO0CVSuyQJQRfG+8HfbhTzKWurXV++of6zIFbzcOQMXYVfAYYhTWONq0d+kw9
	DIVlw62bJvriZ7pHYd/QF5UEUvxhCY27clam8+nKs0qYc5vBvf/2H5agbUPDdiNSrwJ9
	Z8YWJeYvhIm6Q4JZqlN833Vvy9iRP+Oy02xfXqDfYC2Y5YvabgAXcsloj1iGH3GaZ5Io
	chww==
X-Gm-Message-State: ALoCoQkjluDgZ9V2CuedJouD2Fke2dxwKWgAO76na737HfQUyxRp1GatBYtYnegzzoweLCX6nmas
X-Received: by 10.55.23.208 with SMTP id 77mr48903683qkx.21.1426579294469;
	Tue, 17 Mar 2015 01:01:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 17 Mar 2015 01:01:14 -0700 (PDT)
In-Reply-To: <1425579036-31022-1-git-send-email-raj.khem@gmail.com>
References: <1425579036-31022-1-git-send-email-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 10:01:14 +0200
Message-ID: <CAJTo0LbyqjXJutC9nrj2zheJqrHGryVAydGeHffuCMB+5a-m0Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/2] tcmode-default: Define one gdb version
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
X-List-Received-Date: Tue, 17 Mar 2015 08:01:34 -0000
Content-Type: multipart/alternative; boundary=001a11479e2e1753a105117760a6

--001a11479e2e1753a105117760a6
Content-Type: text/plain; charset=UTF-8

On 5 March 2015 at 20:10, Khem Raj <raj.khem@gmail.com> wrote:

> +GDBVERSION ?= "7.8%"
>

What's the rationale behind wildcarding this instead of using the version
of gdb in oe-core (7.8.1)?

Ross

--001a11479e2e1753a105117760a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 March 2015 at 20:10, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><div id=3D":300" class=3D"a3s" style=
=3D"overflow:hidden">+GDBVERSION ?=3D &quot;7.8%&quot;<br></div></blockquot=
e><div><br></div><div>What&#39;s the rationale behind wildcarding this inst=
ead of using the version of gdb in oe-core (7.8.1)?</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--001a11479e2e1753a105117760a6--
