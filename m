Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id 93BC977507
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:22:35 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id x35so17625973qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Feb 2017 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uK/6eJOdEI6XhyCoMbmhKFFdsttLu3K9Y270HdFh2qk=;
	b=wIUOymP0jkCZeLIgv+obKs36IgOn/LmRQHFsJ0dxe1hqHF3lLTAok0vcZ8Wp1b1iBV
	FZyIcwZKWX/624pU8/I0mLeOr/RAE8+qeRW7wFhCEHEOKAOAHx5D/LnnPpOwZF7qP69O
	lyBoFIgS161VQ4xBiIm90cAUa53MzIv1Cctas5cGCyBkzd/GxA+1PAe6D+TY8onGgtpR
	urdBlqaHF8adC1+N06x32/ElRIf8i1IYPtM7fSNYIm/onKaHieTyFPdhs1UhKnTdYqIs
	5sTPl+L62LPfOnU7tsYUsczvUZNJqMyowrjbnKqmykVn/zdiJCuB6aIunAAhHt5fPyxH
	9Hyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uK/6eJOdEI6XhyCoMbmhKFFdsttLu3K9Y270HdFh2qk=;
	b=TX0TzgV7JezOq7b2IyHtP8F4s8ZWRPmdtypAo3YpgMIKwIk/Lh1k5Sc0OcPTe4oVsU
	hGwfYR8ii1buDs320nndLqS4Hihtr3k5lsAwLbgUjJESwYjLVzP/qcLwDsFqBK80SJJB
	l79a2nsz7L4+6T/WWeHAUeMtg8Kxm7pyf+zdNPxtRMYAZMlPcqwc3RMzfSRJqrs/6bNf
	PziLVe18tCfTZveh239H5G5pG0PrUz6Kd4NDfIAxi7A7tFaK2rAc4qGVs2tL/TVYvBVr
	BI7/SYhhXsIEv8EIQcGF90Y+asCWY8VIsE/g9X+flEgG68DTnLMXjPj3wNN1HiqSlqML
	NX1A==
X-Gm-Message-State: AMke39lJ1WdTNWJXJuwEN3xr1C0IYm7Vdzeqcp9kbQfsrRas7XnPqLJ1yPc3Pz/cq1x5f1GWQReLUTJFaFWxh9Ou
X-Received: by 10.237.43.69 with SMTP id p63mr579538qtd.68.1487946156363; Fri,
	24 Feb 2017 06:22:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 24 Feb 2017 06:22:15 -0800 (PST)
In-Reply-To: <93fa4a77d852419f068ccd2cd99faee771f4c29c.1487774787.git.alexander.kanavin@linux.intel.com>
References: <cover.1487774787.git.alexander.kanavin@linux.intel.com>
	<93fa4a77d852419f068ccd2cd99faee771f4c29c.1487774787.git.alexander.kanavin@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Feb 2017 14:22:15 +0000
Message-ID: <CAJTo0LZuDead4UYtB0yssZQrF1XAXPYXENiQvLOSBWo2dv7uug@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 24/24] systemtap: update to 3.1
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
X-List-Received-Date: Fri, 24 Feb 2017 14:22:35 -0000
Content-Type: multipart/alternative; boundary=94eb2c124cc418990905494776cb

--94eb2c124cc418990905494776cb
Content-Type: text/plain; charset=UTF-8

On 22 February 2017 at 14:51, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:
>
> Add support for python 3 probes

ERROR: QA Issue: lib64-systemtap: Files/directories were installed but not
shipped in any package:
  /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info

/usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/dependency_links.txt
  /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/PKG-INFO

/usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/top_level.txt

/usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/SOURCES.txt
  /usr/lib/python3.5/site-packages/HelperSDT/__init__.py
  /usr/lib/python3.5/site-packages/HelperSDT/_
HelperSDT.cpython-35m-x86_64-linux-gnu.so
  /usr/lib/python3.5/site-packages/HelperSDT/__main__.py
  /usr/lib/python3.5/site-packages/HelperSDT/__pycache__

/usr/lib/python3.5/site-packages/HelperSDT/__pycache__/__init__.cpython-35.pyc

/usr/lib/python3.5/site-packages/HelperSDT/__pycache__/__main__.cpython-35.pyc

Ross

--94eb2c124cc418990905494776cb
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br>On 22 February 2017 at 14:51, Alexander Kanavin &lt;<a=
 href=3D"mailto:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.=
intel.com</a>&gt; wrote:<br>&gt;<br>&gt; Add support for python 3 probes<br=
><br>ERROR: QA Issue: lib64-systemtap: Files/directories were installed but=
 not shipped in any package:<br>=C2=A0 /usr/lib/python3.5/site-packages/Hel=
perSDT-0.1.0-py3.5.egg-info<br>=C2=A0 /usr/lib/python3.5/site-packages/Help=
erSDT-0.1.0-py3.5.egg-info/dependency_links.txt<br>=C2=A0 /usr/lib/python3.=
5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/PKG-INFO<br>=C2=A0 /usr/lib/=
python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/top_level.txt<br>=C2=
=A0 /usr/lib/python3.5/site-packages/HelperSDT-0.1.0-py3.5.egg-info/SOURCES=
.txt<br>=C2=A0 /usr/lib/python3.5/site-packages/HelperSDT/__init__.py<br>=
=C2=A0 /usr/lib/python3.5/site-packages/HelperSDT/_<a href=3D"http://Helper=
SDT.cpython-35m-x86_64-linux-gnu.so">HelperSDT.cpython-35m-x86_64-linux-gnu=
.so</a><br>=C2=A0 /usr/lib/python3.5/site-packages/HelperSDT/__main__.py<br=
>=C2=A0 /usr/lib/python3.5/site-packages/HelperSDT/__pycache__<br>=C2=A0 /u=
sr/lib/python3.5/site-packages/HelperSDT/__pycache__/__init__.cpython-35.py=
c<br>=C2=A0 /usr/lib/python3.5/site-packages/HelperSDT/__pycache__/__main__=
.cpython-35.pyc<br><br><div>Ross</div></div>

--94eb2c124cc418990905494776cb--
