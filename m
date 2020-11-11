Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web08.7412.1605105316666374875
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 06:35:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZRI9zu6K;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id w188so2393916oib.1
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 06:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=gz10zFvrYYK6CXLKTv4+LtxOqKO3Wqww1nrZFGB/KLE=;
        b=ZRI9zu6KeO3SnIqdcBC71D1dJmFc9B+BuvPCFlChRiQSMJ7kkEK0Gp0wfRObxh2Whq
         qTzSdOKPZi2CO+zeFtDxdETb9AHw7XOYD8M9LAFdOiS/MDHhQLnotqNKA1z5Sij0HN8B
         qAzl4GMeTG8T1c7aILIlW8BdY5VfOJ10RkfdwoR+PobEACD2P653ga+uw2SqLVsRypyJ
         dvdeDypKO94ByB7/q3Vt+gkIz86jbDHKH+SGX4k3IyoSEyUa4YCkB1iyawP7yPWisAGx
         8jG61Av83eklEiBBptQRcWFJeuo2Hosd3Ip6TANZJZFkOCFqn2rPrB0+CV44+8F+f4UW
         CUUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=gz10zFvrYYK6CXLKTv4+LtxOqKO3Wqww1nrZFGB/KLE=;
        b=jB4qw8ZgWmMMDB5yntZTGqvAlU+3/aDAj43SIxVKYAD4PWI9VWd3yyZkyJRIyab4IU
         TifjOVuYGFogui0AZwGOJoo20LHaYuF10Lu8JFTMXUaMKUxibGzJw0Fe4QyuSeJN3Alx
         Ji+dr2Op5wrODFLUO2C5PxTOSKj9P2jHfc6tRK9rfHBUAzmokQXNCFv4tRiZCntmIrMG
         RJ2lMKkEilHyzIxmGwrsutrjAlxmaDVWyWUq79YqXMdzMRS3u6Vsn2ZXdruvEZmjZGMA
         pz/9WemXZso0cdXBPQ9KmUOZAaSqxJ9lGjGlGXB53Gjo33OaoyB7ADXaQ30f1iklDUna
         LJVQ==
X-Gm-Message-State: AOAM53251wAIcx+Hu80cFZ+wJygRnzxiZfGtW3yuZyEe9CHyJ0FwBdmU
	o5F5Mr4KMTixcJF9qJRD6ZGX/r8LTo4S3w==
X-Google-Smtp-Source: ABdhPJyRdR2wEbpI/rOVUJH1/YEsMv3WskDx2L3hV0zeBBkHXd7V8c4uqiD5NbHKkEXB22yamLMpag==
X-Received: by 2002:aca:c3d6:: with SMTP id t205mr2410884oif.10.1605105315404;
        Wed, 11 Nov 2020 06:35:15 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id t25sm528721otj.13.2020.11.11.06.35.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 06:35:14 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [WIP v2 1/1] qemurunner: add support for qmp cmds
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20201111041003.864509-1-saul.wold@windriver.com>
 <20201111041003.864509-2-saul.wold@windriver.com>
Message-ID: <e9accf72-281e-96cd-152f-290e72c9f7f3@gmail.com>
Date: Wed, 11 Nov 2020 08:35:13 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111041003.864509-2-saul.wold@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------685B658B20A991153E3F57BE"
Content-Language: en-US

--------------685B658B20A991153E3F57BE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 11/10/20 10:10 PM, Saul Wold wrote:
> This adds support for the Qemu Machine Protocol [0] extending
> the current dump process for Host and Target. The commands are
> added in the testimage.bbclass.
>
> Currently, we setup qemu to stall until qmp gets connected and
> sends the initialization and continue commands, this works
> correctly.
>
> With this version, the monitor_dumper is created in OEQemuTarget
> but then set in OESSHTarget as that's where we get the SSH failure
> happens. Python's @property is used to create a setter/getter type
> of setup in OESSHTarget to get overridden by OEQemuTarget.
>
> By default the data is currently dumped to files for each command in
> TMPDIR/log/runtime-hostdump/<date>_qmp/unknown_<seq>_qemu_monitor
>
> Current Issue, the first command succeeds, but the following commands
> seem to fail. I think it's something to do with JSON and quoting. I
> think the next step is to try and use JSON (which I am not super
> familiare with).

