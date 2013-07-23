Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5006A9C4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 13:37:25 +0000 (UTC)
Received: by mail-vb0-f54.google.com with SMTP id q12so5558197vbe.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 06:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=kV/uzaSDhpUUU8lCHtn5gDRSArtSffSn6lSYc4C8xHY=;
	b=axXHexOlXHAt6rqpsWptN/hbo/6hytK7rQHQA2CaOjqLAXgVfi7FK1/KJw4G673/o/
	vzhVDRlcksXmwuY6tezpxi2CrbXfCojoy2raO2tGTCcSN9lWJF+WYuT2i9WCyKhCrnHh
	jPskme6OlKLvxuKxIUM3zBh9Udoy6N3sV2O5qepSPp+PYx3uSUcnViG2+4cFFUE5A5fF
	nTa2nRfRqqvTPcFeeY/gCdzIsBL70KrPGeobrtOeKztEJNVCZLnVIAVAO0OpiSY7dpyj
	XgLa5uqB6J5sM8PXYuIEpg3J12RsGt5toR9EHiWfs5A+1jq05BoGDoU0lfWfZIk+l9tW
	Tkpw==
X-Received: by 10.220.45.132 with SMTP id e4mr11508744vcf.56.1374586645730;
	Tue, 23 Jul 2013 06:37:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 06:37:05 -0700 (PDT)
In-Reply-To: <1373354955-16500-3-git-send-email-eric@eukrea.com>
References: <1373354955-16500-1-git-send-email-eric@eukrea.com>
	<1373354955-16500-3-git-send-email-eric@eukrea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 14:37:05 +0100
Message-ID: <CAJTo0La3zAhojZD6sSW=GXRuU+s4KCQQQjBYHTsT3=kFebPPYw@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Gm-Message-State: ALoCoQkl00JVKzKHEWN5SMB6GvdkQBIYrpS7V5h0D7MhsluM8iunXV/xxXiDfkoRGOP4dmV8mM0F
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [danny][PATCH 3/3] binutils: fix build with recent texinfo (5.1)
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
X-List-Received-Date: Tue, 23 Jul 2013 13:37:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 July 2013 08:29, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.22.inc   |    1 +
>  .../binutils/binutils/texinfo.patch                |  294 ++++++++++++++=
++++++
>  2 files changed, 295 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/texinfo.patch

Sorry for the delay, this series is now in ross/danny-next.

Ross

