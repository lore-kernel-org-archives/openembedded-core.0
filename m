Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QQZQf-0002jD-UU
	for openembedded-core@lists.openembedded.org;
	Sun, 29 May 2011 08:24:50 +0200
Received: by pwj9 with SMTP id 9so1357529pwj.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2011 23:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:subject:from:to:in-reply-to:references
	:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=QZOkyjBiECaH7hLVjREydKQd3q5Fcl/lNRwBMmmh3TY=;
	b=Wjy+535mGnQPZDF5lfrNx+qp7G58PFlXnw/Ryipg6t8DifKDWkoQ9Ds2Q4g4OVoR7O
	2GfjzveLmU3wvWcy7Z8ht+tH9oB3X2H3SPSjQSlujfuU5SjkYPcJU0TFCySdKYSgfEZ8
	dsBbpg7gt+/CgI1B/80nL11YPPW8/HPsSUOmA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=ino9APWBwOFO2RWur8b7Am2IGyOZk9d7inmbUDlQDDRCksmYBidyJbS0D8qut7wF4b
	Qv88B2OONpTb0bH/wk+U7RaG+PsLZaEp4Zujx2eG74JMEmw6+L6KAkxsGaiepJZDNoS8
	jsgP/vGYTRi4rQapwvlt/XrjxLWFRikFbONws=
Received: by 10.68.4.167 with SMTP id l7mr1421254pbl.2.1306650101718;
	Sat, 28 May 2011 23:21:41 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id c5sm1854489pbj.57.2011.05.28.23.21.39
	(version=SSLv3 cipher=OTHER); Sat, 28 May 2011 23:21:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1306545413.git.nitin.a.kamble@intel.com>
References: <cover.1306545413.git.nitin.a.kamble@intel.com>
Date: Sat, 28 May 2011 23:21:37 -0700
Message-ID: <1306650097.5246.2.camel@perseus>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [upgrades 0/4] devel/toolchain recipe upgrades
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 29 May 2011 06:24:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-05-28 at 20:22 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
> 
> I could build meta-toolchain & sato-sdk image for qemuppc with these commits.
> 
> I had to fix the autoconf's config-site patch to avoid lots of errors as site
> files were not getting parsed earlier.
> 
> The following changes since commit 1169f1b066d0028bd2ef7915440450bd42ef165e:
> 
>   license.bbclass: Sane Parsing of licenses (2011-05-27 23:36:24 +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib nitin/upgrades
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/upgrades
> 
> Nitin A Kamble (4):
>   m4: upgrade from 1.4.15 to 1.4.16
>   autoconf: upgrade from 2.65 to 2.68
>   bison: upgrade from 2.4.3 to 2.5
>   genttext-0.16.1: mark upstream status for gplv2 recipe's patches

I had question on one patch otherwise the patchset looks sane to me.

> 
>  .../gettext/gettext-0.16.1/disable_java.patch      |    2 +
>  .../gettext-0.16.1/fix_aclocal_version.patch       |    2 +
>  .../gettext-0.16.1/fix_gnu_source_circular.patch   |    2 +
>  .../gettext/gettext-0.16.1/fixchicken.patch        |    2 +
>  .../gettext/gettext-0.16.1/getline.m4.patch        |    2 +
>  .../gettext-autoconf-lib-link-no-L.patch           |    2 +
>  .../gettext-error_print_progname.patch             |    2 +
>  .../gettext/gettext-0.16.1/gettext-vpath.patch     |    2 +
>  .../gettext-0.16.1/hardcode_macro_version.patch    |    2 +
>  .../gettext/gettext-0.16.1/linklib_from_0.17.patch |    2 +
>  .../{autoconf-2.65 => autoconf}/autoconf-x.patch   |    0
>  .../autoheader-nonfatal-warnings.patch             |    0
>  .../autoreconf-exclude.patch                       |    0
>  .../autoreconf-foreign.patch                       |    0
>  .../autoreconf-gnuconfigize.patch                  |    0
>  .../autoreconf-include.patch                       |    0
>  .../{autoconf-2.65 => autoconf}/config_site.patch  |   19 ++-
>  .../fix_path_xtra.patch                            |   14 +-
>  .../path_prog_fixes.patch                          |    0
>  .../program_prefix.patch                           |    0
>  .../{autoconf_2.65.bb => autoconf_2.68.bb}         |    6 +-
>  meta/recipes-devtools/bison/bison/m4.patch         |  131 --------------------
>  .../bison/bison/uclibc-sched_param-def.patch       |   21 ---
>  .../bison/{bison_2.4.3.bb => bison_2.5.bb}         |    7 +-
>  .../{m4-native_1.4.15.bb => m4-native_1.4.16.bb}   |    0
>  .../m4/{m4_1.4.15.bb => m4_1.4.16.bb}              |    6 +-
>  26 files changed, 50 insertions(+), 174 deletions(-)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoconf-x.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoheader-nonfatal-warnings.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-exclude.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-foreign.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-gnuconfigize.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/autoreconf-include.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/config_site.patch (60%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/fix_path_xtra.patch (90%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/path_prog_fixes.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf-2.65 => autoconf}/program_prefix.patch (100%)
>  rename meta/recipes-devtools/autoconf/{autoconf_2.65.bb => autoconf_2.68.bb} (85%)
>  delete mode 100644 meta/recipes-devtools/bison/bison/uclibc-sched_param-def.patch
>  rename meta/recipes-devtools/bison/{bison_2.4.3.bb => bison_2.5.bb} (85%)
>  rename meta/recipes-devtools/m4/{m4-native_1.4.15.bb => m4-native_1.4.16.bb} (100%)
>  rename meta/recipes-devtools/m4/{m4_1.4.15.bb => m4_1.4.16.bb} (75%)
> 





