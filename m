Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8079565E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 15:18:49 +0000 (UTC)
Received: by mail-qg0-f52.google.com with SMTP id q108so327047qgd.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:18:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+4J9N5MS/VGH8AeW+Xcmpd6BKQDxb18CAArMILVvMVM=;
	b=V57K6sT5xvLaPm02nniZe9/e3uRqD1uVmjEJnuhH8LdU183MIyrpq6UuwgMbW1B5rG
	1cTip08ndUO3MzOAITX8hguTPtcpVXPVTNkAplX7ZGvfwoaNGyHQG587JZwLW4x84dOa
	VdQwsgZe4651aH1TShQDgmrkQi2G7vyX5TqCUeAcwQxMBDcVWwTYT1RO5QNNE8sJsVeT
	qWpSPTFjado0IYGdpH4eIKG8fXfbWjsXgWmW+MPyDYsG9XjZGya95XLzP5tUR2PL7Jh+
	0eGFdnDvqU7YOmLo+2Te8+h9pdi50ceXIbmNTCtUiyjpx4XnaaqwZURGFq++0+wPT88v
	Dihw==
X-Gm-Message-State: ALoCoQlKt9jFW03vInGO+vmaapZMhdkYObXmFS4GB9GiTWPHUCxjGN8/QLS1JhHHH2tOGbkFKWNZ
X-Received: by 10.140.40.84 with SMTP id w78mr24650320qgw.87.1412090297574;
	Tue, 30 Sep 2014 08:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Tue, 30 Sep 2014 08:17:57 -0700 (PDT)
In-Reply-To: <1412087104-1560-1-git-send-email-noor_ahsan@mentor.com>
References: <1412087104-1560-1-git-send-email-noor_ahsan@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 30 Sep 2014 16:17:57 +0100
Message-ID: <CAJTo0LbJW2XEfzK0hzHeeRHeuWapb2ZNZ4dj47Q0GSm0zEuqtQ@mail.gmail.com>
To: "Noor, Ahsan" <noor_ahsan@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sysprof: Creats x11 PACKAGECONFIG.
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
X-List-Received-Date: Tue, 30 Sep 2014 15:18:59 -0000
Content-Type: text/plain; charset=UTF-8

On 30 September 2014 15:25, Noor, Ahsan <noor_ahsan@mentor.com> wrote:
> +PACKAGECONFIG[x11] = ",,gtk+ libglade"

You'll need a patch to configure.ac to make this actually work in
situations where the x11 option has been explicitly disabled, but GTK+
is present in the sysroot.

Ross

