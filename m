Return-Path: <psidhu@gateworks.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 95ACA75E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 20:21:40 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so45770434wic.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 13:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/rLrjiuK52WqqmVcUSMTS2qYEVtpy3NPhWthZY0p75k=;
	b=ZLtPLsFv1e1FNAzcQv0vHls1+pLo5DArWSvfzW4nei+qAU88mthODyn6BvqZeKNC6b
	UwU95EdSCj+s+esDAALikOEuhQquQorqRrZxLiiQuup4j6GekDPX/+5/QM0pA8UCyw++
	4ULBUABqtjno6C8ILTtjMktyDvhzx6eUsGT5zFKGqfNWRB4z2gUZDEfQCI+0UJQj7x6u
	FgYWOzFZ/27vuyMvjDl6K6wy1WgF0rbNF4MjD42ZaogwvI8UIPgtCtnk9bEkGCFPr5Ab
	ObA9GB3bN/f/Nw/Kj4AUjjENLFl5hkDb9+Hv5wI4WbnTuXMQLsuw4XZheUS3UHHJ/bLU
	bMwg==
X-Gm-Message-State: ALoCoQm/wNooVqiRk0lKgNc43McT0MWaigYpYFW8r9CQLpgVNjnW0uGjQWic4gwiwI7EyzNIyGgr
X-Received: by 10.181.13.48 with SMTP id ev16mr6356102wid.40.1445631700463;
	Fri, 23 Oct 2015 13:21:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.112.167 with HTTP; Fri, 23 Oct 2015 13:21:10 -0700 (PDT)
In-Reply-To: <CAJTo0LYKycvgn4p3J88fjbWgc6Dh24q6dt9MJTr64e8LDByFyQ@mail.gmail.com>
References: <1445620987-11004-1-git-send-email-psidhu@gateworks.com>
	<CAJTo0LYKycvgn4p3J88fjbWgc6Dh24q6dt9MJTr64e8LDByFyQ@mail.gmail.com>
From: Pushpal Sidhu <psidhu@gateworks.com>
Date: Fri, 23 Oct 2015 13:21:10 -0700
Message-ID: <CAD1M063TPymcvdfn_qn+Ze+PFGs83D-q+0u=UuRPnf3vDcB+fQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Alexander Kanavin <alexander.kanavin@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: Add upstream patch to fix build problem
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
X-List-Received-Date: Fri, 23 Oct 2015 20:21:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 23, 2015 at 1:15 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 23 October 2015 at 18:23, Pushpal Sidhu <psidhu@gateworks.com> wrote:
>>
>> +From 6ea42d4fa6f3f6dd18c37cb7b6e1faea6afefba4 Mon Sep 17 00:00:00 2001
>> +From: "clopez@igalia.com" <clopez@igalia.com>
>> +Date: Tue, 15 Sep 2015 21:50:18 +0000
>> +Subject: [PATCH] [GTK] Build failure with ACCELERATED_2D_CANVAS when
>> cairo-gl has
>> + built with OpenGLESv2 support only.
>> + https://bugs.webkit.org/show_bug.cgi?id=149172
>> +
>> +Reviewed by Martin Robinson.
>> +
>> +No new tests, no behavior change.
>> +
>> +* platform/graphics/glx/GLContextGLX.cpp:
>> +(WebCore::GLContextGLX::cairoDevice):
>> +
>> +git-svn-id: http://svn.webkit.org/repository/webkit/trunk@189826
>> 268f45cc-cd09-0410-ab3c-d52691b4dbfc
>> +---
>
>
> No Upstream-Status or Signed-off-by tags, and please explain at least a
> little bit what the problem is in the commit message.
>
> Ross

The patch is from a git format-patch, so the original commiter didn't
do a sign-off. However, because I backported this patch, I supposed I
can add my own name and extend the original patch's commit message to
include Upstream-Status and add info on the problem. Will that work
for you?

- Pushpal