One thing that might help with that is letting python encode the strings 
for you (JSON is *really* picky about syntax):

  import json

  s = json.dumps({"execute": "status"}) + "\n"

This effectively lets you write the commands in python dictionaries 
(which will by syntax checked by the interpreter) and know they will be 
encoded into correct JSON.

>
> [0] https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt
>
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>   meta/classes/testimage.bbclass    |  7 ++++
>   meta/lib/oeqa/core/target/qemu.py |  6 +++
>   meta/lib/oeqa/core/target/ssh.py  | 22 ++++++++--
>   meta/lib/oeqa/targetcontrol.py    |  5 +++
>   meta/lib/oeqa/utils/dump.py       | 20 +++++++++
>   meta/lib/oeqa/utils/qemurunner.py | 70 ++++++++++++++++++++++++++++++-
>   6 files changed, 126 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
> index e3feef02f8..a274865955 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -127,6 +127,12 @@ testimage_dump_host () {
>       netstat -an
>   }
>   
> +testimage_dump_monitor () {
> +    '{"execute":"status"}\n'
> +    '{"execute":"query-status"}\n'
> +    '{"execute":"query-block"}\n'
> +}
> +
>   python do_testimage() {
>       testimage_main(d)
>   }
> @@ -319,6 +325,7 @@ def testimage_main(d):
>       target_kwargs['powercontrol_extra_args'] = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
>       target_kwargs['serialcontrol_cmd'] = d.getVar("TEST_SERIALCONTROL_CMD") or None
>       target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
> +    target_kwargs['testimage_dump_monitor'] = d.getVar("testimage_dump_monitor") or ""
>       target_kwargs['testimage_dump_target'] = d.getVar("testimage_dump_target") or ""
>   
>       def export_ssh_agent(d):
> diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
> index 0f29414df5..a73d82d9af 100644
> --- a/meta/lib/oeqa/core/target/qemu.py
> +++ b/meta/lib/oeqa/core/target/qemu.py
> @@ -12,6 +12,7 @@ from collections import defaultdict
>   
>   from .ssh import OESSHTarget
>   from oeqa.utils.qemurunner import QemuRunner
> +from oeqa.utils.dump import MonitorDumper
>   from oeqa.utils.dump import TargetDumper
>   
>   supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
> @@ -43,6 +44,11 @@ class OEQemuTarget(OESSHTarget):
>                                    dump_host_cmds=dump_host_cmds, logger=logger,
>                                    serial_ports=serial_ports, boot_patterns = boot_patterns,
>                                    use_ovmf=ovmf)
> +        dump_monitor_cmds = kwargs.get("testimage_dump_monitor")
> +        self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
> +        if self.monitor_dumper:
> +            self.monitor_dumper.create_dir("qmp")
> +
>           dump_target_cmds = kwargs.get("testimage_dump_target")
>           self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
>           self.target_dumper.create_dir("qemu")
> diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
> index 461448dbc5..faffc8acdf 100644
> --- a/meta/lib/oeqa/core/target/ssh.py
> +++ b/meta/lib/oeqa/core/target/ssh.py
> @@ -43,6 +43,7 @@ class OESSHTarget(OETarget):
>           if port:
>               self.ssh = self.ssh + [ '-p', port ]
>               self.scp = self.scp + [ '-P', port ]
> +        self._monitor_dumper = None
>   
>       def start(self, **kwargs):
>           pass
> @@ -50,11 +51,20 @@ class OESSHTarget(OETarget):
>       def stop(self, **kwargs):
>           pass
>   
> +    @property
> +    def monitor_dumper(self):
> +        return self._monitor_dumper
> +
> +    @monitor_dumper.setter
> +    def monitor_dumper(self, dumper):
> +        self._monitor_dumper = dumper
> +        self.monitor_dumper.dump_monitor()
> +
>       def _run(self, command, timeout=None, ignore_status=True):
>           """
>               Runs command in target using SSHProcess.
>           """
> -        self.logger.debug("[Running]$ %s" % " ".join(command))
> +        self.logger.debug("sgw-[Running]$ %s" % " ".join(command))
>   
>           starttime = time.time()
>           status, output = SSHCall(command, self.logger, timeout)
> @@ -87,9 +97,15 @@ class OESSHTarget(OETarget):
>               processTimeout = self.timeout
>   
>           status, output = self._run(sshCmd, processTimeout, True)
> -        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output))
> -        if (status == 255) and (('No route to host') in output):
> +        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
> +#        if (status == 255) and (('No route to host') in output):
> +        # for testing right now
> +        if self.monitor_dumper:
> +            self.monitor_dumper.dump_monitor()
> +        if status == 255:
>               self.target_dumper.dump_target()
> +            if self.monitor_dumper:
> +                self.monitor_dumper.dump_monitor()
>           return (status, output)
>   
>       def copyTo(self, localSrc, remoteDst):
> diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
> index 19f5a4ea7e..0d070531c3 100644
> --- a/meta/lib/oeqa/targetcontrol.py
> +++ b/meta/lib/oeqa/targetcontrol.py
> @@ -17,6 +17,7 @@ from oeqa.utils.sshcontrol import SSHControl
>   from oeqa.utils.qemurunner import QemuRunner
>   from oeqa.utils.qemutinyrunner import QemuTinyRunner
>   from oeqa.utils.dump import TargetDumper
> +from oeqa.utils.dump import MonitorDumper
>   from oeqa.controllers.testtargetloader import TestTargetLoader
>   from abc import ABCMeta, abstractmethod
>   
> @@ -108,6 +109,7 @@ class QemuTarget(BaseTarget):
>           self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
>           dump_target_cmds = d.getVar("testimage_dump_target")
>           dump_host_cmds = d.getVar("testimage_dump_host")
> +        dump_monitor_cmds = d.getVar("testimage_dump_monitor")
>           dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
>           if not dump_dir:
>               dump_dir = os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdump')
> @@ -147,6 +149,9 @@ class QemuTarget(BaseTarget):
>                               serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
>   
>           self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
> +        self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
> +        self.logger.debug("sgw monitor: %s" %  self.monitor_dumper)
> +
>   
>       def deploy(self):
>           bb.utils.mkdirhier(self.testdir)
> diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
> index 09a44329e0..4d0357a155 100644
> --- a/meta/lib/oeqa/utils/dump.py
> +++ b/meta/lib/oeqa/utils/dump.py
> @@ -96,3 +96,23 @@ class TargetDumper(BaseDumper):
>               except:
>                   print("Tried to dump info from target but "
>                           "serial console failed")
> +                print("Failed CMD: %s" % (cmd))
> +
> +class MonitorDumper(BaseDumper):
> +    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
> +
> +    def __init__(self, cmds, parent_dir, runner):
> +        super(MonitorDumper, self).__init__(cmds, parent_dir)
> +        self.runner = runner
> +
> +    def dump_monitor(self, dump_dir=""):
> +        if dump_dir:
> +            self.dump_dir = dump_dir
> +        for cmd in self.cmds:
> +            try:
> +                output = self.runner.run_monitor(cmd)
> +                self._write_dump("qemu_monitor", (cmd + "\n" + output))
> +            except:
> +                print("Failed to dump montor data")
> +                print("Failed CMD: %s" % (cmd))
> +
> diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
> index 77ec939ad7..0ca0d78470 100644
> --- a/meta/lib/oeqa/utils/qemurunner.py
> +++ b/meta/lib/oeqa/utils/qemurunner.py
> @@ -20,6 +20,7 @@ import string
>   import threading
>   import codecs
>   import logging
> +from contextlib import closing
>   from oeqa.utils.dump import HostDumper
>   from collections import defaultdict
>   
> @@ -84,6 +85,12 @@ class QemuRunner:
>           default_boot_patterns['send_login_user'] = 'root\n'
>           default_boot_patterns['search_login_succeeded'] = r"root@[a-zA-Z0-9\-]+:~#"
>           default_boot_patterns['search_cmd_finished'] = r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#"
> +        monitor_cmds = defaultdict(str)
> +        monitor_cmds['qmp_cap'] = '{"execute":"qmp_capabilities","arguments":{"enable":["oob"]}}\n'
> +        monitor_cmds['cont'] = '{"execute":"cont"}\n'
> +        monitor_cmds['quit'] = '{"execute":"quit"}\n'
> +        monitor_cmds['preconfig'] = '{"execute":"x-exit-preconfig"}\n'
> +        self.monitor_cmds = monitor_cmds
>   
>           # Only override patterns that were set e.g. login user TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
>           for pattern in accepted_patterns:
> @@ -168,10 +175,17 @@ class QemuRunner:
>           return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
>   
>       def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
> +        # Find a free socket port that can be used by the QEMU Monitor console
> +        with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as s:
> +            s.bind(('', 0))
> +            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
> +            qmp_port = s.getsockname()[1]
> +
>           try:
>               if self.serial_ports >= 2:
>                   self.threadsock, threadport = self.create_socket()
>               self.server_socket, self.serverport = self.create_socket()
> +
>           except socket.error as msg:
>               self.logger.error("Failed to create listening socket: %s" % msg[1])
>               return False
> @@ -185,6 +199,9 @@ class QemuRunner:
>           if os.path.exists(self.qemu_pidfile):
>               os.remove(self.qemu_pidfile)
>           self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
> +        qemuparams += ' -S -qmp tcp:localhost:%s,server,wait' % (qmp_port)
> +        qemuparams += ' -monitor tcp:localhost:4444,server,nowait'
> +
>           if qemuparams:
>               self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
>   
> @@ -250,6 +267,28 @@ class QemuRunner:
>   
>           if self.runqemu_exited:
>               return False
> +
> +        # Create the client socket for the QEMU Monitor Control Socket
> +        # This will allow us to read status from Qemu if the the process
> +        # is still alive
> +        try:
> +            self.monitor_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +            self.monitor_socket.connect(("127.0.0.1", qmp_port))
> +            self.monitor_socket.setblocking(False)
> +
> +        except socket.error as msg:
> +            self.logger.error("Failed to connect qemu monitor socket: %s" % msg[1])
> +            return False
> +
> +        # Run an empty command to get the initial connection details, then
> +        # send the qmp_capabilities command, this is required to initialize
> +        # the monitor console
> +        mon_output = self.run_monitor("")
> +        self.logger.debug("Monitor: %s" % mon_output)
> +        mon_output = self.run_monitor(self.monitor_cmds['qmp_cap'], timeout=120)
> +        self.logger.debug("Monitor: %s" % mon_output)
> +        mon_output = self.run_monitor(self.monitor_cmds['cont'], timeout=120)
> +        self.logger.debug("Monitor: %s" % mon_output)
>   
>           if not self.is_alive():
>               self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
> @@ -338,6 +377,7 @@ class QemuRunner:
>           reachedlogin = False
>           stopread = False
>           qemusock = None
> +        monsock = None
>           bootlog = b''
>           data = b''
>           while time.time() < endtime and not stopread:
> @@ -376,7 +416,6 @@ class QemuRunner:
>                           sock.close()
>                           stopread = True
>   
> -
>           if not reachedlogin:
>               if time.time() >= endtime:
>                   self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
> @@ -437,6 +476,9 @@ class QemuRunner:
>               self.runqemu.stdout.close()
>               self.runqemu_exited = True
>   
> +        if hasattr(self, 'monitor_socket') and self.monitor_socket:
> +            self.monitor_socket.close()
> +            self.monitor_socket = None
>           if hasattr(self, 'server_socket') and self.server_socket:
>               self.server_socket.close()
>               self.server_socket = None
> @@ -495,6 +537,32 @@ class QemuRunner:
>                           return True
>           return False
>   
> +    def run_monitor(self, command, timeout=60):
> +        data = ''
> +        self.monitor_socket.sendall(command.encode('utf-8'))
> +        start = time.time()
> +        end = start + timeout
> +        while True:
> +            now = time.time()
> +            if now >= end:
> +                data += "<<< run_monitor(): command timed out after %d seconds without output >>>\r\n\r\n" % timeout
> +                break
> +            try:
> +                sread, _, _ = select.select([self.monitor_socket],[],[], end - now)
> +            except InterruptedError:
> +                continue
> +            if sread:
> +                answer = self.monitor_socket.recv(1024)
> +                if answer:
> +                    data += answer.decode('utf-8')
> +                    if data.rfind('\r\n') != -1:
> +                        break;
> +                else:
> +                    raise Exception("No data on monitor socket")
> +
> +        if data:
> +            return (str(data))
> +
>       def run_serial(self, command, raw=False, timeout=60):
>           # We assume target system have echo to get command status
>           if not raw:
>
> 
>

