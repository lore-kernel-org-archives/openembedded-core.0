Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id BD51460809
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 14:43:20 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id o8so3901278qcw.36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Sep 2014 07:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ScWZWnUFFqaMzYNgBzHI0r7bmTekxDIF2pRTlhpm7fQ=;
	b=BbiefGYgzsAsSVIigHn3zNeKvFFW2apla/WaP0ZpSO9iBMkOwUvdDjou3ZeegDC+0d
	pDgEfZHtL88LXSGeE3rA1xqqpogVqtBQraSg2qDSPfvBNw+00AJWkCdKGpsBL4uK5ZQc
	vRr0DYRPEQUcLtJzjoRThWDQ6J7jev81SEMsM93hGzluUn9TGWQItQwNTrkdWCW8m3kD
	dLHPbdcfg61Llj8h5BBN3exxlqFNM9IVD4zFLskbOzCAh6h9BOyX+S1H+FFTUGtKjS9h
	F5wUcHjWvqvxhiLDGZ4qil0+DCibS1AE3XJJH5OMDp/YuIEvgP+349E/hq1rozARJFjE
	jxfg==
X-Gm-Message-State: ALoCoQnlzWhJfXem5coB/yJYlaPlsEYpIA5ujnw0A6YDolXBHFku1z1MUjwRmw+f8pa8RgaNZEx6
X-Received: by 10.224.38.10 with SMTP id z10mr37029733qad.52.1410792201238;
	Mon, 15 Sep 2014 07:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Mon, 15 Sep 2014 07:43:01 -0700 (PDT)
In-Reply-To: <5416F9F4.30101@windriver.com>
References: <cover.1410247971.git.liezhi.yang@windriver.com>
	<b4b89028043c706ebd9e5d81d25f55224069e5a5.1410247971.git.liezhi.yang@windriver.com>
	<CAJTo0LZx+PrHbn=2imh1gpFQF2fnHaUZ6xbMeO8bhvixnWWOsA@mail.gmail.com>
	<5416E407.4050703@windriver.com>
	<CAJTo0LZsfdkvr7vsyvCzdK8mvn81jLk-FBdQf6D0SOhOvANuOA@mail.gmail.com>
	<5416F9F4.30101@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Sep 2014 15:43:01 +0100
Message-ID: <CAJTo0LbNcGrFTT=dHGz6p6kQVb_n5YAvXT9FAONzHkQ-UU+oBA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] libxml2: fix python path and enable libxml2-python
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
X-List-Received-Date: Mon, 15 Sep 2014 14:43:21 -0000
Content-Type: text/plain; charset=UTF-8

On 15 September 2014 15:38, Robert Yang <liezhi.yang@windriver.com> wrote:
> Ah, yes, then we should set PACKAGECONFIG ??= "python" by default ?
> Otherwise
> I'm afraid that there would be errors.

No need to set it by default - although my argument here is that we
don't currently. This should work:

PACKAGECONFIG ??= ""
PACKAGECONFIG_class-native ??= "python"
PACKAGECONFIG_class-nativesdk ??= "python"

Ross

