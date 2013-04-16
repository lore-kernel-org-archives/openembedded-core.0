Received: from mail-vc0-f179.google.com ([209.85.220.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US5Ay-0007kk-Av
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 14:39:57 +0200
Received: by mail-vc0-f179.google.com with SMTP id hz11so312292vcb.38
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 05:22:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=LK+iQjN0t6OyygIcbeRncdf0L6w3hTl6t9Dxst8K/QE=;
	b=k8D/XyYPFDAGrCvsCXm09S67+rMjp6djuKFnTQl4V/9wa/sPE+i/tOFPKtQzs9JnQK
	JmhTpUKV0OnWitFDoLJMwHkPcEy6Oe9xxLGRvm8RZHJ45M+5Go8AvsAGjWpSfF2qO51E
	tPi3uEf1lR5HlCUwvwvM9wjvBdPWD7fMzEhlZ1/H0cIOI0IwlypM2VefZQquneQXiQ4I
	BFhunMpActWj9s1Vu83IPUevzn+hbM4I9meXtWHb2ra/GZQGlUnR4xogNpdCTNZL4LDH
	FDYXyqbTgrpN9Qd8SlijNuQcmcVZGzhfv5zm47GatbTXC8qN3HWQnA4qKI0ZxTNlu1to
	hqnA==
X-Received: by 10.52.28.139 with SMTP id b11mr1163385vdh.4.1366114945820; Tue,
	16 Apr 2013 05:22:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 16 Apr 2013 05:22:04 -0700 (PDT)
In-Reply-To: <760EB53F-6A7D-4020-AE87-914F3E9E9368@dominion.thruhere.net>
References: <1366111789-24156-1-git-send-email-ross.burton@intel.com>
	<760EB53F-6A7D-4020-AE87-914F3E9E9368@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Apr 2013 13:22:04 +0100
Message-ID: <CAJTo0Lb0_Shg2hJ8U6pxk0wue_KjpHAA=hVAn4bTT11SZO_O+w@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkZwZMrtqd2xGYrNpGhQF5IULgImPssXEo6Nl9HBVLO379hSnzx6q5pcHoZL4e0mM5tPFfu
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cairo: fix builds with libpng 1.6
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
X-List-Received-Date: Tue, 16 Apr 2013 12:40:02 -0000
Content-Type: text/plain; charset=UTF-8

On 16 April 2013 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
> This fixes the weston/cairo issue for me :)

My test case was weston-terminal, so I'm glad! :)

Ross


