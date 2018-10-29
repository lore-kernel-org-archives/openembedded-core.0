Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4C1BA60236
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 13:07:52 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id o14so7450405oth.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 06:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B52z5tDTwISmlbN6WKfHBYqvPFsBY+uGK/9MG1N/y8E=;
	b=hAHYjCu7uPSgOAhreIgpzSyULYdTijdGyiqh2oFKruP9esaE66UiE3QmCPtDqKVbf+
	wcBUpmYsw3qE+AMwQmcdvlFYISi0DYZ7ZK1N/AwaqFMChCnNaNB6/ATT3vMJVy/D58qC
	tG5kB9s4XiS+UAXqq0UN+72Ga74AbSpkEyp0ArBihevjfjqvMKKhJ5lp28AfmLw5BXSj
	sv0Nzfk7tic3ryk1Uen0fBk0/1MtzeY7aOfKDzVppdHiGteliv7MX6pDq2c2Lo7beyFB
	UpFr2wjkhpMDbyqwYdNviM+5IHgTRpGauaB+ENeUTRgc4cuuyxCFoIPWQvuEaWQFjQkr
	SRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B52z5tDTwISmlbN6WKfHBYqvPFsBY+uGK/9MG1N/y8E=;
	b=cUban5x6EKvBDVBtUPyhD+wiDgwM1vuYx02zL64Nsct0wrm8+UPpgFRw0ZMbyFVqPC
	82pzRnOFZik3xtEHHbykKGlZlF0UrTTMcETv2eSoRHRrAA0y5HFSqSzyxcOZYYKMQ5h1
	4UpD44Zjoji3E8zakXUT+Z+6c5aPv1MzlkPO+piQszsPyaMCpnM6elkB4nwu4HDttud4
	g9jKd3FdBb4ERyWAwZviNvTUMT3PNIiProl1H5kcvLUiVAO5YZwX4yoq9wY3PrfTM/IQ
	XOUkqH7SeQ4gmXQp6VdE+JFuN/0gsDFL87AbWTienW5bW/9Y1p824Jy+ergnzvIVJmZY
	/awA==
X-Gm-Message-State: AGRZ1gLePzkDSIBg20ZeuByp+tB6er7fpoKIHH93MqjXL4pp22Kd/3g2
	ZBW8vhS5522LqDlRivr6woLeoUAYc47mWAN/mGop0g==
X-Google-Smtp-Source: AJdET5fnQhCsBAl/J+Kboy1mbdxi8ZQYio+AK5UoKU5tSWR6N8RIukFsa9dCFZYbaK2E2YlilOfmTgDEbtjNS+rdtNg=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr7802911otg.8.1540818473029;
	Mon, 29 Oct 2018 06:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20181023084931.5543-1-hugues.kamba@arm.com>
In-Reply-To: <20181023084931.5543-1-hugues.kamba@arm.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Oct 2018 13:07:40 +0000
Message-ID: <CAJTo0LZUu0xXJx8Ob8zW67U-GccgQjwqzeF_9KJ5eMi4ipcm5Q@mail.gmail.com>
To: Hugues.Kamba@arm.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Fix python3-pyvenv run-time dependency
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
X-List-Received-Date: Mon, 29 Oct 2018 13:07:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

If pyvenv is going to disappear, would it be neater to just put all
the files into PN-venv and have that RPROVIDE python-pyven for now?

Ross
On Wed, 24 Oct 2018 at 02:19, Hugues Kamba <Hugues.Kamba@arm.com> wrote:
>
> Pyvenv is just a small script that uses venv to create virtual
> environments.
> https://www.python.org/dev/peps/pep-0405/#creating-virtual-environments
>
> This patch adds the python3-venv module as a self-contained package which
> python3-pyvenv must depend on at run-time. This is also good for
> future-proofing since python3-pyvenv has been deprecated and only
> python3-venv is now available in Python 3.6.
> https://docs.python.org/3/library/venv.html.
>
> Without this patch python3-pyvenv is broken because it is missing the
> venv module at run-time. This patch specifies the newly created
> python3-venv as a run-time dependency of python3-pyvenv.
>
> The python3-pyvenv package is removed from the python3 recipe since it is
> now created from the manifest.
>
> Signed-off-by: Hugues Kamba <hugues.kamba@arm.com>
> ---
>  .../python/python3/python3-manifest.json      | 26 +++++++++++++++++++
>  meta/recipes-devtools/python/python3_3.5.6.bb |  3 ---
>  2 files changed, 26 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b=
/meta/recipes-devtools/python/python3/python3-manifest.json
> index f922561368..68bea36781 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -915,6 +915,17 @@
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pydoc.*.pyc"
>          ]
>      },
> +    "pyvenv": {
> +        "summary": "Allows creation of virtual environments so project d=
ependencies can be isolated. Pyvenv has been deprecated in Python 3.6.",
> +        "rdepends": [
> +            "core",
> +            "venv"
> +        ],
> +        "files": [
> +            "${bindir}/pyvenv*"
> +        ],
> +        "cached": []
> +    },
>      "resource": {
>          "summary": "Python resource control interface",
>          "rdepends": [
> @@ -1107,6 +1118,21 @@
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
> +            "${libdir}/python${PYTHON_MAJMIN}/venv"
> +        ],
> +        "cached": []
> +    },
>      "xml": {
>          "summary": "Python basic XML support",
>          "rdepends": [
> diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes=
-devtools/python/python3_3.5.6.bb
> index 2a4547694a..4413022aa4 100644
> --- a/meta/recipes-devtools/python/python3_3.5.6.bb
> +++ b/meta/recipes-devtools/python/python3_3.5.6.bb
> @@ -226,9 +226,6 @@ FILES_${PN}-2to3 +=3D "${bindir}/2to3-${PYTHON_MAJMIN=
}"
>  FILES_${PN}-pydoc +=3D "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3=
"
>  FILES_${PN}-idle +=3D "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
>
> -PACKAGES =3D+ "${PN}-pyvenv"
> -FILES_${PN}-pyvenv +=3D "${bindir}/pyvenv-${PYTHON_MAJMIN} ${bindir}/pyv=
env"
> -
>  # package libpython3
>  PACKAGES =3D+ "libpython3 libpython3-staticdev"
>  FILES_libpython3 =3D "${libdir}/libpython*.so.*"
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