--------------685B658B20A991153E3F57BE
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/10/20 10:10 PM, Saul Wold wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20201111041003.864509-2-saul.wold@windriver.com">
      <pre class="moz-quote-pre" wrap="">This adds support for the Qemu Machine Protocol [0] extending
the current dump process for Host and Target. The commands are
added in the testimage.bbclass.

Currently, we setup qemu to stall until qmp gets connected and
sends the initialization and continue commands, this works
correctly.

With this version, the monitor_dumper is created in OEQemuTarget
but then set in OESSHTarget as that's where we get the SSH failure
happens. Python's @property is used to create a setter/getter type
of setup in OESSHTarget to get overridden by OEQemuTarget.

By default the data is currently dumped to files for each command in
TMPDIR/log/runtime-hostdump/&lt;date&gt;_qmp/unknown_&lt;seq&gt;_qemu_monitor

Current Issue, the first command succeeds, but the following commands
seem to fail. I think it's something to do with JSON and quoting. I
think the next step is to try and use JSON (which I am not super
familiare with).</pre>
    </blockquote>
    <p>One thing that might help with that is letting python encode the
      strings for you (JSON is *really* picky about syntax):</p>
    <p> import json</p>
    <p> s = json.dumps({"execute": "status"}) + "\n"<br>
    </p>
    <p>This effectively lets you write the commands in python
      dictionaries (which will by syntax checked by the interpreter) and
      know they will be encoded into correct JSON.<br>
    </p>
    <blockquote type="cite"
      cite="mid:20201111041003.864509-2-saul.wold@windriver.com">
      <pre class="moz-quote-pre" wrap="">

