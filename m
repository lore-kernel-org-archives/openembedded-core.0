Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E15FE6011F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:48:03 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 77so262396603ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=RFaW5jc9bTz2tfUWGkztAIrVuqhdUxeqt+8WXancXXI=;
	b=etzT+flogwREQ6ElBahFOo2HmSIgM0jrvrX/0Z6Uw1G7UNmsaa5np7PvgAMRCoi/Oh
	0Rai/U+U9q9tJ3SVx3eMAK8j84rATECnNde84jA38Iy9aF9tFXB84LOUd4efn7jJWes8
	WDYi/36LRoYWp6qvIguRYT/4k/Vsqz5XIJ3DSzP9tJRz6iMbPpA33jIJrnfo6a8liDWg
	kq4fAdJuTwxyjIHhjugw7+xyamtYq+u+hH9ULQSNpCs3IDvOpnCfeP4todr98DNLdnxa
	jCQNAMFp7y48dGX/QK0AVE/8r2+k/BRZJDgrU/0A2yVsIw9/CBMuwcVfeevs8MOfHQxv
	U7Vg==
X-Received: by 10.107.34.79 with SMTP id i76mr52352696ioi.195.1452275284171;
	Fri, 08 Jan 2016 09:48:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 8 Jan 2016 09:47:34 -0800 (PST)
In-Reply-To: <CAJTo0La3v=55Kf=kd2N34g836tAzeieffFOX7c81=yudby=VWw@mail.gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0La=m_u33L7z06GssdbQoQ0bAFpTweaUchU_kVDfOgnNwQ@mail.gmail.com>
	<CAJTo0La3v=55Kf=kd2N34g836tAzeieffFOX7c81=yudby=VWw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Jan 2016 09:47:34 -0800
Message-ID: <CAMKF1sr8aqcB7=hF1D0ENejatX6W9piXgyzqKTtMCJZNTs-Sdg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Fri, 08 Jan 2016 17:48:04 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 8, 2016 at 6:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 8 January 2016 at 14:00, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> systemd fails with this error, over and over:
>>
>> |
>> /data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/src/basic/util.h:96:70:
>> error: unknown type name 'comparison_fn_t'
>> |  static inline void qsort_safe(void *base, size_t nmemb, size_t size,
>> comparison_fn_t compar) {
>
>
> I've just remembered about meta-musl so this is likely fixed there but I'm
> also seeing this when building systemd:
>
> |
> /data/poky-master/tmp/work/i586-poky-linux-musl/systemd/1_228+gitAUTOINC+dd050decb6-r0/git/src/basic/missing.h:590:6:
> error: #error "neither secure_getenv nor __secure_getenv are available"
>
> Now I'll disable systemd verify it all works with sysvinit.

yes systemd is not supported yet as I describe in prior email. I have
patches to build it though but I dont want us to have it unless it
works

>
> Ross

