Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz5Gl-0002sk-VY
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 14:21:48 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 05:10:00 -0700
Received: by obbuo19 with SMTP id uo19so910970obb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 05:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=LjgqUM2gUEGptIjnLfJS0ScAtvAVQoKAhAYm06JCzsY=;
	b=N0ofBjTNlBAQpUuEZboycyeOTD2LX/yEZeSIQNRsU8J8JE+THLi8Wb5XfeQI2prOGU
	+xaLG6XBy8L9+1cK2k8r0/n3TQx4KTbm8DFD73YFldI9mmpwCptvhFqfOR9gKRF2AbzP
	Ng0HzObr3I9PoGVOBwaI8etHowI/hUHNgw1GRdaj21aV6Hk0LwDVLwxNfeqHRh5Fa0EH
	L18G/TJOI+BMYNQ+u1Z1TvGCxkvbUOODiLw5x8yPeNcVtqICJhWPpI7oj/cjPjUMtqVv
	AVE926s9TINMOJQ7eu1R38KRcdhTvDfd+oRl3007VLTVsLyNr7tVSBH+vlrU01teKU+h
	t95Q==
Received: by 10.60.22.5 with SMTP id z5mr29719645oee.2.1344427799012; Wed, 08
	Aug 2012 05:09:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 05:09:38 -0700 (PDT)
In-Reply-To: <1344418236.23275.219.camel@phil-desktop>
References: <CAJTo0Lb2jyRgUxqKE_ggZDwGr9FQuHig8rnQsYZTghdMXUpKhw@mail.gmail.com>
	<1344418236.23275.219.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 13:09:38 +0100
Message-ID: <CAJTo0La+0sDd00LS2n=3qJ7xgmaa0csFv-jaTz5jvevHrtceVA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmCdHiaxTociWbLt99hvf75hqhymwb3XMuxQhWiFY8B/U3ZETdQbWZ2uBbbvON7XOk9Avw0
Subject: Re: Configurable host name
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
X-List-Received-Date: Wed, 08 Aug 2012 12:21:48 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2012 10:30, Phil Blundell <philb@gnu.org> wrote:
> hostname_pn-base-files = "my-distro-rocks"

Aha.  I was looking at the hostname variable in there and wondering if
it could be overridden.  That satisfies my itch for now, considering
the drawback of causing everything to rebuild if a global variable
were changed.

Thanks,
Ross


