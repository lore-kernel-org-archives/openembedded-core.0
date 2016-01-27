Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id D73C873289
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 22:49:09 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id z14so421289igp.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Jan 2016 14:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=s4R0JWX54NfVNNpIHMKyIL35YITAsjgD+4SXXVg4A/4=;
	b=ukVvFNxxKjrkhnAx/1tqPtcLuop0DeAO7pFbtCFgInzCJqY74TWnU6snlF21S+940z
	QsYstIZWRQTdyRiNcO62rHmEDOoFaGFDZIavrvgkeXrYSPkoz7fNPuSDUngKYSWx64eV
	eZGcnq4C/kfcCdvk69B0YFh/JPk+0rreDDeEdVUh+caBCqRrj/qn565aI7ID46cM4Qw9
	jOWYMQ+YEJ0joMZ1VsXA15HQZN8ZsYFRyNsPhBpkCV7whgvScipPzPiXQNfLvGcfBPE/
	iOUVOgIg6J8lGuaLj80iSzBKm69UCDfEyLWxBpu/KQRqPSsi5P8CdKFtKkg9uBVNxcCP
	MOsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=s4R0JWX54NfVNNpIHMKyIL35YITAsjgD+4SXXVg4A/4=;
	b=ACHOjyZbAuWmVp+fbVoNckbBX7EnHRPZcUyKYzyh5zwZ6JNpag3FZj/kdfMDqVKOvH
	OJETXWQgfEiam0snu6hafQFol0jU5d0tYT9WtPxlezX6Rgh1hVthPnIwNY8uzXoRA5nS
	XGPkPLimZYvEI0ToFcSsOkLVdv9uQEAzRAhX5PPI/OVUlxp8JjnocjpTUCd1OnkrxqyZ
	SJYGagI2GbckExhd/M2QQQIApaWp7GpC7X5U9uEkkaXLqqoBa8Wi7HGlX9GGnJjl+gL4
	yk/Oui1g6V+Z7IALYh5uF9Bvk4LHE3pPEFo/920e9NzLzu+3BrSkg+84XGjvbmmX5za/
	MWHA==
X-Gm-Message-State: AG10YOTQJXHFhUNlPXxo8zBIZgQ5h29cROUjPsQ7FTOuI+x/gdVvaCRHG1Yea8VHX3IIucFwkUFQkYpFsh3VyVYV
X-Received: by 10.50.13.100 with SMTP id g4mr30095832igc.64.1453934949740;
	Wed, 27 Jan 2016 14:49:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 27 Jan 2016 14:48:50 -0800 (PST)
In-Reply-To: <CAJTo0LZe5rwfWJUMvbaavospzyqeNV-h5BgjoJ8uLfZUb_rVEw@mail.gmail.com>
References: <1453890141-4213-1-git-send-email-catalin.enache@windriver.com>
	<CAJTo0LZe5rwfWJUMvbaavospzyqeNV-h5BgjoJ8uLfZUb_rVEw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 27 Jan 2016 22:48:50 +0000
Message-ID: <CAJTo0LYNY5er7X8KmR-tdjkDGtrp4e4=xhKnys=zHFdg_takZQ@mail.gmail.com>
To: Catalin Enache <catalin.enache@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: fix CVE-2015-0860
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
X-List-Received-Date: Wed, 27 Jan 2016 22:49:16 -0000
Content-Type: multipart/alternative; boundary=089e013c661434dde8052a589c8b

--089e013c661434dde8052a589c8b
Content-Type: text/plain; charset=UTF-8

On 27 January 2016 at 11:29, Burton, Ross <ross.burton@intel.com> wrote:

> Please use the tag CVE: CVE-2015-0860.
>

Don't worry - as it's a CVE I fixed this and merged locally.

Ross

--089e013c661434dde8052a589c8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 27 January 2016 at 11:29, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_extr=
a">Please use the tag CVE: CVE-2015-0860.</div></blockquote><div><br></div>=
<div>Don&#39;t worry - as it&#39;s a CVE I fixed this and merged locally.</=
div><div><br></div><div>Ross=C2=A0</div></div></div></div>

--089e013c661434dde8052a589c8b--