[0] <a class="moz-txt-link-freetext" href="https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt">https://github.com/qemu/qemu/blob/master/docs/interop/qmp-spec.txt</a>

Signed-off-by: Saul Wold <a class="moz-txt-link-rfc2396E" href="mailto:saul.wold@windriver.com">&lt;saul.wold@windriver.com&gt;</a>
---
 meta/classes/testimage.bbclass    |  7 ++++
 meta/lib/oeqa/core/target/qemu.py |  6 +++
 meta/lib/oeqa/core/target/ssh.py  | 22 ++++++++--
 meta/lib/oeqa/targetcontrol.py    |  5 +++
 meta/lib/oeqa/utils/dump.py       | 20 +++++++++
 meta/lib/oeqa/utils/qemurunner.py | 70 ++++++++++++++++++++++++++++++-
 6 files changed, 126 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index e3feef02f8..a274865955 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -127,6 +127,12 @@ testimage_dump_host () {
     netstat -an
 }
 
+testimage_dump_monitor () {
+    '{"execute":"status"}\n'
+    '{"execute":"query-status"}\n'
+    '{"execute":"query-block"}\n' 
+}
+
 python do_testimage() {
     testimage_main(d)
 }
@@ -319,6 +325,7 @@ def testimage_main(d):
     target_kwargs['powercontrol_extra_args'] = d.getVar("TEST_POWERCONTROL_EXTRA_ARGS") or ""
     target_kwargs['serialcontrol_cmd'] = d.getVar("TEST_SERIALCONTROL_CMD") or None
     target_kwargs['serialcontrol_extra_args'] = d.getVar("TEST_SERIALCONTROL_EXTRA_ARGS") or ""
