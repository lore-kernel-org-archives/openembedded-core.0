Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB237C694
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 12:05:33 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id o17so5110780wrw.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2019 04:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=mM8BWYR3xTh807qVqSeltvHvC1fpa3RCUQC/ACKrMJ4=;
	b=DmlMm5D3DEbbvsza2NrEn0hHhKPO+rru0vs/4693/mM5rlo2QSmvZDKG5bp3YjyCB4
	TJKKEphtjsc3ffQ2AO5/LeqFsniW9V+QisLWhkxzEq2rS5NBT+bEArDxGwlxdwqGvKql
	QznjDd2syiUuAPdysO3m+0+KgvUYGix1aNZc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=mM8BWYR3xTh807qVqSeltvHvC1fpa3RCUQC/ACKrMJ4=;
	b=IzNG09DN78g3rl+EPF74fON48B6GIzJKkfFDXNshXsFq5F9zbZ73u+0I9E1IpW6JMZ
	XdbCNxzTp63L4wBeFKPbBMWhIlrZ0tLMI5UuOhc4rRlf0oI/pOFe2kowk1GrMQkW9jKl
	A+fKVkcKhtScaIFilZBhFACNePoIJd1zvjgJTN2CAqY77+DhfmptDNkxO81V4bshNTqL
	fQEuTijw26plnUruTYwG6l1f1U5l2OM+G2+isXJE4nK3ElDa8AD8A5Gl9kiZHcELB+6B
	UcUM2lQfsD6D8D+RiAYmIQ3AuDwdgW3luRHnT5vNRICb4TEwGkLD+I20oqewp4WugUFi
	b+/w==
X-Gm-Message-State: AHQUAua+0jlmTuj4yImd/7vJPdGI+JFH9ADTgusGTml1MvZw33U5Bfll
	5UtsUHFdOYg6rlSFl/Yydo+RdA==
X-Google-Smtp-Source: AHgI3IaSSeMjDyQELcHKdPqqvmY/OqUCqF4yGzJphxklK8BQayppKBbYR5j0SU+3JUMesl/Stvbd1g==
X-Received: by 2002:a5d:4149:: with SMTP id c9mr6526162wrq.58.1550923534680;
	Sat, 23 Feb 2019 04:05:34 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	r70sm2413791wme.46.2019.02.23.04.05.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 23 Feb 2019 04:05:33 -0800 (PST)
Message-ID: <b83e9ffe50071e4cc3cca2633c328f323e5834a6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 23 Feb 2019 12:05:32 +0000
In-Reply-To: <20190222141650.46895-2-alex.kanavin@gmail.com>
References: <20190222141650.46895-1-alex.kanavin@gmail.com>
	<20190222141650.46895-2-alex.kanavin@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] glib-2.0: restore API docs generation
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
X-List-Received-Date: Sat, 23 Feb 2019 12:05:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-22 at 15:16 +0100, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 4d7fdeebbbd..6305f553b4a 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -31,6 +31,12 @@ LEAD_SONAME = "libglib-2.0.*"
>  
>  inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bash-completion gio-module-cache manpages distro_features_check
>  
> +GTKDOC_ENABLE_FLAG = "-Dgtk_doc=true"
> +GTKDOC_DISABLE_FLAG = "-Dgtk_doc=false"
> +
> +EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
> +                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
> +
>  # This avoids the need to depend on target python3, which in case of mingw is not even possible.
>  # meson's python configuration pokes into python3 configuration, so this provides the native config to it.
>  unset _PYTHON_SYSCONFIGDATA_NAME

https://autobuilder.yoctoproject.org/typhoon/#/builders/69/builds/326/steps/7/logs/step3b

Cheers,

Richard



