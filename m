Received: from mx.insigma.com.cn ([115.236.48.170] helo=WX-Edge.insigma.com.cn)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang@insigma.com.cn>) id 1RktQy-0001XX-LZ
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 09:21:24 +0100
Received: from WX-EXCHMB2.insigma.com.cn (10.0.1.203) by
	WX-Edge.insigma.com.cn (10.0.1.205) with Microsoft SMTP Server (TLS) id
	8.1.436.0; Wed, 11 Jan 2012 16:13:43 +0800
Received: from [192.168.0.98] (122.224.76.38) by Wx-ExchMB2.insigma.com.cn
	(10.0.1.203) with Microsoft SMTP Server id 8.1.436.0; Wed, 11 Jan 2012
	16:13:38 +0800
Message-ID: <1326269523.12463.3.camel@localhost.localdomain>
From: Ni Qingliang <niqingliang@insigma.com.cn>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Jan 2012 16:12:03 +0800
Organization: Insigma
X-Mailer: Evolution 3.2.3 
MIME-Version: 1.0
Subject: does busybox 1.19 still support the arg `-m'?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: niqingliang@insigma.com.cn,
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
X-List-Received-Date: Wed, 11 Jan 2012 08:21:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

in file meta/recipes-core/busybox/files/syslog
I found code section:
	if [ -n "$MARKINT" ]; then
		SYSLOG_ARGS="$SYSLOG_ARGS -m $MARKINT"
	fi
but I can't find `-m' in the help of syslogd.


syslogd --help                                                    
BusyBox v1.19.3 (2012-01-11 12:34:06 CST) multi-call binary.

Usage: syslogd [OPTIONS]

System logging utility

        -n              Run in foreground
        -O FILE         Log to FILE (default:/var/log/messages)
        -l N            Log only messages more urgent than prio N (1-8)
        -S              Smaller output
        -s SIZE         Max size (KB) before rotation (default:200KB,
0=off)
        -b N            N rotated logs to keep (default:1, max=99,
0=purge)
        -R HOST[:PORT]  Log to IP or hostname on PORT (default
PORT=514/UDP)
        -L              Log locally and via network (default is network
only if)
        -C[size_kb]     Log to shared mem buffer (use logread to read
it)
        -f FILE         Use FILE as config (default:/etc/syslog.conf)

-- 
Yi Qingliang
niqingliang@insigma.com.cn
https://niqingliang2003.wordpress.com



