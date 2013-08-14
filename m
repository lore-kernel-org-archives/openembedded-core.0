Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id D851A6B669
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:36:08 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id x14so8049549vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 13:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Ox4GcvXMcsuucmwz509YDV8hWulbyon0nEpEIacTn+A=;
	b=Z/D+AZz3iJIk+ZbWaVbS+gMceNKspR2keLmp1EREGZjROhTen6iPiv48qSjKd2kBZs
	OzFKYvYPOgyEiCX9KzTM3aSmh4OppEVOVtxU1W3cwFxz+thQcYIGwHpBrHv2d/agM3+o
	TiIzofGRCsxbX/cMXmIizQgrAWIKlZSP4ndD41wAE0oZRnVF2i7eATR4+WQkmB5g+Xic
	FSGG2m4g2k8Qkv7tcd9DVLu8JAP7loioTf3bk0XScTqazSzz6iO8DPG7rk32VaBWoLM6
	7qm2CT3uzl+q+o2wpsKSudhq+qKgreU+aih+QntRNS3VKgYALcnir1jjfWCjDGpA/C9Z
	Mxnw==
X-Gm-Message-State: ALoCoQleJ1A3kGcAOX0ftnwUgURyu27FbS4kAqreOb/yErn+W/Rc8ELHZhLP7fWnL4lQmJtJD+ei
X-Received: by 10.52.30.48 with SMTP id p16mr9597897vdh.25.1376512569103; Wed,
	14 Aug 2013 13:36:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 14 Aug 2013 13:35:48 -0700 (PDT)
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Aug 2013 21:35:48 +0100
Message-ID: <CAJTo0La-PsajOhDmPHyMONi9_u2ytgWLpnGoQNvf1tewV5dYCQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/11] Update the way we control the construction of filesystems
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
X-List-Received-Date: Wed, 14 Aug 2013 20:36:09 -0000
Content-Type: text/plain; charset=UTF-8

On 14 August 2013 21:29, Mark Hatle <mark.hatle@windriver.com> wrote:
>  Debian(apt-get) does not appear to be capable of
> BAD_RECOMEMNDATIONS,

The semantics of BAD_RECOMMENDATIONS is "these packages may be listed
as recommendations, but don't install them", right?  You *might* be
able to do this with dpkg by setting the package state to
"not-installed hold".

Ross

