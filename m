Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 06E6D6F800
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 22:54:33 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so3520384igb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 15:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=H4mACXSw9nyIZF+niADnWaEqaKidzRz9jXp0Wu0P9Hw=;
	b=EXWzOxZOV3+e40yjOrEuLWPWHp54klPYgBpNFe+h7oTTaONY2cKQKq0xCIaug/Jvkj
	vh6lYjWfqJCHBAw7IAwGsmBFkcPjEGjkiYp1znsSLiaI5H9JmOmXmZ5INZRbbQ63h8KI
	ge7GflO7062XcAsMMMLC/LIL/Fb7OVAiMhh3cf8UuAAGIV7ekWRL3wCdoyAfLqQNBjsp
	gGqFq9rQK6tIW0PMo9hnVRtS7tpioCAsSLzSfigC+hsUjy40UVuo9alU19ZOsdI0gwEV
	zcNszcg0C+b+WXMHY/U5gsv6i59Qs6+v4uLhLT+asttak/zlLmPj4WLITGYxL7IBjB1u
	AmrA==
X-Received: by 10.50.49.76 with SMTP id s12mr23796919ign.2.1395356075025; Thu,
	20 Mar 2014 15:54:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Thu, 20 Mar 2014 15:54:01 -0700 (PDT)
In-Reply-To: <cover.1395343268.git.paul.eggleton@linux.intel.com>
References: <cover.1395343268.git.paul.eggleton@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Mar 2014 15:54:01 -0700
Message-ID: <CAMKF1srcKgDQurZLWGNwx7_wf_Hzxq-U0s4vPx=1QTq01TMVZA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Fixes for python module packaging
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
X-List-Received-Date: Thu, 20 Mar 2014 22:54:35 -0000
Content-Type: text/plain; charset=UTF-8

looks good to me overall.

Thanks

On Thu, Mar 20, 2014 at 12:24 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Some fixes for module package dependencies and SUMMARY values in
> Python 2.7/3.3.
>
>
> The following changes since commit ef196434620522affc11b5b1b867386b5d14a4c3:
>
>   alsa-tools: fix build when x11 and gtk+ not available (2014-03-19 14:41:55 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/python-manifest
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/python-manifest
>
> Paul Eggleton (5):
>   python: add python-mmap to python-multiprocessing RDEPENDS
>   generate-manifest-*.py: set SUMMARY instead of DESCRIPTION
>   generate-manifest-2.7.py: sync with python-2.7-manifest.inc
>   generate-manifest-3.3.py: sync descriptions with 2.7 version
>   python3: sync module dependencies from 2.7
>
>  .../python/python-2.7-manifest.inc                 |   2 +-
>  .../python/python-3.3-manifest.inc                 | 130 ++++++++++-----------
>  scripts/contrib/python/generate-manifest-2.7.py    | 122 +++++++++----------
>  scripts/contrib/python/generate-manifest-3.3.py    | 114 +++++++++---------
>  4 files changed, 184 insertions(+), 184 deletions(-)
>
> --
> 1.8.5.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

