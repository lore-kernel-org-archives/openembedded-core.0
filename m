Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1US41L-0000DG-69
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 13:26:21 +0200
Received: by mail-vc0-f180.google.com with SMTP id m16so260729vca.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Apr 2013 04:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type:x-gm-message-state;
	bh=GTxyW0k1RjpNOItBCRI/yXqXFH7yKARmxxH+6Q4fWcU=;
	b=Qufz7GbJoHYwEvKYq8ZtFP0Q2G8l/eCdppio6514YPpHCimKMcXWMIfKl/WoUVy5Ql
	0wkpfp7u+Xq33rUK8tLEmBaypvsjKFkte279AxKJQmKecWT5sD3KKGtE5HeadgpkafVf
	lVK65eAhwNINUFWdrwsTzJ+/cZAVz4cUJvQgOCWJsHx22smTxnLo0ixjW7BT4Jv9wJ5j
	nU0SfB0irRYU4f7P+UJucnrARrHIq6zPpIGA2eAjOAzMQwzKBx2RsHdiMJYasj2hMXmb
	hDA3wigsPUeoFrjmqmrkH/In8nOH6mEiD0jiAw88Nvw59QbsDsDRz0FN8Ka7qOVwH4xK
	TT0Q==
X-Received: by 10.52.23.115 with SMTP id l19mr966968vdf.55.1366110504713; Tue,
	16 Apr 2013 04:08:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 16 Apr 2013 04:08:04 -0700 (PDT)
In-Reply-To: <1366109919-11950-1-git-send-email-ross.burton@intel.com>
References: <1366109919-11950-1-git-send-email-ross.burton@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Apr 2013 12:08:04 +0100
Message-ID: <CAJTo0LbN-W6nap04ZHucoEKSLg+G04hjcmCtCYzxPRB1X8cm5g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQmBiIeCk9Gp600LdjO1GiDSAE0yzxLcJN0dMhheeMjxTKZeb+ZlIJKWPdLRsaDblKX8en17
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
X-List-Received-Date: Tue, 16 Apr 2013 11:26:47 -0000
Content-Type: text/plain; charset=UTF-8

On 16 April 2013 11:58, Ross Burton <ross.burton@intel.com> wrote:
> libpng 1.6 emits more warnings than before, and is also stricter with function
> ordering.  Fix the function ordering when reading PNGs, and stop treating all
> warnings as errors.

Ignore this, Chris just merged some pieces upstream so I'll update this patch.

Ross


