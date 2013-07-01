Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 5B24A6A5AF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Jul 2013 14:44:30 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id hr11so2031062vcb.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Jul 2013 07:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=a3suifLEqxcQLU+mfqroTh5ka4WKIridhvgB3bEyBRA=;
	b=dRPq03Kh7by2fvGro0ZebztoysHmyCp5Ee16M6coLjG0LEDBY4MF9kxQgRHWE4djY3
	7QYketfkvSYRLcmd1/bqs2ERHgOg72e/Fsodu7k3Hv5MLC3mFSXA0J1y0XoNckwCDeT5
	INPGt7cZXR+102Qvd8zOrk93EGMvK91X17ydY1+f4FddaUS4WguFQ4VQ+NfijLdvVP9A
	+duQLm5rrqrH4d7IXhkBI05Jcjou6U/hi7fZIJp84vzj5A+fKr2TrfX0Ujp6FfFne1F4
	LB8AF1KFSYMQ2WheE/vim1/UTSD3uUKZmi8QY20qwLvWcN39S5fMzPpSjy54OJS1UAqN
	Jh3Q==
X-Received: by 10.58.118.70 with SMTP id kk6mr9781103veb.1.1372689870449; Mon,
	01 Jul 2013 07:44:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Mon, 1 Jul 2013 07:44:10 -0700 (PDT)
In-Reply-To: <1372688477-27863-1-git-send-email-paul.eggleton@linux.intel.com>
References: <1372688477-27863-1-git-send-email-paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 1 Jul 2013 15:44:10 +0100
Message-ID: <CAJTo0Laa1Y4NtDbQsGEJRaP+K31y_CF9Hmk=drvFs1GOArPBzw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkerea+jrZ5ZNfr6zxAEbPHNpcYvkCxHSzLfJ0F0G1HrXSuRbXeEiXjhUPRFJ5E1aIM2o9U
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lttng-modules: allow building without tracepoints enabled in kernel
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
X-List-Received-Date: Mon, 01 Jul 2013 14:44:31 -0000
Content-Type: text/plain; charset=UTF-8

On 1 July 2013 15:21, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> +       find ${D}/lib -depth -type d -empty -exec rmdir {} \;

A slightly cleaner form of this:

$ find ${D}/lib -type d -empty -delete

Ross

