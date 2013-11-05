Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f169.google.com (mail-vc0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id AB1066D3C5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2013 12:17:14 +0000 (UTC)
Received: by mail-vc0-f169.google.com with SMTP id hu8so5679105vcb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2013 04:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=apAOLuNdNX8X7yIxb2mmEKeRLEN8ux/p1oSPiKaqfDU=;
	b=lTP9dWKZOsOk3JZBfIsVX3zkLX8QB0DmAQEd9gOtJ3Ii70ejYIUWaJWoQ/ze6O3pSW
	7Xj9ebrmPr9WD2yigL7Xj8jsq0NZxFjxOt3Gj3kuUwBwiX9Qf6kxQ/Nhh1dVws5HJ56u
	MXqv4Ba4pOcscb3/AFT2v+O0UKmv0MO3I1wUVHGO+IPq6lxQ1CJEbZkKLuvKd3tiqbId
	OD0gfdzCRty9aeSQUZo/PqR5U/GtPoZVfLFGwRjkd37jr+2bCvIBPajwl6cwV61Y92Te
	kej1I2M5oPniv92cBK9uCdyFqtJP5Rk9rz3Dg3zTvnI6DccGUKO0VkIViOr0gkMQCprw
	PPNA==
X-Gm-Message-State: ALoCoQm5/J6ZnxNPxW1QYbUdrNWeUNz2d0119boYUv8+DAJQjU5wROhEZU0Aea/Z623pQ/g0SBM7
X-Received: by 10.221.44.136 with SMTP id ug8mr15392714vcb.13.1383653836351;
	Tue, 05 Nov 2013 04:17:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 5 Nov 2013 04:16:55 -0800 (PST)
In-Reply-To: <7b7e2f1f2c529a2867a48e0ddfe78faf2b702c2f.1383643350.git.laurentiu.palcu@intel.com>
References: <cover.1383643350.git.laurentiu.palcu@intel.com>
	<7b7e2f1f2c529a2867a48e0ddfe78faf2b702c2f.1383643350.git.laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 5 Nov 2013 12:16:55 +0000
Message-ID: <CAJTo0LbP5517bBCnBH2tFoF0C6KKShwSrfw355XcZuK0c-iiiQ@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] diffstat: upgrade to 1.58
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
X-List-Received-Date: Tue, 05 Nov 2013 12:17:15 -0000
Content-Type: text/plain; charset=UTF-8

On 5 November 2013 09:25, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:
> -diff --git a/aclocal.m4 b/aclocal.m4

How does this work, considering do_configure should be replacing this file?

Ross

