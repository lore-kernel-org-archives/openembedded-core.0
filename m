Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web10.7872.1585061087308698415
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 07:44:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=DZ7EZeow;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I5uRMOXP4ZlZd1ndGFXakO31JJ6PmxiH7lVeyy0zlTKODJ6CCzqeB0sU0J7DWpf6Sh0+HGzyVDaq8SdjOwHw6kymRRourSeqhClYjCAHOwv4IcC89ixtOXkk6XUpnLhF2lQ/xMyEOEmACNbW2mxhaPlU6SL7DG8T4Bh5KKltT0Bo1obPIq6wDhzn3Ej10toHB6gJ9mRwhO3bVaL9W9BS6dQEDMAJHrp9sJiLMG/oczdk3Rymv+AuEFMI2wtJYypLa8iPKNfidX6Y6RXZRaBAZ62Tme9E/C73D5kbEWCXu4VzYUXyjzTwaysJ4eqIJWJKc8XOEkVkVb6m3WQS6yL3ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWa0DDyQRONnQZS86MaPM5astZYMAhYVFExw2im9xBI=;
 b=NQhIDZHLs+P9B2/pixQBUeAz4HJvHVcG10g6s3EbHptzgg+S3uwjGKjr9jfq3JA6/QBfxbNxbPVJR+sKAa9ZEzp0oDWpr5qTXK7i4MB2FLLCJo4S60Ktu1uxD21Zmvmk0pFRDbhwDe6LSW/sEVlGjj8e6hgmehO/iW8F8iJhWtc3iFTLD4OrjB/RsBi8UsOLB07bWf8k8LNI4CXGcBvhBUiv6AP0x5DEph8fj6w7M4DXUQmo7brgwe06IacX3quLk2I6aTE5YngbNR2jcnX/t/N5cWHkun7CwLoTYi799WkYkOcIFNiBAFynPlaOJXatwN7kQSt9UDRXmUYj9FIIWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWa0DDyQRONnQZS86MaPM5astZYMAhYVFExw2im9xBI=;
 b=DZ7EZeowayQiXQpBLHAVbdHWFscDiiuDagkgqtY0WRfuboPl2Hm/1TZ99aaXrqUe+e/A3iPMvx7D9G2cAyOcXUcqTAoFyIEmE4k2ioa4M/Z0CotyUirTrDO9r8MdgmKBOn8AG4/4O5d/ml7Rp5w6KXgmq0sMbtzX2lAyBO6c+7g=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0393.EURP193.PROD.OUTLOOK.COM (52.135.128.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.19; Tue, 24 Mar 2020 14:44:47 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 14:44:47 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 5/5] buildstats*.sh: fix spacing indentation in the files
Date: Tue, 24 Mar 2020 14:44:41 +0000
Message-ID: <20200324144441.41230-6-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324144441.41230-1-luis.martins@criticaltechworks.com>
References: <20200324113313.39528-6-luis.martins@criticaltechworks.com>
 <20200324144441.41230-1-luis.martins@criticaltechworks.com>
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:a1::31) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.19 via Frontend Transport; Tue, 24 Mar 2020 14:44:46 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 235491e4-6791-4efd-ef1e-08d7d001e601
X-MS-TrafficTypeDiagnostic: DB7P193MB0393:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB0393B8247C4F2A94DE44A92E85F10@DB7P193MB0393.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(39850400004)(396003)(136003)(346002)(376002)(366004)(316002)(5660300002)(52116002)(26005)(6512007)(6666004)(44832011)(36756003)(1076003)(6506007)(186003)(66556008)(81166006)(81156014)(8936002)(66476007)(956004)(2906002)(6916009)(2616005)(86362001)(16526019)(66946007)(6486002)(69590400007)(8676002)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0393;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hbl5ZJeBBIoJ6DGU4UXoXg1/p+6H9IL4wLjUcAHYJtMEgQw27if2Pnb1BZ1BZ/IXDHnQj08BC+hNRytNt9cd2ugQJrvRNW5Htvpptco3NYIMyXciGplFjxFnBxcfynJyEkU3Hakb6m70L/hCxRUPoVlwnIitGjL9b1xEuHZqOxBLnu4MnDW27dWbLj9Nv3YRCE3ok8bI76CwJWIQ/11LdyBTdT5+S2BjQQoThPJygVtioGRH/1fKwYThBNjH/GuZYJRVbfmtL/XMQmHO3uS2XsgSnCRADbbJ46yUrDHVCox/VBT7cJoHIFEdLi+QKUXTPf1GVwYl5eE25UxZrUKRYNawy8YdPr50TBKpq9VVoc309Ob0DZf5K4K0jJiAHlyTIbKz7DbtvwrcMPxllOuiElpHz7xjZRmMMXzGPyDJxYkjbodHqBXB4huTYXbnQ3KKOhlv/VIXH08LToAfGP1NcY7ayaQGhMKs/+3J+DomAX6v2hRPED3enwezOcrXPBG0
X-MS-Exchange-AntiSpam-MessageData: 
	VESwoQ/mFVKUCLENx++PwCihh5P88n9gI/DXUwJvonOd9JkUP4LTkg2W8LQaKT3Ci2D/1gMBGvF6Hc/UfCyFpiVndjm+RU77ROHV74fbQkE+64hjf21YRQIvAS1C+vrMdx0F+iXH1NJyYi452yFEPg==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235491e4-6791-4efd-ef1e-08d7d001e601
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 14:44:47.2743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vhsMD1ihsKjLmZ41I2PN+pqgot/UdtQ1lz/ze7fw0cr4XsbEBXsNSZjfVAQbG/i4B33kDostcIMYYpmUaWeONlPRkMmvMdRiikytqc4viIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0393
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix indentation in buildstats.sh and buildstats-plot.sh
to convert every line to 4 spaces indentation.

