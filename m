Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id B9FE8710B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 15:39:18 +0000 (UTC)
Received: by mail-qa0-f50.google.com with SMTP id cm18so6543904qab.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 08:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v5dfLOU6lvwuInc04EJNsX2pToWzhoDzYCyxVMYZjaU=;
	b=NAyHIhn7IY5YySFHwc2wyM5Q4TvAkCmB5ZDxWGvGB2js3ECLWQx35VWZStCFo1z0YT
	8OXG0RpAh3wS4V7vt9sLbbCuWcuVFYlzn9bDjZPqizWeIgzEKp4kt4CAyqeQqHnXxeNj
	ryoRGmd3z21XC6vA71OdHT4NQM/RV2AxYiBK8BDwi8eN4NPBDG8OscqgpKdwBZZhtE2Y
	w6GOSrX1y40W7fzYnIn+5pT27+nrud+4FVDzKtPh+jwYr1ccpfOJ5kZ3rujbjShHiG8Z
	uokzf4u+W6VIEHC3582dS7qxtdRPne3yC/xQTeMBDLsij93/qWcYIIeqab/5shVD+TNN
	6Y0A==
X-Gm-Message-State: ALoCoQmLrSrYXwI5a1WkjwbRloqjE6Gy5wsYMdFdA+PvMUbmQ+MjmYKkJWaE3lhJwPPMbTN/acmR
X-Received: by 10.224.166.195 with SMTP id n3mr35746577qay.22.1409672359480;
	Tue, 02 Sep 2014 08:39:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 08:38:59 -0700 (PDT)
In-Reply-To: <50321ac97381f5d3aea180c0b6506747a5c392c3.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<50321ac97381f5d3aea180c0b6506747a5c392c3.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 16:38:59 +0100
Message-ID: <CAJTo0LagWB=cxN5jqV5SQ49Jckpn1+_ycyq7VfMYc+urMufCHQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/26] cups: add systemd support
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
X-List-Received-Date: Tue, 02 Sep 2014 15:39:28 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:54, Chen Qi <Qi.Chen@windriver.com> wrote:
> +       # Remove sysinit script and symlinks
> +       rm -rf ${D}${sysconfdir}/init.d/
> +       rm -rf ${D}${sysconfdir}/rc*

Pretty sure you don't mean to unconditionally do that.

Ross

