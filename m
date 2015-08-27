Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8421E60043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 16:19:38 +0000 (UTC)
Received: by igcse8 with SMTP id se8so71707071igc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=h9j9eSu889HapPpQr9KdE90hdzALc++rvS5rr5nJnFM=;
	b=yCbd9EAZ1VfC7O1vlMTLor1N5cAVu4WAf3tvK/xm7E8SFrmgDeMQtg5MM0NTFYYoTz
	4pGDuxjQZq0QED8m2+v1YU7FxPKFsjRaFUs0FSAqFJsFuXRnP83zaNk5jiObi9Pl3bnM
	0WoUHApa1o2pI18FnfaFkG2fmAJ2A1WhAFMepRoV97mgEnk5t3xEL9cFmOxaTwcNYd9K
	337UeIkYKcuFFdx5xQwmF3b5qWQab/79DS9B+kd7roxbj1JZuq4mfGJ/Iivl0NjXmNDo
	zyM5yS1xYfrd3enGLrEiPQ/XH9Zm0rK5uljFlSTc3OHYkSxzWMpRt6IEgcyW26nG+7MC
	GRTw==
X-Received: by 10.50.93.102 with SMTP id ct6mr9770807igb.75.1440692378715;
	Thu, 27 Aug 2015 09:19:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.3.135 with HTTP; Thu, 27 Aug 2015 09:19:09 -0700 (PDT)
In-Reply-To: <1440691301-8285-1-git-send-email-ross.burton@intel.com>
References: <1440691301-8285-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Aug 2015 09:19:09 -0700
Message-ID: <CAMKF1srXapg39duVdoQXD=SfG+S+V+1-KBayZhTNFCLdB3RL-g@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bind: remove dependency on bind in bind-dev
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
X-List-Received-Date: Thu, 27 Aug 2015 16:19:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 27, 2015 at 9:01 AM, Ross Burton <ross.burton@intel.com> wrote:
> bind doesn't ship shared libraries only static libraries, so the default
> dependency on PN from PN-dev is pointless and means that an image with bind-dev
> installed (via dhcp-dev's automatic dependency) ends up with named installed and
> started on boot which is rarely intended.

I see similar issues in meta-oe I wish this could be abstracted out to
a general solution would be awesome
detecting if there are no .so in PN detach PN-dev from it.

