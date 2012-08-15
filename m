Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T1aT7-0006cu-JG
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 12:04:53 +0200
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 15 Aug 2012 02:52:56 -0700
Received: by iadj38 with SMTP id j38so120076iad.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 02:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=zKn82zWxx6T4X1gQS7b46NdDsBz0CSJbBgJe+datMfo=;
	b=T5lw9l5WsrDiv4uGpGJ7MLOgV8WiDwdGbYyCzhXjSBU4MZaiiRxXdzEjCitLCX84Z+
	dYHw11ZgWuPDnmBrn6YmtyHj2RMh42djQyoL2t1g5KywgX4QrfaZDhFbh53K2tfNBg/z
	U+wlIKU7BtyRa2y21vxF6QduF54Zrn0LLYmQFPd969cwVLXf8tWRlbuMUgeNoYb5YIGD
	veDdTKeKQASlxYFKMfV4nckf4Ii4NQ0V9otjzHTxO9pXTUw4mwU16SH9AwxESYcDqboX
	aNrb7/O+65FXCG1D8cndWxoPNQauNNxMX7IASgx8CcuEQy8rK1t01GzMQFwB/hhFGoHw
	yCAw==
Received: by 10.42.64.9 with SMTP id e9mr14029229ici.20.1345024375898; Wed, 15
	Aug 2012 02:52:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.146.103 with HTTP; Wed, 15 Aug 2012 02:52:34 -0700 (PDT)
In-Reply-To: <CAJTo0Lbzc5vG64aPKiZ5H_iVpwaQ7bn5uT8eemKo294CczXA7w@mail.gmail.com>
References: <cover.1344884283.git.ross.burton@intel.com>
	<502AF9CD.9020508@linux.intel.com>
	<CAJTo0LYPEOfgDhiKgh9G3Jsyi39hcU99qd0P_0UNL7NEwcY0PA@mail.gmail.com>
	<CAJTo0Lbzc5vG64aPKiZ5H_iVpwaQ7bn5uT8eemKo294CczXA7w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Aug 2012 10:52:34 +0100
Message-ID: <CAJTo0La-Z=nh5RLnD9idbr95=6cEcLZrPtEW+MuP3kdmMo9-bQ@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQkS6va0B0CsKLqAGM7ZpQ96tDCt54+N53o+tG1aqc95pztEGHTeAY7d4UE8hXDyPOpXu35w
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Enable EGL and GLES in x86 Mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Aug 2012 10:04:53 -0000
Content-Type: text/plain; charset=UTF-8

I just tested my mesa branch against stage/master_under_test too, builds fine.

The complication is that you need to ensure that the mesa-glsl-native
package is correct, even small patches to mesa make it produce bad
code, but then you get an entirely different error.

Ross


