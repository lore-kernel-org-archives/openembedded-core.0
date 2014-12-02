Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A3E3B72278
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Dec 2014 01:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sB21ZhcF012674
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Dec 2014 17:35:44 -0800 (PST)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 1 Dec 2014 17:35:43 -0800
Message-ID: <547D176C.3010107@windriver.com>
Date: Tue, 2 Dec 2014 09:35:40 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1416815305.git.Chong.Lu@windriver.com>
In-Reply-To: <cover.1416815305.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 0/5] Upgrade dbus and dbus-glib
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
X-List-Received-Date: Tue, 02 Dec 2014 01:35:50 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

//Chong

On 11/24/2014 03:49 PM, Chong Lu wrote:
> The following changes since commit edaeb8940813b620090a0797ad3b6a076897512d:
>
>    bitbake: cooker.py: fix loginfo op being set to an invalid value (2014-11-12 17:04:50 +0000)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib chonglu/dbus
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/dbus
>
> Chong Lu (5):
>    dbus: Upgrade to 1.8.10
>    dbus-test: Upgrade to 1.8.10
>    dbus-glib: Upgrade to 0.102
>    connman-gnome: fix dbus interface name
>    upstream_tracking.inc: update entries for dbus
>
>   .../conf/distro/include/upstream_tracking.inc      |   2 +-
>   .../connman-gnome-fix-dbus-interface-name.patch    | 187 +++++++++++++++++++++
>   .../connman/connman-gnome_0.7.bb                   |   7 +-
>   .../obsolete_automake_macros.patch                 |  15 --
>   meta/recipes-core/dbus/dbus-glib.inc               |   1 -
>   .../no-examples.patch                              |   0
>   .../test-install-makefile.patch                    |  57 ++++---
>   meta/recipes-core/dbus/dbus-glib_0.100.2.bb        |   5 -
>   meta/recipes-core/dbus/dbus-glib_0.102.bb          |   5 +
>   .../{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb}    |   0
>   meta/recipes-core/dbus/dbus_1.8.10.bb              |   4 +
>   meta/recipes-core/dbus/dbus_1.8.2.bb               |   4 -
>   12 files changed, 234 insertions(+), 53 deletions(-)
>   create mode 100644 meta/recipes-connectivity/connman/connman-gnome/connman-gnome-fix-dbus-interface-name.patch
>   delete mode 100644 meta/recipes-core/dbus/dbus-glib-0.100.2/obsolete_automake_macros.patch
>   rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/no-examples.patch (100%)
>   rename meta/recipes-core/dbus/{dbus-glib-0.100.2 => dbus-glib}/test-install-makefile.patch (66%)
>   delete mode 100644 meta/recipes-core/dbus/dbus-glib_0.100.2.bb
>   create mode 100644 meta/recipes-core/dbus/dbus-glib_0.102.bb
>   rename meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb} (100%)
>   create mode 100644 meta/recipes-core/dbus/dbus_1.8.10.bb
>   delete mode 100644 meta/recipes-core/dbus/dbus_1.8.2.bb
>


