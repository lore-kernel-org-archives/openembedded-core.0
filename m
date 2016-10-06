Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 283E160616
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2016 09:22:26 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id q192so9397387iod.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Oct 2016 02:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=f9VN6H9IqFBGKOoVEYimqobxLxPbgIIw7aoyrJmeamg=;
	b=Ulho5D9u9y8kJD7KEasLmqB9tmO1zG6AkXoMt+Urd2DsOFsP8rFl+9jwaOgcxi7GoG
	T1uDBLSOCnNH5OCkC7TXxHQjlYAS+iX0pUa5kBMrTAVKSNhSQwrNqLoPDQVom7MxqJTc
	AYzk2J4NPW77+Jd0hIMmDO+mUYBLy5I5ZMZ0maavRx/B0bbRGoTV9+tvL++W2ekuDLbz
	j5NZHBuMdQME3nX/uhLAchRZU73VQoyyyr8BDY5of3AThmb4wbPIYfV2Y9xWApNDWzZE
	vuoqX3P4/fAJJ4CQVDbYbxuU/8/HjM+UB8FNt/FNVG88Rf/rhUrgDF9rUxeDiWbH4r0V
	7vBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=f9VN6H9IqFBGKOoVEYimqobxLxPbgIIw7aoyrJmeamg=;
	b=N4CQ3GvSItC9pkPbo4ffX28bzbx24JIsTOq5K4Pw0ArXyPo9WHhdMvkkqdXKKdVm75
	dAEdI0YnKrUEUtC3H6kfqthZYi3p2701FFhBLlmNRDQljg4urwnd4Cir4xJtLnKSOe0V
	26qIFYF7b6CIW+v5vXS8A8VNyr+BO/HnL/U1mSNqBREjDX0iCo8cFe03T4o6keNXvhww
	0T7rO0kCkLfKTzvNRbODJgXqPRjCfDgqx+cjNO2MQY4E0MnyKu3OpJJRppn8TpqjaC4a
	j2TNn6FucKbL3ejJ/dy/eeei6koBusVRDvsOaoZ1ZaHmcqL4ECe2ORWcc3sO4cyC+Htt
	zLig==
X-Gm-Message-State: AA6/9RmrM59tFuMEOMRAItNgl4E5RLy7OsEjzy+AoGvxMzOG6MncRjAI6xUGNOZPt5NjS2VRWG2qh8QmGQ10OuH+
X-Received: by 10.107.138.15 with SMTP id m15mr14130791iod.127.1475745747665; 
	Thu, 06 Oct 2016 02:22:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 6 Oct 2016 02:22:07 -0700 (PDT)
In-Reply-To: <1475735370-22935-1-git-send-email-fan.xin@jp.fujitsu.com>
References: <1475735370-22935-1-git-send-email-fan.xin@jp.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Oct 2016 10:22:07 +0100
Message-ID: <CAJTo0La6k5GVtoHWUWvTnYcePMCSPLXGunkZvBoZVuP6YnJTLQ@mail.gmail.com>
To: Fan Xin <fan.xin@jp.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ltp: Upgrade 20160126 -> 20160920
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
X-List-Received-Date: Thu, 06 Oct 2016 09:22:27 -0000
Content-Type: multipart/alternative; boundary=001a113feb3c11904f053e2ed5c4

--001a113feb3c11904f053e2ed5c4
Content-Type: text/plain; charset=UTF-8

On 6 October 2016 at 07:29, Fan Xin <fan.xin@jp.fujitsu.com> wrote:

> 1. Upgrade from 20160126 to 20160920
>
> https://github.com/linux-test-project/ltp/releases/tag/20160920
>

We're close to the final 2.2 release so unless this is *critical* then it
won't be merged until 2.3 is open.


> 2. Delete the unnecessary patch files because the ltp source code has been
> changed.
>

Delete because they've all been merged upstream, or because they conflict
and you don't want to rebase?

The patches I looked at either had no or pending Upstream-Status, so I
can't trivially check that they have been submitted upstream and are now
redundant.

Ross

--001a113feb3c11904f053e2ed5c4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 6=
 October 2016 at 07:29, Fan Xin <span dir=3D"ltr">&lt;<a href=3D"mailto:fan=
.xin@jp.fujitsu.com" target=3D"_blank">fan.xin@jp.fujitsu.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div>1. Upgrade from 20160126 to=
 20160920<br>
<br>
<a href=3D"https://github.com/linux-test-project/ltp/releases/tag/20160920"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/linux-test-<wbr>pr=
oject/ltp/releases/tag/20160<wbr>920</a><br></div></blockquote><div><br></d=
iv><div>We&#39;re close to the final 2.2 release so unless this is *critica=
l* then it won&#39;t be merged until 2.3 is open.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex"><div>2. Delete the unnecessary patch files beca=
use the ltp source code has been changed.</div></blockquote></div><br>Delet=
e because they&#39;ve all been merged upstream, or because they conflict an=
d you don&#39;t want to rebase?</div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">The patches I looked at either had no or pending =
Upstream-Status, so I can&#39;t trivially check that they have been submitt=
ed upstream and are now redundant.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div>

--001a113feb3c11904f053e2ed5c4--
