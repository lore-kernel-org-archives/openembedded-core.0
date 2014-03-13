Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6D19B6F605
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 10:33:06 +0000 (UTC)
Received: by mail-qc0-f173.google.com with SMTP id r5so836198qcx.18
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Mar 2014 03:33:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iN1S5wXIWge0NTNP5yEmbZJTykoszNIEb0Hz86p0alo=;
	b=GterdlQeJVmPddmy3N7AW+fxGCIMoOte9y1TjRRpJF8WFM745Gg7s1XVGpq1mbx0oY
	Y+VQRyhYh5xQ2HqocH3BWRDT6ljCARyU5/WQ9NCo/Qt4k9vzh2HdYQwPHLwCzToQm93N
	bikWayIcwVhkC7WOjMulQADUbS2w0Q6cFypaIZuJ+oFZr+Wo0+la0ioazunJkp8CUwBZ
	F9RI4sTBzKKXEA6MybHsV8xq0vQk9HzryA1fm2CLOCtUms3IZJQfgdZMNDAa626WQuwJ
	8i6ojW2bMQdKfhd7a6ZWEv1spXzeXUW9pdYtjBxkVtf2v0TzupBbTi901RlleZAQxM3K
	UXrA==
X-Gm-Message-State: ALoCoQmOdCPIUrtW1V6Yp3VMOcWhQvYoBoKbgk47lP1EjMaNO6ICRWIsaZgoiCMk/QrxdHAn2rt9
X-Received: by 10.224.127.129 with SMTP id g1mr1291149qas.22.1394706787969;
	Thu, 13 Mar 2014 03:33:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Thu, 13 Mar 2014 03:32:47 -0700 (PDT)
In-Reply-To: <969F26A8BAB325438E7EB80D3C3134FB16D5ADA1@IRSMSX105.ger.corp.intel.com>
References: <cover.1394703743.git.cristian.iorga@intel.com>
	<fcd2f5c2d7d8063a6084de454c0847cba830480d.1394703743.git.cristian.iorga@intel.com>
	<CAJTo0Lb2GW2LPQBeWJ45tBwnMTwAYrt9u9edi1nDb6vogLYkgQ@mail.gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB16D5ADA1@IRSMSX105.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Mar 2014 10:32:47 +0000
Message-ID: <CAJTo0Lbyy-J3KFFdAApRAkecoqsZ5iEXVy7O4vwBxuQOMtACAg@mail.gmail.com>
To: "Iorga, Cristian" <cristian.iorga@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] packagegroup-core-tools-testapp: added 3G tools
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
X-List-Received-Date: Thu, 13 Mar 2014 10:33:07 -0000
Content-Type: text/plain; charset=UTF-8

On 13 March 2014 10:20, Iorga, Cristian <cristian.iorga@intel.com> wrote:
> But in this case, can be removed?

Nope, then it would go back to r0.  It will have to stay forever.

Ross

