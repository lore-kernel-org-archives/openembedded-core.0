Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id F0DAA6C0C0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 09:11:21 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so95782448iot.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jul 2019 02:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=X65KQHsu5TRpj6E2IPjJMWtwJ3XX5flBIGswB7skGS4=;
	b=SxLz9jAL5fcrlrWQ6obI/VQSfhtw0hexgXSV7Ql/dOTmOtY3mVwkS1TKa/mS87zwL/
	Hl9Il/W6uPRl+9IVN3uUXdiuG461oiyeOTtBWEvIZARQP+xYBG1fQ4j3yXHDeGp2516V
	9s9d+wBsHDs4LTZh78MXW19Ocq9TogQ9UWULQlGM/COdJFcRxF97jwyFAvB6V3bFam/4
	h5uZ3COOk4ZjGf7x++E6NGAvmspw8q2qdl7RIo5N51lQjt8JJHXFKXuDEmpejeQa2X2r
	h1hfZLBtPK8ZmtnAIXKyjJJOR6Wr7sUvvIyp3pV4271HiBIt3ILNxAS4JkdgFxutx4mA
	8RiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X65KQHsu5TRpj6E2IPjJMWtwJ3XX5flBIGswB7skGS4=;
	b=BwdlsqfY2+aQMqtRsdgazZXZMsw6qjurl+y96A+L9NTNZh7HyuqBQM+7E8vQhbnlzC
	yh8Fv0vcAzsa5rvodv0Qpx0gWKOmC6n9mnRooIbdWuDnKlQBqIslu3qAbSw2QXOC8lE+
	Ws7MYe+33Tkhhlj+kfRPUabtXDEDvXjbOqLjB0iDQ3T+8tf4FxhZY+8S3+q6W88K18yl
	I+jC7qIC5LIg/unXdIHS+pj0pFJ+q3cHgv+O4AJSITP5CJNDSd2BeiyzCkI7ewPoXnyR
	RB7jFsBVmLblovDBi2KnRfu/rlGEE+ysJtzYbdpwGHxuPabyg9DBbjw3yeAhkvYNdxaT
	sbZg==
X-Gm-Message-State: APjAAAUjpTHoASEKunSOZrKJMIUTRo1E5frECFt8/Z3Dtw9oNyDO/YwC
	ePVWLXH/Kpuv6NJfayoZ7fvzCqUVe6zcWaRSUsQzAw==
X-Google-Smtp-Source: APXvYqxceGNColqv4DUzD2kM7xb4xlDwg+qO9pKI2YdgNMOuMwmnvr0kxMyKJ8daQhhQ7X/RE7g+IvSwY3NoO510pp0=
X-Received: by 2002:a6b:6611:: with SMTP id a17mr57023812ioc.179.1564045882806;
	Thu, 25 Jul 2019 02:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <1564038071-229899-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1564038071-229899-1-git-send-email-mingli.yu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 25 Jul 2019 10:11:11 +0100
Message-ID: <CAJTo0LbWhF26Qg0SVYbKSD7ObMhHbPu1dyh8vfLCQM-tzTOzJg@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsoup: Add password capabilities for use with ostree
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
X-List-Received-Date: Thu, 25 Jul 2019 09:11:22 -0000
Content-Type: text/plain; charset="UTF-8"

I'm not hugely happy about adding new API that isn't in discussion
with upstream.

Ross

On Thu, 25 Jul 2019 at 08:02, <mingli.yu@windriver.com> wrote:
>
> From: Jason Wessel <jason.wessel@windriver.com>
>
> Add the ability to use a password encoded URI for use with ostree.
>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  ...0001-add-soup_uri_to_string_with_password.patch | 67 ++++++++++++++++++++++
>  meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb |  1 +
>  2 files changed, 68 insertions(+)
>  create mode 100644 meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch
>
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch b/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch
> new file mode 100644
> index 0000000..c679d6b
> --- /dev/null
> +++ b/meta/recipes-support/libsoup/libsoup-2.4/0001-add-soup_uri_to_string_with_password.patch
> @@ -0,0 +1,67 @@
> +From 82c2f059bc7c491c8c4c728408eb913bfc4a6f0a Mon Sep 17 00:00:00 2001
> +From: Hongxu Jia <hongxu.jia@windriver.com>
> +Date: Wed, 6 Jun 2018 22:37:30 +0800
> +Subject: [PATCH] add soup_uri_to_string_with_password
> +
> +The existed soup_uri_to_string does not have password, add a
> +function to support it.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + libsoup/soup-uri.c | 21 +++++++++++++++++++++
> + libsoup/soup-uri.h |  5 +++++
> + 2 files changed, 26 insertions(+)
> +
> +diff --git a/libsoup/soup-uri.c b/libsoup/soup-uri.c
> +index 3eafd87..8421f1c 100644
> +--- a/libsoup/soup-uri.c
> ++++ b/libsoup/soup-uri.c
> +@@ -619,6 +619,27 @@ soup_uri_to_string (SoupURI *uri, gboolean just_path_and_query)
> + }
> +
> + /**
> ++ * soup_uri_to_string_with_password:
> ++ * @uri: a #SoupURI
> ++ * @just_path_and_query: if %TRUE, output just the path and query portions
> ++ *
> ++ * Returns a string representing @uri.
> ++ *
> ++ * If @just_path_and_query is %TRUE, this concatenates the path and query
> ++ * together. That is, it constructs the string that would be needed in
> ++ * the Request-Line of an HTTP request for @uri.
> ++ *
> ++ * Note that the output will contain a password, if @uri does.
> ++ *
> ++ * Return value: a string representing @uri, which the caller must free.
> ++ **/
> ++char *
> ++soup_uri_to_string_with_password (SoupURI *uri, gboolean just_path_and_query)
> ++{
> ++      return soup_uri_to_string_internal (uri, just_path_and_query, TRUE, FALSE);
> ++}
> ++
> ++/**
> +  * soup_uri_copy:
> +  * @uri: a #SoupURI
> +  *
> +diff --git a/libsoup/soup-uri.h b/libsoup/soup-uri.h
> +index b9360c6..af702d3 100644
> +--- a/libsoup/soup-uri.h
> ++++ b/libsoup/soup-uri.h
> +@@ -57,6 +57,11 @@ char           *soup_uri_to_string             (SoupURI    *uri,
> +                                           gboolean    just_path_and_query);
> +
> + SOUP_AVAILABLE_IN_2_4
> ++char             *soup_uri_to_string_with_password             (SoupURI    *uri,
> ++                                          gboolean    just_path_and_query);
> ++
> ++
> ++SOUP_AVAILABLE_IN_2_4
> + SoupURI          *soup_uri_copy                  (SoupURI    *uri);
> +
> + SOUP_AVAILABLE_IN_2_4
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
> index c4715a0..2d1f921 100644
> --- a/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
> +++ b/meta/recipes-support/libsoup/libsoup-2.4_2.66.2.bb
> @@ -11,6 +11,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI = "${GNOME_MIRROR}/libsoup/${SHRT_VER}/libsoup-${PV}.tar.xz \
>             file://0001-Do-not-enforce-no-introspection-when-cross-building.patch \
> +           file://0001-add-soup_uri_to_string_with_password.patch \
>             "
>  SRC_URI[md5sum] = "66c2ae89d6031b01337d78a2c57c75d5"
>  SRC_URI[sha256sum] = "bd2ea602eba642509672812f3c99b77cbec2f3de02ba1cc8cb7206bf7de0ae2a"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

