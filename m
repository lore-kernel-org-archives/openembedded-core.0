Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8A374596
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 16:06:51 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id n18-v6so7575354ioa.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B+/KhP9JiFhC5O6JupeTU1a4Oqw4sE3b0qBy5mm9AIQ=;
	b=F8emqAM/K4UbzmF0IpWmLiSE+Zldxg4QPPMJE2x+9g+H27IKspMvzmXAiIEVaage2P
	dCMkFtHnSPqwnje0RJbEgvVFqRPdJknPHTb1ef5fjVO9Dg9iNKLNZ5nEFCasQIWdPwBt
	S+Ou4H04oCdGkCmsRcr3UX34Tb+xyUsE2Ldr5k2WYdt9dDsbLCkJ5ykElouEEeBvluoT
	21qDEKaHp1v6vzBXL3s6G2uYGTy0aQ1YXEO5nLDg6AHYA51KrlTNxl8zTaj8u4aDrl/D
	M2yi0YGVRGgNqsJFkpxh8vpUgGx9RJNoyxPO5d0FeU4BYZwbD8PrD7apVA4dyD6jRcIy
	cwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B+/KhP9JiFhC5O6JupeTU1a4Oqw4sE3b0qBy5mm9AIQ=;
	b=O3gePaU9MDCc5A3SDDJz4zIF7vIWgZAU+7oMxv5xaD4n5TU/ErZUysZCS0qJRYLCdH
	l1FwclxXpivokUWLaz1YfSfU3D3TaScrllkyXQ5DBMnhoJr81eyW8tQr3HJwqH2BeRtH
	LJPStrG6zUjhzWh/zYCzwmIBYRpwf80bqL44lObbWassd4NVKDslqS6EuUBjOu3dj+Ft
	kQ/Ry0CZ1AWVPimY5T1cIHEzcDhe4nqxQRe47FWW0yc27fHUQzBzhuZpWjQxDiCaPqFU
	htMmBGkEWp2RMGsSanpzdLfFU9uNtXLGyRWGyLFDkFS47smVvfirIGdoTJ8KQTgxLP3U
	HGnw==
X-Gm-Message-State: AGRZ1gIfpm0f6AKRPjNY5F8GkMgbxvAf7oyRKHN15UhlQF5b5gLgnZ32
	1RMG6lCGPx4305A4O9DJW43dFwxJKiwmWWEEbg3+Eg==
X-Google-Smtp-Source: AJdET5d6tnQiAQzB9UVlf25nntuFFgbaLZR6It4gDTU3hJlUw5vqeobG5Jy1AG8/hdJx8TL5h9A1dSHxaXd5Wlqo4Ak=
X-Received: by 2002:a6b:b9d5:: with SMTP id
	j204-v6mr11184899iof.20.1540915612451; 
	Tue, 30 Oct 2018 09:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181030093655.26251-1-hugues.kamba@arm.com>
In-Reply-To: <20181030093655.26251-1-hugues.kamba@arm.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Oct 2018 16:06:40 +0000
Message-ID: <CAJTo0LZsRLrwRTDyU6iFHjdm6PwajpLjRN3RbufZLuik0bCdxw@mail.gmail.com>
To: Hugues.Kamba@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Tue, 30 Oct 2018 16:06:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patch looks good, but the commit message contradicts itself a few
times.  python3-pyvenv is removed, but:

"   This patch adds the python3-venv module as a self-contained package whi=
ch
    python3-pyvenv must depend on at run-time."
    This patch specifies the newly created
    python3-venv as a run-time dependency of python3-pyvenv."

Ross
On Tue, 30 Oct 2018 at 13:08, Hugues Kamba <Hugues.Kamba@arm.com> wrote:
>
> Pyvenv is just a small script that uses venv to create virtual
> environments.
> https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments
>
> This patch adds the python3-venv module as a self-contained package which
> python3-pyvenv must depend on at run-time.
>
> The patch also provides the package python3-pyvenv from the pyhton3-venv
> package.This is good for future-proofing since python3-pyvenv has been
> deprecated and only python3-venv is now available in Python 3.6.
> https://docs.python.org/3/library/venv.html.
>
> Without this patch python3-pyvenv is broken because it is missing the
> venv module at run-time. This patch specifies the newly created
> python3-venv as a run-time dependency of python3-pyvenv.
>
> Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
> ---
>  .../python/python3/python3-manifest.json         | 16 ++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.6.bb    |  4 ++--
>  2 files changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
> index f922561368..ef7fa4ecaf 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -1107,6 +1107,22 @@
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/getpass.*.pyc"
>          ]
>      },
> +    "venv": {
> +        "summary": "Provides support for creating lightweight virtual en=
vironments with their own site directories, optionally isolated from system=
 site directories.",
> +        "rdepends": [
> +            "compression",
> +            "core",
> +            "logging",
> +            "shell",
> +            "stringold",
> +            "unixadmin"
> +        ],
> +        "files": [
> +            "${libdir}/python${PYTHON_MAJMIN}/venv",
> +            "${bindir}/pyvenv*"
> +        ],
> +        "cached": []
> +    },
>      "xml": {
>          "summary": "Python basic XML support",
>          "rdepends": [
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes=
-devtools/python/python3_3.5.6.bb
> index 2a4547694a..31f8eada11 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -226,8 +226,8 @@ FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN=
}"
>  FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3=
"
>  FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
>
> -PACKAGES =3D+ "${PN}-pyvenv"
> -FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyv=
env"
> +# provide python-pyvenv from python3-venv
> +RPROVIDES_${PN}-venv +=3D "${PN}-pyvenv"
>
>  # package libpython3
>  PACKAGES =3D+ "libpython3 libpython3-staticdev"
> --
> 2.18.0
>
> IMPORTANT NOTICE: The contents of this email and any attachments are conf=
idential and may also be privileged. If you are not the intended recipient,=
 please notify the sender immediately and do not disclose the contents to a=
ny other person, use it for any purpose, or store or copy the information i=
n any medium. Thank you.
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

