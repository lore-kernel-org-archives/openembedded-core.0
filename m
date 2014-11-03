Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6986E63E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 11:59:58 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id i50so7673254qgf.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 03:59:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=WCtJK5rT48hb03LQtptHOX1tLI8Wp+RcGWyrMTuOreE=;
	b=jJoq07FvklbvsMmI6brn5fEuH9k8O4gbCTL/zD3Gs6cAqppfjX09OKMZlgEdomTSTu
	vhRolPe6citPM7cy3oxKADATQAeDRb0PAmRaLxe0ZnYcfoq3zMMUnZxqskThgsGhl6/s
	3n38oO2uPND1mxOUfyd2sNPsnqsnZ4Zkg7RxltxeA4jJH0BmyCCRPx3aP9bXsqZ33pwn
	/Tel4aKUOY0aIilVrgOyzsgq9dU1ZHj6lsNMY4VA60RGZ2ypPZrw6LMlOeYMOrVduxzs
	N86mUK7hC0SvrJaUZHi5MEK4Dz4KgMyKvB18CHdfAHATm88lGHy/luN4ygqxJO9q1MQp
	zzQw==
X-Gm-Message-State: ALoCoQk4+8ZX1pmt+UjUs6qyy8/hMbMofxyY433z+Zkrn76SVYoTASlK8h61H6wNpMUxQ6W016b+
X-Received: by 10.229.252.196 with SMTP id mx4mr63701943qcb.4.1415015998274;
	Mon, 03 Nov 2014 03:59:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 03:59:38 -0800 (PST)
In-Reply-To: <1415007085-2342-1-git-send-email-Chong.Lu@windriver.com>
References: <1415007085-2342-1-git-send-email-Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 11:59:38 +0000
Message-ID: <CAJTo0LYbLmb9EVbPFf+xtQfn8OVT02j+HUX7JfSYPwZ-hSQ6zQ@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: Security Advisory - curl - CVE-2014-3620
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
X-List-Received-Date: Mon, 03 Nov 2014 12:00:07 -0000
Content-Type: multipart/alternative; boundary=001a11c2fbceedfa5c0506f3156e

--001a11c2fbceedfa5c0506f3156e
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 09:31, Chong Lu <Chong.Lu@windriver.com> wrote:

>  meta/recipes-support/curl/curl/CVE-2014-3620.patch |   69
> ++++++++++++++++++++
>

ERROR: Command Error: exit status: 1  Output:
Applying patch CVE-2014-3620.patch
patching file lib/cookie.c
patching file tests/data/test61
Hunk #1 FAILED at 21.

Assuming that this is a line ending problem again, do you have this commit
in a git repository somewhere?

Ross

--001a11c2fbceedfa5c0506f3156e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2014 09:31, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto:=
Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div id=3D":yu" class=3D"" style=3D"overflo=
w:hidden">=C2=A0meta/recipes-support/<span class=3D"">curl</span>/<span cla=
ss=3D"">curl</span>/CVE-2014-3620.patch |=C2=A0 =C2=A069 ++++++++++++++++++=
++<br></div></blockquote></div><br><div class=3D"gmail_extra">ERROR: Comman=
d Error: exit status: 1 =C2=A0Output:</div><div class=3D"gmail_extra">Apply=
ing patch CVE-2014-3620.patch</div><div class=3D"gmail_extra">patching file=
 lib/cookie.c</div><div class=3D"gmail_extra">patching file tests/data/test=
61</div><div class=3D"gmail_extra">Hunk #1 FAILED at 21.</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Assuming that this is a =
line ending problem again, do you have this commit in a git repository some=
where?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div></div>

--001a11c2fbceedfa5c0506f3156e--
