Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E149F60745
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 14:44:46 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g73so90422451ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 06:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=TveoJrXtpEMSJ0HUGS0Ir8qBXTZ2hYH9GcNSoASxc5Y=;
	b=VtWIqzeedHt60yHzbrNpYCAilJcps2f98aNP8pdfMV6yhCiVyHvClhMi27zCB4JGyr
	CWnmTaTM308KfVtmlXokfa2kmHKIgkiem2Lv6mKpi7Shq6o3dEVtDOs1QpygUaJacM1C
	KPiB+r6InF32qfyofnriZBkAolw7/y/MD45yjXKC6QMGSYDLZWOJ9z+EicshH1rUYL5k
	+AToVrYLlEalQGwC0ej0wqQS7u48pPYDwtog4IaXjdVNB9T3RQOoHE02twJVQ+VsJh/5
	3oSlKy71R2RiePZJrTptaIStBD6WEoA2EhpVJdKjG8KurVEt3sybYxttlHXkD1+UoJc3
	P+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=TveoJrXtpEMSJ0HUGS0Ir8qBXTZ2hYH9GcNSoASxc5Y=;
	b=Hwn992yaEe/DhS+XnMr3R2JLjQZetSOJPGsW5Az58c0z98jtBtgF8CEj2mH6pnEGVw
	04Ec0wH2buLzEl2yUrbAqhS7YgKNcLMEeIOoMvmJk9OEQ3zu/jHmQ3bUPhHs5CTKyD1W
	LQQ2D20BuebTWDcrP5Arn7DYIkzO3cvoggBPVijmg82sKCC40sfh3x4TV3uS1J3RmNjG
	MoRcz/TEE+ladiXlA2lgG/iZ4Y4gXyJ/FXe8rYj2A1McndAWlKl+m/sBZv+2Opjh1pn7
	+5Hw4JRaXO9sQSRdpnccGzkzu7CzVmcKIAPLSYROExcx7y1AvofXBHhJrD7/ZobvjyuL
	Xvbg==
X-Gm-Message-State: ALoCoQl+eisrI9xEDONF4vx9eOMOzUkWz3rVpWMh9C+2n50QJT7FZ9gHJnGF4jGusvCoL1gdP9uUW/XIB3hqDKFxlkwb/OPk7Q==
X-Received: by 10.107.13.4 with SMTP id 4mr83398912ion.124.1452264287162;
	Fri, 08 Jan 2016 06:44:47 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F2CE.dip0.t-ipconnect.de. [93.232.242.206])
	by smtp.gmail.com with ESMTPSA id
	wy7sm6813365igb.14.2016.01.08.06.44.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jan 2016 06:44:46 -0800 (PST)
Message-ID: <1452264284.17716.16.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Date: Fri, 08 Jan 2016 15:44:44 +0100
In-Reply-To: <73c4db7e6c63768735002961feb9c95815d352ea.1448030272.git.andrew.shadura@collabora.co.uk>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
	<73c4db7e6c63768735002961feb9c95815d352ea.1448030272.git.andrew.shadura@collabora.co.uk>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] dbus: add user sessions support
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
X-List-Received-Date: Fri, 08 Jan 2016 14:44:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-11-20 at 15:38 +0100, Andrew Shadura wrote:
> Enable the user-sessions support with a PACKAGECONFIG flag.

I've tried this out in combination with the D-Bus 1.10 update patches.
It's perhaps worth pointing out that user sessions only work in
combination with pam.

I also found that one minor fix was needed in
meta/recipes-core/dbus/dbus_1.10.2.bb. Andrew, Ross, feel free to just
squash that into the pending patch.

But overall it looked good, so I'd love to have this in OE-core.

https://github.com/pohly/poky/commit/5b32e63f9e37492cef8de7aabfae562ab072b510

commit 5b32e63f9e37492cef8de7aabfae562ab072b510
Author: Patrick Ohly <patrick.ohly@intel.com>
Date:   Fri Jan 8 15:34:50 2016 +0100

    dbus_1.10.2.bb: fix path to systemctl
    
    When compiling with systemd, pam and user sessions, the resulting
    /usr/lib/systemd/user/dbus.socket ensures that the right
    DBUS_SESSION_BUS_ADDRESS gets put into the environment when logging
    into the system.
    
    The default configure behavior is to look in the PATH, which picks up
    the tool from the host sysroot. We need to override that so that the
    final location on the target is used instead. This is only relevant at
    the moment when enabling user sessions, but it makes sense to fix the
    value in all cases.
    
    Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>

diff --git a/meta/recipes-core/dbus/dbus_1.10.2.bb b/meta/recipes-core/dbus/dbus_1.10.2.bb
index ffb428b..a6cb649 100644
--- a/meta/recipes-core/dbus/dbus_1.10.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.10.2.bb
@@ -96,6 +96,10 @@ EXTRA_OECONF = "--disable-tests \
 
 EXTRA_OECONF_append_class-native = " --disable-selinux"
 
+# Automatic detection in the configure script picks up the path to
+# the native tool, therefore we must override the automatism.
+EXTRA_OECONF_append_class-target = " SYSTEMCTL=${base_bindir}/systemctl"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
 PACKAGECONFIG_class-native = ""

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




