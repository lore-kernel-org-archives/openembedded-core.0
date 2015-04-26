Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 58FC47169F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Apr 2015 16:17:48 +0000 (UTC)
Received: by oiko83 with SMTP id o83so73008961oik.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Apr 2015 09:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=D98n418VJkzjRsIxCelE0TtgEUTcwXtGNC7oJBNGMZk=;
	b=Rxt9HsouFU8edJ3F2rUgR5BBmss7FfAdGSnWO0CWj/jJn4DAwmfG1pNRcUZ7swds1+
	a4Qu6Q4uKImN//MP1t4OmJLIULiwumEisZ0L1rRYvRcoeF1kOCv+uj1jJxx7IEuVFoq7
	SzRaC5OcIparRUEazWWdDytrGgllsf49XqLSUAsndiJzfpFzUKZSXzioJKOepDtgXvKJ
	iA2C0HeZ+90BH1aMYRqsCLtGA1vZ6E4Woj3cqQCFVW+rJlvqs2uMH7BCpS/hroT+RwJK
	URL6FuC77SGeXJEN945mtsP0ybGtSlY23V4oI+DUSLpUZowYsCJdRv7UVz+R5T9ew96W
	bqaQ==
X-Gm-Message-State: ALoCoQlDtRiFAdTrTpNOPAyL9jFnwVO1w/yS4CKF7a+mHNXifNh4qGBPVmVqU/yegkdyIJoJrGgX
X-Received: by 10.202.95.198 with SMTP id t189mr6193438oib.105.1430065069175; 
	Sun, 26 Apr 2015 09:17:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Sun, 26 Apr 2015 09:17:18 -0700 (PDT)
In-Reply-To: <CAJTo0LY5P1=bxOw5iyq9w1516Z80AK_Zgo4uz_HLeBnSJvDqaA@mail.gmail.com>
References: <cover.1429623703.git.jussi.kukkonen@intel.com>
	<8707327ed9f83af241aa6fc3a8afc640854c9ced.1429623703.git.jussi.kukkonen@intel.com>
	<CAJTo0LY5P1=bxOw5iyq9w1516Z80AK_Zgo4uz_HLeBnSJvDqaA@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Sun, 26 Apr 2015 19:17:18 +0300
Message-ID: <CAHiDW_HLeP=U-aAVzY4yZS3PyZX+NbP2-ZhDdRPjYoUP9BUgQg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] librsvg: Upgrade 0.40.6 -> 0.40.9
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
X-List-Received-Date: Sun, 26 Apr 2015 16:17:49 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2015 at 11:50, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 21 April 2015 at 16:49, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> -Upstream-Status: Submitted
>> [https://bugzilla.gnome.org/show_bug.cgi?id=712693]
>
> This tag disappears in the updated patch, please add it back.

I fixed Upstream-Status tag in that patch and re-pushed the same
branch (rebased to current master):

  git://git.yoctoproject.org/poky-contrib jku/update-gnomeish
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-gnomeish


Thanks,
  Jussi

