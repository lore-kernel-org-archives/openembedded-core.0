Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f45.google.com (mail-qa0-f45.google.com
	[209.85.216.45])
	by mail.openembedded.org (Postfix) with ESMTP id B14A86FC68
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Oct 2014 14:47:56 +0000 (UTC)
Received: by mail-qa0-f45.google.com with SMTP id s7so1860006qap.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Oct 2014 07:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AbiSTmCxTGzZMLd+lpYi9QHIIp6vHbW2vDs5e1D+hYo=;
	b=SsR09beRsNZ5zI4I1467FPnAsX3xNMQdUjQlUebXTGo0zVtMAlInt9n3nELkYECcmi
	39vznCEa9bEcNW823ZbKiLNrAr6gP81vq3Qo4oq/aCEDlLzPewxjLtVsMPTgu5qNRhQp
	fB+lwOR9vLkT0ib8TKB2RZQMpoDR+X2gjMCuWJb1ebiTBBZPIw1OnFwLpMSZGz9t6oQO
	b47fm5wZmJcK28jHrU4N2lwAfH5T0ENAUug0TUGjYmRKU7Vck7BhUCeE0meOB4XK8orY
	9Vo1K0RyOPJkrMQ3VGgJGJe7Wd9aAAUau3cGYxorbDHT2+OSBvc0o5CGrfvI0s4ienS1
	EbTA==
X-Gm-Message-State: ALoCoQn2bGfbXlEIb+VnpB8fYXnL9VY4Bhie2DPcP7Zb56cf2Ot/evKOe0TU+KhdQLLRc8LyxJ/I
X-Received: by 10.140.97.247 with SMTP id m110mr17349529qge.80.1412261277586; 
	Thu, 02 Oct 2014 07:47:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Thu, 2 Oct 2014 07:47:37 -0700 (PDT)
In-Reply-To: <1412260145-15296-1-git-send-email-sona.sarmadi@enea.com>
References: <1412260145-15296-1-git-send-email-sona.sarmadi@enea.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Oct 2014 15:47:37 +0100
Message-ID: <CAJTo0LbnpxBF98ZPYa3jNHNVU0NE4nH6Ku+4JFRyuVOFxywi8w@mail.gmail.com>
To: Sona Sarmadi <sona.sarmadi@enea.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Fix for CVE-2014-7186
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
X-List-Received-Date: Thu, 02 Oct 2014 14:48:04 -0000
Content-Type: text/plain; charset=UTF-8

On 2 October 2014 15:29, Sona Sarmadi <sona.sarmadi@enea.com> wrote:
>  .../bash/bash-3.2.48/cve-2014-7186.patch           |   87 ++
>  .../recipes-extended/bash/bash/cve-2014-7186.patch | 1303 ++++++++++++++++++++

The second patch contains generated files, can you remove them from the patch?

Ross

