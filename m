Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 98CA760112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 13:42:33 +0000 (UTC)
Received: by wmvv187 with SMTP id v187so72504887wmv.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dresearch-fe-de.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=EXf1uEsBPtImI0R0WiGo/pkMAVfhW0LYbxA62s+xYow=;
	b=Jbq3wiqnqt9TY+pxF16bPO04TqtpNvUbGsV+ebAGIciUvFuuNwi9URrbruktrFJRTt
	azW7QEIcdJ8kM+tgU2879Q3sr6pwqckx9WoVXJ44myvXKDUr6tbVQu66lUOx7LdvBI3Q
	1tkeNExGbxoAXZhlQT112JFjhHZDy4wjeP1CWh1XaF3qwdFKwniReykrABKkaCYf/Iob
	uNKe+ACXcSkkAxlbkAMS7lXsT2kzDUnl6kLNvba2vCb6QP3nYJ4i1DK2GApgpddTEvt3
	0uUrUuT3wFzwApBPXS1bazbRHQLOjyDk/ZRkiIl7pj8cgTN8MOmDweEmhm2/EP2tv2dv
	VPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=EXf1uEsBPtImI0R0WiGo/pkMAVfhW0LYbxA62s+xYow=;
	b=O06thRdAHWrSE36N53jVihn4jT4BgC8KHeIBcAYKF4JW8jUQgAEGOPIXQou3DdJQ+Y
	Ioq58cql+DCW7R+sBh//coEsbUe3Jmfgd10Zdwf25f4H/V0sfdrb3UPUsbgLHulhpUcR
	aJL6t88nsf764b4MfJ3J52sGOmqtMlnjBIqgB9MGH7bY5CpoFCM+uPM0P//cyMa+erfd
	BZjUjo5hzFn6TBHRf4fD9Es4S6XKqf9IXz259wIoXrrTgwU5IJVdWCmE5qpuMeoPdsAV
	muvcGaxXOu2oir+Z3FA1sjnrej5kzOeegFgQM+h4vRACUqk495bjJRr/Rbclay+9CRnu
	GYHw==
X-Gm-Message-State: ALoCoQlF9ZnNf+b/4NrY+8rEuvJLT4xNPC1pqlILPOHgCcyk1z0lse538Z3Y66/07H04c+fquCmw
X-Received: by 10.194.116.167 with SMTP id jx7mr14684013wjb.105.1448026953610; 
	Fri, 20 Nov 2015 05:42:33 -0800 (PST)
Received: from [172.29.23.46] (zk223.dresearch-fe.de. [217.92.177.116])
	by smtp.googlemail.com with ESMTPSA id
	kj3sm12783814wjb.19.2015.11.20.05.42.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Nov 2015 05:42:32 -0800 (PST)
To: ChenQi <Qi.Chen@windriver.com>, Kang Kai <kai.kang@windriver.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Ross Burton <ross.burton@intel.com>, Radu Moisan <radu.moisan@intel.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	=?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>,
	Khem Raj <raj.khem@gmail.com>, Koen Kooi <koen@dominion.thruhere.net>, 
	Jonathan Liu <net147@gmail.com>
References: <5649BDDE.6030107@dresearch-fe.de>
	<564AE081.30004@dresearch-fe.de> <564CA3F8.9020404@dresearch-fe.de>
	<564DDDE4.20002@dresearch-fe.de> <564EE292.5070704@windriver.com>
From: Steffen Sledz <sledz@dresearch-fe.de>
X-Enigmail-Draft-Status: N1110
Message-ID: <564F2347.1010308@dresearch-fe.de>
Date: Fri, 20 Nov 2015 14:42:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <564EE292.5070704@windriver.com>
Subject: Re: systemd service vs. update-alternatives (was rsyslog: buggy systemd/ua handling?)
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
X-List-Received-Date: Fri, 20 Nov 2015 13:42:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 20.11.2015 10:06, ChenQi wrote:
> I sent out a series of patches regarding syslog & systemd some time ago.
> The title is "[OE-core] [PATCH V3 0/4] Fixes for systemd services in systemd".
> Codes regarding update-alternatives and syslog for 'rsyslog' recipe is actually part of the whole fix.
> You could try the patch series to see if they work for you.

I've applied your four patches to our fido based build environment (with a little modification because systemd was updated from 216 to 219).

Here are the results of my first tests:

----------------------------------------------------------------------
(1) busybox-syslog only

Everything seems to be OK.

----------------------------------------------------------------------
(2) opkg install sysklogd_1.5.1-r0.0_armv5e.ipk

Job for sysklogd.service failed. See "systemctl status sysklogd.service" and "journalctl -xe" for details.
Collected errors:
 * pkg_run_script: package "sysklogd" postinst script returned status 1.
 * opkg_configure: sysklogd.postinst returned 1.

