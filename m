Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5D3B16D899
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 11:59:19 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id w5so8325121qac.20
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 04:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hd1JkbKHZEHkpll6c4X/WgL+qCBN9rp+/loIzvYPj+k=;
	b=SvSb4rzfuUPFXUbQcCh2WjqYVLi000z1YL/W/xilWV4lne7YOTMJsI3btNpjjpIIRf
	1hTGQ5v+Vfr00B2ZPv2tTF4HzOqdcRvt20u2fODM7KDlsi2oTRc0t/VFwh8JK6V7Kcv1
	/XFeg+kNve/vyXYRj6QzjNINSU0+iktR5DGhrEuqOT1w9AtwT65s8HZjmCcxkbHInksD
	4RqFeWOpkjLU2I2LH40BwKSiTy09EqqPch60BrCpf5fFxz1uLJ1bOc3JbanlBAABdDbP
	r1bzoB4YegVCvUXZY3YNaVG//yxa6wSvW7hpV0amgN+h6ooQIHErGQJSCvkfwU07f2c6
	BWsg==
X-Gm-Message-State: ALoCoQnPBPKBMF1dYck37+0ukzzwf83SZdmmtww7N2g7JrNqprrH6eTMiU/d4FimOdzGrPxYsdHG
X-Received: by 10.229.193.136 with SMTP id du8mr42433845qcb.11.1395230360462; 
	Wed, 19 Mar 2014 04:59:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Wed, 19 Mar 2014 04:59:00 -0700 (PDT)
In-Reply-To: <3e91ee5bf0390d700dd57ed89b1dba1434e3f17c.1395194072.git.Chong.Lu@windriver.com>
References: <cover.1395194072.git.Chong.Lu@windriver.com>
	<3e91ee5bf0390d700dd57ed89b1dba1434e3f17c.1395194072.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Mar 2014 11:59:00 +0000
Message-ID: <CAJTo0Lbxi0MpyY8Ev+ovn+HJ8Zzoyr4a1SzZDHL+e2p1SLz=RA@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Wed, 19 Mar 2014 11:59:24 -0000
Content-Type: text/plain; charset=UTF-8

On 19 March 2014 02:00, Chong Lu <Chong.Lu@windriver.com> wrote:
> If image contains dbus and ptest is in DISTRO_FEATURES, dbus-ptest package
> is installed, regardless of whether ptest-pkgs is in IMAGE_FEATURES. This
> issue will increase size for most small images.
> This patch fixes this problem.

Reviewed-by: Ross Burton <ross.burton@intel.com>

Ross

