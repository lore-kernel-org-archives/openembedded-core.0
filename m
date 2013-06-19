Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0DDD060668
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 12:08:22 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id ia10so3696358vcb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 05:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=AkcREryjSfnPcByALjJnw7LEEGgcOCEE/OCkQyGumdI=;
	b=SXqMxF4l8itGHVDIU1flch8TcLrHECBSReCsZ1S66KEEqbUYUMKnD+Pt1Y3pmKonZR
	GgcsDucDe3Ru9v209H/Nq1lcmLlTvKgFtsGQzl7PoWwT7zi0b+LMbwtk405h3ntRszWq
	Faf2jzoai/I9bs6FnLUlbUz6T+jquQf0o1u7TOOMUNNN4lTFdDAW4a4rZbKdugB+JY0P
	0etjSHEmjJm8sUHmoKRn8s/yevLCRicA0pEvw9u+Bxi0V8HtDfpWIrWAEkLp95Rsr9A9
	GW8xbISxQYAl6y6UXNQia8zGYXnhJYKSjLQXsHk72xIb2Ah6sfsFbm4BPSBHrAix4+3M
	omSw==
X-Received: by 10.58.181.225 with SMTP id dz1mr803436vec.95.1371643703538;
	Wed, 19 Jun 2013 05:08:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 19 Jun 2013 05:08:03 -0700 (PDT)
In-Reply-To: <c30e02ff25c696da4c08bf8e66d0bd7b0858dea9.1371642926.git.kai.kang@windriver.com>
References: <cover.1371642926.git.kai.kang@windriver.com>
	<c30e02ff25c696da4c08bf8e66d0bd7b0858dea9.1371642926.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jun 2013 13:08:03 +0100
Message-ID: <CAJTo0Ladh4xDOE5MRGOXkzN822-Uy_Hot+S-tei9MU59Rm6uyA@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
X-Gm-Message-State: ALoCoQlkEKUiwUMHbcvVVnwm9oQ17vEDnB7s0FiKlW9jmF2Rb5v51EsqEKpGcGqhYgVz9fXLl6We
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] python-pygobject: disable parallel install
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
X-List-Received-Date: Wed, 19 Jun 2013 12:08:23 -0000
Content-Type: text/plain; charset=UTF-8

On 19 June 2013 12:57, Kai Kang <kai.kang@windriver.com> wrote:
> +sRALLEL_MAKEINST = ""

Typo :)

Ross

