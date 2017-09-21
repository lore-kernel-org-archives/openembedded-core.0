Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6B23E78243
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 11:39:39 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id t127so3833711ywg.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 04:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=R9szSvBRRcSc80x+6tTJ5G0r+98GwWWv/NRa6ZSNTV0=;
	b=lZkzZ2PysRvMLg4Od12nprDN0Omn6E1rySc8DYc4e5mOijoCBzASG5r4mCStfcU+n4
	ZXKvsL51pnhbjNs8GVjUc2ypaq8Ofhg3KqIPlDfSFgDhqKbIr2STCEVyxsMvRaUidnwv
	82f+0EYa1Jyc+dVd8pT+26JOJJdCLtTqQj7t4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=R9szSvBRRcSc80x+6tTJ5G0r+98GwWWv/NRa6ZSNTV0=;
	b=fSKxCkxewJ+n2yrFDC37n28GHusDay9vSbu7xpUTXEs1d7Nes3Bs3DJjv7vP7VcIWi
	xkrfYch50/WaX+zyhmxHf/SEGAFRia+uoyb8b9f4YkL+s6IeAf9Kcn4RmuM9Vx4NNfAU
	yrxY70Rd5Pq0wDQXXunsFVpZQVEM5I5KCw6zduoynZdCIezGqrCaZNsNDgrf6tCNibgW
	l5a9wYI6ocOWdmbfUBQROP6PqgJEn7qOAULlfkAXw2kVPQVKKUxk/BoxbLxip0tqdn0f
	jdq2irD50iJtPJZyM4DW89/UamVJlJLWMcKfODTi1hTfWFH7Ba8kJA6X+UkLtWHKaFW5
	0hzQ==
X-Gm-Message-State: AHPjjUhzjboMDpSsjCz0dnWvAJQnI1faFyHGMuPSf9OEkjHml88eE1dY
	2DWt4eA959cVC+NHY5D4w8czRWAg/NEEEA==
X-Google-Smtp-Source: AOwi7QDUIl0PLwBFU0lIBrL4X4S6HRxg5/6+iWKjJc0ozftKFJp7X+PInoOv2uReXCdPVOTDKj5Y2w==
X-Received: by 10.37.165.5 with SMTP id h5mr1349498ybi.68.1505993981253;
	Thu, 21 Sep 2017 04:39:41 -0700 (PDT)
Received: from bill-the-cat ([2606:a000:1401:811b:24e9:4a96:6457:ac31])
	by smtp.gmail.com with ESMTPSA id o2sm455052ywf.22.2017.09.21.04.39.40
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 21 Sep 2017 04:39:40 -0700 (PDT)
Date: Thu, 21 Sep 2017 07:39:41 -0400
From: Tom Rini <trini@konsulko.com>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>
Message-ID: <20170921113941.GE30205@bill-the-cat>
References: <1505841336-6415-1-git-send-email-nandojve@gmail.com>
	<9504bd62-df10-36a8-01d5-34664c288f8c@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <9504bd62-df10-36a8-01d5-34664c288f8c@prevas.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Sorted ctypes to avoid basehash error
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
X-List-Received-Date: Thu, 21 Sep 2017 11:39:40 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Sep 21, 2017 at 07:15:01AM +0200, Martin Hundebøll wrote:
> 
> 
> On 2017-09-19 19:15, Gerson Fernando Budke wrote:
> >When selected multiple subimages a similar error could happend:
> >   Variable do_image_cpio[subimages] value changed \
> >     from 'cpio.gz.u-boot cpio.gz' to 'cpio.gz cpio.gz.u-boot'
> >To avoid this, 'ctypes' should be sorted at 'gen_conversion_cmds'.
> >
> >This garantee that 'CONVERSION_CMD_xxx' are always written in tha same
> >order and consequently 'do_image_cpio' have the same hash.
> >
> >Signed-off-by: Gerson Fernando Budke <nandojve@gmail.com>
> 
> Tested-by: Martin Hundebøll <mnhu@prevas.dk>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

