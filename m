Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA7E608BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 15:37:19 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id id13so234596vcb.32
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 08:37:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NyHzBkfXKMvcv0LCBDCL5vqBBNCuCWJrwTvOnkawlXI=;
	b=GE0yAfMD5Y18f9sYllln14n0btN4AhOfyZ27sDs4ypLEXBwwowb7T+09H1+O7MIrD2
	4QEMfVuj39I5kEYw5P9zG44vaSMtTS5Qk1zzMxynnJ3KO4X10+gI8A1Ske44bTefeptl
	AMMnTG6M7gJfQoef8UBCnqVM5xN9Jsl2CVb49KXePx7BYsGUinN6N6ebU/yCDVZpvRET
	S8l9TrfeOn/AoeQZMB9qEyqXleJqm97jX7/ZTUXdnZd9zROgzSfEIBNUtCZR5yeBvCRV
	IzVee2tBCuPnyg8Tv1/ZzDEdDBCGCuVXW0z5pqAX59xeqn4jh+h9AaM43EZBb9k2vPVz
	XqTg==
X-Gm-Message-State: ALoCoQkMAD8YKTnmJTbEh03LluYYnkgzZCZQW+tVoTD404qC+leldQVOy4/mVCfnxXyvQ6MCIkgX
X-Received: by 10.220.75.73 with SMTP id x9mr4381926vcj.38.1375976239809; Thu,
	08 Aug 2013 08:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 08:36:59 -0700 (PDT)
In-Reply-To: <6d45e79a28f0e03dd2d21cd1a2d0e2450736b56d.1375969277.git.cristiana.voicu@intel.com>
References: <cover.1375969277.git.cristiana.voicu@intel.com>
	<6d45e79a28f0e03dd2d21cd1a2d0e2450736b56d.1375969277.git.cristiana.voicu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 16:36:59 +0100
Message-ID: <CAJTo0LaUmkkAKesy2jo+X38Gighw0xWk0x_rbaKh3snjk5rPjQ@mail.gmail.com>
To: Cristiana Voicu <cristiana.voicu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/5] atk: upgrade to 2.9.3
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
X-List-Received-Date: Thu, 08 Aug 2013 15:37:19 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 14:46, Cristiana Voicu <cristiana.voicu@intel.com> wrote:
> Signed-off-by: Cristiana Voicu <cristiana.voicu@intel.com>
> ---
>  .../atk/{atk_2.8.0.bb => atk_2.9.3.bb}             |    4 ++--

ATK is GNOME, so 2.[odd] are development releases.  Drop this upgrade
from the series and see if there's a 2.8.x to upgrade to.

(also, the regex can be fixed, see Emelia's patch to stop alerts for
development GStreamer releases)

Ross

