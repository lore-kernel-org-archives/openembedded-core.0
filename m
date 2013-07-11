Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3726D6AED1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 11:01:47 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id e12so415084vbg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 04:01:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6TFfcK5YuDumyuFk/odbIAECZQXDHyI1FYyK/r07uEM=;
	b=PlsrvNDOlqxtMeYJ40G3IQ3442WRUJmheroIqTgMj9uWGulPiKXeTllYCgnT8JlIE0
	lnDAF5nl+vqYEKzuEMpQ1MimjEVqsxktB/9BfzP+Tf7mLB4dxanKtYkhcAljfnc3f+++
	Ei57Hmate0R+8ngqQeTDl+WXdxetHXbYgJCBgdWLyBQNZ/JHnA7FbwOnk33/GSo48ejV
	jODNRq/ob7lOs9ZVH/VunKqDfiD6IaRAMcASNWP1vzt25ItgzQhgkAn7BTKyP1WLTdm0
	AD41SbeZp9CEUQP2ymvvNPeWhhYa8llyJkzMvAvJaKMwj/5nSKnHm7H0c1uPzSyak4ZU
	yZhA==
X-Received: by 10.220.192.4 with SMTP id do4mr21398474vcb.91.1373540507844;
	Thu, 11 Jul 2013 04:01:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 04:01:27 -0700 (PDT)
In-Reply-To: <51DE8EB8.60908@opendreambox.org>
References: <1373504197-9550-1-git-send-email-obi@opendreambox.org>
	<1373504197-9550-3-git-send-email-obi@opendreambox.org>
	<CAJTo0Laa7if2poYd_8AeLYDq8obefuw5F7ygSi+uz4LYpWrOkg@mail.gmail.com>
	<51DE8EB8.60908@opendreambox.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 12:01:27 +0100
Message-ID: <CAJTo0LbWOX7v7o1-0CVEbs66yAg0d4rG2nYRCZbD9AXm3YBJDg@mail.gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
X-Gm-Message-State: ALoCoQk1ruYpNvxnbDZ6XT2Tp2LMy7jRfJNi1M9hl+r1LlYblGAG0eU8h5ePk2CdzEA0riRwsOeU
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] cogl-1.0: add option to enable GLES1
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
X-List-Received-Date: Thu, 11 Jul 2013 11:01:48 -0000
Content-Type: text/plain; charset=UTF-8

On 11 July 2013 11:53, Andreas Oberritter <obi@opendreambox.org> wrote:
>> The rationale behind this was that the GLES1 support isn't tested,
>> mainly as there's not a lot of hardware that can't also do GLESv2.
>> Was this enabled for completeness or are you actually restricted to
>> GLESv1?
>
> It's for completeness, so if you have libraries for both GLES1 and
> GLES2, you can compare them easily and then choose the one that works
> better for your application. If nothing else, then this may improve test
> coverage. Because it's disabled by default, introducing this option
> doesn't have any bad side effects. On the good side, it explicitly
> disables GLES1, so if a later version of cogl switches to
> auto-detection, the behaviour of the build won't change.

The GLESv2 backend will work best, because the v1 backend is crippled
by v1's limitations and lack of testing.  And GLESv1 is already
disabled explicitly in EXTRA_OECONF (that this patch should remove).

I'm leaning towards rejecting this as it doesn't serve a purpose,
unless someone can say that they're actually using the GLESv1 backend
(that upstream admits isn't tested).

Ross