# ps aux | grep syslog;ll /etc/systemd/system/*syslog*;ll /sbin/syslogd;systemctl status syslog.service;systemctl status busybox-syslog.service;systemctl status sysklogd.service
root     24123  0.0  0.1   2256  1528 ?        Ss   13:21   0:00 /sbin/syslogd -n -C
root     24291  0.0  0.1   2244  1272 pts/0    S+   13:22   0:00 grep syslog
lrwxrwxrwx    1 root     root            36 Nov 20 13:21 /etc/systemd/system/syslog.service -> /lib/systemd/system/sysklogd.service
lrwxrwxrwx    1 root     root            22 Nov 20 13:21 /sbin/syslogd -> /sbin/syslogd.sysklogd*
● sysklogd.service - System Logging Service
   Loaded: loaded (/lib/systemd/system/sysklogd.service; enabled; vendor preset: enabled)
   Active: failed (Result: exit-code) since Fri 2015-11-20 13:21:57 UTC; 24s ago
  Process: 24278 ExecStart=/sbin/syslogd $SYSLOGD (code=exited, status=1/FAILURE)
● busybox-syslog.service - System Logging Service
   Loaded: loaded (/lib/systemd/system/busybox-syslog.service; indirect; vendor preset: enabled)
   Active: active (running) since Fri 2015-11-20 13:21:14 UTC; 1min 8s ago
 Main PID: 24123 (syslogd)
   CGroup: /system.slice/busybox-syslog.service
           └─24123 /sbin/syslogd -n -C
● sysklogd.service - System Logging Service
   Loaded: loaded (/lib/systemd/system/sysklogd.service; enabled; vendor preset: enabled)
   Active: failed (Result: exit-code) since Fri 2015-11-20 13:21:57 UTC; 24s ago
  Process: 24278 ExecStart=/sbin/syslogd $SYSLOGD (code=exited, status=1/FAILURE)

So the symlinks seem to be OK. But why is busybox-syslog.service as running and sysklogd.service as failed.

----------------------------------------------------------------------
(3) opkg remove sysklogd

Warning: Stopping sysklogd.service, but it can still be activated by:
  syslog.socket

Evrything seems to be OK. All symlinks are set right. sysklogd.service is reported as not-found

----------------------------------------------------------------------
(4) opkg install sysklogd_1.5.1-r0.0_armv5e.ipk

This time no postinst error. But two syslogd instances are running and busybox-syslog.service is reported as running again.

# ps aux | grep syslog;ll /etc/systemd/system/*syslog*;ll /sbin/syslogd;systemctl status syslog.service;systemctl status busybox-syslog.service;systemctl status sysklogd.service
root     24123  0.0  0.1   2256  1528 ?        Ss   13:21   0:00 /sbin/syslogd -n -C
root     24647  0.0  0.1   1788  1420 ?        Ss   13:23   0:00 /sbin/syslogd
root     24653  0.0  0.1   2244  1260 pts/0    S+   13:24   0:00 grep syslog
lrwxrwxrwx    1 root     root            36 Nov 20 13:23 /etc/systemd/system/syslog.service -> /lib/systemd/system/sysklogd.service
lrwxrwxrwx    1 root     root            22 Nov 20 13:23 /sbin/syslogd -> /sbin/syslogd.sysklogd*
● sysklogd.service - System Logging Service
   Loaded: loaded (/lib/systemd/system/sysklogd.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2015-11-20 13:23:55 UTC; 12s ago
  Process: 24646 ExecStart=/sbin/syslogd $SYSLOGD (code=exited, status=0/SUCCESS)
 Main PID: 24647 (syslogd)
   CGroup: /system.slice/sysklogd.service
           └─24647 /sbin/syslogd
● busybox-syslog.service - System Logging Service
   Loaded: loaded (/lib/systemd/system/busybox-syslog.service; indirect; vendor preset: enabled)
   Active: active (running) since Fri 2015-11-20 13:21:14 UTC; 2min 52s ago
 Main PID: 24123 (syslogd)
   CGroup: /system.slice/busybox-syslog.service
           └─24123 /sbin/syslogd -n -C
● sysklogd.service - System Logging Service
   Loaded: loaded (/lib/systemd/system/sysklogd.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2015-11-20 13:23:55 UTC; 12s ago
  Process: 24646 ExecStart=/sbin/syslogd $SYSLOGD (code=exited, status=0/SUCCESS)
 Main PID: 24647 (syslogd)
   CGroup: /system.slice/sysklogd.service
           └─24647 /sbin/syslogd

----------------------------------------------------------------------

So my first conclusion: It looks much better but not perfect yet.

I'll do some more researches next week.

Regards,
Steffen

PS: What's the better place for this discussion? This mailing list? Or <https://bugzilla.yoctoproject.org/show_bug.cgi?id=8688>?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

