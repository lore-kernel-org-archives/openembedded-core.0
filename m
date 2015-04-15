Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9ECDF6AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:29:09 +0000 (UTC)
Received: by qkgx75 with SMTP id x75so65468418qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 01:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=ymYDgR4//em/tm16PN3TP+Oq/GcAw7gFGAo92D5KH3I=;
	b=KVbB2LgEmiTzA+nMVsI4a3BXalJrfXaYWVRxRyUwtO1m5RC556+sC7TtVqHceMqb9J
	THWapBbJM8fHrrG4h0eqPJoBLX5fACsRnHEm6Jccowhn0nxLsmbRjpoqg/XSnZbXfSRV
	F8NVVryh5WLahnngloct7IfyuOieXGzjCcfEKtnzzMnPjMxEIVDq3tSz8IT9tLR1ZCmN
	0B1ISYXVZRNJPSL6jhe/XQhglYN3dcaQhg1zX7LGLA6T57TzQuy7wQ8bi4zG6bLLfHeD
	k6pkAhTyJbKy8wyJhA9PzksKGSn1K6NrK8TjLCyK+rG5hCsySKY+3yNjilStlyZ47S2O
	nyeA==
X-Gm-Message-State: ALoCoQlAW4hq1Musy+XSbUtWJPVl/OHoGYBlhYwYfBeshLqGQ/rVDFaOkU+Bki6Fz0F3Na/vaOPI
X-Received: by 10.182.80.103 with SMTP id q7mr19668142obx.18.1429086538376;
	Wed, 15 Apr 2015 01:28:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.177.67 with HTTP; Wed, 15 Apr 2015 01:28:27 -0700 (PDT)
In-Reply-To: <552DC27E.3060804@windriver.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Wed, 15 Apr 2015 11:28:27 +0300
Message-ID: <CAHiDW_EWoEuXsQ3PLBpOpfj1h3bRrRD1PbMUchUbxk8qxiqgBw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 08:29:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 15 April 2015 at 04:44, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 04/14/2015 09:52 PM, Burton, Ross wrote:
>> On 14 April 2015 at 14:50, Andreas M=C3=BCller <schnitzeltony@googlemail=
.com
>> <mailto:schnitzeltony@googlemail.com>> wrote:
>>
>>     from the error I would DEPEND on virtual/egl
>>
>> Agreed.  And there's no dependency on virtual/libx11 which the readme yo=
u
>> quote
>
> virtual/mesa or virtual/egl depends on virtual/libx11, so I didn't add
> virtual/libx11, I updated virtual/mesa -> virtual/egl in the repo.

That looks correct to me, thanks for fixing.

As a learning exercise, what would have been the correct (and least
destructive) way for me to test that I hadn't forgotten a dependency
like this? I assume the problem is that I already had the correct
headers and pkg-config files in the staging sysroot?

Jussi

