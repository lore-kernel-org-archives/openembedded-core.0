Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id 9B571609B2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 12:47:53 +0000 (UTC)
Received: by qcir1 with SMTP id r1so7234546qci.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 May 2015 05:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gW/O07qNHAFWJUidgBZ35JHfJa2eDqfPYQarYdmh/ew=;
	b=IzZq5gI/vX3WSVKENhHysm6BR8emI2X8ikSwrhb/iY+m4QQ8lKOFynUwdEYN9ChmNi
	OJAsC7BlHm5bmNNxULxGTkDGIvaFIHGmGLjiv/xSyx6Ygf0AN5GNxvfDRL+gr1u+tSa3
	xJFCat6FtMhSDxxhqk2/NxBHK10ho14oU4bC0FhxUtyFNM+jY4goozat6W2onZDlu1A7
	LN3YHA5/qB62lzJNYMEh4IZKp3yhnQSc3F71oCJiTQ4GtSx44T/UfWjy+vBo5ZASNXH1
	RdSE3zguUbYnohh7xmoNYrn2y/eNyi1K8YnOCT5THwgRJ/RFK7LQ806i46kgiyTbrtos
	0d6w==
X-Gm-Message-State: ALoCoQmt2Bc2ZQCr7g4T3+2W8Y95VRMGXihmwi9u6gZFPcj2cEawQ+KMcnqSRleNXbXrIXZuO0Wz
X-Received: by 10.140.238.9 with SMTP id j9mr11060584qhc.52.1432298874651;
	Fri, 22 May 2015 05:47:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 22 May 2015 05:47:34 -0700 (PDT)
In-Reply-To: <1432286503-10891-1-git-send-email-rongqing.li@windriver.com>
References: <1432286503-10891-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 May 2015 13:47:34 +0100
Message-ID: <CAJTo0LbsBMteF66G7E5k2S=-xH8jO4oj=U975uD73EXtRph6pw@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gettext-minimal-native: Disable the unnecessary check in iconv.m4
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
X-List-Received-Date: Fri, 22 May 2015 12:47:58 -0000
Content-Type: multipart/alternative; boundary=001a11358faea2d93b0516ab1198

--001a11358faea2d93b0516ab1198
Content-Type: text/plain; charset=UTF-8

On 22 May 2015 at 10:21, <rongqing.li@windriver.com> wrote:

> Disable the test "Test against HP-UX 11.11 bug: No converter from EUC-JP
> to UTF-8 is provided" since we don't support HP-UX and if the euc-jp is
> not installed on the host, the dependence will be built without iconv
> support and will cause guile-native building fail.
>

So why does the build host not ship the euc-jp encoding?  Is this a
"dogfooding" situation where you're building with bitbake on a distro built
with bitbake?  If that's the case, shipping all locales is probably a good
idea.

Ross

--001a11358faea2d93b0516ab1198
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 May 2015 at 10:21,  <span dir=3D"ltr">&lt;<a href=3D"mailto:rongqing.=
li@windriver.com" target=3D"_blank">rongqing.li@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div id=3D":1o7" class=3D"a3s" s=
tyle=3D"overflow:hidden">Disable the test &quot;Test against HP-UX 11.11 bu=
g: No converter from EUC-JP<br>
to UTF-8 is provided&quot; since we don&#39;t support HP-UX and if the euc-=
jp is<br>
not installed on the host, the dependence will be built without iconv<br>
support and will cause guile-native building fail.</div></blockquote></div>=
<br>So why does the build host not ship the euc-jp encoding?=C2=A0 Is this =
a &quot;dogfooding&quot; situation where you&#39;re building with bitbake o=
n a distro built with bitbake?=C2=A0 If that&#39;s the case, shipping all l=
ocales is probably a good idea.</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></div>

--001a11358faea2d93b0516ab1198--
