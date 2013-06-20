Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 218856ABCA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 13:28:46 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w16so4635950vbb.23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jun 2013 06:28:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=q3vKtjlhMPnyHJG4wu6Oeifcn+bB78lYDTuRb/IHFuo=;
	b=DT9b65vWEhU57ouasHic8PGpymx+hULfiQUU6nSRUZN8pjqjCDHje2b6dqLSmdEAmd
	Fgy3bBmkQotDRHrIFUpV/jOWwT6SH5q2n6qawbt16e83/RePDMCF9j1C3pHDCw8M1fl8
	xQLTEPrzZc6rQokAQ/TNPoStz1qgBVIIYsYZ5Q/ntdRGp9jJlRnexM1aU/xn9GWZulwD
	t80TJXY48KbGkRjzY2zpSHxQ+LSenzav22qr/4SoR7rnfJYUbEgkd1gAKkGWdtB4+e+M
	pxIYaBNIIkx3bIHexplwTzk8QJpQ9XRPmXo52qerOkNEhcg8ex+cNGe7YQz5FHyOpo+f
	vteA==
X-Received: by 10.52.163.46 with SMTP id yf14mr2535752vdb.58.1371734927057;
	Thu, 20 Jun 2013 06:28:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 20 Jun 2013 06:28:27 -0700 (PDT)
In-Reply-To: <91dd40249c4291e863bb94f9a97245f80e58c0fe.1371734594.git.kai.kang@windriver.com>
References: <cover.1371734594.git.kai.kang@windriver.com>
	<91dd40249c4291e863bb94f9a97245f80e58c0fe.1371734594.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jun 2013 14:28:27 +0100
Message-ID: <CAJTo0LZPwsE-v+3rKfQ8q6wjh2fXvgmynqnXJobHhtbHqrRPxw@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQn5QgOj+oM+FU1QxL2ujaKJmz1HrI8a4VD2p+OvTv1sXdpMYSHVC4/etdg+/DxqJADeXzHZ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] tcl: remove hardcoded library install path
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
X-List-Received-Date: Thu, 20 Jun 2013 13:28:46 -0000
Content-Type: text/plain; charset=UTF-8

On 20 June 2013 14:24, Kai Kang <kai.kang@windriver.com> wrote:
> Fix unit test clock.test fails with boundary year 2099.
>
> Remove hardcoded library install path and then install library to
> ${libdir}.

Please split these into two patches, as the summary doesn't mention
the patch at all.

Ross

