Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f179.google.com (mail-we0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id 266296B834
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:40:51 +0000 (UTC)
Received: by mail-we0-f179.google.com with SMTP id t57so376733wes.38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=yz57uBDhTravidwFo3WbPYyT96VBYIdeYK3Xe6htaw0=;
	b=b+rtmnd5kNc3SC3j7pO9W7wd6gzFr/czQ18mb5gsVYuT5oMcSgMEGvv2D2ijWF2+rU
	9DG5yaykdNOahaMgyPIaDUSjU9grf2IkUg2aVxm84lwKCuL9gSXgmeYZUYeupszx/zdm
	w7F62gMmWMWFuoN4Idniu0Oz6et1K8/xnTxapLjiDzyY5SUthSAZ9uNLKsgVRX09aSIM
	L3sisEhvxCUp6jSZrfcFcn4emc0OE800T26z7CUqQWtThlVYWu7JWSuI+zhGCo5ZlnZO
	tPWi754QaUYc1+nff1jTz28rczt06k3t361MvTlMDbTK2AvKELFG+5J8UniO6taKA43y
	4YJA==
X-Gm-Message-State: ALoCoQlw6dxPgGGQ/6NEKoD6s2BsCOec+eDZIYhrDJ44atw2F/fFIfRo4NwMbUwgdkjNok7moPWx
X-Received: by 10.180.79.161 with SMTP id k1mr1270215wix.36.1376559652527;
	Thu, 15 Aug 2013 02:40:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.140.10 with HTTP; Thu, 15 Aug 2013 02:40:32 -0700 (PDT)
In-Reply-To: <cover.1376546582.git.sgw@linux.intel.com>
References: <cover.1376546582.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Aug 2013 10:40:32 +0100
Message-ID: <CAJTo0LZ8ZcK3cWB1GU5f_Q8amruS-58xXvVmpZYSYpjHQEa4Rw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: paul.eggleton@linux.intel.com, clarson@kergoth.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/33] Review & ACK
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
X-List-Received-Date: Thu, 15 Aug 2013 09:40:52 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2013 07:10, Saul Wold <sgw@linux.intel.com> wrote:
>   connman: fix systemd support for connman-* packages.

This situation (possibly empty packages) should be supported in the
systemd class instead of worked around with anonymous Python
functions, please pull this.

Ross

