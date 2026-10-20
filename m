Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4370.1792491586465929238
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 03:19:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=rXL/lY3Q;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so21033175e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792491584; x=1793096384; darn=lists.openembedded.org;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xhKudHZJuQaHPZFMvfbsSVkljDhGqRDb6ylmf2nnJP4=;
        b=rXL/lY3QhkT3drtkdUdx9oj0OoUt9D5+N3ovfuivNY6KEjmOKjZl9c4pO960uCR4CZ
         RP57e5sz0WWSY5AbbkOL6NxNsSvYEDbl4BB5A/L4ScXzY+EvTI1jHzLwI69KUQdCv8kb
         +qNQKaF0Iraej71tNkPjLq0HsSh2ajspK98rQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491584; x=1793096384;
        h=in-reply-to:references:subject:to:from:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xhKudHZJuQaHPZFMvfbsSVkljDhGqRDb6ylmf2nnJP4=;
        b=rPlaUOpMMM5klLxuPFXQ0xJhbUjwMwpOd/QOxKzdaG5ToMLXCD1Lchrh19xlt6B3DQ
         qgWZ8LBzRlHjr+q4+nkrIboUcoDqWf+iJBGcQj/hbveZis7tf1iI6NJDcV6bOqm4f3l8
         bd2NNYJib29u+x6SolV2RAXRQBlhiazXtZ+AN1z5brkGpKtwuJoTSUMZoy2/AqmDdVAW
         U0Ksr3Z4lAn9uITQNWWoT55zLDP4qWEL5E2B6OauA1YZ3D3/s63MZy5HZrUKJtFWJvlY
         jCQ0n3BGd/rQntih1u5iK1SFTWSP6QnA6T9Q9B1Q/5MEUNG1A9CllNfcvOnNYuHnKbY/
         QiKw==
X-Forwarded-Encrypted: i=1; AKwUvBwe+KWD+fNweB+Sv0XsxgBnprTRZp5x4AAKQtdjJA4KhEPMQkLSrNoiQmZD0nC5BOOFpV13vyZd5IjwS/H5niK05w==@lists.openembedded.org
X-Gm-Message-State: AFq9FYJas2qW0MesFP6SdGxybf2wBPSGPn0ojPHzWvE5bKsxXgLbJIvw
	RX6UAFubgAPzSm9Iin57/7pWo8+bASViNiS9LF8NUDqrQ+NeuPQSrq7C9gPphwz9doY=
X-Gm-Gg: AYBFou1Ujo/q6Kq7FaxCTl6yoG76bOsboqgXRXkNSC70T45mAzy4nMq2WZcAVv9Sqe6
	7mgR9K01TowLC/h1jL7wyk4A1LBKqImC99YM6KzsmVD5fMCOyL5crnimvu60oe9MzYR9NzET4tX
	ufqRiH5Cm73JI6XXR+amjDuE1eqwV9QU4SpZkx5tMlyGFNmJX9tAaZYpVDdOVResAnfSRJYgnGp
	y7kjAJOd7juAwuE/LcZvRJL4dbwMP36kEMw0h7AQwxHA5NRIGGGI9IHV1UHrph65fe2yi+jXmou
	BN0FMN9Kt8XQ//+3v9MZeTGPHZaGh6gPdv7S153DCvVKbB473GMyVnOIp8KKTDA0dwk8u6Qe2fl
	3KEANHYDfke4mUBFkjGYVURHain2P6WPYxvDzPranzlOSWcuECo2N1LyvcREFeCauR2odKGDM8K
	WvUR/34nRqif1MqyGazDP6/H6uI64uxKUJSpc1jtXPUpEmi3X6XzsUS0SwtY/JFZfxocZgfkG2m
	Yg/xcVpq1/7uNfshqgud9VW+iKo+tsSCqL6PPJmcf+jAGrWivTSxyzvuFU=
X-Received: by 2002:a05:600c:3d8f:b0:4a1:e31f:e86b with SMTP id 5b1f17b1804b1-4a1e31ff798mr153519145e9.28.1792491584477;
        Tue, 20 Oct 2026 03:19:44 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d82456asm5676793f8f.42.2026.10.20.03.19.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:19:44 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:19:43 +0200
Message-Id: <DM9L8HN7ZWH1.2NW5XME94OJ17@smile.fr>
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <yurade@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 02/27] python3-git: fix CVE-2026-67323
X-Mailer: aerc 0.20.0
References: <20261016054106.210444-1-yurade@cisco.com>
 <20261016054106.210444-3-yurade@cisco.com>
