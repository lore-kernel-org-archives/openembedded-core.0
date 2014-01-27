Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8339C6C76F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 10:37:37 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g10so3321816vbg.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2014 02:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QorTrgObN+dgL2NfXRZXb4xYQlLQSIFZa2mhHBE6lY4=;
	b=SFgzzuOAuCoRLKjLHA0Sjcs89jlgwmXAzRAzr0Vn5a26YA4IwjNZlz8XQHDYR/DosA
	TW8GJHG0fbLFHmPfs5obrRvZXjO93CKDcs171VCHjTUsD+/KGs5i0lbSX2gAMDP7kqmd
	ei9dZXnQ8w7RPNuM+xH2mlE9EwdLlEJSK7znSeGFPjk33IBb7OjECgRFEEjb6e9vRVxL
	8ThAgeHzy/KfQhYD5mOLgySfl1jNEE0RuLLrzur8gxCnYe6Lw/x1eKqGM1KPKQLi7mV9
	mnGlZuNDJMbt0EYp6KcCvm0a9LFZ6aoI/6xo5KrSEY6RwSk/eclVattcv4t0AYgfmkWK
	tmTA==
X-Gm-Message-State: ALoCoQkvufkgMKQSO4h5LcCdbDx79iTPlN35v+PN5Afr5ZOunGP7b583FHj+1kuJ+k75dSaGm/Dh
X-Received: by 10.52.106.107 with SMTP id gt11mr2940985vdb.7.1390819058165;
	Mon, 27 Jan 2014 02:37:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.96.84 with HTTP; Mon, 27 Jan 2014 02:37:18 -0800 (PST)
In-Reply-To: <1390808120-15299-1-git-send-email-baogen.shang@windriver.com>
References: <1390808120-15299-1-git-send-email-baogen.shang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Jan 2014 10:37:18 +0000
Message-ID: <CAJTo0La92jbGsXxHF--BBnksNm4am0X=hxeho++rPavMf2E86A@mail.gmail.com>
To: Baogen Shang <baogen.shang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs:fix build native package error
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
X-List-Received-Date: Mon, 27 Jan 2014 10:37:38 -0000
Content-Type: text/plain; charset=UTF-8

On 27 January 2014 07:35, Baogen Shang <baogen.shang@windriver.com> wrote:
> e2fsprogs requires pkgconfig to build native package

Presumably this is also the case for non-native builds but ordering
ensures that pkgconfig is present?

Ross

