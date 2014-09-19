Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id BA47D62252
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 11:37:51 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id x3so2941897qcv.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 04:37:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dIJ2RRDKTwbSbotDSdyo4aKgp8rBN4HJPopN63dNffU=;
	b=KWL/fAIpZOZEL0lyL4K8Gf5OOMN9ngEx0/YoKo4OW9nuCmyeHC5TG6Ywzja/Ey3+j8
	cuY3VH1vvhB0EIlxmNuIey1k95+t92TZgQJ+wVyUk1HrCe+cExldNkcrfsAHFXyODo6l
	WcYb7hR4zHsR+mLvb51CW2kX/HdrF/GIOUq/Dr7tPeZvzpY0SRu7aL6aOYlIobXyyFQQ
	a8+CS80CGI+XB+EdyPt310DPNLS+CwV3CNYrm7zy6Rze0nTgcW4qr3AoJUt4zQ+xug+Z
	b2Avj6owzldK76Zx6g5zgvEWmwx5aZZwwh4Y55tSAFpsIEJvaf02VLohmv+u9ZWWQHGP
	1cvw==
X-Gm-Message-State: ALoCoQlWmIcKBQhMG27QlLFunkYIrkuQApBUq641xhWRpeRTHndpRD5bi2RAPT8Hx4W0sqG9W7MI
X-Received: by 10.140.105.244 with SMTP id c107mr109254qgf.15.1411126672748;
	Fri, 19 Sep 2014 04:37:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 19 Sep 2014 04:37:32 -0700 (PDT)
In-Reply-To: <CAKuL1XT+=AYT_LVveVWOO2qqoiLwCbi6fP0j_b+xq3aMN7jdSQ@mail.gmail.com>
References: <CAKuL1XT+=AYT_LVveVWOO2qqoiLwCbi6fP0j_b+xq3aMN7jdSQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 19 Sep 2014 12:37:32 +0100
Message-ID: <CAJTo0LZZQMBBKRcxpfbOMC2KUWw5ffp=RdBOyymi-wfaq2UL3g@mail.gmail.com>
To: harsh jain <harshjain32@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recipe file of Python 2.7.4 of later version
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
X-List-Received-Date: Fri, 19 Sep 2014 11:37:54 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2014 12:31, harsh jain <harshjain32@gmail.com> wrote:
> Python version 2.7.3 is not compatible with AARCH64
> architecture.Support for AARCH64 is added in 2.7.4 onwards._ctypes.so
> is not compiled by  2.7.3 python version for AARCH64.
>
> 1 ) Can we have recipe file of  2.7.4 or later version. If yes from
> where i can download.
> 2 ) There are several other python package which have build dependancy
> on 2.7.3 version.When I try to install 2.7.4 using custom build recipe
> file these dependencies give warning message.Is there any global
> setting in configuration file to solve this issue.

It's past the feature freeze which means we won't merge upgrades, but
I imagine its fairly simple to identify the patches in 2.7.4 which
enable aarch64.

Ross

