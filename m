Received: from fly.rz.hs-augsburg.de ([141.82.25.25])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.morscher@hs-augsburg.de>) id 1QykpT-0002K7-DO
	for openembedded-core@lists.openembedded.org;
	Wed, 31 Aug 2011 15:27:43 +0200
Received: from [127.0.0.1] (ppp-188-174-6-202.dynamic.mnet-online.de
	[188.174.6.202]) (authenticated bits=0)
	by fly.RZ.HS-Augsburg.DE (8.14.3/8.14.3) with ESMTP id p7VDGBWe005900
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2011 15:16:12 +0200 (MEST)
Message-ID: <4E5E3418.3000304@hs-augsburg.de>
Date: Wed, 31 Aug 2011 15:16:08 +0200
From: Michael Morscher <michael.morscher@hs-augsburg.de>
Organization: HS Augsburg
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1314747825.5939.449.camel@rex>
In-Reply-To: <1314747825.5939.449.camel@rex>
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.0
	(fly.RZ.HS-Augsburg.DE [141.82.16.16]);
	Wed, 31 Aug 2011 15:16:12 +0200 (MEST)
X-HSA-RZ-MailScanner-Information: Please contact the ISP for more information
X-HSA-RZ-MailScanner-ID: p7VDGBWe005900
X-HSA-RZ-MailScanner: Found to be clean
X-HSA-RZ-MailScanner-From: michael.morscher@hs-augsburg.de
X-HSA-RZ-MailScanner-Watermark: 1315401373.1214@PExK2q60D20Ct9znuKovfQ
X-Spam-Status: No
Subject: Re: [PATCH] gdb: upgrade from 7.3 to 7.3a
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: michael.morscher@hs-augsburg.de,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 31 Aug 2011 13:27:44 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Hey Richard,

Thanks for your patch for gdb, but gdb-cross-canadian is also broken:

Log data follows:
| NOTE: Applying patch 'no-werror.patch' 
(../meta/recipes-devtools/gdb/gdb/no-werror.patch)
| ERROR: Error executing a python function in 
/build/oe-core/meta/recipes-devtools/gdb/gdb-cross-canadian_7.3a.bb:
| CmdError: Command Error: exit status: 1  Output:
| Applying patch no-werror.patch
| patching file bfd/warning.m4
| Hunk #1 FAILED at 23.
| 1 out of 1 hunk FAILED -- rejects in file bfd/warning.m4
| patching file configure.ac
| Hunk #1 FAILED at 3371.
| 1 out of 1 hunk FAILED -- rejects in file configure.ac
| patching file gdb/Makefile.in
| Hunk #1 FAILED at 151.
| 1 out of 1 hunk FAILED -- rejects in file gdb/Makefile.in
| patching file gdb/configure.ac
| Hunk #1 FAILED at 1525.
| Hunk #2 FAILED at 1587.
| 2 out of 2 hunks FAILED -- rejects in file gdb/configure.ac
| Patch no-werror.patch does not apply (enforce with -f)
|
| ERROR: The stack trace of python calls that resulted in this 
exception/failure was:
| ERROR:   File "patch_do_patch", line 136, in <module>
| ERROR:
| ERROR:   File "patch_do_patch", line 133, in patch_do_patch
| ERROR:
| ERROR:   File "/build/oe-core/meta/lib/oe/patch.py", line 338, in Resolve
| ERROR:     raise sys.exc_value
| ERROR:
| ERROR: The code that was being executed was:
| ERROR:      0132:                     raise 
bb.build.FuncFailed(str(sys.exc_value))
| ERROR:      0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:  *** 0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 136, function: <module>)
| ERROR:      0129:                     patchset.Import({"file":local, 
"remote":url, "strippath": striplevel}, True)
| ERROR:      0130:             except Exception:
| ERROR:      0131:                     import sys
| ERROR:      0132:                     raise 
bb.build.FuncFailed(str(sys.exc_value))
| ERROR:  *** 0133:             resolver.Resolve()
| ERROR:      0134:
| ERROR:      0135:
| ERROR:      0136:patch_do_patch(d)
| ERROR:      0137:
| ERROR: (file: 'patch_do_patch', lineno: 133, function: patch_do_patch)
| ERROR: Function 'patch_do_patch' failed
NOTE: package gdb-cross-canadian-arm-7.3a-r4.0: task do_patch: Failed


Bye



