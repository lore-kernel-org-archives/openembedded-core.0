Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8297C446
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 12:44:42 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id 9so8252409itf.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 05:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E6KfMxUH/0HO5prHH9iHyKQWo3t3AqFhzb3xVGEhisA=;
	b=E+mYS94/1THd3/oaJcWbGCdbhJg/Ns2fikizrUCvVDrwixOL0NXJohWtS2j/C4ulQn
	r4/GKrAloLL1Y5wC8eiBhpjdHzFaa3QLeIrH/x3pb41O7ORTpVBo17dktGtP4mBu2+c/
	pmzDDfFc77J605gp2Bh/MlVALH3uKhMwxZB3UT1TNBQ3yuy5K5RgRE2+UQ2Cx2cwegmC
	IlBNmdt7DP+omIAhIoRtJaKCcf3sVOHX4c6bOFUvWioSqKZDwrRa5hZJo3h15AU9JKMu
	Xfsm0pKtkoBexPRICD5aUe8ZZvs56GxKKajmXSnBvlEwNhi6x5lrT1C4Ov4JA/Fyj0Eg
	8j0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E6KfMxUH/0HO5prHH9iHyKQWo3t3AqFhzb3xVGEhisA=;
	b=ThNbxWhCoqKDqjRx/0uiC7XJwS58B7rx7mpIWITMWSZGJCnby8ScmMnA1G8JDLpmAG
	7P9SD3SB3H9KQCYNJmRJDu7mwpvR9YrdA7Teg3mMooBWnluRcZJPpKHiREinAKRzsZWn
	aAVmzRqxTKWa05tp+Hp8avwUHsJbpr7z4CAObdTxbEvZGq/WEU8F2QQ9TNg1biE9wBu/
	nw+UXwu+WmAFGrBCGxilC/DXTCJDZm5MzClonA7a0gzcEiRsENWCNneyAYnGOXC8GDJH
	NWVH3Jg4bKvg28OwUscMdy6ikuR6O/pBsRsDQFe+A2sW8K3Q0z444u0rDZhFyGDNSRYd
	LdsA==
X-Gm-Message-State: APjAAAXDhXbV0S+BcoyKRuv4LR/APdK+P9O41OLVaneQV5RcMFy672X8
	JcXMhOxFJXhMNNLiRnzPUnL0ALFRP47MSPRPvj8=
X-Google-Smtp-Source: APXvYqwrfq4ADdYFRjQnVAt/vGVI2xpcHki0zoHUSWUzKiFHyD5Jmx3MVvaiRQMVtfXy2rtge4Hom6unuhUIzEEn4rk=
X-Received: by 2002:a02:3846:: with SMTP id v6mr61823260jae.81.1558615483637; 
	Thu, 23 May 2019 05:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190523122941.21058-1-schnitzeltony@gmail.com>
	<CAJTo0La2B39+ZuN6t40xz_g2MoDo44kow6g4RA6L_8YGfin0VQ@mail.gmail.com>
In-Reply-To: <CAJTo0La2B39+ZuN6t40xz_g2MoDo44kow6g4RA6L_8YGfin0VQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 23 May 2019 14:44:32 +0200
Message-ID: <CALbNGRTv8f6nPOS1fDskR3t=29+jw9Gj74_jsZCY7jpUFPk24A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_manager: add help packages based on languages selected in IMAGE_LINGUAS
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
X-List-Received-Date: Thu, 23 May 2019 12:44:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 23, 2019 at 2:39 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Why -help- and not -doc?
>
Because there are help files installed in 'help' directory and
displayed by a help browser.

Andreas

