Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 93B7A731A6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:49:44 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2015 03:49:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,446,1444719600"; d="scan'208";a="620129490"
Received: from irsmsx152.ger.corp.intel.com ([163.33.192.66])
	by FMSMGA003.fm.intel.com with ESMTP; 18 Dec 2015 03:49:44 -0800
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.203]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.143]) with mapi id
	14.03.0248.002; Fri, 18 Dec 2015 11:49:43 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: "Musat, George L" <george.l.musat@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] oeqa/runtime: Added wifi tests.
Thread-Index: AQHRI4hsYx9F8J6BFEqn7kntdHQvL57QzTnA
Date: Fri, 18 Dec 2015 11:49:42 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB44C393E1@irsmsx105.ger.corp.intel.com>
References: <1448019722-24279-1-git-send-email-george.l.musat@intel.com>
In-Reply-To: <1448019722-24279-1-git-send-email-george.l.musat@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiZmYzODcyMDktYjAwMy00YTA0LTkwNDItYjFlNDVkZTA2ODk0IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjQuMTAuMTkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiY3k5TlB0RXdZeFBLcWpFSUJWSkZIUWs1XC9uWkN4SnRyT2FCRDVlTG1JeVk9In0=
x-ctpclassification: CTP_IC
x-originating-ip: [163.33.239.181]
MIME-Version: 1.0
Subject: Re: [PATCH] oeqa/runtime: Added wifi tests.
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
X-List-Received-Date: Fri, 18 Dec 2015 11:49:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.

-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Lucian Musat
Sent: Friday, November 20, 2015 1:42 PM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] oeqa/runtime: Added wifi tests.

A few wifi tests ported from IOT. They use expect scripts to connect and an=
 external config file for the SSIDs and passwords.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/files/config.ini             |  10 ++
 meta/lib/oeqa/runtime/files/wifi_connect.exp       |  47 +++++
 .../lib/oeqa/runtime/files/wifi_hidden_connect.exp |  47 +++++
 meta/lib/oeqa/runtime/wifi.py                      | 195 +++++++++++++++++=
++++
 meta/lib/oeqa/utils/helper.py                      |  62 +++++++
 5 files changed, 361 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/files/config.ini
 create mode 100755 meta/lib/oeqa/runtime/files/wifi_connect.exp
 create mode 100755 meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp
 create mode 100644 meta/lib/oeqa/runtime/wifi.py  create mode 100644 meta/=
lib/oeqa/utils/helper.py

