Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id B21AA7DE37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 14:05:23 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id n76so4857274ywd.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2019 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dzB0SfJCVH1esISCM1y4Wx4+woPPNudYnGam+Y6vMNs=;
	b=erm3Yv48swICxfx0CU3dWiL432EqVX7ejm1Ye5xK1sKl9dM8wNQI06CES64PCahEB8
	bCAT0t0UXJSoyqmV/zChCaqXvHLtXZUw+yIecUyUnrnIFrUT8jwjwu6DyldKIueThCsa
	MQZ2gx2eOw5xe43mXH7AY0LSyMTBh1eN6QD1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dzB0SfJCVH1esISCM1y4Wx4+woPPNudYnGam+Y6vMNs=;
	b=n0ZlWuNJzhb2AJ7GvXaS/4P3Rz/uOR8wnb01dUvNWDpNMgZeGeUKiDgFzZuYQ3zFoY
	cCuwzVtNVAb0/BlAE1NQ55W6yGOlQagGSzZNOG5jLMRsqRTlWMF2XJ2cvQ+sRxfz7THS
	d2lOSia+dQpDuqNra3Y0945o4sAr9gPn4gDReXki0PaNlyuZw7nlbAwgsvI7awunDrlU
	6NeGQcyDS1RNNfpXxJHyJhiMSP7Ewvssn/6HOBtjZah02RObeLxm2eoNO8RenOSF518R
	f6cdqdA6Qf3xG5Z8zEV21cDni8bP4rDiptN6VD2kWvvjidENDR6xbm5iY7OeAVTYn7fS
	Dq9Q==
X-Gm-Message-State: APjAAAWOtipoP6BdGNhFHwr5v9X+nB2ghnhadLs2os0H/qnoUDHky2Kf
	NZ4Ize2TAaC60d5TuOwKqQWYrw==
X-Google-Smtp-Source: APXvYqwkNHbK+6TlQVrLp0qpni1EMltrFlrlJU6L5DFMq6XN63aZADTQAzPCZIL6qPqm8RZQQ0nvMg==
X-Received: by 2002:a81:4bc1:: with SMTP id y184mr5750348ywa.437.1557497124396;
	Fri, 10 May 2019 07:05:24 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-141-147.ec.res.rr.com.
	[65.184.141.147]) by smtp.gmail.com with ESMTPSA id
	q10sm1345996ywg.34.2019.05.10.07.05.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 May 2019 07:05:23 -0700 (PDT)
Date: Fri, 10 May 2019 10:05:21 -0400
From: Tom Rini <trini@konsulko.com>
To: chee.yang.lee@intel.com
Message-ID: <20190510140521.GA6312@bill-the-cat>
References: <1557457245-17482-1-git-send-email-chee.yang.lee@intel.com>
MIME-Version: 1.0
In-Reply-To: <1557457245-17482-1-git-send-email-chee.yang.lee@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wic/bootimg-efi: replace hardcoded volume name with label
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
X-List-Received-Date: Fri, 10 May 2019 14:05:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 10, 2019 at 11:00:45AM +0800, chee.yang.lee@intel.com wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> volume name should refer to --label in .wks.
> Replace the hardcoded volume name  with label.
> Keep "efi" as default name when no lable specified.
> 
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> ---
>  scripts/lib/wic/plugins/source/bootimg-efi.py | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg-efi.py
> index 0a0c5bd..55202a8 100644
> --- a/scripts/lib/wic/plugins/source/bootimg-efi.py
> +++ b/scripts/lib/wic/plugins/source/bootimg-efi.py
> @@ -268,8 +268,10 @@ class BootimgEFIPlugin(SourcePlugin):
>          # dosfs image, created by mkdosfs
>          bootimg = "%s/boot.img" % cr_workdir
>  
> -        dosfs_cmd = "mkdosfs -n efi -i %s -C %s %d" % \
> -                    (part.fsuuid, bootimg, blocks)
> +        label = part.label if part.label else "efi"
> +
> +        dosfs_cmd = "mkdosfs -n %s -i %s -C %s %d" % \
> +                    (label, part.fsuuid, bootimg, blocks)
>          exec_native_cmd(dosfs_cmd, native_sysroot)
>  
>          mcopy_cmd = "mcopy -i %s -s %s/* ::/" % (bootimg, hdddir)

Does the name "efi" come from some spec?  I would expect the default
name here to be "ESP".  Thanks!

-- 
Tom

