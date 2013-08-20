Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mail.openembedded.org (Postfix) with ESMTP id EC7836B7C8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 15:23:40 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id dn14so808803obc.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 08:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=WMHdmx8atNmbhE0sZ9U/A9QC2TU2Nis44wLRAt9SQqw=;
	b=dj9wpNO5XMY/uAwf2HhVrbSdKhVmA3ULJXjEK5iHEcK257zlDKebiH7uKYmE7qSEa1
	oCugTD5K0pFeUPAPwhVObTo4BtDT/7Xm9+KenL0oWu9gXBvtaS4eSbYqx6UXMDO2Ujdi
	2ckyRugSGmXn+ZgdtM3yuMUqXVQfVp1I/p5E8Pj+8ug93NHt0SZdtNYWf/Mm5GBPt+LQ
	xbc0Bz/7zDImCA+WfMqk5voV0UgH29Fp96zL/CEq54ITbozvJIynglVOldhJLWsTiijz
	fIhodTaV6rrSk7LQ8DMby2gGDLIvEffj8cZrTfGtukUvtXNpb/orBJYrVaehModkXIYa
	Dl2g==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr2203625obb.63.1377012221523;
	Tue, 20 Aug 2013 08:23:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Tue, 20 Aug 2013 08:23:41 -0700 (PDT)
In-Reply-To: <1376966880-4557-1-git-send-email-kergoth@gmail.com>
References: <1376966880-4557-1-git-send-email-kergoth@gmail.com>
Date: Tue, 20 Aug 2013 12:23:41 -0300
X-Google-Sender-Auth: ueanTHCrJHnjiMhXyZl9cCP51xU
Message-ID: <CAP9ODKp2ofdWzn_P7xnZGZZ7QffxyE7XJtmn_m=V4ZoWfc_Zdg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] oe.types: add 'path' type
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
X-List-Received-Date: Tue, 20 Aug 2013 15:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 19, 2013 at 11:48 PM, Christopher Larson <kergoth@gmail.com> wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> - path normalization ('normalize' flag, defaults to enabled)
> - existence verification for paths we know should exist ('mustexist' flag)
> - supports clean handling of relative paths ('relativeto' flag)
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>

Great addition :-)

> ---
>  meta/lib/oe/types.py | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/meta/lib/oe/types.py b/meta/lib/oe/types.py
> index 5dac9de..7f47c17 100644
> --- a/meta/lib/oe/types.py
> +++ b/meta/lib/oe/types.py
> @@ -1,4 +1,7 @@
> +import errno
>  import re
> +import os
> +

No need for another new and empty line here.

Rest of code looks alright :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

