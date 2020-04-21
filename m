Received: from mail1.bemta24.messagelabs.com (mail1.bemta24.messagelabs.com [67.219.250.5])
 by mx.groups.io with SMTP id smtpd.web11.5547.1587461874122933791
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Apr 2020 02:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digiinternational.onmicrosoft.com header.s=selector2-digiinternational-onmicrosoft-com header.b=x+Yh5c/f;
 spf=pass (domain: digi.com, ip: 67.219.250.5, mailfrom: dan.callaghan@digi.com)
Return-Path: <Dan.Callaghan@digi.com>
Received: from [100.112.129.201] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.us-west-2.aws.symcld.net id 16/9E-46303-0FEBE9E5; Tue, 21 Apr 2020 09:37:52 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKJsWRWlGSWpSXmKPExsWSoa9rovth37w
  4gw+blS3u/HzH7sDocW7jCsYAxijWzLyk/IoE1oxjPx6xFpySrNh61qyB8ZFoFyMXB6PAUmaJ
  nu5lzBDOMRaJTVeXMEE4mxglzv1cwgjisAgcYZZo3v2VpYuREygTIfH17gSwKiGBxUwSf34+Y
  INwHjNKNHx9wQ5SxSZgILFu7lSgBAeHiICOxJuPXiBhZgE9id6D/8FKhAUCJZ71HQYbyiKgKj
  GjeQ4jiM0rYC/x98FtsLiEgLxEy5U2VoheeYnmrbOZIWwJiYMvXoDdLSEwlVHi74UesCIhAXW
  J1aufskEMEpQ4OfMJ1CAdib+LGlkhDt3FJNG1o50ZoqFeYv22FnZ02yQErCUOdy+CistKHD07
  hwXkGQkBX4ntV41gZk5Z+Z8NIqwicfuJDYRZILH1MdQQNYkne08yQtgyEh/2PYQ6+RqzxJm2R
  vYJjLqzkLw2C8lrs5B8sICReRWjeVJRZnpGSW5iZo6uoYGBrqGhka6hsaGuqYleYpVuol5psW
  55anGJrpFeYnmxXnFlbnJOil5easkmRmAKSSloNtvBeHbte71DjJIcTEqivAIr5sUJ8SXlp1R
  mJBZnxBeV5qQWH2KU4eBQkuBdtRcoJ1iUmp5akZaZA0xnMGkJDh4lEd7WDUBp3uKCxNzizHSI
  1ClGXY4JL+cuYhZiycvPS5US5z0JMkMApCijNA9uBCy1XmKUlRLmZWRgYBDiKUgtys0sQZV/x
  SjOwagkzCsDMoUnM68EbtMroCOYgI7IN50NckRJIkJKqoFJ1jR0xSwpU+nvHxaWbJPksu5R17
  354fk6aUFzqbMsnkuieeZN/hmsLfB/knn4laXB5xjrzyq+XPX4tO9j24S7oSvKP1Tamz0V+ag
  m0RRzyHJNuZZHVLLn9FkrHu/hK87qbJ8iXc+pH6zeH6F75FBQJdeB0DuLjHWezJynzHDklOAN
  oY/PL292jmZgrz4gucSxXPvhj+SdzH9mXBTawX2atdJy7r/rLRZH3l25FFCwz+eWrMuEVB/Hp
  3/sJjLtO+X6Kyi9lsvwzAmr65rzPqXfFjOad+7ovcr//Rq186rmvL+dvL2o6HzhlE2vfB8Hf2
  qWrTqzdaPVv07n0GzjQ5JW226K8L27pyO3Pn72YamPSizFGYmGWsxFxYkAtobbJygEAAA=
