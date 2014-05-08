Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f180.google.com (unknown [209.85.216.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE7360897
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 May 2014 15:25:42 +0000 (UTC)
Received: by mail-qc0-f180.google.com with SMTP id i17so3061562qcy.39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 May 2014 08:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=N7T25swlU4rh+rlAjU2p8WpHhHHw9PkcPRmSA3eYhHE=;
	b=XkbMEaMl2ODBi7vdrajz1+4reKtFSR6EGvRGHdDoTtz57LN0WBwD7Uo9UMwYlvp5it
	chAdjB5z6kFLeD1lPTyttpkj0EHrEPKC7FU8C1mmGRD0AaSPlUfYzUoSugts5zZSxkj2
	X5jCGKHrjN3EyfzJKSwjJ3uNXlg2UV/w8qv5DcnNqeNjXtf7ZbGe2xgPfADsIGLmIT0t
	AryefwUI8HLw1ZnSnFZYpiyImxwfvINdV4Kv4zI40XRtUaijeg4AqaOaGEHbdS15ymwt
	Zwq6dI5wpkdpAK/MGVDeBSz+4YTsGLCZn8/YdQRlQtx5oo99xMShP7vT3uoCRuYqEY0U
	AKFg==
X-Gm-Message-State: ALoCoQliQxOHa6HqYwcT430TMjH7+P5oi04pMRJqDUlV0vn+Ab5mJDhANTxmHknOH/tYaLicVcXA
X-Received: by 10.224.138.3 with SMTP id y3mr5912522qat.78.1399562743192; Thu,
	08 May 2014 08:25:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.101.77 with HTTP; Thu, 8 May 2014 08:25:22 -0700 (PDT)
In-Reply-To: <536B9EB0.50704@pseudoterminal.org>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
	<536B9EB0.50704@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 8 May 2014 16:25:22 +0100
Message-ID: <CAJTo0LYounKnnDLj3XVrYBmMGjq=Lmqveid2PkHBmKUJ55qS2g@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Thu, 08 May 2014 15:25:42 -0000
Content-Type: text/plain; charset=UTF-8

On 8 May 2014 16:11, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> I suppose it wouldn't be possible to rename the recipes as well? It would be
> cleaner to have them adopt the GStreamer 1.0 recipe naming convention. So,
> for example, no more gst-plugins-bad_1.0.23.bb , but
> gstreamer0.10-plugins-bad_1.0.23.bb for example.
>
> I guess that this would break compatibility with some existing layers that
> still use 0.10.

If the 0.10 recipes had a future that would be sensible, but I
wouldn't be surprised to see them deleted from meta-multimedia's
master branch in a year's time so this would be needless change.

Ross

