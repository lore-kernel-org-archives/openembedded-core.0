Return-Path: <moritz.fischer@ettus.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7346F6022E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 20:25:26 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id a20so23248511qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 12:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ettus-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z1P7te4P2020wv9ZdAhEbdsZqy7bPBN3+a9tWDBTGzk=;
	b=eIKHqUjeJL/0HxNvt+uASjr7zpuHhXSc3Unqs59mSgitCnq+7iF4/x0E+BKxcwNdUS
	cZhpGD7M/LEkAK9cRGFpQhZ+NPFbX679m2mTU1m/FUxLfgDKKttrew33MqSiXucBKwRq
	XiM979JXqVax7PdYOOIou9EWBMtz3yapkLysJSve4kZXk653yRcstxR42nUPuo2vVKef
	9h/VYLbpkPhkD9qlXlt9W2ZP/hXu2vyvtEMIi2s2J2NiDa5ir6OdqcS6P/0E4zttedf2
	aR2wJgTpwo2JoS0cgA5FMNudhdYgFGweyzjXxELxT2OQzfBqx0N0hUJnBnmHl8lUsVSu
	hTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z1P7te4P2020wv9ZdAhEbdsZqy7bPBN3+a9tWDBTGzk=;
	b=efaQAyojMx0WqZjTZkilT49RSYDgg3yus9GhhdjBrl+bCUhbjgd4LwNPJUkZkaMsHl
	STpUS+mLC63iGudKf/u32+DdpK5o791I9YEE+09GbagFB8UhSbrjsSaBs5PhkUT00Sf/
	YBjMer/P09dUqp+1lGvd0Age5rqPcRBrb07ZfxvA0GdWG4i4w1S5HIzqF5inLGGXFUHH
	ZzObLv3qoNq8rfA3/7NLDfzr7OhRdXoncRDJpYaqyOSo6ok+i5ysS/vY6K99BoZUbjKb
	499kJLUvRW+9/tI6VF2dHPPts2J6KXk23VARtnicLnOOCldAPkiX2Cjm3bbtwTzlvWTs
	pJkw==
X-Gm-Message-State: AIkVDXJH96Ojp04uKy+fdeSvoStCVqviTQ9alKIKYjPYUINBD16wrCHw2do2GFr657eH3dX+CoxYq6N1WIvy8lQh
X-Received: by 10.233.237.13 with SMTP id c13mr7932177qkg.227.1483561527286;
	Wed, 04 Jan 2017 12:25:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.160.163 with HTTP; Wed, 4 Jan 2017 12:25:26 -0800 (PST)
In-Reply-To: <740a7531-d635-8191-d901-ffaa0deffae4@linux.intel.com>
References: <1483512355-27961-1-git-send-email-moritz.fischer@ettus.com>
	<740a7531-d635-8191-d901-ffaa0deffae4@linux.intel.com>
From: Moritz Fischer <moritz.fischer@ettus.com>
Date: Wed, 4 Jan 2017 12:25:26 -0800
Message-ID: <CAAtXAHe=ob8N-Z6OzVPm_Fbc91Z3Ve+=K4Mubp79PJhik8a+bA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: koen@dominion.thruhere.net, openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] devtools: Add recipe for Chromium Embedded Controller utilities
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
X-List-Received-Date: Wed, 04 Jan 2017 20:25:27 -0000
Content-Type: text/plain; charset=UTF-8

Leonardo,

On Wed, Jan 4, 2017 at 10:36 AM, Leonardo Sandoval
<leonardo.sandoval.gonzalez@linux.intel.com> wrote:
>
>> +}
>> diff --git
>> a/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
>> b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
>> new file mode 100644
>> index 0000000..46e8cad
>> --- /dev/null
>> +++
>> b/meta/recipes-devtools/chromium-utils/files/0001-build-Add-HOST_LDFLAGS.patch
>> @@ -0,0 +1,26 @@
>> +From 56ffeeffea735a6a8f69fc111278ebabe3c7e2d8 Mon Sep 17 00:00:00 2001
>> +From: Moritz Fischer <moritz.fischer@ettus.com>
>> +Date: Tue, 27 Dec 2016 22:24:07 -0800
>> +Subject: [PATCH] build Add HOST_LDFLAGS
>> +
>
>
> what is the Upstream Status of this patch? At least for oe-core, you need to
> provide it. More info at
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Good catch, thanks. I submitted it upstream. I'll just wait for that
to resubmit my v4 here, maybe by then I don't need the patch anymore
then.

Moritz

