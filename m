Return-Path: <alex.kiernan@gmail.com>
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
	[209.85.222.52])
	by mail.openembedded.org (Postfix) with ESMTP id 198A860107
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 09:27:05 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id m11-v6so10085619uao.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 02:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3Jlf8N8u/AIHN/5HerQmUcoUMbVr8XN7j3afwE92PuE=;
	b=XtHkPTYmv6zZ/pRH/hW+ULIGEsNXSTTsMDJtgaqlmwmm7HG5n7r6+2O0alfdAQOLn/
	Fz3v/aMBfey/XJW2QSLFOY1DzzsEVDFm8LUznvYKcfI2PLrdGvHXs9XZ5uV7jmJRd19z
	/AMP8XXLj3SA6uUQ3iuIz8j1EuUUa72qHAONSHMLqINJtZ1+8i2OzWyQTiAMonUfzHv5
	ny/4H9DHrWWhiEnZdFeyi0/6R17nD+n1fDjqLzm9sQUXkKDiky+qO4uPceK5leCnMPm3
	tEaaxxB9l1kQbvjv5/OAcjxMEGlDqw3lx372m7cpPO/r0U+cnyT9J+HrOJ5Cpf5Sh4NT
	YPBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3Jlf8N8u/AIHN/5HerQmUcoUMbVr8XN7j3afwE92PuE=;
	b=YlGkvyNp6XTk0H2Qvwk9q2WCBl/u/9IcW2SJPBmu/MjC/uxU5aU8m5dSq/VaLn7KL7
	zwTwxQTt3J8A2kLXRyG109ML0X97axff+xdbkR4s333hd/Cwzx7SHssWDmHOAMFSK/Ob
	MVAN5u5IQiZowon+Zxla1hb1WFFYDi8XGJA2PfGD6q4m65867CZNMfAcw6uT/VpqHJAt
	wOw/RLqI/eyQ7e3h70KlIYyEfkWnFAwVPGb5hRVaEamSq9OFGlAH911aDUpCqwgRLorD
	A7UuDOAnDdaWf1yfDLP7SCFpwt2SrgsEIiJ3+IAavm/lNh73Cbxgz4MYrZx5qUyXQNe0
	Q8OQ==
X-Gm-Message-State: APzg51AyZHxnScYOHrYl6XGw7yCb5m+t4foMFobD5/0YTwuCTz40sTBi
	YQzsxjZVhHlYcIr7STREsg2WzGWBb8PvyYTsBpo=
X-Google-Smtp-Source: ANB0VdblxU3eGLQvGsnO8lBcPuC9unhSH9n/ThQK0QU1T8DQmzVSQdqQMyls6S5T86SMUM0J7DPt513IAe8lblvMUss=
X-Received: by 2002:a9f:318a:: with SMTP id
	v10-v6mr7585292uad.36.1537176426828; 
	Mon, 17 Sep 2018 02:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1535478536.git.raj.khem@gmail.com>
	<62f7c23173a051958c2cf6e8d7a4fce9bd0ef279.1535478536.git.raj.khem@gmail.com>
In-Reply-To: <62f7c23173a051958c2cf6e8d7a4fce9bd0ef279.1535478536.git.raj.khem@gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 17 Sep 2018 10:26:56 +0100
Message-ID: <CAO5Uq5SZ0hfF_zNcP9c0ntOwmCVbeKBqiApV6AOR2GkVSNOz+A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] gpgme: Inherit distutils3-base
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
X-List-Received-Date: Mon, 17 Sep 2018 09:27:06 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Khem

On Tue, Aug 28, 2018 at 6:51 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> its building a module therefore its important to provide correct cross
> build environment, distutils3-base automatically inherits python3native
> this is seen when using clang where it tried to link with gcc since the
> environment falls back to builtin LDSHARED variable
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

With this change I'm getting python3 pulled into images when using
gpgme, which I really don't want. If I add:

diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
index ac9fccf..8b34aa3 100644
--- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
+++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
@@ -50,6 +50,8 @@ LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG',
'python3', ' python3', '', d

 PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', '
distutils-base', '', d)}"
 PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', '
distutils3-base', '', d)}"
+PYTHON_INHERIT_class-target = "${@bb.utils.contains('PACKAGECONFIG',
'python2', ' pythonnative', '', d)}"
+PYTHON_INHERIT_class-target .= "${@bb.utils.contains('PACKAGECONFIG',
'python3', ' python3native', '', d)}"

 EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
                  --disable-gpgconf-test \

I avoid that runtime dep, but does that still work for clang?

> ---
>  meta/recipes-support/gpgme/gpgme_1.11.1.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/gpgme/gpgme_1.11.1.bb b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> index 151fc03f55..ac9fccf133 100644
> --- a/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> +++ b/meta/recipes-support/gpgme/gpgme_1.11.1.bb
> @@ -48,8 +48,8 @@ LANGUAGES ?= "${DEFAULT_LANGUAGES}"
>  LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' python2', '', d)}"
>  LANGUAGES .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' python3', '', d)}"
>
> -PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', 'pythonnative', '', d)}"
> -PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native', '', d)}"
> +PYTHON_INHERIT = "${@bb.utils.contains('PACKAGECONFIG', 'python2', ' distutils-base', '', d)}"
> +PYTHON_INHERIT .= "${@bb.utils.contains('PACKAGECONFIG', 'python3', ' distutils3-base', '', d)}"
>
>  EXTRA_OECONF += '--enable-languages="${LANGUAGES}" \
>                   --disable-gpgconf-test \
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Alex Kiernan