X-Env-Sender: Dan.Callaghan@digi.com
X-Msg-Ref: server-18.tower-325.messagelabs.com!1587461870!1321236!1
X-Originating-IP: [104.47.45.52]
X-SYMC-ESS-Client-Auth: mailfrom-relay-check=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15578 invoked from network); 21 Apr 2020 09:37:52 -0000
Received: from mail-co1nam04lp2052.outbound.protection.outlook.com (HELO NAM04-CO1-obe.outbound.protection.outlook.com) (104.47.45.52)
  by server-18.tower-325.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Apr 2020 09:37:52 -0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R37GKbA0PgCNDriQepyRcWl3GUvRUTwzoPeuUgG+58JxK9Vr+zy7XdZj7UR/Hx7EvgpYfc1SV3huenlFu07LZqhKCTDlFsfHrJ4eZaZvyECj8cDUDaGv+NRB0gyP73HJLYhH3+HCGR5CcsOyYoQFDdhPhLKv3Mul5b9/dgCKkJNQLh+Jgc2q0m6gKU55ZUG4AOYtaSUd3U5S/s2btGKPoTy3tt0nywLMiZ3E6IMZabC1KC3Dicnlay0qWqeqI2z03KF7wOq4heuwIvkv5fXR4mh6acWZPvQXm4jKz4ApaR6RhXkU8umns4RO9WCRcAuqDrpv05W/pBHa9yDChBC0HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mu1TjR5bRWfZkcssMgAbKkIICKmLn4GikTAXiagqO4=;
 b=oeUaMzVz6EX45mXofgXbY+fdj9bSPNDZpsaEG4nQ/QbQuEZwFlsbIgFXC5N8PkQGrf2TR8MhbgdEWlzhVJEk43k5u0ygMKjNYSVl8Zq7wXxsGr6pEHWY789yeLYflI2yhGsxIn0+7nqGKlyWZNLDB+KUiv24OUSG29SQwxaiSLC84aoqnR1wls4cq5eEPwmRsYuDXu07hq+ZYyBJat4XPVj+B+WStmtc+g2QYgwLKr4cUrrbIYqK2jr42aPaycGzkGMEO/CKLiQOSTjTsrm7SrdinHLOR7ZczqWevhnJjGmME2M9zpk4V39JO8pPAvsyqBXd0uE8Gp3UfSQqk2T0ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=opengear.com;
 dkim=pass header.d=opengear.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=digiinternational.onmicrosoft.com;
 s=selector2-digiinternational-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mu1TjR5bRWfZkcssMgAbKkIICKmLn4GikTAXiagqO4=;
 b=x+Yh5c/f/FwhBDHSbHxwoY7ZlMZvkyfgWtowb4FxBxawEW1yXOjauh0Fq6H85aK8CCwQl659groXQlUWE3lPjMD4rxkDYhsufSLim6u5GOSStVrkrRBdfsgllp3p9kRHLG7HmCvlRkn1TKfyI6noD2hGU7YJlI+di6ttJkSx76Q=
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35) by CY4PR1001MB2358.namprd10.prod.outlook.com
 (2603:10b6:910:4a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.29; Tue, 21 Apr
 2020 09:37:48 +0000
Received: from CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c]) by CY4PR1001MB2118.namprd10.prod.outlook.com
 ([fe80::1de5:5498:680e:db6c%3]) with mapi id 15.20.2921.027; Tue, 21 Apr 2020
 09:37:47 +0000
