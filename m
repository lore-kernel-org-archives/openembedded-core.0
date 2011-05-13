Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QL1yR-0002z7-7g
	for openembedded-core@lists.openembedded.org;
	Sat, 14 May 2011 01:40:47 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 13 May 2011 16:37:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,367,1301900400"; 
   d="scan'208";a="2029759"
Received: from unknown (HELO localhost) ([10.255.12.78])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2011 16:37:57 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 16:37:45 -0700
Message-Id: <5e5edceb6441c4e9400e0c510ba932a8b0a45b87.1305329659.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1305329659.git.dvhart@linux.intel.com>
References: <cover.1305329659.git.dvhart@linux.intel.com>
Subject: [RFC PATCH 06/10] send-pull-request: whitespace cleanup
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
X-List-Received-Date: Fri, 13 May 2011 23:40:47 -0000

Indent with tabs, not spaces, for consistency with other bash scripts.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/send-pull-request |  250 ++++++++++++++++++++++----------------------
 1 files changed, 125 insertions(+), 125 deletions(-)

diff --git a/scripts/send-pull-request b/scripts/send-pull-request
index 3af2a9f..76dd7a2 100755
--- a/scripts/send-pull-request
+++ b/scripts/send-pull-request
@@ -31,72 +31,72 @@ EOM
 # $2: The regex to match and strip from the line with email addresses
 harvest_recipients()
 {
-    TO_CC=$1
-    REGX=$2
-    export IFS=$',\n'
-    for PATCH in $PDIR/*.patch; do
-        # Grab To addresses
-        for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
-            if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
-                if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
-            elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
-                if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
-            fi
-        done
-    done
-    unset IFS
+	TO_CC=$1
+	REGX=$2
+	export IFS=$',\n'
+	for PATCH in $PDIR/*.patch; do
+		# Grab To addresses
+		for EMAIL in $(sed '/^---$/q' $PATCH | grep -e "$REGX" | sed "s/$REGX//"); do
+			if [ "$TO_CC" == "TO" ] && [ "${TO/$EMAIL/}" == "$TO" ] && [ -n "$EMAIL" ]; then
+				if [ -z "$TO" ]; then TO=$EMAIL; else TO="$TO,$EMAIL"; fi
+			elif [ "$TO_CC" == "CC" ] && [ "${CC/$EMAIL/}" == "$CC" ] && [ -n "$EMAIL" ]; then
+				if [ -z "$CC" ]; then CC=$EMAIL; else CC="$CC,$EMAIL"; fi
+			fi
+		done
+	done
+	unset IFS
 }
 
 
 # Parse and verify arguments
 while getopts "af:ghp:t:" OPT; do
-    case $OPT in
-        a)
-            AUTO=1
-            ;;
-        f)
-            FROM="$OPTARG"
-            ;;
-        g)
-            PULL_MTA="git"
-            ;;
-        h)
-            usage
-            exit 0
-            ;;
-        p)
-            PDIR=${OPTARG%/}
-            if [ ! -d $PDIR ]; then
-                echo "ERROR: pull-dir \"$PDIR\" does not exist."
-                usage
-                exit 1
-            fi
-            ;;
-        t)
-            if [ -n "$TO" ]; then
-                TO="$TO,$OPTARG"
-            else
-                TO="$OPTARG"
-            fi
-            ;;
-    esac
+	case $OPT in
+	a)
+		AUTO=1
+		;;
+	f)
+		FROM="$OPTARG"
+		;;
+	g)
+		PULL_MTA="git"
+		;;
+	h)
+		usage
+		exit 0
+		;;
+	p)
+		PDIR=${OPTARG%/}
+		if [ ! -d $PDIR ]; then
+			echo "ERROR: pull-dir \"$PDIR\" does not exist."
+			usage
+			exit 1
+		fi
+		;;
+	t)
+		if [ -n "$TO" ]; then
+			TO="$TO,$OPTARG"
+		else
+			TO="$OPTARG"
+		fi
+		;;
+	esac
 done
 
 if [ -z "$PDIR" ]; then
-    echo "ERROR: you must specify a pull-dir."
-    usage
-    exit 1
+	echo "ERROR: you must specify a pull-dir."
+	usage
+	exit 1
 fi
 
 
 # Verify the cover letter is complete and free of tokens
 CL="$PDIR/0000-cover-letter.patch"
 for TOKEN in SUBJECT BLURB; do
-    grep -q "*** $TOKEN HERE ***" "$CL"
-    if [ $? -eq 0 ]; then
-        echo "ERROR: Please edit $CL and try again (Look for '*** $TOKEN HERE ***')."
-        exit 1
-    fi
+	grep -q "*** $TOKEN HERE ***" "$CL"
+	if [ $? -eq 0 ]; then
+		echo "ERROR: Please edit $CL and try again (Look for '*** $TOKEN HERE ***')."
+		exit 1
+	fi
 done
 
 
@@ -104,39 +104,39 @@ done
 # In addition to To and CC headers/lines, the common Signed-off-by, Tested-by,
 # etc. (*-by) will be added to CC.
 if [ $AUTO -eq 1 ]; then
-    harvest_recipients TO "^[Tt][Oo]: *"
-    harvest_recipients CC "^[Cc][Cc]: *"
-    harvest_recipients CC "^.*-[Bb][Yy]: *"
+	harvest_recipients TO "^[Tt][Oo]: *"
+	harvest_recipients CC "^[Cc][Cc]: *"
+	harvest_recipients CC "^.*-[Bb][Yy]: *"
 fi
 
 case "$PULL_MTA" in
-    git)
-        FROM="$(git config sendemail.from)"
+git)
+	FROM="$(git config sendemail.from)"
 	AUTO_TO="$(git config sendemail.to)"
 	if [ -n "$AUTO_TO" ]; then
-	    if [ -n "$TO" ]; then
-		TO="$TO,$AUTO_TO"
-	    else
-		TO="$AUTO_TO"
-	    fi
+		if [ -n "$TO" ]; then
+			TO="$TO,$AUTO_TO"
+		else
+			TO="$AUTO_TO"
+		fi
+	fi
+	;;
+sendmail)
+	if [ -z "$FROM" ]; then
+		FROM="$(git config user.name) <$(git config user.email)>"
+		if [ -z "$FROM" ]; then
+			echo "ERROR: unable to determine a FROM address"
+			usage
+			exit 1
+		fi
 	fi
-        ;;
-    sendmail)
-        if [ -z "$FROM" ]; then
-            FROM="$(git config user.name) <$(git config user.email)>"
-            if [ -z "$FROM" ]; then
-                echo "ERROR: unable to determine a FROM address"
-                usage
-                exit 1
-            fi
-        fi
-        ;;
+	;;
 esac
 
 if [ -z "$TO" ] && [ -z "$CC" ]; then
-    echo "ERROR: you have not specified any recipients."
-    usage
-    exit 1
+	echo "ERROR: you have not specified any recipients."
+	usage
+	exit 1
 fi
 
 
@@ -155,55 +155,55 @@ echo "Continue? [y/N] "
 read cont
 
 if [ "$cont" == "y" ] || [ "$cont" == "Y" ]; then
-    ERROR=0
-    case "$PULL_MTA" in
-        git)
-            export IFS=$','
-            GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
-            GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
-            unset IFS
-            for PATCH in $PDIR/*patch; do
-                # We harvest the emails manually, so force git not to.
-                eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
-                if [ $? -eq 1 ]; then
-                    ERROR=1
-                fi
-            done
-            ;;
-        sendmail)
-            for PATCH in $PDIR/*patch; do
-                # Insert To and CC headers via formail to keep them separate and
-                # appending them to the sendmail command as -- $TO $CC has
-                # proven to be an exercise in futility.
-                #
-                # Clear the From header, leaving it up to sendmail to insert an
-                # appropriate one. Insert the original sender (per git) into the
-                # body of the message.
-                #
-                # Use tail to remove the email envelope from git or formail as
-                # msmtp (sendmail) would choke on them.
-                #
-                # Modify the patch date for sequential delivery, but retain the
-                # original date as "Old-Date".
-                DATE=$(date +"%a, %d %b %Y %k:%M:%S %z")
-                GIT_FROM=$(cat $PATCH | formail -X "From:")
-                cat $PATCH | formail -I "To: $TO" -I "CC: $CC" -I "From: $FROM" -i "Date: $DATE" | sed "0,/^$/s/^$/\n$GIT_FROM\n/" | tail -n +2 | sendmail -t
-                if [ $? -eq 1 ]; then
-                    ERROR=1
-                fi
-            done
-            ;;
-        *)
-            echo "ERROR: unknown MTA: $PULL_MTA"
-            usage
-            exit 1
-            ;;
-    esac
-
-    if [ $ERROR -eq 1 ]; then
-        echo "ERROR: Failed to send one or more messages. Check your MTA log for details."
-    fi
+	ERROR=0
+	case "$PULL_MTA" in
+	git)
+		export IFS=$','
+		GIT_TO=$(for R in $TO; do echo -n "--to='$R' "; done)
+		GIT_CC=$(for R in $CC; do echo -n "--cc='$R' "; done)
+		unset IFS
+		for PATCH in $PDIR/*patch; do
+			# We harvest the emails manually, so force git not to.
+			eval "git send-email $GIT_TO $GIT_CC --no-chain-reply-to --suppress-cc=all $PATCH"
+			if [ $? -eq 1 ]; then
+				ERROR=1
+			fi
+		done
+		;;
+	sendmail)
+		for PATCH in $PDIR/*patch; do
+			# Insert To and CC headers via formail to keep them separate and
+			# appending them to the sendmail command as -- $TO $CC has
+			# proven to be an exercise in futility.
+			#
+			# Clear the From header, leaving it up to sendmail to insert an
+			# appropriate one. Insert the original sender (per git) into the
+			# body of the message.
+			#
+			# Use tail to remove the email envelope from git or formail as
+			# msmtp (sendmail) would choke on them.
+			#
+			# Modify the patch date for sequential delivery, but retain the
+			# original date as "Old-Date".
+			DATE=$(date +"%a, %d %b %Y %k:%M:%S %z")
+			GIT_FROM=$(cat $PATCH | formail -X "From:")
+			cat $PATCH | formail -I "To: $TO" -I "CC: $CC" -I "From: $FROM" -i "Date: $DATE" | sed "0,/^$/s/^$/\n$GIT_FROM\n/" | tail -n +2 | sendmail -t
+			if [ $? -eq 1 ]; then
+				ERROR=1
+			fi
+		done
+		;;
+	*)
+		echo "ERROR: unknown MTA: $PULL_MTA"
+		usage
+		exit 1
+		;;
+	esac
+
+	if [ $ERROR -eq 1 ]; then
+		echo "ERROR: Failed to send one or more messages. Check your MTA log for details."
+	fi
 else
-    echo "Send aborted."
+	echo "Send aborted."
 fi
 
-- 
1.7.1



