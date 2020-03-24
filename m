Received: from EUR02-HE1-obe.outbound.protection.outlook.com (EUR02-HE1-obe.outbound.protection.outlook.com [])
 by mx.groups.io with SMTP id smtpd.web11.3774.1585049599895105746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 04:33:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@criticaltechworks.onmicrosoft.com header.s=selector2-criticaltechworks-onmicrosoft-com header.b=qZCCvcIb;
 spf=permerror, err=parse error for token &{10 18 spf.kmitd.com}: permanent DNS error (domain: criticaltechworks.com, ip: <nil>, mailfrom: luis.martins@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FnjEIDcKLfrIXdE49Nmg0gkT8BumEkiE3OHbC1RE8d2LDvmumVs5OYZIKL6hQ0Ye279L67Vhyr/QtcIjxo0hOfVjwJkU8VXpWIcfQ+qCmvbBUk8Jr0UGacuns4I1xYLh9FXRucEOc1ts0D2dggKfgis/BCeF7XpZGqGGyQ19kCfc2puBx4u2AC36m+eZKMVk+tGPwDLSGAI5MP5ehYfVwxrWrqOuZWarvZ4CPk5hd2K3wcRK0ceVBvms3QX6la9JtjsyWmUijI7t4V2v/vjVIX0IKcISkz//7SDW2DZFPNU94Dx/3y3Dz9os8oI/sJUg0luBLuAhm3xRrCbQZWmRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg3tvk7jZoMOF9vM5o23tzSWBbVoXrUlRc1UcWWEsso=;
 b=GobVC4pp4FzwJ2BYw4CSG9wXKs5B7XdrpU89ZWTJmKWQzVLTBD2WfVhThE093zDIMLXDlxVpwWUUUZjOXIvrqp6ZFxfVyopAmm62/grrdni1gNrfa8TQTGQSDxfY5BIgqBJZHf6ZXkb0z6h6Od2NEuRNsPu+xk+TfbiLD7qa2WrlkPljlFJLKn4hiAdlXvSyZ9myickuui1YUNKsARHGhxxoP29+bymngPJex4tSJCJrRTkN2f7Wo2QoWzkBqKhNpogm15Jc7qzVMfz1LtkScyuIiXcyHPsnQDTNl5rt89tEtX1+yr7/F3yf0QPREDsfx4dr042xJoIkciAIbjj61A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticaltechworks.onmicrosoft.com;
 s=selector2-criticaltechworks-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg3tvk7jZoMOF9vM5o23tzSWBbVoXrUlRc1UcWWEsso=;
 b=qZCCvcIbNB2GlqmAPDBHASCQJJvcmd8IBwlExRfofePVVtmGoF/1068oGkm8xDU6LiXLzy5C5jeWNrXeInA0qdgSjJgJF2Pu4Oe7/wWzE+ZUJb9Mdst4qM9l1ivo58VowMVgfEPSO6nyHfto1JWKy2jvgSxb7dCt+m0DTbcpEXA=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Luis.Martins@criticaltechworks.com; 
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM (52.134.109.21) by
 DB7P193MB0284.EURP193.PROD.OUTLOOK.COM (52.134.111.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2835.15; Tue, 24 Mar 2020 11:33:18 +0000
Received: from DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1]) by DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 ([fe80::a0cd:4b77:8f8f:c6e1%3]) with mapi id 15.20.2835.021; Tue, 24 Mar 2020
 11:33:18 +0000
From: "Luis Martins" <luis.martins@criticaltechworks.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] buildstats*.sh: fix spacing indentation in the files
Date: Tue, 24 Mar 2020 11:33:13 +0000
Message-ID: <20200324113313.39528-6-luis.martins@criticaltechworks.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
References: <20200324113313.39528-1-luis.martins@criticaltechworks.com>
X-ClientProxiedBy: LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5e::23) To DB7P193MB0282.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:5:1b::21)
Return-Path: luis.martins@criticaltechworks.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (213.205.68.220) by LNXP265CA0011.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:5e::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.18 via Frontend Transport; Tue, 24 Mar 2020 11:33:17 +0000
X-Mailer: git-send-email 2.25.2
X-Originating-IP: [213.205.68.220]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ac038a8-2773-431c-32b3-08d7cfe72605
X-MS-TrafficTypeDiagnostic: DB7P193MB0284:
X-Microsoft-Antispam-PRVS: 
	<DB7P193MB02845E94DFE6B88F397F9C9285F10@DB7P193MB0284.EURP193.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:338;
X-Forefront-PRVS: 03524FBD26
X-Forefront-Antispam-Report: 
	SFV:NSPM;SFS:(10009020)(4636009)(366004)(136003)(39850400004)(396003)(346002)(376002)(5660300002)(6506007)(36756003)(478600001)(44832011)(26005)(52116002)(6512007)(16526019)(2906002)(186003)(6666004)(6486002)(1076003)(81166006)(81156014)(956004)(8936002)(8676002)(66476007)(69590400007)(6916009)(66946007)(2616005)(66556008)(86362001)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB7P193MB0284;H:DB7P193MB0282.EURP193.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;
Received-SPF: None (protection.outlook.com: criticaltechworks.com does not
 designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0XrNl0A0XpBEtBvFkUoYwwkZHzQxEQxbDTylRxEjwU/DHTYFolNk3hwafLjagokmvrQLKKySsqaNR2qte0a/GK9YmOXTp7Qlg5gzyfjfJPCNzUCwsFV5h4g2JaYrIiGlw6WZessXV4WH9WPkOgxsnyqTqd+ijwy5qZt/E9kLZ+P5mFPYQFlLBzeOXg9/CQKvtErAMS06+iCuOPahEjbYCchylNxkfQ57QvS134eeDzvC1ODckPDhKAVaVV7KxM6KyEkKMd8gswWE7J7YovJPyAkiHyQgAT80+COQ7AFz9rBz5itphflbGlpXwlNAydCXmbXgTIgbjJxDCZTx+rixpJjnKiJaHHUqBySK0Zhf6fv9DEUunIDFugFewZTeVAn2a33u6PQMfb3nioxRQazFWCn5bOJgCLSgv6neHQr4GQOUHGqAe45TKyLk+ZrMfS0wMuX4jG18yuTI7tWJG4sb6l3wd3auXgpKntRKWTylmh5CVMQvHhNNtAayNDveb7Y+
X-MS-Exchange-AntiSpam-MessageData: 
	8xIcbv1lCFAJyeZz29S5cZq1xqaTO2RnuWgjRT8zh/NPhPscZ4ruLtQZ6GknOtSpdfBZl/OfPfD9XHQVOKAxkNl+cyUrpZwxGuOG3+3FqQMocrmVv1yVspouVjC5sQUP6MSBA06/G9y5NeuopL0Uvw==
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac038a8-2773-431c-32b3-08d7cfe72605
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2020 11:33:18.2032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+w2ap9CrPF2JVkAy9vXNHUnjpHwl2/NSi1T7I4AUlkE8SBpRzx9xZVHamMY7UZnVpfXXJikIiIwOE3rnZMlyIIQHK79qfCf2zxiJvsgzgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7P193MB0284
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Fix indentation in buildstats.sh and buildstats-plot.sh
to convert every line to 4 spaces indentation.

Upstream-Status: Pending

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

