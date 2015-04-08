Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id CAA2B60089
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 15:06:49 +0000 (UTC)
Received: by igblo3 with SMTP id lo3so40787383igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=hTtiXiSU0i3p/ECsqrt9SL/qBb2TSW/CrY8HIR7kZ9w=;
	b=bC6UgXZrdiXPeBxuov2SIhPS0urWMV2KoiuWOU2ZESUfwDx0nMgMd/tAd0ivfG4E9V
	RQ27rlh/xjT0kWfUidm5a0UKJVsTKMVeeiulEL3DEg17nIITQA8qCXGDz126qlLsdEGf
	kRgXx91NQTXEpxcERxUPBHVjLkrjJ9etqMNIFZVa2yy0h7W5AhcX1Votg+I4adbWNyRZ
	Aq9MyFxtYmroR58hRd/uzGEmIXm61dQrzSmA7fJZKxk4ueAts+vg/kP1gWYGKNlJxjfj
	CB97VgJuTwlyTTq7jYvBaXRVSr2W7AaA88hcnw5j8olI+3nP0l7/gS6pdEGHYKNx8EUJ
	I9DA==
MIME-Version: 1.0
X-Received: by 10.50.35.195 with SMTP id k3mr12703383igj.11.1428505610253;
	Wed, 08 Apr 2015 08:06:50 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.23.6 with HTTP; Wed, 8 Apr 2015 08:06:50 -0700 (PDT)
In-Reply-To: <1428504230941.43152@caviumnetworks.com>
References: <1428500004-9535-1-git-send-email-jagadeesh.krishnanjanappa@caviumnetworks.com>
	<20150408134320.GB8848@ad.chargestorm.se>
	<1428504230941.43152@caviumnetworks.com>
Date: Wed, 8 Apr 2015 12:06:50 -0300
X-Google-Sender-Auth: PpVGxCY_eWkMRrq9ioswm_UK6tI
Message-ID: <CAP9ODKoiPAA5BYjUBwsQKDJPgfhuoUCWHyjNNyQ-fLfio-4yxA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Krishnanjanappa, Jagadeesh" <Jagadeesh.Krishnanjanappa@caviumnetworks.com>
Cc: Anders Darander <anders@chargestorm.se>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dpkg: add triplet entry to fix build error for armeb
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
X-List-Received-Date: Wed, 08 Apr 2015 15:06:49 -0000
Content-Type: text/plain; charset=UTF-8

Hello Jagadeesh,

On Wed, Apr 8, 2015 at 11:43 AM, Krishnanjanappa, Jagadeesh
<Jagadeesh.Krishnanjanappa@caviumnetworks.com> wrote:
>>Drop INC_PR from this patch.
>>There's no INC_PR in the .inc file, and besides that, we're not touching
>>PR at all, unless we're really forced to.
>
> Yes, there is no INC_PR defined in dpkg.inc file.
> The intention was if anyone wants to update dpkg.inc file in future, they
> can define INC_PR in dpkg.inc file and then the updated INC_PR value
> will be reflected in recipe file. I felt this would help to track changes in
> dpkg application build.

The reason why Anders asked for the removal is that we do not use
manual bumping of PR to track most changes in recipes (there are some
rare cases it is needed) but the PR Service[1] which works in a much
more reliable way for end user.

1. https://wiki.yoctoproject.org/wiki/PR_Service

> However, I have sent Patch v2 with INC_PR, PR removed.

Thanks for your prompt act on this.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

