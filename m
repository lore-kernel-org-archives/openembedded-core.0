Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZlmx-00055r-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 19:34:58 +0200
Received: by mail-ve0-f182.google.com with SMTP id jx10so828492veb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 10:16:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=3ylQioX4vxklhliIjN/BrLKXTYAnisAeNwLT3eikQ+4=;
	b=pBMcYxPGiqC9WLvC1TkMaXx/FrQihA2UAejN7ptw7x7m3GkysLigzf7ck705jF6DBZ
	znnx5i1wH0sV2Ky5XfcUD4wnxPOIua24ZdjUqgopXVSUH17bUqHeKk7Cs5xj/RLhHflX
	IF54IzcTrMBJHTjuLqa6yXO8afboyEt1h0tX7g22tXoKzU2Q4k0rGojSLhvKIHTYHYTG
	eIEARCVLVBRgr39SH518YAQAOJSNe7+HgT3EU6Yr+nRnDLc4GPT/M1euWxUP1G21ciA3
	JtWV6qntRfyKOH2ItCOcg8J4PbDQJ50TsPLpZAkuBYl308y6d/jO8yrexLhr8t8LahVr
	LwpQ==
X-Received: by 10.52.174.41 with SMTP id bp9mr1651704vdc.4.1367947010288; Tue,
	07 May 2013 10:16:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 10:16:30 -0700 (PDT)
In-Reply-To: <51893613.40209@windriver.com>
References: <1367946490-9159-1-git-send-email-ross.burton@intel.com>
	<51893613.40209@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 18:16:30 +0100
Message-ID: <CAJTo0LbwonrH5uSq_j9A=31hM_VNBgSD4FJymb9SHQx_RrY9PQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Gm-Message-State: ALoCoQl+bQ9X0m1LJuIySqQgX6H9qFmXUvp0R1s2LL346BVYDxUvQvGeK64cb9v8EGRJ5VD/fQaR
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemux86: disable paravirt guest in linux 3.4, causes test failures
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 17:34:58 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 18:12, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> (I also have pending updates to the latest 3.4 + LTSI, so it's worth
> checking to see if they happen to help here. Or was it only when these
> were applied that we started seeing this ?).

They crash is sufficiently rare that I'm not able to precisely point
at when it started appearing - I just ran ~twenty cycles of the tests
and it only hit once.

Ross


