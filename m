Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f41.google.com (mail-vb0-f41.google.com
	[209.85.212.41])
	by mail.openembedded.org (Postfix) with ESMTP id E2D7C6A457
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 15:25:32 +0000 (UTC)
Received: by mail-vb0-f41.google.com with SMTP id g17so3351353vbg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2013 08:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=08ELmoJ7R+WgwzKy6Nr4xXfAQUgftKv7wfdQ59tZQpY=;
	b=CSkfGhypUOmETeM2Z2IIS3s2BIlISuGQQEZbKOXwjZZkg5/FYxoq2LO5FT4ACPwH6X
	zweXQInsmaQP9fZ25s3rC29XsS09CRetsYAHd+vKzzuoO2K5ga5TIdWsqJwywLlawwfp
	m529pt/vltFd0vYhNGSgjcyc9yHElBOgMN3TQ4z7I4ht0g3+Bo7M+d86Nxb+Fo0q9W5K
	6zj1ptl+myDF8muBJv4OeGyOx1+jig6bxYYYO5e9blniMWVd53CADfOqs7DCBnw2G3xw
	5abLXGGegLqFLGb5/MUhB3SkbkvRpKmRMxCOI7st4AffrHfFFCQGntefy6yx10j8Y48c
	Uvng==
X-Gm-Message-State: ALoCoQk26thFnS6WJgQWVM+3qINSu+xDViZZWo3DL3xjCcsqlvPDVW3jG9rQ7X4sRnJ4JGlnfy0d
X-Received: by 10.52.164.227 with SMTP id yt3mr2855952vdb.107.1375975533569;
	Thu, 08 Aug 2013 08:25:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 8 Aug 2013 08:25:13 -0700 (PDT)
In-Reply-To: <1375975325-2752-1-git-send-email-sgw@linux.intel.com>
References: <1375975325-2752-1-git-send-email-sgw@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 Aug 2013 16:25:13 +0100
Message-ID: <CAJTo0La2pWvVmfi=zgRMZNaN+JZgs6BLNn5cXWRrAphA2M4o2A@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] tzcode: Fix up tzdata to 2013d
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
X-List-Received-Date: Thu, 08 Aug 2013 15:25:33 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2013 16:22, Saul Wold <sgw@linux.intel.com> wrote:
> +           ftp://ftp.iana.org/tz/releases/tzdata2013d.tar.gz;name=tzdata"

Use ${PV} to avoid this in the future, or do they not update in sync?

Ross

