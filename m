Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A280078246
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:33:04 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id 123so6189188wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 06:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=88fZvmb00dV8lh6ZMDd3N+SXl9tqmTk/eZg6Qy5ZuCQ=;
	b=GtbO3dL9TtVJ07hbfGeBbqPT/lUGXbrfiDerpF3FZmL9kwsvNYlUwhcvGGQg47YEgH
	bDeHiLHw7OR/hQtb58GgpGaLN97BLHgu8Xo5KC5d1gbjHSj0JdsZVZK3GM81FyzyDd4z
	cmEyuXcAN2siig3nJAUoX4urP7nUfHNZl3MVNYzxLHV3R/6uAhG7zxa+5E0PdZBgLz2D
	wfaMTfTq6TLByi51hQ+jk5F6vHcBpHqkH6xiBEilLFo9/WIQfz+pTGb+V2AQeQVNrF2d
	yhMBhY/iJo3Bsy7vAhMrmugVt6qbulSVFLwzu0KwIeVlwcjhiAYKEvZzDAQbUEuUygUz
	4miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=88fZvmb00dV8lh6ZMDd3N+SXl9tqmTk/eZg6Qy5ZuCQ=;
	b=K2/w2G+IrMzfMvxEWdOXCMbG7vkmNYUBeQKwyG/xFEsrgl/UU7xUaWcK/QwbLJ3TdF
	DRRlQq2fsutQj+jxz16xV507iR6hcFyU73pwPOTrphsj7Xz8a68GxLnwBDM6KUf05/9M
	bLUVpASFmEvodm73gEaZ/F+By6CMQ7WukOnAf4Uks0KkzJto3SFa2Snj6gLlX0e6DzWH
	8uo06bkPjs0MN9QIEYMuoye6ibUSXe9UoxxURAd8mfvAfGDEdu6NHaSu+SisAHzMQYtI
	qJ0D2kXgO2yhENyYxANI9zhJSNFq8BLoqJJ7bnRiuT2cN/5ZxyXXg8uXZ+Ag3c3BlXQW
	ktKQ==
X-Gm-Message-State: AODbwcDTsthntZ7vAYOkDSu/b2bW7UVhm75Kq+2EfJbZhuTn4RV8eHI6
	Olw5u6oDEFvjj4pn/wNSeRv/HVsX6A==
X-Received: by 10.28.87.16 with SMTP id l16mr2299197wmb.114.1495805585524;
	Fri, 26 May 2017 06:33:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.128.65 with HTTP; Fri, 26 May 2017 06:33:04 -0700 (PDT)
In-Reply-To: <1495805613.26945.11.camel@linux.intel.com>
References: <CAJdd5GYuBbqarXs38M91atDyQhz17EcPDE9yKme-oiwDjCtaaA@mail.gmail.com>
	<20170526015428.13714-1-JPEWhacker@gmail.com>
	<1495805613.26945.11.camel@linux.intel.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 26 May 2017 08:33:04 -0500
Message-ID: <CAJdd5GY2PvzsxHB+evuaOKOMsnKh3ZnwiWTsbdruQPX3J1A8+g@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v5] openssh: Atomically generate host keys
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
X-List-Received-Date: Fri, 26 May 2017 13:33:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 8:33 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
> Just a minor comment: there is no need to include any prefix besides
> [PATCH vN]. Also, patches either go to oe-core or meta-oe, so it makes
> no sense to send the patch to the oe-core and using the [meta-oe] as
> prefix.

Ya, sorry. I was following these directions and didn't read closely enough:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

>
>
> Leo
>
>
>
> On Thu, 2017-05-25 at 20:54 -0500, Joshua Watt wrote:
>> Generating the host keys atomically prevents power interruptions during
>> the first boot from leaving the key files incomplete, which often
>> prevents users from being able to ssh into the device.
>
>

