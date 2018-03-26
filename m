Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7071C782EC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 19:15:50 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id o4so24596118iod.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 12:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IwUXB5I7l9G+F3WbiJW7qZNX8MqLGEBvu+iY8DsWx0U=;
	b=LfICXzq7st+SDLuKmlp3Qn+Lka2wOuBOKsKc0QenpEl+hLeEyapV38wsHBsErmpavY
	QpEUUQjUgeWRWnWHJeqiX4EcwmQ2DJkNYHgnAhXVXLzogds+CiiLEYIomwMeuRwTzGYc
	xtjhctDzP6xAYvM0ExVgcAvjFcoV621+ayYekL7BqV90SHCmzvrMMiJv9lEOqwvnkaDw
	L8jG1MOi0Ohv555TvkMyRaf2jd0yIe20sQHaYJdIF2HwhhjU+JdqZCWrRPGrOMp+OB3Z
	L3GAZ7ZySLhe93SWgylcxg0k+fQbdDVio9a8QjA40ComPDSXDYhlky7wNst6flN+Qu4d
	sxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IwUXB5I7l9G+F3WbiJW7qZNX8MqLGEBvu+iY8DsWx0U=;
	b=SXxYCVluiN986MpGFUT0/VTWfSyVgy5jDh2xsWv2r/5cGoy3wZQT1sxg6X2DizgtFp
	aiNuRYSXaBGEYrRs3bJz5+YczjV7/SUSkMMsgb5X9qOKUE4T/t70TC1x3RuKWbOX+F6j
	j9Ga1kPciu8xOTsDSAYLdL7UARTB2OsXUhpYiD8kUoRjCn5neUjUDFBVncUOwNhOKHuR
	jo3Mc9iltjszreGvUGKYiB6aM4zmZnpd35YRhCsrJNYPdxvIjKN2HeT0W8YF0glyBd8Z
	vMfVP01HR7dfeDhZreC2aiw3sVMCzjjtWXsZM7Z14wNtte5fXjPyUAfmRFHx7fyS/spx
	HcYA==
X-Gm-Message-State: AElRT7GCXaD2fBAAqsi1qiG6wNJ5TIkuSip6Od/QoKKJU6X9BflJEcJe
	yfwS/MDKM9Ql1XU+/PCP/ZVhrCAnibBI/u+seI5RJQ==
X-Google-Smtp-Source: AG47ELu3eX+3KWv3gm5bSW6am3alDhsQw0YTTB+04o/mEwcu4M4lyNHlu9bI9prPamxCYoAACvo6c+z6wS4QrMNR5+g=
X-Received: by 10.107.183.4 with SMTP id h4mr41506687iof.201.1522091752495;
	Mon, 26 Mar 2018 12:15:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Mon, 26 Mar 2018 12:15:32 -0700 (PDT)
In-Reply-To: <1522082736-7635-1-git-send-email-akuster808@gmail.com>
References: <1522082736-7635-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 26 Mar 2018 20:15:32 +0100
Message-ID: <CAJTo0Laywc++UjXLkwS51FP6wOJnaV9KZcSAVOAYgeGEXg_4-w@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2][PATCH] libshmfence: update to 1.3
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
X-List-Received-Date: Mon, 26 Mar 2018 19:15:51 -0000
Content-Type: text/plain; charset="UTF-8"

On 26 March 2018 at 17:45, Armin Kuster <akuster808@gmail.com> wrote:
> -@@ -29,4 +29,6 @@ AC_CONFIG_SRCDIR([Makefile.am])
> - AC_CONFIG_HEADERS([config.h])
> +Index: libxshmfence-1.3/configure.ac
> +===================================================================
> +--- libxshmfence-1.3.orig/configure.ac
> ++++ libxshmfence-1.3/configure.ac
> +@@ -30,6 +30,8 @@ AC_CONFIG_HEADERS([config.h])
> +
> + AC_USE_SYSTEM_EXTENSIONS
>
>  +AC_USE_SYSTEM_EXTENSIONS
>  +

The point of Alex's comment was that this patch is now just adding
AC_USE_SYSTEM_EXTENSIONS again, as you can see the context has been
updated to include AC_USE_SYSTEM_EXTENSIONS now that my submitted
patch has been merged upstream.

Ross