+    target_kwargs['testimage_dump_monitor'] = d.getVar("testimage_dump_monitor") or ""
     target_kwargs['testimage_dump_target'] = d.getVar("testimage_dump_target") or ""
 
     def export_ssh_agent(d):
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 0f29414df5..a73d82d9af 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -12,6 +12,7 @@ from collections import defaultdict
 
 from .ssh import OESSHTarget
 from oeqa.utils.qemurunner import QemuRunner
+from oeqa.utils.dump import MonitorDumper
 from oeqa.utils.dump import TargetDumper
 
 supported_fstypes = ['ext3', 'ext4', 'cpio.gz', 'wic']
@@ -43,6 +44,11 @@ class OEQemuTarget(OESSHTarget):
                                  dump_host_cmds=dump_host_cmds, logger=logger,
                                  serial_ports=serial_ports, boot_patterns = boot_patterns, 
                                  use_ovmf=ovmf)
+        dump_monitor_cmds = kwargs.get("testimage_dump_monitor")
+        self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
+        if self.monitor_dumper:
+            self.monitor_dumper.create_dir("qmp")
+
         dump_target_cmds = kwargs.get("testimage_dump_target")
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
         self.target_dumper.create_dir("qemu<a class="moz-txt-link-rfc2396E" href="mailto:)diff--gita/meta/lib/oeqa/core/target/ssh.pyb/meta/lib/oeqa/core/target/ssh.pyindex461448dbc5..faffc8acdf100644---a/meta/lib/oeqa/core/target/ssh.py+++b/meta/lib/oeqa/core/target/ssh.py@@-43,6+43,7@@classOESSHTarget(OETarget):ifport:self.ssh=self.ssh+['-p',port]self.scp=self.scp+['-P',port]+self._monitor_dumper=Nonedefstart(self,**kwargs):pass@@-50,11+51,20@@classOESSHTarget(OETarget):defstop(self,**kwargs):pass+@property+defmonitor_dumper(self):+returnself._monitor_dumper++@monitor_dumper.setter+defmonitor_dumper(self,dumper):+self._monitor_dumper=dumper+self.monitor_dumper.dump_monitor()+def_run(self,command,timeout=None,ignore_status=True):">")
