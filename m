Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UQb62-0002Fs-2A
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 12:20:47 +0200
Received: by mail-ve0-f172.google.com with SMTP id oz10so2300612veb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 03:03:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=9eAXwuu5h6B5IyaWG1XmI5nCIUHM0oBbe0PuOMYKiRw=;
	b=f3ci0EndjbUASVqNynHnctLqmzPAn8PlS0ffEbW982nGnyMRIiD+K5UT8P8H+75qgV
	Y7U81LYdq0sP9+lDeUqSc5VIF7L+zQhl5+gO4IFG3++WPL1xxoJs9PpvpLgof9SmpQUZ
	5+dTPGD5JQCXhVGRG45f2ij8N9/iR7+N2KgqtgCHK7qbn/UVsDpoUjU7PXImR0VjaxqG
	sZL5Aw9C7Mq1mBBPHTYAEIcalt42QvOToKFYzm6HLxhB9UTYJWyoFfpkk3BNNCUURQhy
	LA13nkF/fp/7ugIodoqELnIOYRMy7YeCYcKB4GCxIBfVuAM+VGI1Kp4uLK7xJ2YsKW+M
	NmLA==
X-Received: by 10.52.23.115 with SMTP id l19mr6763724vdf.55.1365760997473;
	Fri, 12 Apr 2013 03:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Fri, 12 Apr 2013 03:02:57 -0700 (PDT)
In-Reply-To: <CAJTo0Lb0GK3+TBpsytc=-atsz6DYo3Obw_Ezz4c9qpUHcwpdcg@mail.gmail.com>
References: <51675A40.6080600@intel.com>
	<CAJTo0Lb0GK3+TBpsytc=-atsz6DYo3Obw_Ezz4c9qpUHcwpdcg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 12 Apr 2013 11:02:57 +0100
Message-ID: <CAJTo0Lb1G6XTUMdXFsiEo9dgvbyTj-h1F+1FJ4sB83va2frfHQ@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
X-Gm-Message-State: ALoCoQn3D71LXBNp6CxJFWQpD2ZLnkOFFkpNH6HC2v7QyH7Cu5VnFoBvtypxM/zp5C6nJaDDMMRO
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Master under test with gcc-4.8
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
X-List-Received-Date: Fri, 12 Apr 2013 10:20:48 -0000
Content-Type: text/plain; charset=UTF-8

On 12 April 2013 10:18, Burton, Ross <ross.burton@intel.com> wrote:
> On 12 April 2013 01:50, Saul Wold <saul.wold@intel.com> wrote:
>> I have seen a couple of failures with an initial build in xmodmap and
>> matchbox-panel (when building a sato image for x86).
>
> xmodmap is probably fixed by integrating this commit upstream:
>
> http://cgit.freedesktop.org/xorg/app/xmodmap/commit/?id=42f99a7a7b836f6f9704a7b1747eb722c93446ec

Patch sent to oe-core.

Ross


