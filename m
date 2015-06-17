Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B694741CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 16:01:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2015 09:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,633,1427785200"; d="scan'208";a="589640745"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.18.65])
	by orsmga003.jf.intel.com with ESMTP; 17 Jun 2015 09:01:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Wed, 17 Jun 2015 17:01:57 +0100
Message-ID: <7490472.yWjSHu68j0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.7 (Linux/4.0.4-202.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/22] Update webkitgtk to latest stable upstream; replace midori with epiphany
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
X-List-Received-Date: Wed, 17 Jun 2015 16:01:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 17 June 2015 16:19:10 Alexander Kanavin wrote:
> This patch series updates webkitgtk to latest stable upstream release
> and replaces midori browser with epiphany.
> 
> These patches should be applied on top of Jussi Kukkonen's gtk3 update to
> 3.16.
> 
> Alexander Kanavin (22):
>   Change tarball compression to xz for gnome recipes
>   Enable icu feature in harfbuzz recipe
>   Add arch conversion routine to cmake.bbclass
>   Update jpeg recipe to version 9a
>   Update libnotify to version 0.7.6
>   Add a recipe for giflib
>   Add a recipe for libyaml
>   Add a recipe for ruby
>   Add a recipe for libsecret
>   Add a recipe for libwebp
>   Add a recipe for webkitgtk 2.8.3
>   Add a recipe for p11-kit
>   Add a recipe for gcr
>   Add a recipe for iso-codes
>   Add a recipe for libwnck3
>   Add a recipe for gnome-desktop3
>   Add a warning suppression patch to glib
>   Add a recipe gsettings-desktop-schemas
>   Add a recipe for epiphany
>   Remove the recipe for the obsolete webkit-gtk 1.8.3
>   Remove the midori recipe and replace references to midori with
>     epiphany
>   poky: update distro files related to webkitgtk update and epiphany
>     addition

A couple of minor things:

1) The shortlog for patches should be prefixed with the recipe or class being 
modified/added/removed.

2) Changes for poky need to be sent to the poky mailing list rather than here.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

