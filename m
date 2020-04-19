Received: from mail1.bemta23.messagelabs.com (mail1.bemta23.messagelabs.com [67.219.246.3])
 by mx.groups.io with SMTP id smtpd.web10.13348.1587284179585398159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Apr 2020 01:16:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digiinternational.onmicrosoft.com header.s=selector2-digiinternational-onmicrosoft-com header.b=zgIIFnc7;
 spf=pass (domain: digi.com, ip: 67.219.246.3, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.3.6] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-b.us-east-1.aws.symcld.net id 9C/CD-35930-1D80C9E5; Sun, 19 Apr 2020 08:16:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCJsWRWlGSWpSXmKPExsWSoe+kp3uRY06
  cwayTXBZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8atYyIFmwwqPrx6xtzAuFuti5GLg1FgKbPE
  kjMrmCCcYywSB19OZoNwNjFKnPu5hBHEYRE4wixxadFE5i5GTqBMhMTXuxPAWoQEFjNJ7Dj0n
  w3CecwocadrN1gVm4CBxLq5U4ESHBwiAjoSbz56gYSZBfQkeg/+ZwexhQX8JRZ9fMAKYrMIqE
  qceX2WBcTmFbCXOP36OtgYCQF5iZYrbawQvfISzVtnM0PYEhIHX7yAqpnKKLHxvjiILSSgLrF
  69VM2iDmCEidnPmGBqNGR+LuokRXizl1MEo++3mOFaKiXaJzey45umYSAtcTh7kVQcVmJo2fn
  QA3ylbhyexsbzNDNDV/ZQX6UEFCRuP3EBsIskDj6TBeiQk1iT2cz1EQZiasnO8DhJiFwj1liW
  nM34wRG3VlIXpuF5LVZSF5YwMi8itEsqSgzPaMkNzEzR9fQwEDX0NBIFwhNjPQSq3ST9EqLdV
  MTi0t0DfUSy4v1iitzk3NS9PJSSzYxAhNISgHTpx2MC9a+1zvEKMnBpCTKW9Y9O06ILyk/pTI
  jsTgjvqg0J7X4EKMMB4eSBK88MCUJCRalpqdWpGXmAJMZTFqCg0dJhDebHSjNW1yQmFucmQ6R
  OsWoyzHh5dxFzEIsefl5qVLivIwgRQIgRRmleXAjYIn1EqOslDAvIwMDgxBPQWpRbmYJqvwrR
  nEORiVh3nUgU3gy80rgNr0COoIJ6Ih809kgR5QkIqSkGphqvj5Zlrij4fU8vY3urJe178tIif
  279WputP2SzElb3zU9ejbjvFD0svk/S5tNvtvPYeaOOyaYuD/gVHv7nbt186uuB/N3sTiZaM5
  hWvF837yWC+sq3TSVPTUVH6td6xCq+x6qqJKzX2Pdd4usGcb/r1iku5rsXa4TdH7m2oQ6Zb53
  N068Nee6tcZ5Fqs9l7HPk/9T+L9q3Dv9qNnk9POvvx8a6nFXRzHWFTFt/lR50NVARXz1+w9R7
  D6t5TzRColLTl6SjukyeneWy7mbXbPtY/Wj9bbPmFt+i6xMmrWvYs+t+DPz109zF3xwnH/TNJ
  Njm7c3+LBGVWR9S1+7+bHf4U8CdQeZCs5NYhZXMf6qxFKckWioxVxUnAgAXF4j6ScEAAA=
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-39.tower-394.messagelabs.com!1587284176!3316699!1
X-Originating-IP: [104.47.66.46]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6728 invoked from network); 19 Apr 2020 08:16:17 -0000
Received: from mail-mw2nam12lp2046.outbound.protection.outlook.com (HELO NAM12-MW2-obe.outbound.protection.outlook.com) (104.47.66.46)
  by server-39.tower-394.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Apr 2020 08:16:17 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1AihGMSRa5H/NzIuIqdC/oLj3L/uCrL9B/GNXPcTgqVDHSOX1E/BGkxfYN0W5ZXAtfit0eyZKvEagMz2Ap7M2V/O7IEsDysbKZnbbppBA6FaUgPlf0ksXseSDFjaYCl7TfyTOdETmjw+35is/z/Egb7mHyufsDsFOg7foZ4slELcdJAhIQvCqYQv8Dz0KWLeCu4y2VLgs8FoJGWd2xTSrpA8GZMFrT4Yno5W+iMUlUQgNy0a2RUG3cqc0LkpkmLwLOL9GfofkEw/fbpZGmpWR+JPB2DOhwg6aKHu27t1HHMJvLHlhkYWMgpMov3lFT27dEWwwCyHuwXW/U8TZENVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saF+pc90Cjsm3vCm9RRm86jY/X1DIVX3nVAp7gB72NY=;
 b=P5gFFzeJK6ZsKQB9YSIMYMYAua7AlCs2iAq4mncX7AAlwnvCkr7jSalZt06V9965LpGTQju14UVR0eKs9LzjXlfczHHP/yBU1Jo8I/aeXlC69bLoLuijZlXGkAI1bpPyeBNt3+NeG0bQjFDL4Xkfle4aHEBpD2jCzvpDmeB8kD3SF7hIclRBzVtrHWl+H+IaXTUtzfPltTzS3D/6mtHZZT2ZCXaXkCaECqOF7yog2eawl7ytBAHcZ8eNOo9ANg8W5TKlCKEn9yHhbguhJ+4nBoGjl3m0oTzg50uQw9CxqDC7x1/1FZ0BLWd3x4akH+5Hk3Dr3RECfox04ciRkrv8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digiinternational.onmicrosoft.com;
 s=selector2-digiinternational-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saF+pc90Cjsm3vCm9RRm86jY/X1DIVX3nVAp7gB72NY=;
 b=zgIIFnc7Jejb38hB23fSNxoR/hb6XDOKTyc+wHKGgfO/JQ9r+vZ6yRzE4EfZznk/OlJGo/TmXpSODOHBIGLcFYUqLKNxbmSLlCjycX9Myy54IkxHHHRKxjpefEmtag6feddNYPhQ7y0LCCi6SS0h9TA8i9RlPwTSKli7h3AbEWk=
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35) by CY4PR1001MB2167.namprd10.prod.outlook.com
 (2603:10b6:910:43::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Sun, 19 Apr
 2020 08:16:15 +0000
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c]) by CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c%3]) with mapi id 15.20.2900.028; Sun, 19 Apr 2020
 08:16:15 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan Callaghan <dan.callaghan@opengear.com>