From: "Dan Callaghan" <dan.callaghan@opengear.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan Callaghan <dan.callaghan@opengear.com>
Subject: [PATCH] kernel.bbclass: copy some more needed files in do_shared_workdir
Date: Tue, 21 Apr 2020 19:37:32 +1000
Message-Id: <20200421093732.29192-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.21.1
X-ClientProxiedBy: SY3PR01CA0102.ausprd01.prod.outlook.com
 (2603:10c6:0:1a::11) To CY4PR1001MB2118.namprd10.prod.outlook.com
 (2603:10b6:910:40::35)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from galangal.danc.bne.opengear.com (2001:44b8:21b0:d600:329c:23ff:fef3:d4d4) by SY3PR01CA0102.ausprd01.prod.outlook.com (2603:10c6:0:1a::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2921.25 via Frontend Transport; Tue, 21 Apr 2020 09:37:47 +0000
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)	id 5A3214238E69; Tue, 21 Apr 2020 19:37:40 +1000 (AEST)
X-Mailer: git-send-email 2.21.1
X-Originating-IP: [2001:44b8:21b0:d600:329c:23ff:fef3:d4d4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64b3f074-5f63-4fdc-4f5f-08d7e5d7a6e7
X-MS-TrafficTypeDiagnostic: CY4PR1001MB2358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR1001MB23586A341C2DED525F95DDA090D50@CY4PR1001MB2358.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-Forefront-PRVS: 038002787A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR1001MB2118.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(346002)(366004)(136003)(396003)(376002)(39850400004)(81156014)(186003)(478600001)(316002)(8676002)(4326008)(42186006)(66946007)(2616005)(66476007)(107886003)(66556008)(42882007)(52116002)(44832011)(426003)(8936002)(6666004)(1076003)(2906002)(5660300002)(6916009)(6266002)(36756003);DIR:OUT;SFP:1102;
Received-SPF: None (protection.outlook.com: digi.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hBJvT+zl2C3JD2OdYZWGJmlVo8lmgq6F9ereYbBdMdkHU+yRzkyt6EmFiTnVvrvnlH1wXI/CbiJbWHb7kvKolUL8/IuXexvWIRaevz11FkvOL94VPebxcvkbW+4/ENmcMpwlz/jljCS7Ti1AercBICoiWISC6iRwkVog3Wn6kbsTJ9n9UJ/PgYSqI5IKPQR9WupIoNtslAuJAAtkHgmIUEX3pIWEQSsQ1A8jC9KLp+4ZyVlVLMzPWj8qcodvCsBmsPZFrRCCqwqDP3rU4LyzQNUyYjVvVOe0uvpSZYWWRPWvhGPykUvOutWv4PyeLfJ+u8rsXIaePjKaeZR4YjJbdmzkD9A3GGdA2e+PJXQCDTnS5dQoNKguJL0VnUaRNZmS7t3OOzqU9CRYKm7A5ReUXZlzFQrwurHjPsvPovcqXp8jcFG6kWvT/7MFkiM/qS2+
X-MS-Exchange-AntiSpam-MessageData: 
	sHu8+hgXYF1AvhB0x8z6RzREKQQ3pbJbzt/EhR0kTg92E4YrLSVC0FPkaQZ7GSUF4yMlANigZh2kX2m2tykt+P8VPj9ev0m9EkklZN4H2z/RxW9mdp2+E0Laq29CGmSjaRoxXlM45OSLEMJmjBOZC8txveEWz3QE845htzGECzd5rngTY2gJPAG4flxr5tubGdcZQu9eOSN7Oan533nE2w==
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b3f074-5f63-4fdc-4f5f-08d7e5d7a6e7
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2020 09:37:47.8809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GoM1dRR0mVW/8xM+xc2wIFLpQTq+2J8CqWOEMcP8w3ktJyCP/+3tL0+lp//3uKhp1Q+d95LJhs3oLYfa3tUlqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1001MB2358
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We need to copy include/config/auto.conf into ${STAGING_KERNEL_BUILDDIR}
to avoid module compilation errors like this:

    | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
    | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
    |
    |   ERROR: Kernel configuration is invalid.
    |          include/generated/autoconf.h or include/config/auto.conf are missing.
    |          Run 'make oldconfig && make prepare' on kernel src to fix it.
    |
    | make[2]: *** [build/tmp-glibc/work-shared/machine/kernel-source/Makefile:641: include/config/auto.conf] Error 1

We also need scripts/basic/fixdep to avoid errors like this:

    | make[1]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-source'
    | make[2]: Entering directory 'build/tmp-glibc/work-shared/machine/kernel-build-artifacts'
    |   CC [M]  build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o
    | /bin/sh: scripts/basic/fixdep: No such file or directory
    | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.build:303: build/tmp-glibc/work/vendor-linux/tehuti-module/0.3.6-r0/git/TLK10232_phy_Linux.o] Error 127

And scripts/mod/modpost to avoid errors like this:

    |   Building modules, stage 2.
    |   MODPOST 1 modules
    | /bin/sh: scripts/mod/modpost: No such file or directory
    | make[3]: *** [build/tmp-glibc/work-shared/machine/kernel-source/scripts/Makefile.modpost:92: __modpost] Error 127

Most of the time, the absence of these files is masked by the
make-mod-scripts recipe's do_configure task, which causes a whole bunch
of extra files to be built into ${STAGING_KERNEL_BUILDDIR} (including
these two). Typically make-mod-scripts will be built before any kernel
modules, and so it didn't matter that do_shared_workdir was missing
these files.

However the problem will be evident if you do certain sequences of
tasks, for example a complete build first (so that make-mod-scripts is
already built), then:

    bitbake linux-yocto my-kernel-module -c clean
    bitbake my-kernel-module -c install

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 meta/classes/kernel.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index a724645466..5a49d01aa5 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -452,6 +452,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf $kerneldir/include/config/
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
@@ -460,6 +461,10 @@ do_shared_workdir () {
 	elif [ -e signing_key.priv ]; then
 		cp signing_key.* $kerneldir/
 	fi
+	mkdir -p $kerneldir/scripts/basic
+	cp scripts/basic/fixdep $kerneldir/scripts/basic/
+	mkdir -p $kerneldir/scripts/mod
+	cp scripts/mod/modpost $kerneldir/scripts/mod/
 
 	# We can also copy over all the generated files and avoid special cases
 	# like version.h, but we've opted to keep this small until file creep starts
-- 
2.21.1