Signed-off-by: Luis Martins <luis.martins@criticaltechworks.com>
---
 scripts/contrib/bb-perf/buildstats-plot.sh |  56 ++++-----
 scripts/contrib/bb-perf/buildstats.sh      | 131 +++++++++++----------
 2 files changed, 94 insertions(+), 93 deletions(-)

diff --git a/scripts/contrib/bb-perf/buildstats-plot.sh b/scripts/contrib/b=
b-perf/buildstats-plot.sh
index 320c4910a1..80fd30960c 100755
--- a/scripts/contrib/bb-perf/buildstats-plot.sh
+++ b/scripts/contrib/bb-perf/buildstats-plot.sh
@@ -72,40 +72,40 @@ EOM
=20
 # Parse and validate arguments
 while getopts "b:n:r:t:s:o:aSh" OPT; do
-	case $OPT in
-	b)
-		BS_DIR=3D"$OPTARG"
-		;;
-	n)
-		N=3D"$OPTARG"
-		;;
+    case $OPT in
+    b)
+        BS_DIR=3D"$OPTARG"
+        ;;
+    n)
+        N=3D"$OPTARG"
+        ;;
     r)
         RECIPE=3D"-r $OPTARG"
         ;;
     t)
         TASKS=3D"$OPTARG"
         ;;
-	s)
-	        STATS=3D"$OPTARG"
-	        ;;
-	a)
+    s)
+        STATS=3D"$OPTARG"
+        ;;
+    a)
         ACCUMULATE=3D"-a"
         ;;
-	S)
-	        SUM=3D"y"
-	        ;;
-	o)
-	        OUTDATA_FILE=3D"$OPTARG"
-	        ;;
-	h)
-		usage
-		exit 0
-		;;
-	*)
-		usage
-		exit 1
-		;;
-	esac
+    S)
+        SUM=3D"y"
+        ;;
+    o)
+        OUTDATA_FILE=3D"$OPTARG"
+        ;;
+    h)
+        usage
+        exit 0
+        ;;
+    *)
+        usage
+        exit 1
+        ;;
+    esac
 done
=20
 # Get number of stats
@@ -141,8 +141,8 @@ else
     declare -a sumargs
     j=3D0
     for i in `seq $nstats`; do
-	sumargs[j]=3Dsum; j=3D$(( $j + 1 ))
-	sumargs[j]=3D`expr 3 + $i - 1`;  j=3D$(( $j + 1 ))
+        sumargs[j]=3Dsum; j=3D$(( $j + 1 ))
+        sumargs[j]=3D`expr 3 + $i - 1`;  j=3D$(( $j + 1 ))
     done
=20
     # Do the processing with datamash
diff --git a/scripts/contrib/bb-perf/buildstats.sh b/scripts/contrib/bb-per=
f/buildstats.sh
index 2f017efeb8..e45cfc146d 100755
--- a/scripts/contrib/bb-perf/buildstats.sh
+++ b/scripts/contrib/bb-perf/buildstats.sh
@@ -66,62 +66,63 @@ EOM
=20
 # Parse and validate arguments
 while getopts "b:r:t:s:aHh" OPT; do
