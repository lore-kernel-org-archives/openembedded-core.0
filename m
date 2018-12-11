Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f170.google.com (mail-it1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF136C4DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 10:58:23 +0000 (UTC)
Received: by mail-it1-f170.google.com with SMTP id h65so3051450ith.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 02:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QI2616qKJx5LoOy9u3aitxHILqbwQkKIWuUZ7RuMiU4=;
	b=e9ir/a9lzen6etSyGC9xp+Q7s36nhxZy3sDT3wgetU9yik3eC9xHF4035W5q/axT3l
	zeX/gRqQgwCs2hSOIAWVkNjUxRqoyV9xMsJ8t3kh7Ei01vbk+5Ey1u5nB87e9zImIO/Y
	fCPUNKKU1RR/Czc5u3xFj8Xju8wYxlwzGrqsDJI8NYiP3VXq+vzgFCQjSmnCpNCGipxn
	xrcshWSMbj0Epe23q+nbAyLNj1Md3uyNHw6GpKr9mbjSahpGJzl0bz/9iYQYnaYH8q0I
	YymDkhcM4oiPrIr2FkRaXG5Yw7teuuMB1LY2KsVVr5h9Qchnrj3yGy9sDJx5G6cdQfDs
	1MdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QI2616qKJx5LoOy9u3aitxHILqbwQkKIWuUZ7RuMiU4=;
	b=dD/gk0mesP+5Km4wffCfuBXVx3tacQQT+mrpFcsx3DTps7+QyEFWX0FDijnHFjwgXB
	52cnMT4qzyf0AHuzB85AA+ir9Xe3Of4wtUKQWMjdaV0Zoypzlf45CxtlgE8eGj5lIud3
	R4OvEU/3Bpsv3glgi+/pz7owFCqwbSlUjajKpcv0EtAhfEklocXTB9EMfRlOyGNZBZ4x
	DtZa+RcpUMk8qz0hZ6/1KC9mZIMO3pYtfBaydd7LaW3StN+z8jJVe1md02VWGlRZVkb7
	9YSWbW2e6BRVIfT+QeKh1WfFAiJvEnqCbDAtULVFka3z3wzrq1wpimyEnZL5uDAo/WWT
	hGBQ==
X-Gm-Message-State: AA+aEWbB77ej0wXNSL/q0xnFPqKoP+2B4kf+c08vUxf5xmXxnXqUh7zX
	zLcJ+/M25f3OsaZiKNwIZW0ftaTI65+KXjHJWhawBw==
X-Google-Smtp-Source: AFSGD/VFnPXZWFzb6yhTSdfWWyuUnybTql1CKG0Rx7483Jy5z++iJkN4jYcuvS6tLkNpnFCfrQGyGuJqwZU1SojYG7w=
X-Received: by 2002:a02:9c53:: with SMTP id h19mr15296471jal.31.1544525904437; 
	Tue, 11 Dec 2018 02:58:24 -0800 (PST)
MIME-Version: 1.0
References: <20181211085706.25762-1-olani@axis.com>
In-Reply-To: <20181211085706.25762-1-olani@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2018 10:58:13 +0000
Message-ID: <CAJTo0Laa7E=sO3emE1n6vNya6V1UOdaa400qoJidxqzMeRKzig@mail.gmail.com>
To: Ola x Nilsson <ola.x.nilsson@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/package: Correct format arguments in test_gdb_hardlink_debug
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
X-List-Received-Date: Tue, 11 Dec 2018 10:58:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Dec 2018 at 08:58, Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
> -            self.logger.error("GDB result:\n%s: %s" % output)
> +            self.logger.error("GDB result:\n%s: %s", status, output)

Isn't status an integer so should be %d?

Ross

