Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 787EF7F8C1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 17:06:47 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v25so16382798qto.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2020 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tdxwXNqJlBVM0YGmO5K2/uo9ySB1qB0dTfI5i+gUFUY=;
	b=F86DstqBvOZsNLQs6vRkBn9Ke1c5cMrgYVfjuckG3id2jCl8jbmUq70JNjnRTFGErJ
	ybvcVTKBR4TYnGDGULzgU6kNwGfEZjekNqTyYb3yBEW26vEluM0Li7YDIsn8Mio1/Tg0
	xTdlU9Nd3o3Q1LRadyU8ePLD6R20NW5fPaPwqlRvplH/JSYsc6N4pvepa8PPrJefHIsa
	j5IV+jaSIGlTMwpcYLUD1pgUBRKNtMo+yFH+6+/kj4/lfyQzsgvo2AvJmqjXq1+g3dsZ
	9f/UI9WzbKOSlR/cBWz9mba7ipYA7nkmjqdcpOiQq7SwF16SssFgiimBXPL8mdEppidI
	9C9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tdxwXNqJlBVM0YGmO5K2/uo9ySB1qB0dTfI5i+gUFUY=;
	b=I2NyelIOdW25cdMpn3MsJkzlyZAR6GYuF79DzY6SpPL8UIukOfJ6fExtCeFGst8S3+
	b9hxg53tK3fsyMHEKIk6N7nrvtoMfbjuV2ExQ/13/Kg6Nn8MCJvXyDJjK1apJhNm/JEt
	k2XmqxfF2dWTZO7WsM0rGK8MfDR5IDJ4L0SOrc8O8h5xxl9uUTF6f0ZtBbPT3H4cTZ0Z
	r8PpgIReBYJqk8YEkBHeudPn5IUqsYlKHIVqr6IanKFktL/PIV2dvqWxlb46T8JXTxRn
	0KTm3u56oiVY13jEriWA/53NZdE94Zr0C9RzsWRQ3/K2dfXsVdtvLFBwBgB+A0Q5WwdU
	WaYA==
X-Gm-Message-State: APjAAAXKJIybsDo/yTCm4H2H6NLgVQlEUQFQ22aS0LAFrV98jKRAQCOa
	GpulCihhVRgZ3YPQq/UftvyAcppODerD/Yo/0Ec=
X-Google-Smtp-Source: APXvYqyi5oF+ZTue8bW6T8zONj+qp9cUdndGJ4frS3KfTrwkOQzcKFlMbdwhweZm59ULRGr6xaHkrIe4Mj90wbX0bac=
X-Received: by 2002:ac8:1a30:: with SMTP id v45mr4388446qtj.80.1579108008018; 
	Wed, 15 Jan 2020 09:06:48 -0800 (PST)
MIME-Version: 1.0
References: <1579103456-31723-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1579103456-31723-1-git-send-email-Saloni.Jain@kpit.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 15 Jan 2020 09:06:21 -0800
Message-ID: <CAMKF1so0kG6MVrxjNdFywxDwJsA6o7kUhGPFQt7N07Bd8yw6YA@mail.gmail.com>
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>, Sana Kazi <Sana.Kazi@kpit.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky][zeus][PATCH] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Wed, 15 Jan 2020 17:06:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2020 at 7:51 AM Saloni Jain <Saloni.Jain@kpit.com> wrote:
>
> From: Sana Kazi <Sana.Kazi@kpit.com>
>
> Added patch for CVE-2019-12900 as backport from upstream.
> Fixes out of bound access discovered while fuzzying karchive.
>

is this fix already present in the bzip2 version we have in master ?

> Tested by: Sana.Kazi@kpit.com
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch         | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-1290=
0.patch
>
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch=
 b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> new file mode 100644
> index 0000000..cab41e0
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> @@ -0,0 +1,34 @@
> +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
> +From: Albert Astals Cid <aacid@kde.org>
> +Date: Tue, 28 May 2019 19:35:18 +0200
> +Subject: [PATCH] Make sure nSelectors is not out of range
> +
> +nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
> +which is
> +UChar    selectorMtf[BZ_MAX_SELECTORS];
> +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid mem=
ory
> +access
> +Fixes out of bounds access discovered while fuzzying karchive
> +
> +Link: https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9=
d51ef9824db71a8ffee5962cdbc.patch
> +
> +Upstream-Status: Backport
> +---
> + decompress.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/decompress.c b/decompress.c
> +index ab6a624..f3db91d 100644
> +--- a/decompress.c
> ++++ b/decompress.c
> +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS) RETURN(BZ_DA=
TA_ERROR);
> +       for (i =3D 0; i < nSelectors; i++) {
> +          j =3D 0;
> +          while (True) {
> +--
> +2.22.0
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.

