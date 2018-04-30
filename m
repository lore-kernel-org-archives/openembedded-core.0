Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id CDB136FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 15:39:45 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id e9so3038047pfi.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2018 08:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=m02wKf8mgRdM2jYf+eCklWVVYrzy6cIxK09DQ15XGSQ=;
	b=CXS2rWLy4qLUbrXLVrzvVZ1WtY0tGGxQQq0YHI/miT582zPEonxd7Dyw5yZ7NohsIY
	Tx6nqIHcjmesUMElbT0T/+zTfBy2tefVxxT1q7A+TC2LkZRW2G7R5jvabHczmzTKe5wG
	azDUDSBvoMNL4V2O0I0CZ/PuiNYacjSDQ5n9zoAeNN53RPnjuq96gMpf58EqKpIPQKIY
	0tkeBHHDeHK9duMK/d8O4tBhPRe+nnbXfg+FDmQUPajXJZMjsasAc6dUDZ+z+yhsLUwo
	dDARqnZKUQpry2HkULk6ajf6Ga6pdYKlKF98qK9ELNbIhHlD8oW0ZRtrmHeKGF1oAuYd
	WcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=m02wKf8mgRdM2jYf+eCklWVVYrzy6cIxK09DQ15XGSQ=;
	b=kNgvBfIUZShEB02pnMt6pCB+HMwdJpAFWcfJaWuH7alv6WDGu5+NH6SfjRjPbH64ua
	AAWnH4oJucD7cjx5Oa/6BXmoY7bRn6JVrROVBoW9NxZSlcywQPz5bEC3iYPQ4dVu5CyP
	a9jC9pTVdtYsJyji7PaW6YoOJ3QI2H42OO1EkrPwzDuj5iSPPvLA+9XFvxBsTLNfcFme
	yrXsvqFgbYSaoFZLzrKbUSLI4qp+FfuQApBSzsbUjrCkMNxXMFS8aLWGX/wPEfrasVsQ
	jV3VdGQ0pxn6NycA2e1mvWqe+qmzfjOcqTLkB9fC/EA7D7Tan0i+ZPyxrbaUBkk8bac2
	Iy2Q==
X-Gm-Message-State: ALQs6tCialX4UhhrRQ1ASu1Xk9NOq1DbyGlhAEJzFdTlDqj8g+l31uSB
	fzP2t4wFo93/WIA1EJvd/TQGcFoPk8a11TBd4ao=
X-Google-Smtp-Source: AB8JxZpMXoj/w9ZRVmHoh8jZDjk0lnod1A9/+MMGGqjftjdrzI6PIPk4UKLKtBP7/9lEThj+YAe1QtrDApRHVvPNJMo=
X-Received: by 2002:a63:7c0b:: with SMTP id
	x11-v6mr8420806pgc.384.1525102786513; 
	Mon, 30 Apr 2018 08:39:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.182.141 with HTTP; Mon, 30 Apr 2018 08:39:16 -0700 (PDT)
In-Reply-To: <455508a9-e067-8025-5633-89d9e189dce6@linux.intel.com>
References: <20180404111321.10824-1-alexander.kanavin@linux.intel.com>
	<20180404111321.10824-9-alexander.kanavin@linux.intel.com>
	<CAMKF1sphcVNwqPgZfuK5iByfEmQ+9KuS5AwMVYsai57Shpg_xA@mail.gmail.com>
	<455508a9-e067-8025-5633-89d9e189dce6@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Apr 2018 08:39:16 -0700
Message-ID: <CAMKF1so8XmxWCxdOkibor+0JxV7=rikVnpsy5Aok66CPYqnUxw@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/22] webkitgtk: update to 2.20.0
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
X-List-Received-Date: Mon, 30 Apr 2018 15:39:45 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 30, 2018 at 6:07 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 04/30/2018 03:43 AM, Khem Raj wrote:
>>
>> On Wed, Apr 4, 2018 at 4:13 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>>
>>> Rebase patches, remove a couple of upstreamed patches.
>>>
>>> Add an option to enable woff2 font library (not currently packaged by
>>> oe).
>>>
>>
>> 2.20.1 patch release is available since this patch was posted. Since
>> this patch is still
>> in staging, it would be nicer if it was rebased to use 2.20.1
>
>
> If I need to resend the patchset, then I'll update it to catch up with
> upstream. There's plenty of time before the next YP release.

its ok, I have done the patch I needed to do on existing version

