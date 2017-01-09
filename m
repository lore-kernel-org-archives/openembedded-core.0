Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0A94B60103
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 15:25:05 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id x49so72469647qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2017 07:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fjj2lVqBsZdRjBMsMkFQ5s7F2wLMaNGH9xgfyJyqMps=;
	b=arkovq4mtxdU56hQ7VC1luCfyJoU6wQ4U6PH6AiYV5ATmqshtYVmsDZ6EZFwEtXZLd
	njVhi0wn9DDYkvw7UC/NXU3eCzDwYdh/hAQnOdZ5LG5z4pZXVO9HYxQiqPrFBBAuepbR
	V+g9wfsisMaShYXjcFKK7ttGUwlFnDi5ULKZ72pF8/23FO6RAXgZMfSC72ftzhcEAYPe
	4a95bjrdl1JiGyirpkuiR7TRvM1Omf/Ftj1YdLqdYB7uzVjIdNqyI4inZJXVFvHycC+o
	jBlI9aZ6K5+MjNMGKUy5ulbok0gUmsKIEQC2fkwZ8izilqV0FE70roD41QwRK/N5XbQr
	qmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fjj2lVqBsZdRjBMsMkFQ5s7F2wLMaNGH9xgfyJyqMps=;
	b=L0H3bmRPgP24SJ6r2Q1MAeqnmbSXCimXcCTDH+RmDese0s5E6izkr2wbZX4DqP3/+k
	TH/0zKJGO/tRLSDRaeP72fT3hsSz5Vr2toy7dX8WmqgpoOTMM+VI6+RJkrvEqwvTrPe4
	yxRY2j84vvnYMbhKVDK16ZOCMbcZWNAI47rqfGMKlw3z6mGywco/AZMzYOe1eIxjgRmM
	Vq+WMUY74H+rSvo3LzeN/8rdchT2NjVM48vIik+zsVgB/dcvg+PzlAQtTdnqmDZXY7Xe
	/Mzspz1CwRbZDjnkNmFEE4n/CndD5+fx2UUIayd/XAS8BcFbCT3eefucTN62F2qktBsE
	5j7w==
X-Gm-Message-State: AIkVDXK6p5YUcnNt3xsJ1p1a7X6it4rNLJegfsXQwRC1CFb43EuAi23HMdEFR0PN7p+G82zvXvQGWCSUNqhFgQYr
X-Received: by 10.237.54.1 with SMTP id e1mr7843866qtb.68.1483975505898; Mon,
	09 Jan 2017 07:25:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 9 Jan 2017 07:24:45 -0800 (PST)
In-Reply-To: <9bcb0f76-972e-852a-de19-feaeb0daa9e7@windriver.com>
References: <cover.1482739038.git.Qi.Chen@windriver.com>
	<46d94601d67973b17516241cea3b6afce9a2914d.1482739038.git.Qi.Chen@windriver.com>
	<CAJTo0LaqVCZMyHhB30c=-yKmWMapkM+HYiDfNv1uD89pUgqEqA@mail.gmail.com>
	<9bcb0f76-972e-852a-de19-feaeb0daa9e7@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Jan 2017 15:24:45 +0000
Message-ID: <CAJTo0LZw3ewAsKjzh-SR3sFz5NoUDEYoqwtGktX6aLepETHc9A@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] flex: upgrade to 2.6.2
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
X-List-Received-Date: Mon, 09 Jan 2017 15:25:06 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0e28f960545aaf86d

--001a1142dcf0e28f960545aaf86d
Content-Type: text/plain; charset=UTF-8

On 9 January 2017 at 01:53, ChenQi <Qi.Chen@windriver.com> wrote:

> I'm not sure if I understand it correctly. stage1flex has to be in sysroot
> to be used safely. Otherwise, if rm_work is enabled, things are removed.
> And for stage1flex to be in sysroot, it has to be installed.
>
> This reminded me that there was work upstream over the holiday to fix the
cross-compile problem and they asked for my testing.  It appears to work so
I'll submit an update myself shortly which incorporates that.

Ross

--001a1142dcf0e28f960545aaf86d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 January 2017 at 01:53, ChenQi <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><p>I&#39;m not sure if I unders=
tand it correctly. stage1flex has to be
      in sysroot to be used safely. Otherwise, if rm_work is enabled,
      things are removed. And for stage1flex to be in sysroot, it has to
      be installed.</p>
    <p></p></blockquote></div>This reminded me that there was work upstream=
 over the holiday to fix the cross-compile problem and they asked for my te=
sting.=C2=A0 It appears to work so I&#39;ll submit an update myself shortly=
 which incorporates that.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div>

--001a1142dcf0e28f960545aaf86d--
