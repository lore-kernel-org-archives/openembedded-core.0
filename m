Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id B7EA765C78
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 10:47:35 +0000 (UTC)
Received: by qgj62 with SMTP id 62so48667227qgj.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Aug 2015 03:47:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=FuSVCYC7faSN6mOx46MHCrRhrylml5ZqrvRv/bsTEAQ=;
	b=ZwG56fWpbJEooQ1Fu8f/Zmf1OV7JEuzfRYtymaXmfXsGV9oLoJpyKfJOfdz+L4qHQy
	CCFa5cMVhK/FzCOWqlDZC8E4FcFnjxkfIvqEGHi3mPAvrxKttUKSQ+Lwo9s5xGUU1xOb
	8uO1IzQ9LNdby+Fdqvr3H46+/cjnVXlWVIWx7ZWimQkLYIHaojvEoYRDvT+isc740vHR
	D21u2zj+tyeb6d2ZJH8xOW1sBk+V6RbxYfjsrPmip/HHnAR/0BqqGonbA3GK58MmiQUN
	hHt50bF+SFSoxUxIEkR4swLhhqW3R1WyB6s3EyqSIgb2JwOuaFMD34svW8Gf38HEuHBR
	xf0g==
X-Gm-Message-State: ALoCoQlkcVR7BGaao0c+3EXbANXNy5KFdTXFhjn8FTDbVfkpOmUJcSmiMB+uUbHAgEF6ySX5FeyF
X-Received: by 10.141.28.6 with SMTP id f6mr82342828qhe.64.1439549256036; Fri,
	14 Aug 2015 03:47:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 14 Aug 2015 03:47:16 -0700 (PDT)
In-Reply-To: <616705173b62954740a1893c672c67eb5ce088f2.1439281753.git.patrick.ohly@intel.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<616705173b62954740a1893c672c67eb5ce088f2.1439281753.git.patrick.ohly@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Aug 2015 11:47:16 +0100
Message-ID: <CAJTo0LbnRjSYpz5F41QjR_93Ex0YdVH+QKQChbRTGLXGrRumBQ@mail.gmail.com>
To: Patrick Ohly <patrick.ohly@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] tar-replacement-native: avoid race condition with host tar
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
X-List-Received-Date: Fri, 14 Aug 2015 10:47:41 -0000
Content-Type: multipart/alternative; boundary=001a11422ff40b217e051d432ed7

--001a11422ff40b217e051d432ed7
Content-Type: text/plain; charset=UTF-8

On 11 August 2015 at 09:44, Patrick Ohly <patrick.ohly@intel.com> wrote:

> Installing "tar" into the sysroot leads to race conditions
> (tasks which do not depend on tar-replacement-native may already
> call tar while it's installation is incomplete). Avoid those
> by installing only the tar binary under the name tar-native.
>

So the point of tar-replacement-native was that it's a *replacement* for
the host tar, so it needs the same name.  If it was to be installed as an
opt-in alternative there's a mechanism for doing that already (see
EXTRANATIVEPATH) but that would break the purpose of tar-replacement-native.

I think for this situation you should show how to enable xattrs for images,
with the caveat that if your host tar isn't suitable the user should
bitbake just tar-replacement-native *first*.

Ross

--001a11422ff40b217e051d432ed7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 August 2015 at 09:44, Patrick Ohly <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:patrick.ohly@intel.com" target=3D"_blank">patrick.ohly@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1vg" class=
=3D"a3s" style=3D"overflow:hidden">Installing &quot;<span class=3D"il">tar<=
/span>&quot; into the sysroot leads to race conditions<br>
(tasks which do not depend on <span class=3D"il">tar</span>-<span class=3D"=
il">replacement</span>-native may already<br>
call <span class=3D"il">tar</span> while it&#39;s installation is incomplet=
e). Avoid those<br>
by installing only the <span class=3D"il">tar</span> binary under the name =
<span class=3D"il">tar</span>-native.<br></div></blockquote></div><br>So th=
e point of tar-replacement-native was that it&#39;s a *replacement* for the=
 host tar, so it needs the same name.=C2=A0 If it was to be installed as an=
 opt-in alternative there&#39;s a mechanism for doing that already (see EXT=
RANATIVEPATH) but that would break the purpose of tar-replacement-native.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I think=
 for this situation you should show how to enable xattrs for images, with t=
he caveat that if your host tar isn&#39;t suitable the user should bitbake =
just tar-replacement-native *first*.</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div>

--001a11422ff40b217e051d432ed7--
