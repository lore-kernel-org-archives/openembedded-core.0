Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 39CF06A478
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 16:35:35 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id w16so1413424vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2013 09:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LXknIUPC+rcLqHYZY6wuqWxJaPXVkG/T7y/BxRxxHEw=;
	b=I3m5o9IqdW2kmpJKVfKMDlMSJv31vKKwFswBVzLB/Qbng21gSviJ0k0/pKzsU4GF3V
	abJ/jo7V5V38H3NLbGt05ec+FHCb9XPFerTsmN+Tyvkw0HTAT7wQNSHBlkrNpCHDt6qv
	/JQbMonsqJklw1wkj/bveDr3fMTxgCeMk6/RCaBmhwF9qBsK4veHuOIi+OpcGzXj2uFa
	np5PV2Hk7Bewt4OOe11QXveqnQFrV1JH+mknYHVQlKnPKHa7r8/kuh8WKNR0x/6wz1qh
	FkB1WTgRip7rU5XKiwp1cHPtQpUXvfDSP5OjDMkfaCApb+dnRW86npFO/hcioKyRqATg
	D2wA==
X-Received: by 10.59.3.198 with SMTP id by6mr3058241ved.39.1369240536079; Wed,
	22 May 2013 09:35:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Wed, 22 May 2013 09:35:15 -0700 (PDT)
In-Reply-To: <CAJTo0LawHFMUtJHzYGqyCzHA8sJhwC4x9xF1PwSUkZ4AB34j0Q@mail.gmail.com>
References: <1369187256-31043-1-git-send-email-net147@gmail.com>
	<CAJTo0LawHFMUtJHzYGqyCzHA8sJhwC4x9xF1PwSUkZ4AB34j0Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 May 2013 17:35:15 +0100
Message-ID: <CAJTo0LZwX4BQ9-2ogAg=DkFbT48m+d3Wkoq7FKmWJsvc9BprCw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQm/o7yhS3FXKdVfZri4xFZPZMjovrxSvWYYW2L26oL1Fucu37vkNPi594j+hIJ1Zu7K5um3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3] base-files: add /run directory from FHS 3 draft specification
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
X-List-Received-Date: Wed, 22 May 2013 16:35:35 -0000
Content-Type: text/plain; charset=UTF-8

On 22 May 2013 17:33, Burton, Ross <ross.burton@intel.com> wrote:
> On 22 May 2013 02:47, Jonathan Liu <net147@gmail.com> wrote:
>> This adds the /run directory from the Filesystem Hierarchy Standard 3.0
>> Draft [1] and refactors the filesystem as follows:

Oh, and have you tested the migration path, i.e. from a current master
image, upgrade to a feed built with this patch in?

Ross

