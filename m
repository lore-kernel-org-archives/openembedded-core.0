Return-Path: <ross.burton@intel.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 64E9A6A48C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:26:20 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id z11so1904672pdj.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ObOAwBj+Ez1jWkITA41FQuVYiPlsWRLod9ojnbannF4=;
	b=dxvrPx6ZVHwu/YwWjQD3LK7LyT+YTJVLm5PVEFPcLNvZgWco+jD97918r1DBX35lOF
	nWW61fgJ0n5FuI2kavAT1tueFNQ+YeL9qhF4/+jm0t2ZNLN4LF/y0+LkjMHN+4gtQcnc
	zrUznKir83KZWvGDKzNurMaO+H8pMIRSh/Wj4y0vzLLI6uQMyH/1MUGlUiUAe78+Bu83
	rBRBvUuTHFKTdyQxO3RwQiLLLHi3aTNiixCU0nJit6cIILfJ+U+u4aQRhqq0fPsRrwGb
	DdyFX4KYPSwHyl6nbuktkGm/oZWBySFc8XNoPCPzfFcKNxo6nvzMC9+SQi4D2JSIcSXP
	5c+g==
X-Received: by 10.68.162.163 with SMTP id yb3mr11836365pbb.212.1369992381608; 
	Fri, 31 May 2013 02:26:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.252.98 with HTTP; Fri, 31 May 2013 02:26:01 -0700 (PDT)
In-Reply-To: <cover.1369967097.git.chris_larson@mentor.com>
References: <cover.1369967097.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 May 2013 10:26:01 +0100
Message-ID: <CAJTo0LaxaDqoygUx6M-VudeM+11yufFbEh+PB_2UQYXJdv4VMA@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Gm-Message-State: ALoCoQnnsj6r60M3qXt7pNcckEnV8wcOb5YNBrwgQIW6f7inoLqA/7+GJuDaaI5YNNWyjzdtpT7G
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Add 'tcp-wrappers' PACKAGECONFIG
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
X-List-Received-Date: Fri, 31 May 2013 09:26:21 -0000
Content-Type: text/plain; charset=UTF-8

On 31 May 2013 03:26, Christopher Larson <kergoth@gmail.com> wrote:
> This makes rpcbind, quota, systemd, portmap, and nfs-utils obey the same tcp
> wrappers PACKAGECONFIG which xinetd obeys.

If many packages have the same packageconfig option, should this be a
distro feature?

Ross

