Received: from mail-wg0-f50.google.com ([74.125.82.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UPciC-00066r-4c
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 19:52:04 +0200
Received: by mail-wg0-f50.google.com with SMTP id k13so7102166wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2013 10:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=CLFWgWA2OY2s3vOhFdpa9JDGYp2lW9YmBe1CAeEPpho=;
	b=O2s2QALifnLsQJMeHoP17H+mSTU3BfKPd3pTENU+Nrk0uhkod7dpYhJhQog1RmHrWg
	TBlMq75JdvNRxgxJpJVoGUk6OhMvLqih/gNZEsIdhz4nae5dg8K3R8+MZQayTx7c9Xr1
	Mi/6BQvRLe4V4PAeius7ujSzt93S/oYD+YnMaeBv2ggERaIgDlv1/yZK7YVzMbhysHPp
	502yC5iHfr8PMDgPjFQYJk1AYLtSRaG8ad2wlbMuavvuiAcPxNYI9PmdVZtMb9itcv1e
	MyM/IJIhPvcLzPpKc/dh0kDBQuEIJJotUyLBb8VTJcYno175iNNS0uJnGMpUcL+iO8fN
	HItQ==
MIME-Version: 1.0
X-Received: by 10.194.178.100 with SMTP id cx4mr40412406wjc.47.1365528884024; 
	Tue, 09 Apr 2013 10:34:44 -0700 (PDT)
Received: by 10.194.45.100 with HTTP; Tue, 9 Apr 2013 10:34:43 -0700 (PDT)
In-Reply-To: <CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
References: <cover.1365179842.git.pkj@axis.com>
	<a20f68229f1499d9020bd9cd8dc593e5f6635967.1365179842.git.pkj@axis.com>
	<CAHUNapRCw6pqVL1MfSkPqDZQL-adp-AHQba8+nGTPoi44BTguQ@mail.gmail.com>
	<3664366.6RB48HkoAG@helios>
	<CAHUNapTSbxqXuj7LOsNSrZL5Ank+ngvkXF=cnhvM7aUK-DQZZA@mail.gmail.com>
Date: Tue, 9 Apr 2013 13:34:43 -0400
Message-ID: <CAHUNapTps6emz9UTtLgKer5yuLzh8haJyg3V=8yTzfxbZRd8rQ@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] oe-buildenv-internal: Only add to $PATH if needed
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
X-List-Received-Date: Tue, 09 Apr 2013 17:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Apr 9, 2013 at 1:29 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> Under which shells do we expect a Yocto build to succeed?

Whoops! My bad.

sh -> yes
bash -> not so much

Let me rephrase: are bash-specific features to be so feared?


