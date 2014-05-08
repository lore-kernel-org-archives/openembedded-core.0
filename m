Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id B067B65F75
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 14:33:16 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j5so2681781qaq.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 07:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZC5gEmQKldR2/YFmBs7P0yT1J/iZO5Mnz2Lg3Jk90YU=;
	b=bMI3vpwrsZu3V61sCQvJxefmqluOvghU17Ao18ilxD5GKC1iLTLhyneiFXm4flLC4G
	gQlALDW09fZXt2C0vL57FoBs/MFtRTKDBT6eNc0SNvdDWBucgAiVtWESd53ykinTreTi
	15d7zSnuG4rTvOLwWjsbQT7HjArdcK7vBe06Q7Kz1HlH086jT+r06IWFpPSE2qGQbt5u
	6tVoVxMehob1gadoRURZo0mNd7LQNhCeJnY0KeOJtKoajsoLhmPbvY4j1RGijuKN1Miv
	mMHKTl0ts0jA8xpLMD9fWYkdXKKcXw42P7m7cVdVdOE7F/huab1e/mCulAb2RSyIJ0J2
	rCXA==
X-Gm-Message-State: ALoCoQkXwpjZKbLlALucukyB6HwKa3Sy7dE3TYXt377yFr4D3okay01j/Jy4AKZgBMpbBP64Nvf7
X-Received: by 10.140.48.161 with SMTP id o30mr4985123qga.68.1399557987146;
	Thu, 08 May 2014 07:06:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 07:06:06 -0700 (PDT)
In-Reply-To: <536AA62A.4000005@linux.intel.com>
References: <1399478735-27819-1-git-send-email-ross.burton@intel.com>
	<1399478735-27819-2-git-send-email-ross.burton@intel.com>
	<536AA62A.4000005@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 15:06:06 +0100
Message-ID: <CAJTo0LbE0+7iT5OD-n8x3q0XQPo5E0DzGjwhfdU2=awUQ6g+xA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] glib-2.0: upgrade to 2.40.0
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
X-List-Received-Date: Thu, 08 May 2014 14:33:22 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2014 22:31, Saul Wold <sgw@linux.intel.com> wrote:
> This update seems to have introduced a definition of g_ptr_array_insert()
> which causes an issue with gst-openmax.

Yep, gst-openmax was using the same namespace so a conflict was
inevitable.  I've patched locally, running a fuller build now.

Ross

