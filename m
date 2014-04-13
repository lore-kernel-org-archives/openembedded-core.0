Return-Path: <michael@neurohr.at>
Received: from mx0.neurohr.at (mx0.neurohr.at [151.236.6.16])
	by mail.openembedded.org (Postfix) with ESMTP id 11A036059A
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 17:48:10 +0000 (UTC)
Received: from [10.39.0.6] (vpn1.vds-ade.com [158.255.212.109])
	by mx0.neurohr.at (Postfix) with ESMTPSA id BB68482403D6
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 17:48:09 +0000 (UTC)
Message-ID: <534ACDD8.20704@neurohr.at>
Date: Sun, 13 Apr 2014 19:48:08 +0200
From: Michael Neurohr <michael@neurohr.at>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Openembedded-core@lists.openembedded.org
X-Enigmail-Version: 1.6
Subject: Package sambaserver_3.0.37-r9_mips32el
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
X-List-Received-Date: Sun, 13 Apr 2014 17:48:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,
there seem to be a bug within the provided Samba server in the package
sambaserver_3.0.37-r9_mips32el.ipk.

When trying to access Samba server as a non root user, the following
appears in the log: [1]

On the Samba mailing list I found a hint that the problem rises during
the "./configure" command within the cross compile environment. I
described the problem in more detail in a thread in the Openpli forum [2].

I'm coming directly to this mailing list because it has been mentioned
within the maintainer info in the package manager.
So could someone please take a look into that?

If you need more info about that issue, please ask.

Thanks,
Michael Neurohr




[1]
[2014/04/10 17:16:49, 0] lib/util_sec.c:assert_gid(119)
  Failed to set gid privileges to (-1,1000) now set to (0,0) uid=(0,0)
[2014/04/10 17:16:49, 0] lib/util.c:smb_panic(1633)
  PANIC (pid 16280): failed to set gid

[2014/04/10 17:16:49, 0] lib/util.c:log_stack_trace(1737)
  BACKTRACE: 1 stack frames:
   #0 /usr/sbin/smbd(log_stack_trace+0x40) [0x778aca58]
[2014/04/10 17:16:49, 0] lib/fault.c:dump_core(181)
  dumping core in /var/log/cores/smbd
[2014/04/10 17:16:49, 0] lib/util_sec.c:assert_gid(119)
  Failed to set gid privileges to (-1,1000) now set to (0,0) uid=(0,0)
[2014/04/10 17:16:49, 0] lib/util.c:smb_panic(1633)
  PANIC (pid 16281): failed to set gid

[2014/04/10 17:16:49, 0] lib/util.c:log_stack_trace(1737)
  BACKTRACE: 1 stack frames:
   #0 /usr/sbin/smbd(log_stack_trace+0x40) [0x778aca58]
[2014/04/10 17:16:49, 0] lib/fault.c:dump_core(181)
  dumping core in /var/log/cores/smbd
[2014/04/10 17:17:04, 0] lib/util_sec.c:assert_gid(119)
  Failed to set gid privileges to (-1,1000) now set to (0,0) uid=(0,0)
[2014/04/10 17:17:04, 0] lib/util.c:smb_panic(1633)
  PANIC (pid 16286): failed to set gid

[2014/04/10 17:17:04, 0] lib/util.c:log_stack_trace(1737)
  BACKTRACE: 1 stack frames:
   #0 /usr/sbin/smbd(log_stack_trace+0x40) [0x778aca58]
[2014/04/10 17:17:04, 0] lib/fault.c:dump_core(181)
  dumping core in /var/log/cores/smbd



[2] http://openpli.org/forums/topic/33264-use-samba-as-non-root/

