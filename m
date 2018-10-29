Return-Path: <raj.khem@gmail.com>
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
	[209.85.210.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2F181748F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 12:47:02 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id k9so7350806otl.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Oct 2018 05:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MnYGV+VZNmHG4+djSzPHo4qVCdvJn3UvsNuXRS+Y2tE=;
	b=qUIt/RsZK4wVBVCjpCKvHXvXHW5seHqwVMyP7vwvJIAzvsugb4ZBx7caDZ2me/9MMw
	Z08YbcTV6/LzfRopD9YxNcVzaxjUejPrDmPmoMVXwGgImIqz0ToHKxXasfo+HlhV27If
	1sr6UpyZ7BTzp4Ja5zwxoyJ6AwUJT9/wxpraXhAl9S8bVPOXuqaXBWzT2zs2rAEnsA58
	rer5kkf7C0XIb/fx/jY6YxwanO1GtpDj4sOVoMBom/sjvI063+3iV9obJpTrt6Hacuwm
	dJnrthDHc+WvksaKG0aVZFRry6MzUCbbNxzc47Q2Oq8B4whlj7YKQqqXLSy8eS+IgF1s
	7UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MnYGV+VZNmHG4+djSzPHo4qVCdvJn3UvsNuXRS+Y2tE=;
	b=CU6JPTg3hKzLDBUfXnP34nyJrwdkafppy38n1+SV8ZcRDuFXsnpKGw3v7XKFgHriGy
	rNs16u1TOnT4XLp7Jvg8a708BOjUPwW7QVrK7xtg8LFd0v8DlfSjLUxeLi02ODMj1Wk5
	YpTXubguxPWCz6hVLb5zgmOHSqA1YM6SN7i7bE760Wu8/Oai6NwPuKFbHSl6C9MLgcaG
	KBJxtouhqb4ykM+AEzbb3kf2uexTS7rfie8WSAieyFOgse0dGGsJddxxh/j51p33L1rh
	Vhq4bRVut7VD49FhFKpZD62idRyc5yMdVm6q4K2nAoahsnCsLJgIYDgQV4mteBAMgdZh
	gNPQ==
X-Gm-Message-State: AGRZ1gIUnAg4FRDzPNbkPKBdyNK7HXdxr3u+lM8+iSWY1Rg4E20KGkDd
	Lyu0RMxiNWE0J647fxec4Da4m9iH0qwfnAD+16w=
X-Google-Smtp-Source: AJdET5fKWDrz+g4QYhmPuIWPotaPUjIyGntVLqrsetVU7qckaFlajkqsGYQh7Tqs8XtpNf9UHjC5cCSH0WiQExDLU9E=
X-Received: by 2002:a9d:5755:: with SMTP id x21mr7117123oti.193.1540817222734; 
	Mon, 29 Oct 2018 05:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <1540539892-14352-1-git-send-email-offougajoris@gmail.com>
In-Reply-To: <1540539892-14352-1-git-send-email-offougajoris@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Oct 2018 05:46:35 -0700
Message-ID: <CAMKF1soYeYcjgFdM0nAuC8vqh=XQrVbDx1TKx2oyK0cxdvBMmg@mail.gmail.com>
To: offougajoris@gmail.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] Signed-off-by: Joris Offouga <offougajoris@gmail.com>
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
X-List-Received-Date: Mon, 29 Oct 2018 12:47:02 -0000
Content-Type: text/plain; charset="UTF-8"

please send this to openembedded-devel mailing list
On Fri, Oct 26, 2018 at 12:45 AM Joris Offouga <offougajoris@gmail.com> wrote:
>
> Add recipes for django rest framework
>
> For create a database with django
> ---
>  .../python/python-djangorestframework.inc                | 16 ++++++++++++++++
>  .../python/python-djangorestframework_3.9.0.bb           |  2 ++
>  .../python/python3-djangorestframework_3.9.0.bb          |  2 ++
>  3 files changed, 20 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework.inc
>  create mode 100644 meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
>
> diff --git a/meta-python/recipes-devtools/python/python-djangorestframework.inc b/meta-python/recipes-devtools/python/python-djangorestframework.inc
> new file mode 100644
> index 0000000..8551a83
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-djangorestframework.inc
> @@ -0,0 +1,16 @@
> +SUMMARY =  "djangorestframework"
> +DESCRIPTION = "pip3 install djangorestframework"
> +HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
> +
> +SRC_URI[md5sum] = "0d481bf8dbb87bb927b46798edc1a9bd"
> +SRC_URI[sha256sum] = "607865b0bb1598b153793892101d881466bd5a991de12bd6229abb18b1c86136"
> +PYPI_PACKAGE = "djangorestframework"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} += "\
> +    ${PYTHON_PN}-django \
> +"
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
> new file mode 100644
> index 0000000..540d12d
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python-djangorestframework_3.9.0.bb
> @@ -0,0 +1,2 @@
> +require python-djangorestframework.inc
> +inherit setuptools
> \ No newline at end of file
> diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> new file mode 100644
> index 0000000..9ed6d17
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.9.0.bb
> @@ -0,0 +1,2 @@
> +require python-djangorestframework.inc
> +inherit setuptools3
> \ No newline at end of file
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