diff --git a/meta/lib/oeqa/runtime/files/config.ini b/meta/lib/oeqa/runtime=
/files/config.ini
new file mode 100644
index 0000000..eaa169a
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/config.ini
@@ -0,0 +1,10 @@
+[Connect]
+ssid_80211g=3D
+ssid_80211n=3D
+ssid_80211b=3D
+passwd_80211b=3D
+passwd_80211g=3D
+passwd_80211n=3D
+ssid_broadcast=3D
+passwd_broadcast=3D
+
diff --git a/meta/lib/oeqa/runtime/files/wifi_connect.exp b/meta/lib/oeqa/r=
untime/files/wifi_connect.exp
new file mode 100755
index 0000000..c0a0775
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/wifi_connect.exp
@@ -0,0 +1,47 @@
+#!/usr/bin/expect
+set timeout 100
+set login 0
+set ip       [lindex $argv 0]
+set cmd      [lindex $argv 1]
+set service  [lindex $argv 2]
+set password [lindex $argv 3]
+
+spawn ssh root@$ip -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyCheck=
ing=3Dno -o LogLevel=3DERROR "$cmd"
+ expect {
+ "Agent registered"
+   {
+    send "config $service --remove\n";
+    sleep 2; send "connect $service\n"; exp_continue
+   }
+ "Operation timeout"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Operation aborted"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Input/output error"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Retry (yes/no)?"
+   {
+    sleep 1; send "yes\n"; exp_continue
+   }
+ "Passphrase?"
+   {
+    sleep 1; send "$password\n"; exp_continue
+   }
+ "Connected wifi*"
+   {
+    send "exit\n"; exit 2
+   }
+ "connmanctl*"
+   {
+    if {$login=3D=3D0} {set login 1;send "agent on\n"; exp_continue} else =
{exp_continue}
+   }
+ eof
+   {}
+ }
+
diff --git a/meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp b/meta/lib=
/oeqa/runtime/files/wifi_hidden_connect.exp
new file mode 100755
index 0000000..0e0f45f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/files/wifi_hidden_connect.exp
@@ -0,0 +1,47 @@
+#!/usr/bin/expect
+set timeout 100
+set login 0
+set ip       [lindex $argv 0]
+set cmd      [lindex $argv 1]
+set service  [lindex $argv 2]
+set ssid     [lindex $argv 3]
+set password [lindex $argv 4]
+
+spawn ssh root@$ip -o UserKnownHostsFile=3D/dev/null -o StrictHostKeyCheck=
ing=3Dno -o LogLevel=3DERROR "$cmd"
+ expect {
+ "Agent registered"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Operation timeout"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Input/output error"
+   {
+    sleep 1; send "connect $service\n"; exp_continue
+   }
+ "Hidden SSID name?"
+   {
+    sleep 1; send "$ssid\n"; exp_continue
+   }
+ "Retry (yes/no)?"
+   {
+    sleep 1; send "yes\n"; exp_continue
+   }
+ "Passphrase?"
+   {
+    sleep 1; send "$password\n"; exp_continue
+   }
+ "Connected wifi*"
+   {
+    send "exit\n"; exit 2
+   }
+ "connmanctl*"
+   {
+    if {$login=3D=3D0} {set login 1;send "agent on\n"; exp_continue} else =
{exp_continue}
+   }
+ eof
+   {}
+ }
+
diff --git a/meta/lib/oeqa/runtime/wifi.py b/meta/lib/oeqa/runtime/wifi.py =
new file mode 100644 index 0000000..c63a711
--- /dev/null
+++ b/meta/lib/oeqa/runtime/wifi.py
@@ -0,0 +1,195 @@
+import time
+import os
+import string
+import ConfigParser
+import unittest
+from oeqa.oetest import oeRuntimeTest
+from oeqa.utils.helper import shell_cmd_timeout from oeqa.utils.helper=20
+import get_files_dir from oeqa.utils.decorators import skipUnlessPassed
+
+def setUpModule():
+    if not oeRuntimeTest.hasPackage("connman"):
+        skipModule("Image does not have connection manager")
+
+ssid_config =3D ConfigParser.ConfigParser() config_path =3D=20
+os.path.join(os.path.dirname(__file__), "files/config.ini")
+ssid_config.readfp(open(config_path))
+
+class CommWiFiConect(oeRuntimeTest):
+
+    @classmethod
+    def setUpClass(self):
+        (status, output) =3D oeRuntimeTest.tc.target.run('connmanctl enabl=
e wifi')
+        if ("error" in output.lower()):
+            raise unittest.SkipTest("Failed to enable wifi: %s " % output)
+        oeRuntimeTest.tc.target.run('connmanctl disable wifi')
+
+    hidden_service =3D ""
+    def setUp(self):
+        # un-block software rfkill lock
+        self.target.run('rfkill unblock all')
+        # Enable WiFi
+        (status, output) =3D self.target.run('connmanctl enable wifi')
+        self.assertEqual(status, 0, msg=3D"Error messages: %s" % output)
+        time.sleep(20)
+        # Scan nearby to get service of none-encryption broadcasting ssid
+        hidden_str =3D "hidden_managed_psk"
+        # will do scan retry 3 times if needed
+        retry =3D 0
+        while (retry < 4):
+            (status, output) =3D self.target.run('connmanctl scan wifi')
+            self.assertEqual(status, 0, msg=3D"Error messages: %s" % outpu=
t)
+            (status, services) =3D self.target.run("connmanctl services | =
grep %s" % hidden_str)
+            retry =3D retry + 1
+            if (status =3D=3D 0):
+                break
+        self.assertEqual(status, 0, msg=3D"Not found hidden AP service")
+        self.hidden_service =3D services.strip()
+
+    def tearDown(self):
+        ''' disable wifi after testing '''
+        self.target.run('connmanctl disable wifi')
+
+    def check_wifi_ip(self):
+        time.sleep(3)
+        # Check ip address by ifconfig command
+        wifi_interface =3D "nothing"
+        (status, wifi_interface) =3D self.target.run("ifconfig | grep '^wl=
p\|^wlan' | awk '{print $1}'")
+        (status, output) =3D self.target.run("ifconfig %s | grep 'inet add=
r:'" % wifi_interface)
+        self.assertEqual(status, 0, msg=3D"Error messages: %s" % output)
+
+    def test_check_wifi_capable(self):
+        (status, output) =3D self.target.run('cp /proc/config.gz .; gunzip=
 config.gz; cat config | grep CONFIG_IWLWIFI=3D')
+        self.assertEqual(status, 0, msg=3D"Wifi not enabled in this kernel=
. Error messages: %s" % output)
+        (status, output) =3D self.target.run('connmanctl enable wifi')
+        self.assertEqual(status, 0, msg=3D"Error messages: %s" % output)
+        (status, output) =3D self.target.run('ifconfig | grep wlan')
+        self.assertEqual(status, 0, msg=3D"No wlan interface found! Error =
messages: %s" % output)
+        (status, output) =3D self.target.run('connmanctl disable wifi')
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_80211b(self):
+        '''connmanctl to connect 802.11b wifi AP'''
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_80211b")
+        pwd =3D ssid_config.get("Connect","passwd_80211b")
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_hidden=
_connect.exp")
+        cmd =3D "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl"=
, self.hidden_service, ssid, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D60)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_80211g(self):
+        '''connmanctl to connect 802.11g wifi AP'''
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_80211g")
+        pwd =3D ssid_config.get("Connect","passwd_80211g")
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_hidden=
_connect.exp")
+        cmd =3D "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl"=
, self.hidden_service, ssid, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D60)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_80211n(self):
+        '''connmanctl to connect 802.11n wifi AP'''
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_80211n")
+        pwd =3D ssid_config.get("Connect","passwd_80211n")
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_hidden=
_connect.exp")
+        cmd =3D "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl"=
, self.hidden_service, ssid, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D60)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_wpapsk(self):
+        '''connmanctl to connect WPA-PSK wifi AP (set by ssid_80211b AP)''=
'
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_80211b")
+        pwd =3D ssid_config.get("Connect","passwd_80211b")
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_hidden=
_connect.exp")
+        cmd =3D "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl"=
, self.hidden_service, ssid, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D60)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_wpa2psk(self):
+        '''connmanctl to connect WPA2-PSK wifi AP (set by ssid_80211g AP)'=
''
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_80211g")
+        pwd =3D ssid_config.get("Connect","passwd_80211g")
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_hidden=
_connect.exp")
+        cmd =3D "expect %s %s %s %s %s %s" % (exp, target_ip, "connmanctl"=
, self.hidden_service, ssid, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D60)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_wpa2psk_broadcast(self):
+        '''connmanctl to connect WPA2-PSK wifi AP (not hidden)'''
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_broadcast")
+        pwd =3D ssid_config.get("Connect","passwd_broadcast")
+
+        # For broadcast AP, get its service firstly.
+        retry =3D 0
+        while (retry < 4):
+            (status, output) =3D self.target.run('connmanctl scan wifi')
+            self.assertEqual(status, 0, msg=3D"Error messages: %s" % outpu=
t)
+            (status, output) =3D self.target.run("connmanctl services | gr=
ep %s" % ssid)
+            retry =3D retry + 1
+            if (status =3D=3D 0):
+                break
+        self.assertEqual(status, 0, msg=3D"Not found AP service")
+        service =3D output.split(" ")[-1]
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_connec=
t.exp")
+        cmd =3D "expect %s %s %s %s %s" % (exp, target_ip, "connmanctl", s=
ervice, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D200)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+    @skipUnlessPassed('test_check_wifi_capable')
+    def test_wifi_connect_internet(self):
+        '''connmanctl to connect to internet, by broadcast wifi AP'''
+        target_ip =3D self.target.ip
+        ssid =3D ssid_config.get("Connect","ssid_broadcast")
+        pwd =3D ssid_config.get("Connect","passwd_broadcast")
+
+        # For broadcast AP, get its service firstly.
+        retry =3D 0
+        while (retry < 4):
+            (status, output) =3D self.target.run('connmanctl scan wifi')
+            self.assertEqual(status, 0, msg=3D"Error messages: %s" % outpu=
t)
+            (status, output) =3D self.target.run("connmanctl services | gr=
ep %s" % ssid)
+            retry =3D retry + 1
+            if (status =3D=3D 0):
+                break
+        self.assertEqual(status, 0, msg=3D"Not found AP service")
+        service =3D output.split(" ")[-1]
+
+        # Do connection
+        exp =3D os.path.join(os.path.dirname(__file__), "files/wifi_connec=
t.exp")
+        cmd =3D "expect %s %s %s %s %s" % (exp, target_ip, "connmanctl", s=
ervice, pwd)
+        status, output =3D shell_cmd_timeout(cmd, timeout=3D200)
+        self.assertEqual(status, 2, msg=3D"Error messages: %s" % output)
+        self.check_wifi_ip()
+
+        # Ping internet web links
+        (status, output) =3D self.target.run("ping www.google.com -c 4")
+        self.assertEqual(status, 0, msg=3D"Error messages: %s" % output)
diff --git a/meta/lib/oeqa/utils/helper.py b/meta/lib/oeqa/utils/helper.py =
new file mode 100644 index 0000000..1b4eeb5
--- /dev/null
+++ b/meta/lib/oeqa/utils/helper.py
@@ -0,0 +1,62 @@
+#[PROTEXCAT]
+#\License: ALL RIGHTS RESERVED
+#\Author: Wang, Jing <jing.j.wang@intel.com>
+
+import time
+import subprocess
+import os
+from oeqa.oetest import oeRuntimeTest
+import unittest
+
+def shell_cmd(cmd):
+    """Execute shell command till it return"""
+    cmd_proc =3D subprocess.Popen(cmd, shell=3DTrue)
+    return cmd_proc.wait() if cmd_proc else -1
+
+def shell_cmd_timeout(cmd, timeout=3D0):
+    """Execute shell command till timeout"""
+    cmd_proc =3D subprocess.Popen(cmd, shell=3DTrue, stdout=3Dsubprocess.P=
IPE)
+    if not cmd_proc:
+        return -1, ''
+    t_timeout, tick =3D timeout, 2
+    ret, output =3D None, ''
+    while True:
+        time.sleep(tick)
+        output =3D cmd_proc.communicate()[0]
+        ret =3D cmd_proc.poll()
+        if ret is not None:
+            break
+
+        if t_timeout > 0:
+            t_timeout -=3D tick
+
+        if t_timeout <=3D 0:
+            # timeout, kill command
+            cmd_proc.kill()
+            ret =3D -99999
+            break
+    return ret, output
+
+def collect_pnp_log(casename, logname, log):
+    """collect the result log for pnp part"""
+    curpath =3D os.getcwd()
+    if not os.path.exists(casename):
+        os.makedirs(casename)
+
+    logpath =3D os.path.join(curpath, casename, logname)
+    logtime =3D time.strftime("%Y-%m-%d %H:%M:%S")
+    with open(logpath, "a") as text_file:
+        text_file.write("%s %s:%s\n" %(logtime, casename, log))
+
+def get_files_dir():
+    """Get directory of supporting files"""
+    pkgarch =3D oeRuntimeTest.tc.d.getVar('MACHINE', True)
+    deploydir =3D oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True)
+    return os.path.join(deploydir, "files", "target", pkgarch)
+
+def get_native_dir():
+    """Get directory of native files"""
+    arch =3D oeRuntimeTest.tc.d.getVar('BUILD_ARCH', True)
+    deploydir =3D oeRuntimeTest.tc.d.getVar('DEPLOY_DIR', True)
+    return os.path.join(deploydir, "files", "native", arch)
+
--
2.1.4

--
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

