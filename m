Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f172.google.com (mail-ve0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id 39181608A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:52:28 +0000 (UTC)
Received: by mail-ve0-f172.google.com with SMTP id oz10so1660513veb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 08:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5KmKZzwi5k4xBvZFuSIA9jr65ooiy+vWPFJi5YVgTCI=;
	b=SexSOuIF/XOSuWR7oeHVSYpttNoS2SJbQ9rwtISj57z9kkYidbwsdgiSNyCoGMJMu3
	r36y0kt00nTCCzLEDfDF2SP9IROxbN7JPctzftYAKRZveszUwgIwNAfvLcbLwIuRVqMm
	hWqOqm5OoINGJPtjZKFr39KbcWryRH215rdY1dshz6rMrITMhJvE3/bBze3WMSCmBjM6
	yj2NxnsBfZcan5BUl9Megw6Ynx85fGMsrxRC+6nYokRHWyKkb3XIGkkWpAdc63lKfoHR
	zzZsitxh2aF2NHKFJahBqoH8OWSwDbmHRpG0qiAqIK2DJL0QKHTIV2ytu7sof3sbBK7Y
	Tpww==
X-Gm-Message-State: ALoCoQlmWEtSc28OD2gmuML7YeXqVTCGX+u4r3jqGuf9bNosaahKBZvvK3mEvdtCwB08yikdmA1p
X-Received: by 10.220.237.208 with SMTP id kp16mr12030241vcb.4.1377186748785; 
	Thu, 22 Aug 2013 08:52:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 22 Aug 2013 08:52:08 -0700 (PDT)
In-Reply-To: <c3d72ead7aeef67db0792738b194891ae8ed3871.1377014441.git.cristian.iorga@intel.com>
References: <cover.1377014441.git.cristian.iorga@intel.com>
	<c3d72ead7aeef67db0792738b194891ae8ed3871.1377014441.git.cristian.iorga@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Aug 2013 16:52:08 +0100
Message-ID: <CAJTo0LaXbDi7BXYsscN1D=LFJH1LcZNnHCs7aiFo-SiKi45Pag@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] Build Appliance: pcmanfm integration
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
X-List-Received-Date: Thu, 22 Aug 2013 15:52:29 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2013 17:05, Cristian Iorga <cristian.iorga@intel.com> wrote:
> +    xprop \

As discussed on Jabber, this should be a rdepends of xdg-utils.

Ross

