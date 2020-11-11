Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.7737.1605106499754695209
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2020 06:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CqLesJEW;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id n11so2396680ota.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2020 06:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:references:message-id:date:user-agent:mime-version
         :in-reply-to:content-language;
        bh=IfHORWttyVSjsle5oMZ/7sPWNUUqNIZZfUnyUIJbxZ4=;
        b=CqLesJEWE5zwFSZ7ZmBBiME1LlT5htqthey83HSys0mn01GocckTzosicr3ZXqOhnj
         9/amuepXDuN/IJ3OhjqkCu9lXanlsoh0N8QE6Ug4K7qQzUSlFqFYtnJffysWBvlvZ5Xg
         H4Uxz9B5UjOGpwkKiCFar2Pceo2ENHcoMWZjC97CEK5x9wXXNp4UepTms6A+8zRi9bQ+
         aBJr+zHmdBf+XCxcDkZKkZcrJOymbM3RwEhlhauJxTj8ZpuAAcwjVmOAq1+HbalVsRft
         llxXPeCle+pdEi9cVcEpIlTJ+Z/C3+/RO2KlhBPFwPMCOS3fb/xoPrCiZYrMFmBgYWWU
         O3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=IfHORWttyVSjsle5oMZ/7sPWNUUqNIZZfUnyUIJbxZ4=;
        b=ShThwCMMA4RuXcNxI6zvKYtZA2rnIuWkyP1LxfsT+ef9AEx7tpCaVErlmKUNMal7vR
         l14kiveUCD6VIblmx8WsCR10GoSCRkD4YpNEk74BHCqdd0tQjSUIwcFNMRWdFnRuggDI
         86Sz+JTQLDsQH4LMJQj+AhWVFDTV8L+GCn2vq91rltY78zKUUevOmYFRC/+ZMmvqk3p+
         SkeI7G7/FfoK2mcdR3j7yWOZAo1JkdINe0vGuqRR3/PdERQivo9Pxw4Q5lA3hQYLJ0uC
         h6JmbrETdJlKF36CyMgXNFlT09i9XNDOzVH9WBxiTLWypY9C2iUtiAX9ZNetZ1vGAWYS
         fq5w==
X-Gm-Message-State: AOAM530E2xDZF7h3+FQzBZpYyaeXtYN9JUXRzUN7FThgkbFCotzbxx5j
	gH9XNz7N6QESUWqIIwStGoyHQqjeqdG9eA==
X-Google-Smtp-Source: ABdhPJzH2eJmrQ13GtiMYWVebUj5cIitcgZ8mtuWQnLXWMu733DQmVdDONEoaOa4rI5pkyBZIEubxw==
X-Received: by 2002:a9d:5382:: with SMTP id w2mr18440584otg.195.1605106498226;
        Wed, 11 Nov 2020 06:54:58 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d? ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id q18sm531240otf.46.2020.11.11.06.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2020 06:54:57 -0800 (PST)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core] [WIP v2 1/1] qemurunner: add support for qmp cmds
To: Saul Wold <Saul.Wold@windriver.com>,
 openembedded-core@lists.openembedded.org
References: <20201111041003.864509-1-saul.wold@windriver.com>
 <20201111041003.864509-2-saul.wold@windriver.com>
Message-ID: <63b1f4e4-6dac-2176-7a3b-d7ddd466d461@gmail.com>
Date: Wed, 11 Nov 2020 08:54:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111041003.864509-2-saul.wold@windriver.com>
Content-Type: multipart/alternative;
 boundary="------------B6C107FCF7773A2937B73AC9"
Content-Language: en-US

--------------B6C107FCF7773A2937B73AC9
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

It's not quit clear to me the purpose of pre-encoding these messages?


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

 From an API perspective, I would probably make this function take in a 
python object (not a string) and then do:

  self.monitor_socket.sendall((json.dumps(command) + "\n")).encode("utf-8"))

  ...

  return json.loads(data.decode("utf-8"))


If you want to be *extra* convenient, you could even do something like:

  def run_monitor(self, command, arguments, id=None, timeout=60):

     c = {"execute": command, "arguments": arguments}

     if id is not None:

         c["id"] = id

     self.monitor_socket.sendall((json.dumps(c) + "\n")).encode("utf-8"))

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

It's possible you will miss events or get a partial invalid response if 
you get more than one message from the server, since `data` doesn't 
persist beyond the execution of this function.


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

--------------B6C107FCF7773A2937B73AC9
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
familiare with).

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
+        monitor_cmds['preconfig'] = '{"execute":"x-exit-preconfig"}\n'</pre>
    </blockquote>
    <p>It's not quit clear to me the purpose of pre-encoding these
      messages?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20201111041003.864509-2-saul.wold@windriver.com">
      <pre class="moz-quote-pre" wrap="">
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
 
+    def run_monitor(self, command, timeout=60):</pre>
    </blockquote>
    <p>From an API perspective, I would probably make this function take
      in a python object (not a string) and then do:</p>
    <p> self.monitor_socket.sendall((json.dumps(command) +
      "\n")).encode("utf-8"))</p>
    <p> ...</p>
    <p> return json.loads(data.decode("utf-8"))</p>
    <p><br>
    </p>
    <p>If you want to be *extra* convenient, you could even do something
      like:</p>
    <p> def run_monitor(self, command, arguments, id=None, timeout=60):</p>
    <p>    c = {"execute": command, "arguments": arguments}</p>
    <p>    if id is not None:</p>
    <p>        c["id"] = id</p>
    <p>    self.monitor_socket.sendall((json.dumps(c) +
      "\n")).encode("utf-8"))</p>
    <blockquote type="cite"
      cite="mid:20201111041003.864509-2-saul.wold@windriver.com">
      <pre class="moz-quote-pre" wrap="">
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
+                    if data.rfind('\r\n') != -1:</pre>
    </blockquote>
    <p>It's possible you will miss events or get a partial invalid
      response if you get more than one message from the server, since
      `data` doesn't persist beyond the execution of this function.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20201111041003.864509-2-saul.wold@windriver.com">
      <pre class="moz-quote-pre" wrap="">
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

--------------B6C107FCF7773A2937B73AC9--