Subject: [PATCH] package.bbclass: inject "minidebuginfo" into packaged binaries
Date: Sun, 19 Apr 2020 18:16:03 +1000
Message-Id: <20200419081603.15837-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.1
X-ClientProxiedBy: SY3PR01CA0098.ausprd01.prod.outlook.com
 (2603:10c6:0:19::31) To CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (2001:44b8:21b0:d600:329c:23ff:fef3:d4d4) by SY3PR01CA0098.ausprd01.prod.outlook.com (2603:10c6:0:19::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Sun, 19 Apr 2020 08:16:14 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 3C73F4238E69; Sun, 19 Apr 2020 18:16:07 +1000 (AEST)
X-Mailer: git-send-email 2.21.1
X-Originating-IP: [2001:44b8:21b0:d600:329c:23ff:fef3:d4d4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8689c380-a830-4207-4542-08d7e439edc7
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2167:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1001MB21678A801D036B947A5F292690D70@CY4PR1001MB2167.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-Forefront-PRVS: 0378F1E47A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2118.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(376002)(136003)(396003)(39830400003)(366004)(478600001)(2616005)(4326008)(6666004)(6916009)(2906002)(44832011)(316002)(42186006)(5660300002)(8936002)(66946007)(966005)(66476007)(8676002)(66556008)(81156014)(186003)(426003)(1076003)(36756003)(42882007)(52116002)(6266002)(107886003);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: digi.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SKwaZxSojXbwqHgwa87HwReq2g2e0H4zeKE9kOQz6hOJD25D7y09IVMKc0QxjU6Dcph02YDvmo/kvuVPpuKvW8nMQe+ZEZUrxZtdGFB/r9w7lqXmYHicR1Qw0aykeSpsxdJwOZteR64V4j4uhdOYwd60B/RhaeKwpaOykgTHFMY7zGlzZvEMtIo3FSJPXCQWFv7EdJeg44q/mum9fxA45jQqcghqlE5W8N42fyPWjFdYA+HhCxYZcpyA/Pek5N/JvR8MGOxDgu637ctBP6XKFPOv+SKUPtot1nyv27qYf3UjyEexDdbF74DurFcj3K7z8qwQQ/0krxLXwc7WolnAxwAEFLRoAC7H415IynQ676+LRixR+XX3ZPSzYTUByQQOvL38FcH9t6tG/qynGdThboNNgt8Z5wSf/2RDVPd30OEpQV5rGDrGoYkcBCyiIODJbWrxm0ufUXejE99ge2JqX/98e6NNhRsSZj/piwGTsdibnDfkMZrKU76B5RNo+93n91Dyl6tcVOHnJRHGyu9Iew==
X-MS-Exchange-AntiSpam-MessageData: 
	V2tqlA5COh7tbcIsHXcW9kKXCYbIG/zJJNFiBPvJWJ8/bfUsrWsa8840nFvrNubuHz8ZPuPgn+73aeW4xD2SIFke++vCpqNdyKoY6De/+FIeLe5+E+Ivh9cPiLlhthIWI8auwwEvaAMsPE78q1VJnoMuYh95KdATP5n0/awFtVicTjGlZg8g7EbkoC2M17+9i5WEpOBY6UbjrOq1cQPdNA==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8689c380-a830-4207-4542-08d7e439edc7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2020 08:16:15.0802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFjujwmlHw6WpBj7AKLAiBAjTAAA2+tM6QoYePeoMwox0Sq9x3BTU6ic5yUispST8Ly9gJ7Bq4EWenQQPUGdlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2167
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"Mini debuginfo" is a special section in ELF executables containing
minimal compressed debuginfo for non-exported symbols:

https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html

It lets debugging tools produce better stack traces, including local
function names, without incurring the space overhead of full debuginfo.
The feature was originally developed for Fedora:

https://fedoraproject.org/wiki/Features/MiniDebugInfo

but nowadays it is widely supported in the ecosystem, including in gdb
and elfutils (and therefore also in tools which use elfutils, such as
systemd-coredump).

This patch adds an optional extra step in package.bbclass to inject
minidebuginfo while stripping and splitting out debuginfo. It can be
enabled by setting PACKAGE_MINIDEBUGINFO=1. In my testing, this
increases the size of resulting binaries by roughly 5%.

The code for producing and re-injecting the minidebuginfo is my own
Python implementation but corresponds directly to the shell
implementation that RPM uses for doing the same:

https://github.com/rpm-software-management/rpm/blob/rpm-4.15.1-release/scripts/find-debuginfo.sh#L261

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/classes/package.bbclass | 84 ++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index d4c6a90e84..648297ad25 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -245,6 +245,8 @@ python () {
         deps = ""
         for dep in (d.getVar('PACKAGE_DEPENDS') or "").split():
             deps += " %s:do_populate_sysroot" % dep
+        if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
+            deps += ' xz-native:do_populate_sysroot'
         d.appendVarFlag('do_package', 'depends', deps)
 
         # shlibs requires any DEPENDS to have already packaged for the *.list files
@@ -459,6 +461,83 @@ def splitstaticdebuginfo(file, dvar, debugstaticdir, debugstaticlibdir, debugsta
 
     return (file, sources)
 
+def inject_minidebuginfo(file, dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d):
+    # Extract just the symbols from debuginfo into minidebuginfo,
+    # compress it with xz and inject it back into the binary in a .gnu_debugdata section.
+    # https://sourceware.org/gdb/onlinedocs/gdb/MiniDebugInfo.html
+
+    import subprocess
+
+    readelf = d.getVar('READELF')
+    nm = d.getVar('NM')
+    objcopy = d.getVar('OBJCOPY')
+
+    minidebuginfodir = d.expand('${WORKDIR}/minidebuginfo')
+
+    src = file[len(dvar):]
+    dest = debuglibdir + os.path.dirname(src) + debugdir + "/" + os.path.basename(src) + debugappend
+    debugfile = dvar + dest
+    minidebugfile = minidebuginfodir + src + '.minidebug'
+    bb.utils.mkdirhier(os.path.dirname(minidebugfile))
+
+    # If we didn't produce debuginfo for any reason, we can't produce minidebuginfo either
+    # so skip it.
+    if not os.path.exists(debugfile):
+        bb.debug(1, 'ELF file {} has no debuginfo, skipping minidebuginfo injection'.format(file))
+        return
+
+    # Find non-allocated PROGBITS, NOTE, and NOBITS sections in the debuginfo.
+    # We will exclude all of these from minidebuginfo to save space.
+    remove_section_names = []
+    for line in subprocess.check_output([readelf, '-W', '-S', debugfile], universal_newlines=True).splitlines():
+        fields = line.split()
+        if len(fields) < 8:
+            continue
+        name = fields[0]
+        type = fields[1]
+        flags = fields[7]
+        # .debug_ sections will be removed by objcopy -S so no need to explicitly remove them
+        if name.startswith('.debug_'):
+            continue
+        if 'A' not in flags and type in ['PROGBITS', 'NOTE', 'NOBITS']:
+            remove_section_names.append(name)
+
+    # List dynamic symbols in the binary. We can exclude these from minidebuginfo
+    # because they are always present in the binary.
+    dynsyms = set()
+    for line in subprocess.check_output([nm, '-D', file, '--format=posix', '--defined-only'], universal_newlines=True).splitlines():
+        dynsyms.add(line.split()[0])
+
+    # Find all function symbols from debuginfo which aren't in the dynamic symbols table.
+    # These are the ones we want to keep in minidebuginfo.
+    keep_symbols_file = minidebugfile + '.symlist'
+    found_any_symbols = False
+    with open(keep_symbols_file, 'w') as f:
+        for line in subprocess.check_output([nm, debugfile, '--format=sysv', '--defined-only'], universal_newlines=True).splitlines():
+            fields = line.split('|')
+            if len(fields) < 7:
+                continue
+            name = fields[0].strip()
+            type = fields[3].strip()
+            if type == 'FUNC' and name not in dynsyms:
+                f.write('{}\n'.format(name))
+                found_any_symbols = True
+
+    if not found_any_symbols:
+        bb.debug(1, 'ELF file {} contains no symbols, skipping minidebuginfo injection'.format(file))
+        return
+
+    bb.utils.remove(minidebugfile)
+    bb.utils.remove(minidebugfile + '.xz')
+
+    subprocess.check_call([objcopy, '-S'] +
+                          ['--remove-section={}'.format(s) for s in remove_section_names] +
+                          ['--keep-symbols={}'.format(keep_symbols_file), debugfile, minidebugfile])
+
+    subprocess.check_call(['xz', '--keep', minidebugfile])
+
+    subprocess.check_call([objcopy, '--add-section', '.gnu_debugdata={}.xz'.format(minidebugfile), file])
+
 def copydebugsources(debugsrcdir, sources, d):
     # The debug src information written out to sourcefile is further processed
     # and copied to the destination here.
@@ -1185,6 +1264,11 @@ python split_and_strip_files () {
 
         oe.utils.multiprocess_launch(oe.package.runstrip, sfiles, d)
 
+    # Build "minidebuginfo" and reinject it back into the stripped binaries
+    if d.getVar('PACKAGE_MINIDEBUGINFO') == '1':
+        oe.utils.multiprocess_launch(inject_minidebuginfo, list(elffiles), d,
+                                     extraargs=(dvar, debugdir, debuglibdir, debugappend, debugsrcdir, d))
+
     #
     # End of strip
     #
-- 
2.21.1

