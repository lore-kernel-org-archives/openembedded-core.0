Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8BE73D13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 16:30:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 18 Sep 2015 09:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,553,1437462000"; 
	d="scan'208,217";a="807527048"
Received: from besquive-mobl2.amr.corp.intel.com ([10.219.17.83])
	by orsmga002.jf.intel.com with ESMTP; 18 Sep 2015 09:30:46 -0700
Message-ID: <1442593860.3524.6.camel@linux.intel.com>
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0Lai9oeh3Kvg8wAB9OPFOBG4WaBYqnGRidv-zt9bNrGqgA@mail.gmail.com>
References: <1442522311-15326-1-git-send-email-benjamin.esquivel@linux.intel.com>
	<CAJTo0Lai9oeh3Kvg8wAB9OPFOBG4WaBYqnGRidv-zt9bNrGqgA@mail.gmail.com>
Organization: Intel Corporation
Date: Fri, 18 Sep 2015 11:31:00 -0500
Mime-Version: 1.0
X-Mailer: Evolution 3.16.5 (3.16.5-1.fc22) 
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] selftest/buildoptions: pexpect not a builtin module
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: benjamin.esquivel@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Sep 2015 16:30:52 -0000
Content-Type: multipart/alternative; boundary="=-fpfwMVMaTlXEbev7PV1k"

--=-fpfwMVMaTlXEbev7PV1k
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-09-18 at 12:05 +0100, Burton, Ross wrote:
> 
> On 17 September 2015 at 21:38, Benjamin Esquivel <
> benjamin.esquivel@linux.intel.com> wrote:
> > put the import of pexpect around a try statement so it can tell you
> > why it failed to import when in a system that has the module
> > unreachable
> > 
> As the failing import is throwing an exception, can't the calling
> code display the exception correctly?
This is the logging without the change:
2015-09-18 08:27:44,233 - selftest - INFO - Loading tests from:
oeqa.selftest.buildhistory
2015-09-18 08:27:44,234 - selftest - INFO - Loading tests from:
oeqa.selftest.buildoptions
2015-09-18 08:27:44,236 - selftest - ERROR - Failed to import
oeqa.selftest.buildoptions
2015-09-18 08:27:44,236 - selftest - ERROR - 'module' object has no
attribute 'buildoptions'
This is the logging with the proposed change and including Paul's
comment:
2015-09-18 08:27:44,233 - selftest - INFO - Loading tests from:
oeqa.selftest.buildhistory
2015-09-18 08:27:44,234 - selftest - INFO - Loading tests from:
oeqa.selftest.buildoptions
No module named pexpect, import failed
Please install pexpect (python-pexpect)
2015-09-18 08:27:44,236 - selftest - ERROR - Failed to import
oeqa.selftest.buildoptions
2015-09-18 08:27:44,236 - selftest - ERROR - 'module' object has no
attribute 'buildoptions'
I'm sending the patch V2
> > Ross
> 

--=-fpfwMVMaTlXEbev7PV1k
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Fri, 2015-09-18 at 12:05 +0100, Burton, Ro=
ss wrote:</div><blockquote type=3D"cite"><div dir=3D"ltr"><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">On 17 September 2015 at 21:38, Ben=
jamin Esquivel <span dir=3D"ltr">&lt;<a href=3D"mailto:benjamin.esquivel@li=
nux.intel.com" target=3D"_blank">benjamin.esquivel@linux.intel.com</a>&gt;<=
/span> wrote:<br><blockquote type=3D"cite"><div id=3D":bf" class=3D"a3s" st=
yle=3D"overflow:hidden">put the import of pexpect around a try statement so=
 it can tell you<br>
why it failed to import when in a system that has the module unreachable<br=
></div><br></blockquote></div><br>As the failing import is throwing an exce=
ption, can't the calling code display the exception correctly?</div></div><=
/blockquote><div>This is the logging without the change:</div><div>2015-09-=
18 08:27:44,233 - selftest - INFO - Loading tests from: oeqa.selftest.build=
history</div><div>2015-09-18 08:27:44,234 - selftest - INFO - Loading tests=
 from: oeqa.selftest.buildoptions</div><div>2015-09-18 08:27:44,236 - selft=
est - ERROR - Failed to import oeqa.selftest.buildoptions</div><div>2015-09=
-18 08:27:44,236 - selftest - ERROR - 'module' object has no attribute 'bui=
ldoptions'</div><div><br></div><div>This is the logging with the proposed c=
hange and including Paul's comment:</div><div><br></div><div>2015-09-18 08:=
27:44,233 - selftest - INFO - Loading tests from: oeqa.selftest.buildhistor=
y</div><div>2015-09-18 08:27:44,234 - selftest - INFO - Loading tests from:=
 oeqa.selftest.buildoptions</div><div>No module named pexpect, import faile=
d</div><div>Please install pexpect (python-pexpect)</div><div>2015-09-18 08=
:27:44,236 - selftest - ERROR - Failed to import oeqa.selftest.buildoptions=
</div><div>2015-09-18 08:27:44,236 - selftest - ERROR - 'module' object has=
 no attribute 'buildoptions'</div><div><br></div><div>I'm sending the patch=
 V2</div><blockquote type=3D"cite"><div dir=3D"ltr"><div><br></div><div cla=
ss=3D"gmail_extra">Ross</div></div>
</blockquote></body></html>

--=-fpfwMVMaTlXEbev7PV1k--
