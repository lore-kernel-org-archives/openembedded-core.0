Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id F0E726AFC2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 14:04:37 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so4126381vbg.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Aug 2013 07:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Uur+PLLVZ0WJXwNItd4Ee0SviELE8mFQJWogoBmSwkY=;
	b=Xnl7gOgwrvJDJMDhG4BdlIj2kRZGiijStXLVncINCzO35jUbWmrwFRrmoh71g7uXby
	XYWn0B/0elNB1Va3hLMl7Vd+KVunfsqwyPYk5gpzYxIuQXm0IcFnqVWNBCwtHfUYyiZZ
	AgqAncFBCT3MNYFcC9fUQrHehDXK6j8rmCJ72UA2H1wmio4FSP07BXol4VYTpZWgvNes
	+mu5lwGNQAhNNRi9KukE9slqkmXvwMG/6sTyd99ItZIFi6q0f/JWAxI6goRybQOlnmdW
	YUvV1rIllyYK/j2uOn4/v3uVwDwnzVA9UiYs61RJYtEzdyJ8L2q75BNB4E/HY7x6xWVb
	7EgA==
X-Gm-Message-State: ALoCoQl64pEGSXhAc8NaJdq9b8/sbU8E2VEOs2UnBqaxrKWJfRnZ3Cfd9pADo+su/pzCXSn5s8kc
X-Received: by 10.52.23.80 with SMTP id k16mr4912541vdf.58.1376057078232; Fri,
	09 Aug 2013 07:04:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 9 Aug 2013 07:04:18 -0700 (PDT)
In-Reply-To: <1376056696-31679-1-git-send-email-kirgene@gmail.com>
References: <1376056696-31679-1-git-send-email-kirgene@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 9 Aug 2013 15:04:18 +0100
Message-ID: <CAJTo0LZya5v==E+Quj5OWTd3Hx3OhjsYDo=RaE3GdrHTnwqZbw@mail.gmail.com>
To: Yevhen Kyriukha <kirgene@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] gst-plugins-good: fix compilation of v4l2 against newer kernel headers.
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
X-List-Received-Date: Fri, 09 Aug 2013 14:04:38 -0000
Content-Type: text/plain; charset=UTF-8

On 9 August 2013 14:58, Yevhen Kyriukha <kirgene@gmail.com> wrote:
> Patch fixes "'V4L2_CID_VCENTER_DEPRECATED' undeclared" error.
>
> Signed-off-by: Yevhen Kyriukha <kirgene@gmail.com>

The patch is missing a signed-off-by and upstream-status, please add those.

Ross

