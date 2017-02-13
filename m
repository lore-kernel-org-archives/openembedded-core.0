Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 8CC2B731D1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 16:26:45 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Feb 2017 08:26:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,156,1484035200"; d="scan'208";a="64164423"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 13 Feb 2017 08:26:44 -0800
To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2144d776-b491-0200-5a2c-63c46f8b775a@linux.intel.com>
Date: Mon, 13 Feb 2017 18:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.6.0
MIME-Version: 1.0
In-Reply-To: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
Subject: Re: [PATCH 00/36] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Mon, 13 Feb 2017 16:26:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2017 05:05 PM, Alexander Kanavin wrote:
> This patchset replaces the outdated, unsupported Smart package manager with
> DNF package manager (Fedora's successor to yum). This is not a trivial change
> and there are many consequences:
>
> - DNF is API incompatible with rpm5; therefore rpm5 is replaced with rpm4.
>
> - There are various non-default features that aren't yet supported or tested:
> such as signing packages and repositories, RPM_PREFER_ELF_ARCH and possibly others
>
> - db 6.x is removed from oe-core; db 5.x is replacing it
>
> - Although I did my very best to test this patchset locally,
> the whole thing may break down in surprising ways. I would appreaciate all the help
> you can provide here. The patchset touches many things in many places and has
> more than the usual share of side effects.

One thing I forgot to mention: previously the way to force something to 
run on target during package installation was to put 'if D is defined 
then exit 1' to pkg_postinst(). That behavior is still supported, but 
deprecated and produces a warning; the new way is to put target-specific 
postinst actions to pkg_postinst_ontarget(). The rationale is in the 
commit message:

http://lists.openembedded.org/pipermail/openembedded-core/2017-February/132654.html

Alex


