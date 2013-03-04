Received: from mail-ve0-f182.google.com ([209.85.128.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UCTAc-0001DZ-FH
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Mar 2013 12:03:02 +0100
Received: by mail-ve0-f182.google.com with SMTP id ox1so4571615veb.27
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2013 02:46:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=vv95TkANw0FpWQrqVjv4etE24kfLRr+pz9WUKbJa6lI=;
	b=PMSGBYVnG5wfYR3gmaHrBoUc21bmqC51mDDJkM28xbz6LZUjMgj2TGa0xJbE7BF3yP
	EgUMh3uc0Mv7nmcCpk70vwg74Tro+lkgbQE08imPP23U4C2um8cFPFZY45jYMPLLyJyC
	VKnfA5A62OATnTqPDNNq5APIq06LX7olyc+wqCNnP70Wyr0+v2beQcR+r8l5c98vMQVd
	5/a6OLYVI3kUUY5/gmvK62Un9idjG8+Y4ifnlj0YYdeUApdWt/A0KIlcotZdfXCxlvnp
	sMEOnjyHi/t7rTH6iGxGBqOgYofLLiwy6iN2x5McHpCwRFL/dcJJtYnf6Q5R7/TWHudt
	FJ1g==
X-Received: by 10.220.215.73 with SMTP id hd9mr7573079vcb.19.1362393994508;
	Mon, 04 Mar 2013 02:46:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Mon, 4 Mar 2013 02:46:14 -0800 (PST)
In-Reply-To: <1362371757-3323-1-git-send-email-yanjun.zhu@windriver.com>
References: <1362371757-3323-1-git-send-email-yanjun.zhu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 4 Mar 2013 10:46:14 +0000
Message-ID: <CAJTo0Lb3mHqmPHLW93O+6Lj1+v=XuYZ-hNe1xOc+yBOySGUkqQ@mail.gmail.com>
To: "yanjun.zhu" <yanjun.zhu@windriver.com>
X-Gm-Message-State: ALoCoQmppSP9FdimdBhCgUCbiD1neW0738a8wFYTQdAw4JPQOL44FcVVe4izJdQ25riQ4HnPJKq8
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] Python: Fix for CVE-2012-2135
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
X-List-Received-Date: Mon, 04 Mar 2013 11:03:03 -0000
Content-Type: text/plain; charset=UTF-8

On 4 March 2013 04:35, yanjun.zhu <yanjun.zhu@windriver.com> wrote:
> From: "yanjun.zhu" <yanjun.zhu@windriver.com>
>
> Reference:http://bugs.python.org/issue14579
>
> The utf-16 decoder in Python 3.1 through 3.3 does not update the
> aligned_end variable after calling the unicode_decode_call_errorhandler
> function, which allows remote attackers to obtain sensitive information
> (process memory) or cause a denial of service (memory corruption and crash)
> via unspecified vectors.

You really should reword this commit message so that it doesn't appear
to be inappropriate - this bug does apply to 2.7 but it's not a
security issue.

Ross


