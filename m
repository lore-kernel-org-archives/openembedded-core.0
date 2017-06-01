Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-qt0-f177.google.com (mail-qt0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id E926B607F8
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 10:15:06 +0000 (UTC)
Received: by mail-qt0-f177.google.com with SMTP id w1so5193020qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Jun 2017 03:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K4CzuWs5VmaVnB/+OKdIluSRPf7tho3FPRIDM0rrbzE=;
	b=Erul/RBcSyUDUcdUv+EVdoYCAavcwFmqSHNzcFcBqb06FZswu+ubwNapa9SG1pFCg2
	/ABaU4ORPGWRT9OlkUtik0oUrcyFCz60QM0BMv3U4qEsGsOCnYqV8jI14tVGcnj+MIHv
	M/7yZ5QjwWm+YstR+WtdQnF3Tq80cM0PYCX9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K4CzuWs5VmaVnB/+OKdIluSRPf7tho3FPRIDM0rrbzE=;
	b=ic1serzodta3W7dXSRq2U5G/d5Y/x09LQN4gnUA+0kFtG0TOrH1CIIrCQlqjnDASYp
	KRlvzZCol/ZOu7a45o7EA7MVRqNwBFiRjVV5Srn7O7+pJD/taFRvu3L66uUjmp4kjOOx
	42LukvqcJJS2YyopkkTjh13wW87C4iUnUd2F0d3bIQXVpZYiIGu8Oke5T/V/U6W4f8WR
	yft7u3l5XgO9L56VcbQYkrYeIBEO2RBVMT9n7ctlyJwdUXF9tym5F2qdxrkY0BAE3/kB
	2yz22vgSmPYGoEwRYwK5LaPyYt8t0mte9aGi0lImfAPNjA0j/o0Pu0jcE6egU4YTltQt
	rEhA==
X-Gm-Message-State: AODbwcC3MnAJkrCpcExRQWQOLEL7H5VpKFZgfOP0Pi2eIlWCCqHbzFsQ
	k6/eVIirTNvFgc/nCiEIc6qiHq3H0cod
X-Received: by 10.200.42.219 with SMTP id c27mr740404qta.9.1496312108076; Thu,
	01 Jun 2017 03:15:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.88.135 with HTTP; Thu, 1 Jun 2017 03:14:47 -0700 (PDT)
In-Reply-To: <CAJTo0La8sEivJMFo7BzLbgLUOt0gD-8UPS06LZ0fNLoc8BoJrg@mail.gmail.com>
References: <20170530153249.7161-1-nicolas.dechesne@linaro.org>
	<CAJTo0La8sEivJMFo7BzLbgLUOt0gD-8UPS06LZ0fNLoc8BoJrg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 1 Jun 2017 12:14:47 +0200
Message-ID: <CAP71Wjzf4Guc_+Ou_bdhg3mDrdxYiQRWfktiMzmnJUSExrvoFg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: upgrade to 17.1.1
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
X-List-Received-Date: Thu, 01 Jun 2017 10:15:07 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 1, 2017 at 11:27 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 30 May 2017 at 16:32, Nicolas Dechesne <nicolas.dechesne@linaro.org>
> wrote:
>>
>> * Costmetic changes in license.html file required new MD5 hash
>> * Add PACKAGECONFIG option for libunwind support (new feature, disable by
>> default)
>> * Rebased 0001-Use-wayland-scanner-in-the-path.patch
>> * Added zlib in DEPENDS, otherwise mesa no longer builds.
>
>
> Breaks under musl:
>
> http://errors.yoctoproject.org/Errors/Details/143476/

thanks.. should be fixed now with
https://lists.freedesktop.org/archives/mesa-dev/2017-June/157542.html

i will update the recipe accordingly and resend.

