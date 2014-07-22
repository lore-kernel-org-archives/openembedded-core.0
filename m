Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id EC130707AA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 22:28:29 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id m5so371267qaj.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J9pgDeorF/5DYWDheQ0vSNSDyODxiwWLw1KJL0hZNcU=;
	b=ipS0jV+Mk4ngyHukf+kZJSE+athmNMerNyLnTK+l57ZJE/GkJ57/8TE7iGoK0R1u4d
	5qLQFG6/Ge4Desz/tJ9w/o3NY/isyIh2K3OyV+HGPyj0xUzEe9btiT2toLExhUJUh8it
	M+mAd0EmKPqWCNQTCqrFEkb+uu83fJE0ajjSEuQtjZlaDmV/wMrmJu+nDDJyujrSCSL+
	iENRn4dh1Ou2oanrbCK4hVon13bg6mZKNH3E5A6yfRVkv6rNsPWcywOQXJqFVfIwAC9I
	+Q84Aep7kyTFtwSqlsX1AhzLgA/zWM+cHyt5aIgaQiqtbxxbt6L4HR2H/nEP+zSnTpft
	lkvg==
X-Gm-Message-State: ALoCoQk8NsXxDlCNvqyyVUehY4a36hE0VCPq+vWmNluma4SM6LD///IeN9mAvvBZJwzwCnT2DpEM
X-Received: by 10.140.109.164 with SMTP id l33mr56026194qgf.72.1406068110333; 
	Tue, 22 Jul 2014 15:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 22 Jul 2014 15:28:10 -0700 (PDT)
In-Reply-To: <1406011764-4955-4-git-send-email-b50113@freescale.com>
References: <1406011764-4955-1-git-send-email-b50113@freescale.com>
	<1406011764-4955-4-git-send-email-b50113@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Jul 2014 23:28:10 +0100
Message-ID: <CAJTo0LasH324O-sO-AvaY=wRWX0h+FOV4cPtiYK3cKzx3gqcmA@mail.gmail.com>
To: Wang Zidan <b50113@freescale.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0: pass rate of input segment to output segment in gstbaseparse.
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
X-List-Received-Date: Tue, 22 Jul 2014 22:28:36 -0000
Content-Type: text/plain; charset=UTF-8

On 22 July 2014 07:49, Wang Zidan <b50113@freescale.com> wrote:
> +Upstream Status: Backported

Presumably this made it into 1.4.0 so should we instead simply upgrade?

Ross