diff --git a/meta/lib/oeqa/core/target/ssh.py b/meta/lib/oeqa/core/target/ssh.py
index 461448dbc5..faffc8acdf 100644
--- a/meta/lib/oeqa/core/target/ssh.py
+++ b/meta/lib/oeqa/core/target/ssh.py
@@ -43,6 +43,7 @@ class OESSHTarget(OETarget):
         if port:
             self.ssh = self.ssh + [ '-p', port ]
             self.scp = self.scp + [ '-P', port ]
+        self._monitor_dumper = None
 
     def start(self, **kwargs):
         pass
@@ -50,11 +51,20 @@ class OESSHTarget(OETarget):
     def stop(self, **kwargs):
         pass
 
+    @property
+    def monitor_dumper(self):
+        return self._monitor_dumper
+
+    @monitor_dumper.setter
+    def monitor_dumper(self, dumper):
+        self._monitor_dumper = dumper
+        self.monitor_dumper.dump_monitor()
+
     def _run(self, command, timeout=None, ignore_status=True):
         "</a>""
             Runs command in target using SSHProcess.
         """
-        self.logger.debug("[Running]$ %s" % " ".join(command))
+        self.logger.debug("sgw-[Running]$ %s" % " ".join(command))
 
         starttime = time.time()
         status, output = SSHCall(command, self.logger, timeout)
@@ -87,9 +97,15 @@ class OESSHTarget(OETarget):
             processTimeout = self.timeout
 
         status, output = self._run(sshCmd, processTimeout, True)
-        self.logger.debug('Command: %s\nOutput:  %s\n' % (command, output))
-        if (status == 255) and (('No route to host') in output):
+        self.logger.debug('Command: %s\nStatus: %d Output:  %s\n' % (command, status, output))
+#        if (status == 255) and (('No route to host') in output):
+        # for testing right now
+        if self.monitor_dumper:
+            self.monitor_dumper.dump_monitor()
+        if status == 255:
             self.target_dumper.dump_target()
+            if self.monitor_dumper:
+                self.monitor_dumper.dump_monitor()
         return (status, output)
 
     def copyTo(self, localSrc, remoteDst):
diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index 19f5a4ea7e..0d070531c3 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -17,6 +17,7 @@ from oeqa.utils.sshcontrol import SSHControl
 from oeqa.utils.qemurunner import QemuRunner
 from oeqa.utils.qemutinyrunner import QemuTinyRunner
 from oeqa.utils.dump import TargetDumper
+from oeqa.utils.dump import MonitorDumper
 from oeqa.controllers.testtargetloader import TestTargetLoader
 from abc import ABCMeta, abstractmethod
 
@@ -108,6 +109,7 @@ class QemuTarget(BaseTarget):
         self.qemulog = os.path.join(self.testdir, "qemu_boot_log.%s" % self.datetime)
         dump_target_cmds = d.getVar("testimage_dump_target")
         dump_host_cmds = d.getVar("testimage_dump_host")
+        dump_monitor_cmds = d.getVar("testimage_dump_monitor")
         dump_dir = d.getVar("TESTIMAGE_DUMP_DIR")
         if not dump_dir:
             dump_dir = os.path.join(d.getVar('LOG_DIR'), 'runtime-hostdump')
@@ -147,6 +149,9 @@ class QemuTarget(BaseTarget):
                             serial_ports = len(d.getVar("SERIAL_CONSOLES").split()))
 
         self.target_dumper = TargetDumper(dump_target_cmds, dump_dir, self.runner)
+        self.monitor_dumper = MonitorDumper(dump_monitor_cmds, dump_dir, self.runner)
+        self.logger.debug("sgw monitor: %s" %  self.monitor_dumper)
+        
 
     def deploy(self):
         bb.utils.mkdirhier(self.testdir)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 09a44329e0..4d0357a155 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -96,3 +96,23 @@ class TargetDumper(BaseDumper):
             except:
                 print("Tried to dump info from target but "
                         "serial console failed")
+                print("Failed CMD: %s" % (cmd))
+
+class MonitorDumper(BaseDumper):
+    """ Class to get dumps via the Qemu Monitor, it only works with QemuRunner """
+
+    def __init__(self, cmds, parent_dir, runner):
+        super(MonitorDumper, self).__init__(cmds, parent_dir)
+        self.runner = runner
+
+    def dump_monitor(self, dump_dir=""):
+        if dump_dir:
+            self.dump_dir = dump_dir
+        for cmd in self.cmds:
+            try:
+                output = self.runner.run_monitor(cmd)
+                self._write_dump("qemu_monitor", (cmd + "\n" + output))
+            except:
+                print("Failed to dump montor data")
+                print("Failed CMD: %s" % (cmd))
+              
diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 77ec939ad7..0ca0d78470 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -20,6 +20,7 @@ import string
 import threading
 import codecs
 import logging
+from contextlib import closing
 from oeqa.utils.dump import HostDumper
 from collections import defaultdict
 
@@ -84,6 +85,12 @@ class QemuRunner:
         default_boot_patterns['send_login_user'] = 'root\n'
         default_boot_patterns['search_login_succeeded'] = r"root@[a-zA-Z0-9\-]+:~#"
         default_boot_patterns['search_cmd_finished'] = r"[a-zA-Z0-9]+@[a-zA-Z0-9\-]+:~#"
+        monitor_cmds = defaultdict(str)
+        monitor_cmds['qmp_cap'] = '{"execute":"qmp_capabilities","arguments":{"enable":["oob"]}}\n'
+        monitor_cmds['cont'] = '{"execute":"cont"}\n'
+        monitor_cmds['quit'] = '{"execute":"quit"}\n'
+        monitor_cmds['preconfig'] = '{"execute":"x-exit-preconfig"}\n'
+        self.monitor_cmds = monitor_cmds
 
         # Only override patterns that were set e.g. login user TESTIMAGE_BOOT_PATTERNS[send_login_user] = "webserver\n"
         for pattern in accepted_patterns:
@@ -168,10 +175,17 @@ class QemuRunner:
         return self.launch(launch_cmd, qemuparams=qemuparams, get_ip=get_ip, extra_bootparams=extra_bootparams, env=env)
 
     def launch(self, launch_cmd, get_ip = True, qemuparams = None, extra_bootparams = None, env = None):
+        # Find a free socket port that can be used by the QEMU Monitor console
+        with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as s:
+            s.bind(('', 0))
+            s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
+            qmp_port = s.getsockname()[1]
+
         try:
             if self.serial_ports &gt;= 2:
                 self.threadsock, threadport = self.create_socket()
             self.server_socket, self.serverport = self.create_socket()
+
         except socket.error as msg:
             self.logger.error("Failed to create listening socket: %s" % msg[1])
             return False
@@ -185,6 +199,9 @@ class QemuRunner:
         if os.path.exists(self.qemu_pidfile):
             os.remove(self.qemu_pidfile)
         self.qemuparams = 'bootparams="{0}" qemuparams="-pidfile {1}"'.format(bootparams, self.qemu_pidfile)
+        qemuparams += ' -S -qmp tcp:localhost:%s,server,wait' % (qmp_port)
+        qemuparams += ' -monitor tcp:localhost:4444,server,nowait'
+
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
@@ -250,6 +267,28 @@ class QemuRunner:
 
         if self.runqemu_exited:
             return False
+        
+        # Create the client socket for the QEMU Monitor Control Socket
+        # This will allow us to read status from Qemu if the the process
+        # is still alive
+        try:
+            self.monitor_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
+            self.monitor_socket.connect(("127.0.0.1", qmp_port))
+            self.monitor_socket.setblocking(False)
+
+        except socket.error as msg:
+            self.logger.error("Failed to connect qemu monitor socket: %s" % msg[1])
+            return False
+
+        # Run an empty command to get the initial connection details, then
+        # send the qmp_capabilities command, this is required to initialize
+        # the monitor console
+        mon_output = self.run_monitor("")
+        self.logger.debug("Monitor: %s" % mon_output)
+        mon_output = self.run_monitor(self.monitor_cmds['qmp_cap'], timeout=120)
+        self.logger.debug("Monitor: %s" % mon_output)
+        mon_output = self.run_monitor(self.monitor_cmds['cont'], timeout=120)
+        self.logger.debug("Monitor: %s" % mon_output)
 
         if not self.is_alive():
             self.logger.error("Qemu pid didn't appear in %s seconds (%s)" %
@@ -338,6 +377,7 @@ class QemuRunner:
         reachedlogin = False
         stopread = False
         qemusock = None
+        monsock = None
         bootlog = b''
         data = b''
         while time.time() &lt; endtime and not stopread:
@@ -376,7 +416,6 @@ class QemuRunner:
                         sock.close()
                         stopread = True
 
-
         if not reachedlogin:
             if time.time() &gt;= endtime:
                 self.logger.warning("Target didn't reach login banner in %d seconds (%s)" %
@@ -437,6 +476,9 @@ class QemuRunner:
             self.runqemu.stdout.close()
             self.runqemu_exited = True
 
+        if hasattr(self, 'monitor_socket') and self.monitor_socket:
+            self.monitor_socket.close()
+            self.monitor_socket = None
         if hasattr(self, 'server_socket') and self.server_socket:
             self.server_socket.close()
             self.server_socket = None
@@ -495,6 +537,32 @@ class QemuRunner:
                         return True
         return False
 
+    def run_monitor(self, command, timeout=60):
+        data = ''
+        self.monitor_socket.sendall(command.encode('utf-8'))
+        start = time.time()
+        end = start + timeout
+        while True:
+            now = time.time()
+            if now &gt;= end:
+                data += "&lt;&lt;&lt; run_monitor(): command timed out after %d seconds without output &gt;&gt;&gt;\r\n\r\n" % timeout
+                break
+            try:
+                sread, _, _ = select.select([self.monitor_socket],[],[], end - now)
+            except InterruptedError:
+                continue
+            if sread:
+                answer = self.monitor_socket.recv(1024)
+                if answer:
+                    data += answer.decode('utf-8')
+                    if data.rfind('\r\n') != -1:
+                        break;
+                else:
+                    raise Exception("No data on monitor socket")
+
+        if data:
+            return (str(data))
+
     def run_serial(self, command, raw=False, timeout=60):
         # We assume target system have echo to get command status
         if not raw:
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------685B658B20A991153E3F57BE--
