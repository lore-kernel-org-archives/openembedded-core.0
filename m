Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3370060125
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 11:42:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 08 Oct 2015 04:42:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,654,1437462000"; d="scan'208";a="787540578"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 08 Oct 2015 04:42:28 -0700
Message-ID: <561656BC.6050808@linux.intel.com>
Date: Thu, 08 Oct 2015 14:42:52 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <20150912215134.9DA455043A@opal.openembedded.org>
	<20151008101847.GI2385@jama>
In-Reply-To: <20151008101847.GI2385@jama>
Subject: Re: [oe-commits] Alexander Kanavin : gcr: add a recipe from meta-gnome
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
X-List-Received-Date: Thu, 08 Oct 2015 11:42:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/08/2015 01:18 PM, Martin Jansa wrote:
> meta-oe recipe had:
> PNBLACKLIST[gcr] ?= "CONFLICT: 4 files conflict with gnome-keyring"
> # e.g. sysroots/qemux86-64/usr/share/glib-2.0/schemas/org.gnome.crypto.pgp.gschema.xml
> # sysroots/qemux86-64/usr/share/GConf/gsettings/org.gnome.crypto.pgp.convert
>
> I don't see this issue resolved in the version moved to oe-core, why did
> you remove PNBLACKLIST?

Because gcr is a hard requirement for epiphany web browser.

> It's still failing:
> http://errors.yoctoproject.org/Errors/Details/20244/

The file conflict is because gcr has been split out of gnome-keyring 4 
years ago, but the version of gnome-keyring in meta-gnome predates that 
split. It's gnome-keyring that should be blacklisted, or preferably 
updated to something recent.

Regards,
Alex