-	case $OPT in
-	b)
-		BS_DIR=3D"$OPTARG"
-		;;
-	r)
-		RECIPE=3D"$OPTARG"
-		;;
-	t)
-		TASKS=3D"$OPTARG"
-		;;
-	s)
-		STATS=3D"$OPTARG"
-		;;
-	a)
+    case $OPT in
+    b)
+        BS_DIR=3D"$OPTARG"
+        ;;
+    r)
+        RECIPE=3D"$OPTARG"
+        ;;
+    t)
+        TASKS=3D"$OPTARG"
+        ;;
+    s)
+        STATS=3D"$OPTARG"
+        ;;
+    a)
         ACCUMULATE=3D"y"
         ;;
-	H)
-	        HEADER=3D"y"
-	        ;;
-	h)
-		usage
-		exit 0
-		;;
-	*)
-		usage
-		exit 1
-		;;
-	esac
+    H)
+        HEADER=3D"y"
+        ;;
+    h)
+        usage
+        exit 0
+        ;;
+    *)
+        usage
+        exit 1
+        ;;
+    esac
 done
=20
 # Ensure the buildstats folder exists
 if [ ! -d "$BS_DIR" ]; then
-	echo "ERROR: $BS_DIR does not exist"
-	usage
-	exit 1
+    echo "ERROR: $BS_DIR does not exist"
+    usage
+    exit 1
 fi
=20
 stats=3D""
 IFS=3D":"
 for stat in ${STATS}; do
-	case $stat in
-	    TIME)
-		stats=3D"${stats}:${TIME}"
-		;;
-	    IO)
-		stats=3D"${stats}:${IO}"
-		;;
-	    RUSAGE)
-		stats=3D"${stats}:${RUSAGE}"
-		;;
-	    CHILD_RUSAGE)
-		stats=3D"${stats}:${CHILD_RUSAGE}"
-		;;
-	    *)
-		stats=3D"${STATS}"
-	esac
+    case $stat in
+        TIME)
+            stats=3D"${stats}:${TIME}"
+            ;;
+        IO)
+            stats=3D"${stats}:${IO}"
+            ;;
+        RUSAGE)
+            stats=3D"${stats}:${RUSAGE}"
+            ;;
+        CHILD_RUSAGE)
+            stats=3D"${stats}:${CHILD_RUSAGE}"
+            ;;
+        *)
+            stats=3D"${STATS}"
+            ;;
+    esac
 done
=20
 # remove possible colon at the beginning
@@ -140,27 +141,27 @@ for task in ${TASKS}; do
     task=3D"do_${task}"
     for file in $(find ${BS_DIR} -type f -path *${RECIPE}*/${task} | awk '=
BEGIN{ ORS=3D""; OFS=3D":" } { print $0,"" }'); do
         recipe=3D"$(basename $(dirname $file))"
-	times=3D""
-	for stat in ${stats}; do
-	    [ -z "$stat" ] && { echo "empty stats"; }
-	    time=3D$(sed -n -e "s/^\($stat\): \\(.*\\)/\\2/p" $file)
-	    # in case the stat is not present, set the value as NA
-	    [ -z "$time" ] && { time=3D"NA"; }
-	    # Append it to times
-	    if [ -z "$times" ]; then
-		times=3D"${time}"
-	    else
-		times=3D"${times} ${time}"
-	    fi
-	done
-    if [ -n "$ACCUMULATE" ]; then
-        IFS=3D' '; valuesarray=3D(${times}); IFS=3D':'
-        times=3D0
-        for value in "${valuesarray[@]}"; do
-            [ "$value" =3D=3D "NA" ] && { echo "ERROR: stat is not present=
."; usage; exit 1; }
-            times=3D$(( $times + $value ))
+        times=3D""
+        for stat in ${stats}; do
+            [ -z "$stat" ] && { echo "empty stats"; }
+            time=3D$(sed -n -e "s/^\($stat\): \\(.*\\)/\\2/p" $file)
+            # in case the stat is not present, set the value as NA
+            [ -z "$time" ] && { time=3D"NA"; }
+            # Append it to times
+            if [ -z "$times" ]; then
+                times=3D"${time}"
+            else
+                times=3D"${times} ${time}"
+            fi
         done
-    fi
+        if [ -n "$ACCUMULATE" ]; then
+            IFS=3D' '; valuesarray=3D(${times}); IFS=3D':'
+            times=3D0
+            for value in "${valuesarray[@]}"; do
+                [ "$value" =3D=3D "NA" ] && { echo "ERROR: stat is not pre=
sent."; usage; exit 1; }
+                times=3D$(( $times + $value ))
+            done
+        fi
         echo "${task} ${recipe} ${times}"
     done
 done
--=20
2.25.2

