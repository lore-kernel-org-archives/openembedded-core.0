Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id 741A760797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 16:03:52 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id g127so21935422ith.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2016 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=58DVsEocxK65A4/oviRrBPUxR0PyZAbsyw17tB+Odao=;
	b=WpZsMYK1bYjI8FShpxuibeg7xiWSDTYFC+i3TuOLuvEig6UFjjdy9D2Lw1UGirtZyC
	nSQU4+XDRe8097KEn7hktx1f78mvIifNS8TzL9yt1NPNnyihOsfLJNKHTDKiVMrf7kzp
	TVR1l+mmQ92xOcNGUDl6FGAbvroJKiq07cB7zqqbbiXx5RHvXTlhoTayVpMbsrpIGULY
	+XO7ZsUeE6wplcPn7wK5xIFVCyU+dcF3RAG2jxBImDOfsD1I1RgF1uGC+550L1hEzHaj
	UDaorAmlz5Nk59EzBhOXeY2iofSuCpP1UiJEVhRPTKRZb3lK3Sv/icm1Ro3uUYRDGxVf
	WDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=58DVsEocxK65A4/oviRrBPUxR0PyZAbsyw17tB+Odao=;
	b=lmrDTxKdCFJFMOmFu2TG2jYJDsSeR9P6/zcNkwlXRw4g69GNje8xAK+ROvv6ds4zjX
	+JxIYwarsM601j3OPRPdBxxB+wUxvq8v4dWCfNI7y8Wk7MURukZ8AWHypV9O/8yAicVj
	KHudsa5yetRcWQGfHHiiLvLX049hrY1LTMjIdeveDyJJtzWlPenRNRKeFPRgTJP1ycOB
	S7aDwaHIvnOnh8xWVS3f7qmV41m+oR1YhIISNRMm3h1A3U6pSMeyj1v1yw+oC4tL02IZ
	8vkR4izGDZXRudmLeNMaCPANy0VRPCh91rO0Yv1KWq1UtNOA9gKz4jhhPYxceq90M3am
	VuyA==
X-Gm-Message-State: ALyK8tKKybS8UIAITLPGWHyNgr0nUZLEaQHyb9PS6CK8dLy9jjPUUB24MgToJr4B5Cjj0lM3XOul2Rj6wmxiUBse
X-Received: by 10.36.57.211 with SMTP id l202mr6999517ita.22.1466525033274;
	Tue, 21 Jun 2016 09:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 21 Jun 2016 09:03:33 -0700 (PDT)
In-Reply-To: <CAMKF1spPd9sX7DmuLtzOuYuQT+jRgZhze6hCiNWwbW2-U_MytA@mail.gmail.com>
References: <1466519942-5978-1-git-send-email-akuster808@gmail.com>
	<CAMKF1spPd9sX7DmuLtzOuYuQT+jRgZhze6hCiNWwbW2-U_MytA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 21 Jun 2016 17:03:33 +0100
Message-ID: <CAJTo0LYtMSmqz-hr6zxfPDrv3x0kDDEO02ceH5zDU3o6H5iY1w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Add qemuppc64 target
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
X-List-Received-Date: Tue, 21 Jun 2016 16:03:55 -0000
Content-Type: multipart/alternative; boundary=001a114ab3caa9e6c60535cbf7b8

--001a114ab3caa9e6c60535cbf7b8
Content-Type: text/plain; charset=UTF-8

On 21 June 2016 at 16:59, Khem Raj <raj.khem@gmail.com> wrote:

> Can you also see if usermode qemu needs to be changed for ppc64 as well
>
It needs enabling entirely - qemu-ppc64 doesn't exist currently so every
build-time postinst fails.

Ross

--001a114ab3caa9e6c60535cbf7b8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 June 2016 at 16:59, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:=
raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">Can you also see if us=
ermode qemu needs to be changed for ppc64 as well</p><div class=3D"HOEnZb">=
</div></blockquote></div>It needs enabling entirely - qemu-ppc64 doesn&#39;=
t exist currently so every build-time postinst fails.</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a114ab3caa9e6c60535cbf7b8--
