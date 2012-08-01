Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwarD-0001U9-9X
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:29:07 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:17:27 -0700
Received: by obbuo19 with SMTP id uo19so10591494obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=leipIzEZAI2CW1JaN5L15MpKCHG3NXVcJew+5MNsE6U=;
	b=JWGmFM/viyO0TZYTSJln+GuTcMoDRx+Kh+5npkVdI1YQsH1NOI/m6Ibk0uiXliiJwr
	WnmXCWaAcrksIibXG06DfDCHUqftXry59x0mwe5PWE7g3UrD8PhrfzUPodNpO8TDoGkE
	qAgjSZXqngfo0WtJg/r5ZROQZPA3JAfMpabUVVhRVCOUTTuVWg5iXT2dFoYcKOWPFWhA
	G7sazd1nfYGZT97AGK//vkZdpmJGg4d+AS9jFc8X5dt2iZUiCUnMKuWSMC7aUpdBx31x
	zu4uw9HIAWkjizHgPTNXhQkCJyjqQKdAqUCsGH9S/Ixfco3U1n0Zdf4tVNDNoVzlEgsl
	q6bA==
Received: by 10.182.207.39 with SMTP id lt7mr29936161obc.67.1343834246877;
	Wed, 01 Aug 2012 08:17:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 08:17:06 -0700 (PDT)
In-Reply-To: <6D85FA88-63A9-4673-B10A-CCF4063407D0@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAJTo0LbVvVqDSPpUs36JTROeq6fWendJwaVQDataN_nD6O=+Ew@mail.gmail.com>
	<17FC0BB5-80B8-4AB8-A3E8-57261EB7D561@dominion.thruhere.net>
	<CAJTo0LaJ9mM_yyU+ZYoDACig5E30qBaPU+Y5BDTrrA1bOdK78A@mail.gmail.com>
	<6D85FA88-63A9-4673-B10A-CCF4063407D0@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 16:17:06 +0100
Message-ID: <CAJTo0LbwhsTKL+A0SbQTn8K4kwNmZx5z+V2qdD_u8RS8ubhJaw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlvMjilniqWRV0UWkgdrC/la8u/NC8NU67YepjldzAffjaymD2KkHXmL7O60a72Krz/tIP/
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 15:29:07 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2012 15:54, Koen Kooi <koen@dominion.thruhere.net> wrote:
> That won't work with debian renaming and shlib will pick up both anyway. You can only have one libegl.so *ever* during the build.

In Debian the packages are renamed libgles2-mesa, and so on...

Ross


