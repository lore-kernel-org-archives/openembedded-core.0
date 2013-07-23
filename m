Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC0361EEB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 09:45:51 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id hz10so1841554vcb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 02:45:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=zOyQMoIR4JmWsvHnsDqF7F0g0WUPgI/25Sb9tIjJnr0=;
	b=EyT5oo3dSJOxYYJxfMWwvVc7syADm8NMeFQ1vDCQltqB5eyHavIR8XQ3c/0KAs7Cul
	8e1SUl1vAVDJQ41cCiBkPygeWL7/YXs6hCItWdRwhTLBg1jmWUIXK5pPqybz1OgNKtCR
	D60/A857/zhioqVfiqgwALfwv1gpmWr7dsU+r35rGmYNABT6o6tfDuadjxa2x1LxiJpR
	52xxS5kk3DLhWxRg0yTLBHG3ytug7L4Z4xWl6MJudgtlTfoH0UmCvGpWNxgXDXkN4vjY
	1iqNNfBcshl2eQjDd27a+woPKCKRYJRLmA3zUYQm4dWnMtsaRFCsxkZqrZ0GHXGJNtt9
	Q2Og==
X-Received: by 10.52.158.136 with SMTP id wu8mr9044356vdb.33.1374572751813;
	Tue, 23 Jul 2013 02:45:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.30.15 with HTTP; Tue, 23 Jul 2013 02:45:31 -0700 (PDT)
In-Reply-To: <cover.1374511663.git.sgw@linux.intel.com>
References: <cover.1374511663.git.sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2013 10:45:31 +0100
Message-ID: <CAJTo0LakgfLTuXy_9w+QuHo6cvafd3qaw4=EgCwyYKKTepkyeA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmBsFzPhD4OFgNob5lOlASpBion6TxwjnBXjnf7t69ZpHoDwvuZMY2AlZmd35MMBfTA6gYg
Cc: Daniel Nilsson <daniel@dnil.se>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/27] Ready for Pull after final ACK
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
X-List-Received-Date: Tue, 23 Jul 2013 09:45:51 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2013 18:12, Saul Wold <sgw@linux.intel.com> wrote:
>   glew: Update GLEW version number in autotools patch

This is just going to hit us every time we upgrade the package, so if
we're going to maintain a non-upstreamed build system then can we a)
squash our patches to our patches and b) use a do_configure_prepend()
to inject PV into configure.ac?

(oddly I can't see this patch on the oe-core list)

Apart from that, Acked-By: Ross Burton <ross.burton@intel.com>

Ross