In-Reply-To: <20261016054106.210444-3-yurade@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 10:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248268

On Fri Oct 16, 2026 at 7:40 AM CEST, Yogita Urade -X (yurade - E INFOCHIPS =
PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> This patch applies the upstream fix as referenced in [2],
> using the commit shown in [1].
>
> [1] https://github.com/gitpython-developers/GitPython/commit/701ce32fe5ba=
8cb622c0e0342a376a6beb47d738
> [2] https://nvd.nist.gov/vuln/detail/CVE-2026-67323
>
> Signed-off-by: Yogita Urade <yurade@cisco.com>
> ---
>  .../python/python3-git/CVE-2026-67323.patch   | 356 ++++++++++++++++++
>  .../python/python3-git_3.1.43.bb              |   1 +
>  2 files changed, 357 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3-git/CVE-2026-673=
23.patch
>
> diff --git a/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patc=
h b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
> new file mode 100644
> index 0000000000..fa6270d305
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3-git/CVE-2026-67323.patch
> @@ -0,0 +1,356 @@
> +From 80bf84d6f24adcc181b78d71fa94544924a85b2c Mon Sep 17 00:00:00 2001
> +From: "GPT 5.6" <codex@openai.com>
> +Date: Sun, 12 Jul 2026 15:06:42 +0200
> +Subject: [PATCH] fix: Guard unsafe git command options (GHSA-956x-8gvw-w=
g5v)
> +
> +Reject command options that can execute arbitrary helpers or write files=
 when passed through archive, revision traversal, blame, clone, fetch, pull=
, push, and ls-remote APIs. Validate positional option tokens and transform=
ed keyword options consistently, including Git-supported long-option abbrev=
iations, attached short-option values, and falsey stringifiable remotes. Pr=
eserve explicit allow_unsafe_options and allow_unsafe_protocols escape hatc=
hes.
> +
> +Add regression coverage for each guarded API, option spelling and abbrev=
iation forms, inert keyword values, mixed positional and keyword candidates=
, tuple blame options, stringifiable remotes, and unsafe commands that must=
 not create marker files.
> +
> +CVE: CVE-2026-67323
> +Upstream-Status: Backport [https://github.com/gitpython-developers/GitPy=
thon/commit/701ce32fe5ba8cb622c0e0342a376a6beb47d738]
> +
> +Backport Changes:
> +- Omitted test/test_clone.py, test/test_commit.py, test/test_git.py,=20
> +  test/test_remote.py, test/test_repo.py because the current PyPI=20
> +  source archive does not include the test suite and the python3-git=20
> +  recipe does not run it.
> +
> +Reviewed-by: Sebastian Thiel <sebastian.thiel@icloud.com>
> +(cherry picked from commit 701ce32fe5ba8cb622c0e0342a376a6beb47d738)
> +Signed-off-by: Yogita Urade <yurade@cisco.com>
> +---
> + git/cmd.py            | 37 ++++++++++++++++++++-
> + git/objects/commit.py | 12 +++++++
> + git/remote.py         | 15 ++++++--
> + git/repo/base.py      | 80 +++++++++++++++++++++++++++++++++++++++----
> + 4 files changed, 133 insertions(+), 11 deletions(-)
> +
> +diff --git a/git/cmd.py b/git/cmd.py
> +index bb8f93a849547e61e4f8fb9055e4be047b2dae38..016d476e38e84439dd325113=
b4a38133b6d768a0 100644
> +--- a/git/cmd.py
> ++++ b/git/cmd.py
> +@@ -1011,6 +1031,22 @@ class Git(metaclass=3D_GitMeta):
> +=20
> +         self._persistent_git_options =3D self.transform_kwargs(split_si=
ngle_char_options=3DTrue, **kwargs)
> +=20
> ++    def ls_remote(
> ++        self,
> ++        *args: Any,
> ++        allow_unsafe_options: bool =3D False,
> ++        **kwargs: Any,
> ++    ) -> Union[str, bytes, Tuple[int, Union[str, bytes], str], "Git.Aut=
oInterrupt"]:
> ++        """List references in a remote repository.
> ++
> ++        :param allow_unsafe_options:
> ++            Allow unsafe options, like ``--upload-pack`` or ``--exec``.
Hello,

Upstream patch does not have this "or ``--exec``" part... Why was it
added here?

Regards,
--=20
Yoann Congal
Smile ECS

