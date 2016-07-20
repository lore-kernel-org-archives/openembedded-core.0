Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id 03FA46067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 02:21:45 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id j12so26325537ywb.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 19:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=aZJgl7KuL7vSvUTQbOC1F/Ci4CKZjnj6Un7Y8IxWE/Y=;
	b=jeDw1j5b10ETsmsKlA6sa77bVRdPyiDYl5kdjhzh9kE31XI0aGrwDBVvqto5Z+Za6Y
	FXSsU6+Kx3TPQskiLjeQxtfvx9R0eIwpPcilPI4SfYVFzc/PgYxe1PbRs63khk9UFZ1/
	m2sJSh70mJQHfwlCReAQ+bE65uexFoPiWyk/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=aZJgl7KuL7vSvUTQbOC1F/Ci4CKZjnj6Un7Y8IxWE/Y=;
	b=d/dpXw5UIi8n+IQoPVKdFrGqICGi3gFMLCHTJ5F0xU++hQlbZOKAOOjIP5fHndNcgM
	5Eb0aYuVn30wmHF2v0Zw5653MQW2EMZtDuhgexUxCiAKN/MrfBYFagq2mpcv9pAAJxde
	mifLaJBZcW1vtGNYSDA9jdKFyRcxJ4fDY/w83pIrERtTU42n0+koXlRNWmBldPvml20A
	3R1XK5IKFrmeSyAertJex3pqPaAgCdWZWSY0F+H7yxyWUCkteS1CU3HVH/MJfQgEctpS
	nzDlrrFUFl3Oc9fLdtTKGDxoYGE9t90HKoP7anN91s2f9xpEIE6gXicjSI9ta2B42Gly
	LpnQ==
X-Gm-Message-State: ALyK8tKXQdXLc52D4v5ytenhkHb4BmrDPraUhGyB0K6K0fvnAyeSwrGxcHNQsovYEc0wgg==
X-Received: by 10.37.202.212 with SMTP id a203mr9208775ybg.122.1468981306635; 
	Tue, 19 Jul 2016 19:21:46 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-B199-1101-CD04-8ABF.dyn6.twc.com.
	[2606:a000:1407:c0e8:b199:1101:cd04:8abf])
	by smtp.gmail.com with ESMTPSA id w79sm172303ywd.51.2016.07.19.19.21.45
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Tue, 19 Jul 2016 19:21:46 -0700 (PDT)
Date: Tue, 19 Jul 2016 22:21:54 -0400
From: Tom Rini <trini@konsulko.com>
To: George McCollister <george.mccollister@gmail.com>
Message-ID: <20160720022154.GP7260@bill-the-cat>
References: <cover.1468862824.git.george.mccollister@gmail.com>
	<e4091eb7e89b6946db9fafd1f3bdb722818d167e.1468862824.git.george.mccollister@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e4091eb7e89b6946db9fafd1f3bdb722818d167e.1468862824.git.george.mccollister@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: marex@denx.de, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] kernel-fitimage: Add x86 support
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
X-List-Received-Date: Wed, 20 Jul 2016 02:21:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 18, 2016 at 12:57:56PM -0500, George McCollister wrote:

> For x86, bzImage must be built instead of zImage.
> 
> Include setup.bin (which is required to boot the kernel) in the fitimage
> and always use a load/boot address of 0x00090000.
> 
> For details see:
> http://git.denx.de/?p=u-boot.git;a=blob;f=doc/uImage.FIT/x86-fit-boot.txt
> 
> Signed-off-by: George McCollister <george.mccollister@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

