Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 2E5786B874
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 09:00:58 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id hq12so2879383wib.14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 02:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LgdtmH/XZ6cJ28CX7h9rf2Vk6avId5zqYW/8Qwcyz9A=;
	b=jd8xcDxiEmE1373ETDErVB+FFq65c/vFf/lhMurlUXJ0HaYP4PUg55cS7rhOqp7AV2
	DN25PxFOx7fpTZhKpZUuzzivVDHWwPWNLBr7paUN1B34BqFwF/W8Pk9KOfUwan5NYBtE
	qJ4oRru/jMzYc0OsMB+nSPVWSDB/gmrmB2vMF9sWuoCHeqt0WtT5x60PqeWPDKuU9c+8
	oFeNMPwzW813i63w9w6X1lVsBrQuiduyFym1ag3EtzQkCes0xXNG64Dyl4c/37iUNdxG
	H0Wqy7lKi98v1eUU9/NgBwePZNM/l1WylhWr4Z6KCE6HSO9PE/eha0/dQXNtk/RHBWXQ
	Ge8w==
X-Gm-Message-State: ALoCoQlYxwSlzged4tBh+knuBKWua6VV6MWINNi1aIw5v7NyDaQnfZ4f0qrfcHjmaI/KX1O6DyRp
X-Received: by 10.180.19.196 with SMTP id h4mr1164739wie.38.1376557258262;
	Thu, 15 Aug 2013 02:00:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.217.140.10 with HTTP; Thu, 15 Aug 2013 02:00:38 -0700 (PDT)
In-Reply-To: <1376547819-3322-1-git-send-email-B40290@freescale.com>
References: <1376547819-3322-1-git-send-email-B40290@freescale.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 15 Aug 2013 10:00:38 +0100
Message-ID: <CAJTo0La1OQdOpOzv0u3UcoMpdvm9dHPL_tHzqvXW-E0GT=Omfw@mail.gmail.com>
To: Chunrong Guo <B40290@freescale.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] genext2fs: fix memory corruption on powerpc
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
X-List-Received-Date: Thu, 15 Aug 2013 09:00:58 -0000
Content-Type: text/plain; charset=UTF-8

On 15 August 2013 07:23, Chunrong Guo <B40290@freescale.com> wrote:
> +Upstream-Status: inappropriate

How is this inappropriate for upstream?  We don't want to deliberately
horde non-trivial patches as it means more work in the future.

Ross

