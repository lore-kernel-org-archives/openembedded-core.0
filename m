Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 9E3F565D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 12:16:56 +0000 (UTC)
Received: by lamp12 with SMTP id p12so65433916lam.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Sep 2015 05:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=/WUVfakTTHgQT7RvCSqbYetATJ2J+GDsNvarfF7XNEg=;
	b=BihCIR5XGuQBgkEAClC8n7LfCccwnGs1A7RKjS2Gihxm8yOv+1hlii4igyogi5nfk+
	tCT2iQRm9vCntBN9lGGV2USDifmasP63yjC1z9B36ti98EB54UWVIDrnNUfAk6oYCfqL
	rW3HSzRh0waO4qRII2zRd0gj2na0I4cFcxd8wz5UGXMR13nl2oVSKwfNt3+Ycl9wSLH8
	4oDHJB38fpI7gRRuOzoFBHxNPp3XAtFlXhmevuTgjDwbvQQXXDVOZHe7XBE8IyO2RiwL
	b6ov7ZGToEMiSFYNQYft/v31yNuoDKC+Fm+GQ/GSmXeOvPMgysq4Jr4mLKJlw04bGlqE
	vLUQ==
X-Gm-Message-State: ALoCoQl2MxI9s9B9CXUMSAw+D8yqwy2irxy2D88yIVgah4PlHtkEhAHOB2I0a513nBroL2c7Xxcq
X-Received: by 10.152.170.196 with SMTP id ao4mr7400971lac.101.1442837814971; 
	Mon, 21 Sep 2015 05:16:54 -0700 (PDT)
Received: from ad.chargestorm.se (h83-209-191-235.dynamic.se.alltele.net.
	[83.209.191.235]) by smtp.gmail.com with ESMTPSA id
	an1sm3560999lac.43.2015.09.21.05.16.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 Sep 2015 05:16:54 -0700 (PDT)
Date: Mon, 21 Sep 2015 14:16:52 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20150921121652.GG4630@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <1442833766-16676-1-git-send-email-net147@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1442833766-16676-1-git-send-email-net147@gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH] opkg: create opkg.lock in /run instead of /var/run
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
X-List-Received-Date: Mon, 21 Sep 2015 12:16:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Jonathan Liu <net147@gmail.com> [150921 13:08]:

> This avoids a "Could not unlink" warning when extracting a /var/run
> symbolic link pointing to /run from the base-files package as it is
> unable to unlink the /var/run directory when it contains opkg.lock.

> This also fixes an issue where /var/run is created as a directory
> instead of a symbolic link to /run.

This fixes my recently discoverd runtime issues, when forwardporting a
systemd-based distro from daisy/dizzy to the current master.

> Signed-off-by: Jonathan Liu <net147@gmail.com>

Acked-by: Anders Darander <anders@chargestorm.se>


-- 
Anders Darander
ChargeStorm AB / eStorm AB

