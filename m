Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f169.google.com (mail-yk0-f169.google.com
	[209.85.160.169])
	by mail.openembedded.org (Postfix) with ESMTP id B268065F0F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 23:06:26 +0000 (UTC)
Received: by mail-yk0-f169.google.com with SMTP id 131so3264057ykp.28
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 16:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=uV24bmKoV26H9xd0sGu5KLD2n2d8lpcziOv9piu3eMc=;
	b=RPzsbLvU8TtfyPVbXXn6uOV26t8cwwRBoMRV8KavE/DSbxCmOWJNt2oPyMH+IPb0Sj
	3vwgj19ZFk0jpjKdSKwOtQvBjgbRhLPCDKSA7uENtk2X63rOjzveF1oPx8wgJzUnPpW9
	kQcHbvqSkiolb0zWBeBOJpNWQeNnvK1QH8AxiLOkvlJtJmYiLVVGYmDwPImDTzKpxVHM
	9mz1mTl6eM1NPRXYvHiLC9j2iB987maHxbQXGH/SAH0YT8ad7rFgkcCajgmmRjPnfseH
	tGYh3irfoZU+7B8g1UioXilxDVlJoTGUGJGyRCqjtuDSF0fBoWTYeXfACr22+YJiPVq0
	uAQw==
MIME-Version: 1.0
X-Received: by 10.236.223.229 with SMTP id v95mr27867036yhp.128.1406329587359; 
	Fri, 25 Jul 2014 16:06:27 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Fri, 25 Jul 2014 16:06:27 -0700 (PDT)
In-Reply-To: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
References: <1406326845-17506-1-git-send-email-gary.robertson@linaro.org>
Date: Fri, 25 Jul 2014 20:06:27 -0300
X-Google-Sender-Auth: _zYH8HHoD3rRkkHYL6jyUSLQF8w
Message-ID: <CAP9ODKrEFg31WOHO3GyY-sQf2x5i24yLp5CNa3bxSp6H74YarQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Gary S. Robertson" <gary.robertson@linaro.org>
Cc: mike.holmes@linaro.org, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] LTP: Realtime test fixes
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
X-List-Received-Date: Fri, 25 Jul 2014 23:06:36 -0000
Content-Type: text/plain; charset=UTF-8

Hello Gary,

On Fri, Jul 25, 2014 at 7:20 PM, Gary S. Robertson
<gary.robertson@linaro.org> wrote:
> The following series of patches addresses several bugs which were preventing
> some of the LTP realtime tests from running or completing in our OE-based
> test environments.  The patches themselves are being separately submitted
> to the upstream LTP maintainers for consideration, and are offered here
> in hopes of addressing these issues in the OE LTP package until such time
> as they can be obtained from a subsequent upstream LTP release.

Please prepare a v2 including the Upstream-Status[1] field in the inner patches.

1. http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Headers_and_Commit_Messages

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

