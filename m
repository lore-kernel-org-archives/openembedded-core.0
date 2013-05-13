Received: from mail-ve0-f170.google.com ([209.85.128.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Ubunj-0003Rv-7X
	for openembedded-core@lists.openembedded.org;
	Mon, 13 May 2013 17:36:53 +0200
Received: by mail-ve0-f170.google.com with SMTP id 14so1874348vea.29
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2013 08:18:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=mvjsqu47Lhtofg3NCfWq5JIR5asrcTnJ34Mfub3+u84=;
	b=oWPyhRtysKs0yadxqVdjhujHR1HdQne6ekV8WkOZT8Db9yC2qkpYhsm5OYN/XqKiI6
	QnnXhIMBwtC7pPz4U8XCHryOb3hx9M9gelQNNEqFm/w2EhN2dkm9O0CUEf5aCDwE++Wa
	+/vdMJmgGCxFMJzdKtFSpHdLrj+n+S3M9+6bccYvTCM23IcQd0dagPWg9xMPBoazpRN8
	Tdjncbfs8UaRJnUnWE9H5hIamkCa5+DvqQcbFvW1lPjm2hsBuCb+4Iqu9IF3El0Wdxti
	pUxla5lVvRdbDEYcaKTGYcdqQBb8gtgLo4peKxo++FNGgyp+8MIt4ZKuwZKzCeP11R0O
	3sdQ==
X-Received: by 10.220.112.198 with SMTP id x6mr10816771vcp.38.1368458304927;
	Mon, 13 May 2013 08:18:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Mon, 13 May 2013 08:18:04 -0700 (PDT)
In-Reply-To: <517B30A4.5050405@windriver.com>
References: <cover.1366963971.git.liezhi.yang@windriver.com>
	<4aa663aaedff33870a96a676b9394ff79fe49eac.1366963971.git.liezhi.yang@windriver.com>
	<CAJTo0LbU2=iEOpnw3GRSntQQyH73RaJ++zdzye2s1zvsgEznSQ@mail.gmail.com>
	<517B30A4.5050405@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 May 2013 16:18:04 +0100
Message-ID: <CAJTo0LYzafv3Eb3QtbVT+jbRkfPN2_vUxh0bsS0WZ9bJc8-NaQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Gm-Message-State: ALoCoQnd23bk4HPGhK4cfwGXj6qHQlcjMiczS59+YAK9w9mfXuCx9ZxP2KJZHVIb33Yi9HMKIoOp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] glib-2.0-native: do_compile failed on opensuse 12.2 64bit
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
X-List-Received-Date: Mon, 13 May 2013 15:36:57 -0000
Content-Type: text/plain; charset=UTF-8

On 27 April 2013 02:57, Robert Yang <liezhi.yang@windriver.com> wrote:
> Thanks for the review, please see more comments:
> The glib-2.0-native had already depend on python-native before this patch,
> the depends chain is:
>
> glib-2.0-native -> python-argparse-native -> python-native

That argparse usage was dropped from upstream in 2.30, so we can drop
the dependency.

I still think that we shouldn't have to build a whole python because a
distribution decided to not install fundamental parts of Python out of
the box (python-xml).

Ross


