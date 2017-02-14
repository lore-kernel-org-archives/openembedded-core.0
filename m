Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 85CBF71A2D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 19:26:41 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id s186so132820739qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 11:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DNaB5ymTXwxpXE4/JMRG2HjjfopyyFtVeid2dgY6R18=;
	b=1l+kZpB/NXzHgyH+BRpJ0VgJywffO6yZhdu0erp5Ns3nhbxYq9/Bn4bhZc3XAEuyv2
	W8kKVZ6YLUfbY0c6yByvVmw2JA3YSSYpgyXK0bzdav+FunIPPgpFpYDq/v1E+DYXWqtX
	NTLcpmoiqQWr97p6BzcBl7ohc90TB1rvuqEQ4EKtLbU0XCsFh2xvqgCuG5eSg3QO2ffk
	P8T3TXPG6GKYKOlFd6/7yP5w/FwYnveN8S890+MZowNbzi55TWmx+QHjUvamRJcGzJ/y
	WQ/i1wYvXAhF1na0JkdOZhTEhsGSJSPVWDmTLT4fusBpcWkT/0gvH3zC/Tvmps18Rn50
	E53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DNaB5ymTXwxpXE4/JMRG2HjjfopyyFtVeid2dgY6R18=;
	b=QWIUYX76rB6gPFZ+4QcpOOvuNOerDuXduTvdXLzdRLrEim2Szl+leZy7sy9PGbQECz
	LYbGE3lNot8fywYPeir1Ud/f7CYi6xmy1gq5n8up5cxhlh0+Cs36DRARhaWV20n6K81J
	jdI0Fl4zffZkrit8wfvWI74wiEoR8w5YSV04CAXvA9Sh6MKVHt0j33wONrKpF1mMhGuB
	Z5UdTcSfltsq7LMp/h+UL09egXoIPx4RBH7X+pB9oBwU40oK8Lgr/8L5dOP/WbuK/4hM
	TzJefIKE77lsQsw8G3Ip+O5aQUjpuu1jsYZJmB/MDoe/KxCni/vNIRWiAIGQ2Yxuiqcu
	6gdw==
X-Gm-Message-State: AMke39lkH+T1kmEI4fasJ4B5kzZe0tVHhmAEtl2QMB0p9JnUNCSyZLlBR6Sh6XCI91lSBM5NpeqXt15O61H/SFHl
X-Received: by 10.55.183.133 with SMTP id h127mr31423759qkf.121.1487100401984; 
	Tue, 14 Feb 2017 11:26:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Tue, 14 Feb 2017 11:26:21 -0800 (PST)
In-Reply-To: <e1d3535e-79b9-f21a-efae-ef53e5745cde@mender.io>
References: <1485499897-15737-1-git-send-email-kristian.amlie@mender.io>
	<e1d3535e-79b9-f21a-efae-ef53e5745cde@mender.io>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Feb 2017 19:26:21 +0000
Message-ID: <CAJTo0LYBSzN4ga5qyMU=ZxAn6rYGye5vaTMHQ7MSeS25TsVXoQ@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wic/partionedfs: Avoid reserving space for non-existing ext. partition
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
X-List-Received-Date: Tue, 14 Feb 2017 19:26:43 -0000
Content-Type: multipart/alternative; boundary=94eb2c06005634d9d40548828b50

--94eb2c06005634d9d40548828b50
Content-Type: text/plain; charset=UTF-8

On 14 February 2017 at 14:46, Kristian Amlie <kristian.amlie@mender.io>
wrote:

> Ping. Patch still applies, should be a very easy change.
>

The consolidated pull I just sent has a large refactoring series in, can
you rebase this on top of that?

Ross

--94eb2c06005634d9d40548828b50
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 February 2017 at 14:46, Kristian Amlie <span dir=3D"ltr">&lt;<a href=
=3D"mailto:kristian.amlie@mender.io" target=3D"_blank">kristian.amlie@mende=
r.io</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3c=
l" class=3D"a3s aXjCH m15a3d17dc1882cc6">Ping. Patch still applies, should =
be a very easy change.<br></div></blockquote><div><br></div><div>The consol=
idated pull I just sent has a large refactoring series in, can you rebase t=
his on top of that?</div><div><br></div><div>Ross=C2=A0</div></div><br></di=
v></div>

--94eb2c06005634d9d40548828b50--
