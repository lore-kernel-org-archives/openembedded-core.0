Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id 377E565D59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 15:26:56 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id m8so4386913obr.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 08:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=JZzPSloiQNGK7mP8eznF+hgB0W2GZpScucZm074IiXs=;
	b=yIeS0yL4JaNWFjp2VzM9EoFyUSaigdWExZJbw7O6GuNHGyRvlzmKda/Tg+J6Spyooc
	15PJK3DGNLUdp0GKebxzVL9Pu3ZRveqoSLSPAr6p4nvSjGaUTvgOk6yw5PNCQnaqPOWv
	bbZKUs4XsHmm20DaXr0am+XfA3Xo94pvIkYRL3QqQh185c9w41sEkdyMB2UPsvPttOnT
	SZTKQbCNXugHFgfZ8kd+MqHkVxg/cohTYk+UbQUWJ7v0JRHED0YHlYKsVB27X8SDmw3z
	8YeYEWwE83Zph4UnbnHnbVliVHvqgXYYD/L6WsrXPDzEsFZgKHnkrg0HMNxhZ2TCWwXO
	eN/w==
MIME-Version: 1.0
X-Received: by 10.202.104.85 with SMTP id d82mr3922215oic.4.1414682817097;
	Thu, 30 Oct 2014 08:26:57 -0700 (PDT)
Received: by 10.202.67.84 with HTTP; Thu, 30 Oct 2014 08:26:57 -0700 (PDT)
In-Reply-To: <CAJTo0LaLRhRASrwdHQboWYjbsGzBmCZgq4J1Qv_i5KDo17ZhVQ@mail.gmail.com>
References: <1414508747-4688-1-git-send-email-gary@mlbassoc.com>
	<CAJTo0LaLRhRASrwdHQboWYjbsGzBmCZgq4J1Qv_i5KDo17ZhVQ@mail.gmail.com>
Date: Thu, 30 Oct 2014 16:26:57 +0100
Message-ID: <CALbNGRTQQTza3PftOobxDqMvJUGwsGKRAcRX49CXtzUeTOcSzQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-pygtk: Restore pkg-config file
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
X-List-Received-Date: Thu, 30 Oct 2014 15:26:58 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 30, 2014 at 1:57 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 28 October 2014 15:05, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>> Some previous version of this recipe was errantly removing the
>> pygtk-2.0.pc
>> (pkg-config) file.  This is needed for other packages to be able to build
>> against this library.
>
>
> It's deleting the code generator too.  This entire recipe gives me the
> heebie-jeebies...
>
> Ross
>
I have a similar patch in for very long time [1]. At the time of
creation I ran several tests without suspicious results. The whole
'dirty fix #1' can go.

Andreas

[1] https://gitorious.org/schnitzeltony-oe-meta/oe-core/commit/dedf83428f297e9461f5c88c32c78192fa96585e

