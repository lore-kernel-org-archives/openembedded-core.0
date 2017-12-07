Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E2F6278200
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Dec 2017 19:27:16 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id r78so15040050wme.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Dec 2017 11:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CsQ9rxzBslqN0aCXjnQF0JRkEj11YYi3FGEYVIe9HPQ=;
	b=Q99Z8MuXSk3miuQsisnHJBk1FXg8ViKJf1khe51lF+9J+q9mkdYV59ZUf+dkduhl9K
	eFG9KQLj3sirPZxO9gnURGrbPARce6AyfOmc6PINpXvYJbX3Tyy/yA/YVOYbMPuIlEvr
	x9Q49ob30ZyKBIcryf614pdoF0Zg8oK8CXKYVwIdvCRzATkRu7JY7jve9fuFi3JBe4hW
	7BAzLj8M3XI3XtHxQS0JWwE/RDvoNT24bl9Zzpaac6RPRMiGM9IZ6E2vzZagMLUNYB/Q
	Db2BPohD0RkxnyKc0OUCy5BlVk9ppJOXBN3CSijOgpGtCsA+Ws8oaceCbfGwqbkxHxAo
	Y/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CsQ9rxzBslqN0aCXjnQF0JRkEj11YYi3FGEYVIe9HPQ=;
	b=JxHrbx1hw5UTd9HuRnJWgdCjOP1U69+kOw6JOOWsP08T86PJKxtlrHuzL2MaGdqKga
	TpuoLl9ozGBoqUIWtLmdqsII+DXSFAfDHF/px+DTdyBqZtfmKlo8EjgYIn2HwvWF1Nyb
	owsrK1a/mZP8kj4nOmZcOr3fkeUSAMehhpBlFDExAQeY+fZQWk2L8+nEkHjR6MVU2O1g
	Cn+8NTBe/RUKhW/vqKyVNq+Iq9QHYpP6WmYPlSqtvra93HKVeNBXo0wWaZ20y1zojz8u
	Gwqf60tRQIQZfgrkxBcT3uU0W6tyPgs/Bc+DDtAGGsiJfvafEncsJn/4yNu4UCeqMD9I
	fMug==
X-Gm-Message-State: AKGB3mJlB3eqHocDJq8JfqTIarO3iI+IB1o+6vUtFn6Dmwer0DdRsAIg
	1u14+Nal+d5OtHXR2ViVJFnXH+r1skDmAAQ0iLx4jQ==
X-Google-Smtp-Source: AGs4zMaxL7L96x0TNGzVSBCKn0ij7pdLjIkWh6ia3RtgEKyQCyv4fgGkZb9NfsXVK+cYSpt7eyfK0dp6RVQQFIeYPEQ=
X-Received: by 10.28.199.75 with SMTP id x72mr1904977wmf.87.1512674837620;
	Thu, 07 Dec 2017 11:27:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Thu, 7 Dec 2017 11:27:17 -0800 (PST)
In-Reply-To: <9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
References: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
	<9f035d6ed0e27ff91e41b67dab0ae852e96c8232.1510920094.git.alexander.kanavin@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 7 Dec 2017 11:27:17 -0800
Message-ID: <CAJ86T=Xk+1sKXvfq3EfEwOuwfuPDeW72G0GSdQtqgTKieLH3JQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/9] meson: add a recipe and class from meta-oe
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
X-List-Received-Date: Thu, 07 Dec 2017 19:27:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 4:02 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> +
> +MESON_HOST_ENDIAN = "${@bb.utils.contains('SITEINFO_ENDIANNESS', 'be', 'big', 'little', d)}"

SITEINFO_ENDIANNESS returns the endianness of the target, not the
host. Perhaps this is just a confusingly named variable though? (it
doesn't make much sense to expect the user to tell the build system
what endianness it's running on, the build system should be able to
determine that on it's own).

> +MESON_TARGET_ENDIAN = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'big', 'little', d)}"

This won't work for all targets (e.g. PowerPC is big endian but
doesn't include "bigendian" in TUNE_FEATURES). To determine the
endianness of the target, use SITEINFO_ENDIANNESS instead.

