Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f178.google.com (mail-ve0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 27C076BEFC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 09:51:43 +0000 (UTC)
Received: by mail-ve0-f178.google.com with SMTP id ox1so3770524veb.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2013 02:51:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=63fbn4BxIpK2utabjmgfP/ic31XXjyRpR16NkGVes4w=;
	b=MBMzCd1kU/rOSEUpzbvj9LG6s4ZoGEpCsgTe3L7FbRhHfesOQA0EtigULUUWqFGqsL
	Dg/7azNDSpXt1O4Hwaj8keM8dtTRobaadS1PM4PO3XYd/48ry3me3VdVMPj7eLtk+pPw
	wFGroOC55p0Lnb590p67DJmJyul3tcj60RzdHpY03M/c1bNaSEzHT4HU8IJlZGtLsphM
	Pn9n+svJRjJeV7uI+kdLzqGFELzpNZ7jdkbPFbIKRhfv8cuEjwtJvVvuR2ktDjrbVTKp
	sfyitniaBzhM+tpFEmLYo7Nzh+wXaYM8jTOzvAZXtLLDYKOWHUN4fbzPc1TB2JpEmE0E
	7rZg==
X-Gm-Message-State: ALoCoQmJ5HfSud4ozdvNBf5H+gPzMzDld36qp4/wPB1iu9pkPB/EmZKsfP2Kul6QW7d2zVxrg3mO
X-Received: by 10.52.165.111 with SMTP id yx15mr190716vdb.33.1378201903292;
	Tue, 03 Sep 2013 02:51:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 3 Sep 2013 02:51:23 -0700 (PDT)
In-Reply-To: <f6faba2e39ab7055392521e8324ca08f2afa4c03.1378194734.git.liezhi.yang@windriver.com>
References: <cover.1378194734.git.liezhi.yang@windriver.com>
	<f6faba2e39ab7055392521e8324ca08f2afa4c03.1378194734.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Sep 2013 10:51:23 +0100
Message-ID: <CAJTo0LYOgNNfeAHWaCYU-QvE+pEKfOmxU0U13iLu5FLKXfewnw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 09:51:45 -0000
Content-Type: text/plain; charset=UTF-8

On 3 September 2013 08:52, Robert Yang <liezhi.yang@windriver.com> wrote:
> +    sed -i -e 's/^\(ABS_GLIB_RUNTIME_LIBDIR=.*readlink\) -f/\1 -m/' ${S}/configure.ac

Please do this as a patch instead of a sed.

Ross

