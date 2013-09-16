Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id D2E2861577
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 15:00:23 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id jx11so3091232veb.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 08:00:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VbBeylhrsPh2Sd/VhN5OXJsJudgK4ORFU539L/uuXuc=;
	b=RJAwfUuvw+pEmUQMWFIJUv+BmIv6GUlR2AXmdbHYi1+UFz4smokB/E1QAOwMGnqvBs
	e6f+QydbcFoqOHG72ZLkdVgGwAn79rapBjJ07iXvX0G/FsKpEGbNSYzMSAY17+P076f7
	vk6S67LgUtmHr4l93nfJ6xLdA0OivlIe1ZZHOyq7OZkxUoWcyWqxErLkPjJCQtV3w5xT
	KKYv+7jCfomQqYx7q6mNzgQP1XZONJVwF/qMRCE8EZuVkIK+UGQuI+0rF9IZWx6QFITK
	Jy93PxjlDnQzMlm8HWFTxqIpBxIYjiAG5qSyhTh+0//eWJWRJoSj9wiJFx5XHgIeavDj
	5bXw==
X-Gm-Message-State: ALoCoQk//4k+DyhhLMLmGcgKmtvulVjzQsAZEn0zrMX9omN3eWihmSI/QOrydnRLFLTZvjo+3lOr
X-Received: by 10.52.37.69 with SMTP id w5mr672766vdj.32.1379343625232; Mon,
	16 Sep 2013 08:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 08:00:05 -0700 (PDT)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C70495CFD@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
	<ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbKD7_vPLK1qV5ZAUBB78GedUZ84SLTSTe9MULArzn4uA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70492C1F@ORSMSX103.amr.corp.intel.com>
	<CAJTo0LbvTNA=YgA5APK55MtO2wS7QDqJUy4t4C_C0g14AYC=wQ@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C70495CFD@ORSMSX103.amr.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 16:00:05 +0100
Message-ID: <CAJTo0LZucKPx8oG-v+JghEwQmcXhu5qz36bie_sgB9tWoN2tfw@mail.gmail.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 16 Sep 2013 15:00:24 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2013 01:49, Kamble, Nitin A <nitin.a.kamble@intel.com> wrote:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=nitin/mesagl

The change to separatebuilddir.inc seems wrong and I merged your dri
change to mesa-gl.bb into my branch which had moved on since you
looked at it.  You won't need a PROVIDES in mesa-gl as it's in
mesa.inc.

I'll send my branch shortly.

> http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-contrib/log/?h=nitin/mesagl

Looks good to me.

Ross

