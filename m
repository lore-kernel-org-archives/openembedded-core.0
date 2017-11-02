Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com
	[209.85.218.49])
	by mail.openembedded.org (Postfix) with ESMTP id ADEF1782B5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 16:10:06 +0000 (UTC)
Received: by mail-oi0-f49.google.com with SMTP id n82so53112oig.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 09:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=xpfdJahSUqcgCcP63C4PoWdIJ3u1A+MjJhpaGgvViVg=;
	b=YsDJxtgv0d5+4VzOtc6an4qtRIl5HYPNrE6n8qyYc+Y00gpQlgXyCP8mQV58N+lLSF
	VwyURYRgXhI+0ZCDT2yagSC/uUjPuVWWRa+xEVI76/jBs4HgaIlgoKeqhkGhrXu0yZeg
	YDIAIDps1JYHjpnRqAnlBtbrXCTR0ZDzRxstbM+PNVrm5nQaJE0931KQGYmVsU+cE7W7
	nHkaE1P5Lwf/MqhNoXGr7tsw/ytWRLW2ec4a+8yhhnvFQwE0ThripXxBebNJO6qbtzVi
	P7aqwAR7qgym4LLXNxC72OOqBThhDQQSCIxJOals+DFaBfjjj4COSge4Pgl9DEFh1gMM
	PMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=xpfdJahSUqcgCcP63C4PoWdIJ3u1A+MjJhpaGgvViVg=;
	b=GMLbKxFKNvNHEAVcIuU/2AkMbOXFMK665mdb3u/7qeeXxdGYPHMsw1PWctxclvY+L5
	ma52Hg7t17j7qD9NMtX8Zp/sBU5RR4PCiFTQzYJfpS1UeLl1Cac2MtYLf6NK6DOgcmJp
	pSVTN8LJW/BFmiu25Z04my4AZpaOjUoSAshMvKQpmO25rgyuuO/y+zTPDB4yU2eOQ1wt
	8QWJKeC22kr2+nfG/PkRFA9hJxkJZpS9u89yPaeF0+zL8Ju4qPaPqWyIYMNXkX45Fgx0
	+MpYCLsAyzblXunfizzwb225qJup+VKLYJHR0LNns/8D2/BGLGycT6XszpW1bnrTq98X
	qnUg==
X-Gm-Message-State: AJaThX6TRN59WGNdBJ1rDeMbgAUUxKy+/QnVss9StW8Ajk9JSdJDRLaS
	JdiPpGunE0cHdhR65wJ7N70/xwui
X-Google-Smtp-Source: ABhQp+RMescvHu64K3S8slgo6hvEgaAAd0j0APJl0pFYQRRE6wNekI1InaYAp+f4B2VW3WQYGydFsQ==
X-Received: by 10.157.86.186 with SMTP id o55mr2358859oth.88.1509639007199;
	Thu, 02 Nov 2017 09:10:07 -0700 (PDT)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com.
	[209.85.218.52]) by smtp.gmail.com with ESMTPSA id
	r18sm1639049ote.81.2017.11.02.09.10.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Nov 2017 09:10:05 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f52.google.com with SMTP id v9so17804oif.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Nov 2017 09:10:05 -0700 (PDT)
X-Received: by 10.202.216.214 with SMTP id p205mr2179512oig.140.1509639005319; 
	Thu, 02 Nov 2017 09:10:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Thu, 2 Nov 2017 09:10:04 -0700 (PDT)
In-Reply-To: <e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
	<e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
Date: Thu, 2 Nov 2017 14:10:04 -0200
X-Gmail-Original-Message-ID: <CAP9ODKpwhAMfUwiSj4uJnt0yDbPXBe6LVK23v8UfMK-feJe-8A@mail.gmail.com>
Message-ID: <CAP9ODKpwhAMfUwiSj4uJnt0yDbPXBe6LVK23v8UfMK-feJe-8A@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 16:10:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 2, 2017 at 10:24 AM, Alexander Kanavin
<alexander.kanavin@linux.intel.com> wrote:
> On 11/02/2017 02:21 PM, Otavio Salvador wrote:
>>
>> On Thu, Nov 2, 2017 at 10:19 AM, Alexander Kanavin
>> <alexander.kanavin@linux.intel.com> wrote:
>>>
>>> On 11/02/2017 07:39 AM, Khem Raj wrote:
>>>
>>>> Changes since v2: Move to 1.1.18 release
>>>> -PV = "1.1.16+git${SRCPV}"
>>>> +PV = "1.1.18+git${SRCPV}"
>>>
>>>
>>>
>>> Can you drop this, and simply rename the recipe to musl_1.1.18.bb please?
>>
>>
>> Why? keeping it on _git makes sense to me.
>
>
> Only if it's a random development revision (e.g. 1.1.18 plus a bunch of
> commits) - if the version taken is a pristine tagged release, it should be
> indicated as such, regardless of whether it's taken from a tarball or a git
> checkout.

I agree partially; if it points to a tag it can be said in a comment
... using SRCPV for this kind of recipe makes sense as it allows for
easy tracking of the revision in use.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

