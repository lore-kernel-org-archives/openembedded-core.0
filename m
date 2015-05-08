Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id DA62460138
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 14:44:48 +0000 (UTC)
Received: by lagv1 with SMTP id v1so54256065lag.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 07:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=yAqIQiyLdasJ+bVJJeYgt6q6aFWmKtAWGV5vSolQGrA=;
	b=0hklGiqGydHcrd5cyGeRqwUdR6SSFyFHT7db5WZZI9Vq2F+oOzCKUlYrpRt0ZyYZf6
	cAtZPoDgB+kHDqlxoD7S+Gy3eWcRfi2AEqa+EVU+Kf/1USKELYPwGiX347Ps32Tb5HEu
	iCmdoLhjE5eRnGWP9gETAHDQZXy7kimfMjbM/7SBGosrhLN8r9bEcsURO6BgMMdAqJOG
	EQcRfe1bO4qDzueAxTfczpRQlSz5Nhz9YmZ4WWNGmMxAhjsxVIo2Kq1/5H3gScI59MaT
	tXktAcqxhNIFggXZWaTnbfcZaJQS064+Vl6QxZsMYusWoVsYvG+jhi5ml7JNTiJrMJlN
	Juvw==
X-Received: by 10.153.4.135 with SMTP id ce7mr3174928lad.44.1431096288838;
	Fri, 08 May 2015 07:44:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.27.15 with HTTP; Fri, 8 May 2015 07:44:28 -0700 (PDT)
In-Reply-To: <CAJTo0LZuKZnX8Qv-g-2X=inu4t7rU8sQvV5NGutRo19nwEuVMw@mail.gmail.com>
References: <1431085154-22103-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LZuKZnX8Qv-g-2X=inu4t7rU8sQvV5NGutRo19nwEuVMw@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 8 May 2015 16:44:28 +0200
Message-ID: <CAPybu_0epZ+jJQ_0kmMrOEeeEWm+VY0h87-wWi2xkY4=bOYjCg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: Make tests selectable via variable
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
X-List-Received-Date: Fri, 08 May 2015 14:44:55 -0000
Content-Type: text/plain; charset=UTF-8

Hello Ross

On Fri, May 8, 2015 at 3:47 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 May 2015 at 12:39, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> wrote:
>>
>>  GSTREAMER_1_DEBUG ?= "--disable-debug"
>> +GSTREAMER_1_CHECK ?= "--disable-check"
>>  EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
>> -                --disable-dependency-tracking --disable-check \
>> +                --disable-dependency-tracking ${GSTREAMER_1_CHECK} \
>
>
> Seems like a PACKAGECONFIG is a neater solution, can you use that and also
> change _DEBUG to use PACKAGECONFIG too?

sure, give me a sec :)

>
> Ross



-- 
Ricardo Ribalda

