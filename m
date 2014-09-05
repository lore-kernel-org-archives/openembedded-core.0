Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5B30A713F2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 19:35:47 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id l6so12935117qcy.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 12:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4QFb140Siai87ReB0wLEjQmZdfyFKEAa8LerDfK7PF8=;
	b=ZMxjXeOsJl2AsYU+URCf3JD1902dHNBkchug0L3CbC0JK249GKcCsFOs2dx/GmF5TP
	mYD5hMrpzPVOo0WlLrWFT58qp7PCv0qnDLQi9tPofm3QyvuRD/JTUKQCSuykhiJ9sVcF
	1QOHExNX9S+giXqDEwNDI1sqTOHmAnOCtKeVnt8VkpyE1zkUfSHklXpEWCToRGnSrQ+Q
	qBb2ijkDyu74K/PkTblVJfzoHNgcT64a2wuk2bJ3R14A5OjW46AUqQNXZGb21ToQp0e3
	TpCPCLk0CcX6QidpsKQuwGbUf/k/tPACeVIkcxljI+HRts87pAvcTSAYYYmJ+tmlg+1l
	LyNw==
X-Gm-Message-State: ALoCoQluVdg0z0w2jWfdsm1M982aUIGHKYTrerJNQKxxeZd/Ih4f4Dy7gckZTBHb3fyxBZGucpVw
X-Received: by 10.140.97.131 with SMTP id m3mr20816639qge.80.1409945748983;
	Fri, 05 Sep 2014 12:35:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 12:35:27 -0700 (PDT)
In-Reply-To: <5f69db7a3b75248ce543cb11f1fabe57b491a340.1409791242.git.cazfi74@gmail.com>
References: <cover.1409791241.git.cazfi74@gmail.com>
	<5f69db7a3b75248ce543cb11f1fabe57b491a340.1409791242.git.cazfi74@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 20:35:27 +0100
Message-ID: <CAJTo0LZmxUE=51F3EwK+0_ih9upLU9T7MmRHR6b=5m9kFh3xfA@mail.gmail.com>
To: Marko Lindqvist <cazfi74@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] pixman: update to 0.32.6
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
X-List-Received-Date: Fri, 05 Sep 2014 19:35:53 -0000
Content-Type: text/plain; charset=UTF-8

On 4 September 2014 01:48, Marko Lindqvist <cazfi74@gmail.com> wrote:
>  meta/recipes-graphics/xorg-lib/{pixman_0.32.4.bb => pixman_0.32.6.bb} | 4 ++--

Before we get another submission for this patch, it's stalling as it
fails to build on qemumips.

Ross

