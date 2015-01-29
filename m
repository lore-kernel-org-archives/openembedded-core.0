Return-Path: <rodrigo.chiossi@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E98EF60034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Jan 2015 12:30:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 29 Jan 2015 04:27:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,485,1418112000"; d="scan'208";a="658582462"
Received: from rchiossi-1.bz.intel.com (HELO rchiossi-1) ([10.218.99.159])
	by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2015 04:30:32 -0800
Date: Thu, 29 Jan 2015 10:30:32 -0200
From: Rodrigo Chiossi <rodrigo.chiossi@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Message-ID: <20150129123032.GA2312@rchiossi-1>
References: <1420553934-2559-1-git-send-email-rodrigo.chiossi@intel.com>
MIME-Version: 1.0
In-Reply-To: <1420553934-2559-1-git-send-email-rodrigo.chiossi@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] lib/oe/terminal: add support for Terminology terminal emulator
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
X-List-Received-Date: Thu, 29 Jan 2015 12:30:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline

Ping

On Tue, Jan 06, 2015 at 12:18:54PM -0200, Chiossi, Rodrigo wrote:
>Terminology is the default Enlightenment terminal emulator
>
>Signed-off-by: Rodrigo Chiossi <rodrigo.chiossi@intel.com>
>---
> meta/lib/oe/terminal.py | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
>index 0a623c7..e9af726 100644
>--- a/meta/lib/oe/terminal.py
>+++ b/meta/lib/oe/terminal.py
>@@ -63,6 +63,10 @@ class Xfce(XTerminal):
>     command = 'xfce4-terminal -T "{title}" -e "{command}"'
>     priority = 2
>
>+class Terminology(XTerminal):
>+    command = 'terminology -T="{title}" -e {command}'
>+    priority = 2
>+
> class Konsole(XTerminal):
>     command = 'konsole -T "{title}" -e {command}'
>     priority = 2
>-- 
>2.1.3
>

