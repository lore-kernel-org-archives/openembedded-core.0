Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f178.google.com (mail-qc0-f178.google.com
	[209.85.216.178])
	by mail.openembedded.org (Postfix) with ESMTP id E45F065F14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 10:44:42 +0000 (UTC)
Received: by mail-qc0-f178.google.com with SMTP id c9so5993034qcz.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 03:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=JcK/INHloaterqPlD0qGomNqtrSijYE7xUIqKGnYc/g=;
	b=NCKyurQXqCkn71ZbjGk9FjdJBNYKiyOnsq3/lFhrZ+azNLakz6blxUg6r5XBwxtKkc
	zW21s3MLiYq6OLv79yrugtttC80/xvPbuiqXaZWwxCpPBg1qG4XgW/e8r8UhczZz3x/5
	xUnJ1vzOFdUPOTzWOmXTbevOBHbyFtzUXh4h2Dm4/mDWs2SaJngFFNVYXJDIQ0vRVbK8
	zizOazjjtVcSaafxXiwvwurXtPv002J8M+JGwCUAwQHnZ1seyjMg/9Qx+YuFXapJG1yL
	CioNXIDDUtNyGPc6aDK9pnnhi+n03ei1cMAgSobzUASVBRn/bWfZo2aVthgDgOuEyyUN
	0jxg==
X-Gm-Message-State: ALoCoQkRTfNqQx3Bz6c6D+Yk02Emrna2ci0OIB4EBK5nweEu4k/gSpVjyBRn/5XS3V+lySglG1Um
X-Received: by 10.140.91.226 with SMTP id z89mr29177899qgd.65.1403520283411;
	Mon, 23 Jun 2014 03:44:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.138 with HTTP; Mon, 23 Jun 2014 03:44:23 -0700 (PDT)
In-Reply-To: <cover.1403490121.git.kai.kang@windriver.com>
References: <cover.1403490121.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 23 Jun 2014 11:44:23 +0100
Message-ID: <CAJTo0LbT8HseE1T+tTCTcbr59rwjZ1zU_rDFnaQUNpqL7oDagg@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] Update iptables runtime recommends and add default init scripts and configs
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
X-List-Received-Date: Mon, 23 Jun 2014 10:44:45 -0000
Content-Type: text/plain; charset=UTF-8

> Kai Kang (5):
>   iptables: update RRECOMMENDS
>   iptables: add init script and configure file
>   iptables: update init script and bb file

Squash these so there's a single commit that adds and integrates a
working init script.

>   iptables: add default rules
>   iptables: update rules for ip6tables

Ditto, squash these into a single commit.

Ross

