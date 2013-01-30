Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0Ze3-0004G2-VN
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Jan 2013 16:32:16 +0100
Received: from mail-qc0-f198.google.com ([209.85.216.198])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 30 Jan 2013 07:16:32 -0800
Received: by mail-qc0-f198.google.com with SMTP id l35so2119876qco.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2013 07:16:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=8bldVPq4Z5Nb6gFG1URdmkeF1rD4caRzyw84Tl/LHQ8=;
	b=prWD+sDWnCVmYBNdLA/BHii5IOoLqQWedqduVxvt7f5WWZ+it6Bu06xiso7JMtFLJ7
	VcnJ64QVvrqSfgfeqHFzwoHOczRr1swBQe5u9evJV8nNpg3F5o9+tIfcV6FiVbY/S8Ai
	OonOH/GoAOoNCjIxXHfd4yA2kGrtzMQ5FdTzMi2zLhK3WNG2a8wuMKywdSQaimKCUaFp
	4bQjHwhqjzlUy4Md0W75RqoflLdhr17zQV61ZqlhzJt9xIir2DNWosyDTLZ/WRjUNVLx
	vsEKMDvDFfwlTuvlcUSQDxNW7AuOGmzC1P18KiSPUx57r8ttYLS7E8/CkKHCFv4mCF0H
	yCgQ==
X-Received: by 10.52.178.105 with SMTP id cx9mr4541553vdc.31.1359558990429;
	Wed, 30 Jan 2013 07:16:30 -0800 (PST)
X-Received: by 10.52.178.105 with SMTP id cx9mr4541547vdc.31.1359558990328;
	Wed, 30 Jan 2013 07:16:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.205.236 with HTTP; Wed, 30 Jan 2013 07:16:10 -0800 (PST)
In-Reply-To: <1359552371-27121-1-git-send-email-igeiser@devonit.com>
References: <1359552371-27121-1-git-send-email-igeiser@devonit.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 30 Jan 2013 15:16:10 +0000
Message-ID: <CAJTo0LbOKe5KhJyKZYPiOkEZdcGM=NJVOsgt8cc_TkqykU99sA@mail.gmail.com>
To: igeiser@devonit.com
X-Gm-Message-State: ALoCoQlfG+CZtKlJT0Ymxyq2+KUq4o6glzJF9yh70wZBGSjPTObiFvYRInVlNi9dI0PjaMVQRq2FBjtA6PRHQrcrZWzKGGAbq+YTMt14xTNaEQeTGDmOQxJFOqL/Ho7j4G48zgPi+CWmYbgX8G9vHeCWmNX/Ti0vEDCgr84q/8nJTmmUSJo9xSKZyeEl71IWDMsq5PjbsNhJ
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa-dri: add extra dri drivers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2013 15:32:16 -0000
Content-Type: text/plain; charset=UTF-8

On 30 January 2013 13:26,  <igeiser@devonit.com> wrote:
> On x86 the ATI and NVidia drm drivers are valid to build.
> Currently there are _append_x86 and _append_x64 lines that
> explicitly add i915 and i965.  For consistency I think that
> the ATI and NVidia drm driver should be added. In classic
> these were tunable via the machine configuration files. I
> would argue we should go back to that so we should make
> the DRIDRIVERS field something that can be defined there.
>
> * Made the DRIDRIVERS field overridable.
> * Add ATI and NVidia DRI drivers to the build list for
>   x86 and x86_64.

I'm not sure why we need to make this machine-tunable - we currently
build all drivers in libdrm (but split them between packages), so why
not just enable all working DRI drivers in Mesa and split them between
packages.

Machine configurations can pull in specific driver packages (or all of
them) without making Mesa itself machine-specific.

Can you send a V2 without the conditional assignment (unless you have
an argument for keeping it), with a commit message that just describes
the patch.

Ross


