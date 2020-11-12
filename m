Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.6409.1605197004275517464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 08:03:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AwRKh2TZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id t15so2017072ual.6
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 08:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W6jOrbqdqrQfXNnvpu4o905WvjYNiUcxkqGG0H6D6Tw=;
        b=AwRKh2TZNG6vShJysVYc+QrrmzPfViFzrsL58mbhXJ6Au/Ep++UPlrrxFq9CblLYo8
         qMsU7yyR7Bzx4HROS9gsodFWJDr2pXXXIYVBdce+jASe7QuqScJvqKTHW6tfZZJXvxNL
         XcmzKOHXJiw97azyqFcHvEGHk2pY2+/tPe16c+G0TskCfgMP5qmtOeYhjtoMyRUK92B1
         wyhbfzwkumY8agaGlk7Ie4MZccI2V4WhaRvYoUyzto5oHpoycK9eOJnOZfbUttX8Tn6L
         kRMG5Dj8hQm4uQDMx+taeFF+Una3iPNI5rnDkllXV/pknR1cAOh75k7RlEKV4c5siJtp
         8pKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W6jOrbqdqrQfXNnvpu4o905WvjYNiUcxkqGG0H6D6Tw=;
        b=k/qHclKqs6r0muJI81wvs0a9pMpf6mlA9oabiQ2Cv1zZ4Oe+ItGLWyumEzazHcJMGR
         JAUrBQ+q/T9nHt51xJKXAy+m7j9UBxotUKYVOO4q3UAHN6sn240iL2hR37mx4wf6r1re
         82lXMgyWu+M5NCtCHoLyTHxGY1ZmO9uG/8brTABvU9tEAVNRMLvXAgtuYFVs/K9hUc3w
         ZhzIONl1pWRcod+GJjJMbGiMCPAkAJF7FO0n/PK8NFc0nwXkg29mX0duQM7MyLgSTYT0
         zrzl9NtYI5pbmq9j2MBGzd+6NkCCMBuFaUMY5L1OG7Kcuk2IkndVGJykf1NEgBz6VzE/
         RhHA==
X-Gm-Message-State: AOAM53013OL3LUrIn0B9iG+87gGQEuTqcH/3I5oMpSqtwBRB0rciJa/Z
	xTmdf/bpGICb5LJhzhD+Msv09Z9nsOFYQl5ecv0=
X-Google-Smtp-Source: ABdhPJxrpdqzyuowGITYxQzvdX9zO07ZzYIRbg6D6Iv1eV6s1Wj7sgWD3E+QpHVjXKxpN/0q8drEbmoXPZBW2InF8F8=
X-Received: by 2002:ab0:7103:: with SMTP id x3mr63668uan.100.1605197003360;
 Thu, 12 Nov 2020 08:03:23 -0800 (PST)
MIME-Version: 1.0
References: <76c7c436-29d1-1687-1889-72e883697a75@berginkonsult.se>
 <29322.1605179238305301621@lists.openembedded.org> <CANNYZj_d6uefKzNP1YQ=zGNuG2z0xRs=37Zv1vz3XFvL4i3KPA@mail.gmail.com>
 <d3a9efbd-e980-65e8-4bc0-15247a8966a1@berginkonsult.se>
In-Reply-To: <d3a9efbd-e980-65e8-4bc0-15247a8966a1@berginkonsult.se>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 17:03:11 +0100
Message-ID: <CANNYZj81DeuAWh5oPsg3dMQPr9iH4m24SpjjvaBNfiEGjdOKZw@mail.gmail.com>
Subject: Re: [OE-core] devtool modify - ModuleNotFoundError: No module named '_sysconfigdata'
To: Peter Bergin <peter@berginkonsult.se>
Cc: ernst.sjostrand@lists.verisure.com, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002e0cd305b3eb0d10"

--0000000000002e0cd305b3eb0d10
Content-Type: text/plain; charset="UTF-8"

I have just seen it first-hand for the first time. It happens on Ubuntu
20.04, but not on for example OpenSuse tumbleweed. So something in Ubuntu
causes the native python environment to leak into the host python
environment. Will investigate.

Alex

On Thu, 12 Nov 2020 at 13:59, Peter Bergin <peter@berginkonsult.se> wrote:

> Hi Alex,
>
> On 2020-11-12 12:38, Alexander Kanavin wrote:
> > If you can provide exact steps to reproduce (the recipe is not
> > available in oe-core), I can take a look. It's been reported plenty of
> > times, but always with something not in core and not easily available.
>
> here are the steps to reproduce with only poky. I hope it can help you
> find the root cause:
>
>      $ git clone https://git.yoctoproject.org/git/poky sources/poky
>      $ . ./sources/poky/oe-init-build-env
>      $ echo 'MACHINE = "qemuarm64"' >> conf/auto.conf
>      $ devtool modify u-boot
>
> And here is the output on my machine:
>
>      Build Configuration:
>      BB_VERSION           = "1.49.0"
>      BUILD_SYS            = "x86_64-linux"
>      NATIVELSBSTRING      = "ubuntu-20.04"
>      TARGET_SYS           = "aarch64-poky-linux"
>      MACHINE              = "qemuarm64"
>      DISTRO               = "poky"
>      DISTRO_VERSION       = "3.2+snapshot-20201112"
>      TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
>      TARGET_FPU           = ""
>      meta
>      meta-poky
>      meta-yocto-bsp       =
> "master:e949e76d0f6897ec5d4feaa47afd2b049b32707f"
>      workspace            = "<unknown>:<unknown>"
>
>      Initialising tasks: 100%
> |###########################################################| Time: 0:00:00
>      Sstate summary: Wanted 20 Found 20 Missed 0 Current 0 (100% match,
> 0% complete)
>      NOTE: Executing Tasks
>      ERROR: Error executing a python function in exec_python_func()
> autogenerated:
>
>      The stack trace of python calls that resulted in this
> exception/failure was:
>      File: 'exec_python_func() autogenerated', lineno: 2, function:
> <module>
>           0001:
>       *** 0002:devtool_post_unpack(d)
>           0003:
>      File:
> '/work/yocto/devtool-reproduce2/sources/poky/meta/classes/devtool-source.bbclass',
>
> lineno: 68, function: devtool_post_unpack
>           0064:}
>           0065:
>           0066:
>           0067:python devtool_post_unpack() {
>       *** 0068:    import oe.recipeutils
>           0069:    import shutil
>           0070:    sys.path.insert(0, os.path.join(d.getVar('COREBASE'),
> 'scripts', 'lib'))
>           0071:    import scriptutils
>           0072:    from devtool import setup_git_repo
>      File:
> '/work/yocto/devtool-reproduce2/sources/poky/meta/lib/oe/recipeutils.py',
> lineno: 21, function: <module>
>           0017:import shutil
>           0018:import re
>           0019:import fnmatch
>           0020:import glob
>       *** 0021:import bb.tinfoil
>           0022:
>           0023:from collections import OrderedDict, defaultdict
>           0024:from bb.utils import vercmp_string
>           0025:
>      File:
> '/work/yocto/devtool-reproduce2/sources/poky/bitbake/lib/bb/tinfoil.py',
> lineno: 19, function: <module>
>           0015:from collections import OrderedDict, defaultdict
>           0016:from functools import partial
>           0017:
>           0018:import bb.cache
>       *** 0019:import bb.cooker
>           0020:import bb.providers
>           0021:import bb.taskdata
>           0022:import bb.utils
>           0023:import bb.command
>      File:
> '/work/yocto/devtool-reproduce2/sources/poky/bitbake/lib/bb/cooker.py',
> lineno: 25, function: <module>
>           0021:import bb, bb.exceptions, bb.command
>           0022:from bb import utils, data, parse, event, cache,
> providers, taskdata, runqueue, build
>           0023:import queue
>           0024:import signal
>       *** 0025:import prserv.serv
>           0026:import pyinotify
>           0027:import json
>           0028:import pickle
>           0029:import codecs
>      File:
> '/work/yocto/devtool-reproduce2/sources/poky/bitbake/lib/prserv/serv.py',
> lineno: 7, function: <module>
>           0003:#
>           0004:
>           0005:import os,sys,logging
>           0006:import signal, time
>       *** 0007:from xmlrpc.server import SimpleXMLRPCServer,
> SimpleXMLRPCRequestHandler
>           0008:import threading
>           0009:import queue
>           0010:import socket
>           0011:import io
>      File: '/usr/lib/python3.8/xmlrpc/server.py', lineno: 117, function:
> <module>
>           0113:import socketserver
>           0114:import sys
>           0115:import os
>           0116:import re
>       *** 0117:import pydoc
>           0118:import traceback
>           0119:try:
>           0120:    import fcntl
>           0121:except ImportError:
>      File: '/usr/lib/python3.8/pydoc.py', lineno: 370, function: <module>
>           0366:    return module
>           0367:
>           0368:# ----------------------------------------------------
> formatter base class
>           0369:
>       *** 0370:class Doc:
>           0371:
>           0372:    PYTHONDOCS = os.environ.get("PYTHONDOCS",
>           0373: "https://docs.python.org/%d.%d/library"
>           0374:                                % sys.version_info[:2])
>      File: '/usr/lib/python3.8/pydoc.py', lineno: 400, function: Doc
>           0396:        raise TypeError(message)
>           0397:
>           0398:    docmodule = docclass = docroutine = docother =
> docproperty = docdata = fail
>           0399:
>       *** 0400:    def getdocloc(self, object,
> basedir=sysconfig.get_path('stdlib')):
>           0401:        """Return the location of module docs or None"""
>           0402:
>           0403:        try:
>           0404:            file = inspect.getabsfile(object)
>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 512, function:
> get_path
>           0508:    """Return a path corresponding to the scheme.
>           0509:
>           0510:    ``scheme`` is the install scheme name.
>           0511:    """
>       *** 0512:    return get_paths(scheme, vars, expand)[name]
>           0513:
>           0514:
>           0515:def get_config_vars(*args):
>           0516:    """With no arguments, return a dictionary of all
> configuration
>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 502, function:
> get_paths
>           0498:    ``scheme`` is the install scheme name. If not
> provided, it will
>           0499:    return the default scheme for the current platform.
>           0500:    """
>           0501:    if expand:
>       *** 0502:        return _expand_vars(scheme, vars)
>           0503:    else:
>           0504:        return _INSTALL_SCHEMES[scheme]
>           0505:
>           0506:
>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 172, function:
> _expand_vars
>           0168:def _expand_vars(scheme, vars):
>           0169:    res = {}
>           0170:    if vars is None:
>           0171:        vars = {}
>       *** 0172:    _extend_dict(vars, get_config_vars())
>           0173:
>           0174:    for key, value in _INSTALL_SCHEMES[scheme].items():
>           0175:        if os.name in ('posix', 'nt'):
>           0176:            value = os.path.expanduser(value)
>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 550, function:
> get_config_vars
>           0546:
>           0547:        if os.name == 'nt':
>           0548:            _init_non_posix(_CONFIG_VARS)
>           0549:        if os.name == 'posix':
>       *** 0550:            _init_posix(_CONFIG_VARS)
>           0551:        # For backward compatibility, see issue19555
>           0552:        SO = _CONFIG_VARS.get('EXT_SUFFIX')
>           0553:        if SO is not None:
>           0554:            _CONFIG_VARS['SO'] = SO
>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 421, function:
> _init_posix
>           0417:def _init_posix(vars):
>           0418:    """Initialize the module as appropriate for POSIX
> systems."""
>           0419:    # _sysconfigdata is generated at build time, see
> _generate_posix_vars()
>           0420:    name = _get_sysconfigdata_name()
>       *** 0421:    _temp = __import__(name, globals(), locals(),
> ['build_time_vars'], 0)
>           0422:    build_time_vars = _temp.build_time_vars
>           0423:    vars.update(build_time_vars)
>           0424:
>           0425:def _init_non_posix(vars):
>      Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>
>
> Thanks,
> /Peter
>
>

--0000000000002e0cd305b3eb0d10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUganVzdCBzZWVuIGl0IGZpcnN0LWhhbmQgZm9yIHRo
ZSBmaXJzdCB0aW1lLiBJdCBoYXBwZW5zIG9uIFVidW50dSAyMC4wNCwgYnV0IG5vdCBvbiBmb3Ig
ZXhhbXBsZSBPcGVuU3VzZSB0dW1ibGV3ZWVkLiBTbyBzb21ldGhpbmcgaW4gVWJ1bnR1IGNhdXNl
cyB0aGUgbmF0aXZlIHB5dGhvbiBlbnZpcm9ubWVudCB0byBsZWFrIGludG8gdGhlIGhvc3QgcHl0
aG9uIGVudmlyb25tZW50LiBXaWxsIGludmVzdGlnYXRlLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+QWxleDxicj48L2Rpdj48L2Rpdj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxkaXYg
ZGlyPSJsdHIiIGNsYXNzPSJnbWFpbF9hdHRyIj5PbiBUaHUsIDEyIE5vdiAyMDIwIGF0IDEzOjU5
LCBQZXRlciBCZXJnaW4gJmx0OzxhIGhyZWY9Im1haWx0bzpwZXRlckBiZXJnaW5rb25zdWx0LnNl
Ij5wZXRlckBiZXJnaW5rb25zdWx0LnNlPC9hPiZndDsgd3JvdGU6PGJyPjwvZGl2PjxibG9ja3F1
b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDti
b3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij5I
aSBBbGV4LDxicj4NCjxicj4NCk9uIDIwMjAtMTEtMTIgMTI6MzgsIEFsZXhhbmRlciBLYW5hdmlu
IHdyb3RlOjxicj4NCiZndDsgSWYgeW91IGNhbiBwcm92aWRlIGV4YWN0IHN0ZXBzIHRvIHJlcHJv
ZHVjZSAodGhlIHJlY2lwZSBpcyBub3QgPGJyPg0KJmd0OyBhdmFpbGFibGUgaW4gb2UtY29yZSks
IEkgY2FuIHRha2UgYSBsb29rLiBJdCYjMzk7cyBiZWVuIHJlcG9ydGVkIHBsZW50eSBvZiA8YnI+
DQomZ3Q7IHRpbWVzLCBidXQgYWx3YXlzIHdpdGggc29tZXRoaW5nIG5vdCBpbiBjb3JlIGFuZCBu
b3QgZWFzaWx5IGF2YWlsYWJsZS48YnI+DQo8YnI+DQpoZXJlIGFyZSB0aGUgc3RlcHMgdG8gcmVw
cm9kdWNlIHdpdGggb25seSBwb2t5LiBJIGhvcGUgaXQgY2FuIGhlbHAgeW91IDxicj4NCmZpbmQg
dGhlIHJvb3QgY2F1c2U6PGJyPg0KPGJyPg0KwqDCoMKgwqAgJCBnaXQgY2xvbmUgPGEgaHJlZj0i
aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9naXQvcG9reSIgcmVsPSJub3JlZmVycmVyIiB0
YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9naXQvcG9reTwvYT4g
c291cmNlcy9wb2t5PGJyPg0KwqDCoMKgwqAgJCAuIC4vc291cmNlcy9wb2t5L29lLWluaXQtYnVp
bGQtZW52PGJyPg0KwqDCoMKgwqAgJCBlY2hvICYjMzk7TUFDSElORSA9ICZxdW90O3FlbXVhcm02
NCZxdW90OyYjMzk7ICZndDsmZ3Q7IGNvbmYvYXV0by5jb25mPGJyPg0KwqDCoMKgwqAgJCBkZXZ0
b29sIG1vZGlmeSB1LWJvb3Q8YnI+DQo8YnI+DQpBbmQgaGVyZSBpcyB0aGUgb3V0cHV0IG9uIG15
IG1hY2hpbmU6PGJyPg0KPGJyPg0KwqDCoMKgwqAgQnVpbGQgQ29uZmlndXJhdGlvbjo8YnI+DQrC
oMKgwqDCoCBCQl9WRVJTSU9OwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDsxLjQ5LjAmcXVv
dDs8YnI+DQrCoMKgwqDCoCBCVUlMRF9TWVPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gJnF1b3Q7
eDg2XzY0LWxpbnV4JnF1b3Q7PGJyPg0KwqDCoMKgwqAgTkFUSVZFTFNCU1RSSU5HwqDCoMKgwqDC
oCA9ICZxdW90O3VidW50dS0yMC4wNCZxdW90Ozxicj4NCsKgwqDCoMKgIFRBUkdFVF9TWVPCoMKg
wqDCoMKgwqDCoMKgwqDCoCA9ICZxdW90O2FhcmNoNjQtcG9reS1saW51eCZxdW90Ozxicj4NCsKg
wqDCoMKgIE1BQ0hJTkXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICZxdW90O3FlbXVhcm02
NCZxdW90Ozxicj4NCsKgwqDCoMKgIERJU1RST8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
PSAmcXVvdDtwb2t5JnF1b3Q7PGJyPg0KwqDCoMKgwqAgRElTVFJPX1ZFUlNJT07CoMKgwqDCoMKg
wqAgPSAmcXVvdDszLjIrc25hcHNob3QtMjAyMDExMTImcXVvdDs8YnI+DQrCoMKgwqDCoCBUVU5F
X0ZFQVRVUkVTwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDthYXJjaDY0IGFybXY4YSBjcmMgY29ydGV4
YTU3JnF1b3Q7PGJyPg0KwqDCoMKgwqAgVEFSR0VUX0ZQVcKgwqDCoMKgwqDCoMKgwqDCoMKgID0g
JnF1b3Q7JnF1b3Q7PGJyPg0KwqDCoMKgwqAgbWV0YTxicj4NCsKgwqDCoMKgIG1ldGEtcG9reTxi
cj4NCsKgwqDCoMKgIG1ldGEteW9jdG8tYnNwwqDCoMKgwqDCoMKgID0gPGJyPg0KJnF1b3Q7bWFz
dGVyOmU5NDllNzZkMGY2ODk3ZWM1ZDRmZWFhNDdhZmQyYjA0OWIzMjcwN2YmcXVvdDs8YnI+DQrC
oMKgwqDCoCB3b3Jrc3BhY2XCoMKgwqDCoMKgwqDCoMKgwqDCoMKgID0gJnF1b3Q7Jmx0O3Vua25v
d24mZ3Q7OiZsdDt1bmtub3duJmd0OyZxdW90Ozxicj4NCjxicj4NCsKgwqDCoMKgIEluaXRpYWxp
c2luZyB0YXNrczogMTAwJSA8YnI+DQp8IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyN8IFRpbWU6IDA6MDA6MDA8YnI+DQrCoMKgwqDCoCBT
c3RhdGUgc3VtbWFyeTogV2FudGVkIDIwIEZvdW5kIDIwIE1pc3NlZCAwIEN1cnJlbnQgMCAoMTAw
JSBtYXRjaCwgPGJyPg0KMCUgY29tcGxldGUpPGJyPg0KwqDCoMKgwqAgTk9URTogRXhlY3V0aW5n
IFRhc2tzPGJyPg0KwqDCoMKgwqAgRVJST1I6IEVycm9yIGV4ZWN1dGluZyBhIHB5dGhvbiBmdW5j
dGlvbiBpbiBleGVjX3B5dGhvbl9mdW5jKCkgPGJyPg0KYXV0b2dlbmVyYXRlZDo8YnI+DQo8YnI+
DQrCoMKgwqDCoCBUaGUgc3RhY2sgdHJhY2Ugb2YgcHl0aG9uIGNhbGxzIHRoYXQgcmVzdWx0ZWQg
aW4gdGhpcyA8YnI+DQpleGNlcHRpb24vZmFpbHVyZSB3YXM6PGJyPg0KwqDCoMKgwqAgRmlsZTog
JiMzOTtleGVjX3B5dGhvbl9mdW5jKCkgYXV0b2dlbmVyYXRlZCYjMzk7LCBsaW5lbm86IDIsIGZ1
bmN0aW9uOiAmbHQ7bW9kdWxlJmd0Ozxicj4NCsKgwqDCoMKgIMKgwqDCoMKgIDAwMDE6PGJyPg0K
wqDCoMKgwqDCoCAqKiogMDAwMjpkZXZ0b29sX3Bvc3RfdW5wYWNrKGQpPGJyPg0KwqDCoMKgIMKg
wqDCoCDCoCAwMDAzOjxicj4NCsKgwqDCoMKgIEZpbGU6IDxicj4NCiYjMzk7L3dvcmsveW9jdG8v
ZGV2dG9vbC1yZXByb2R1Y2UyL3NvdXJjZXMvcG9reS9tZXRhL2NsYXNzZXMvZGV2dG9vbC1zb3Vy
Y2UuYmJjbGFzcyYjMzk7LCA8YnI+DQpsaW5lbm86IDY4LCBmdW5jdGlvbjogZGV2dG9vbF9wb3N0
X3VucGFjazxicj4NCsKgwqDCoMKgIMKgwqDCoMKgIDAwNjQ6fTxicj4NCsKgwqDCoCDCoMKgwqAg
wqAgMDA2NTo8YnI+DQrCoMKgwqDCoCDCoMKgIMKgIDAwNjY6PGJyPg0KwqDCoMKgwqAgwqDCoCDC
oCAwMDY3OnB5dGhvbiBkZXZ0b29sX3Bvc3RfdW5wYWNrKCkgezxicj4NCsKgwqDCoMKgwqAgKioq
IDAwNjg6wqDCoMKgIGltcG9ydCBvZS5yZWNpcGV1dGlsczxicj4NCsKgwqDCoCDCoMKgwqAgwqAg
MDA2OTrCoMKgwqAgaW1wb3J0IHNodXRpbDxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDA3MDrCoMKg
wqAgc3lzLnBhdGguaW5zZXJ0KDAsIG9zLnBhdGguam9pbihkLmdldFZhcigmIzM5O0NPUkVCQVNF
JiMzOTspLCA8YnI+DQomIzM5O3NjcmlwdHMmIzM5OywgJiMzOTtsaWImIzM5OykpPGJyPg0KwqDC
oMKgIMKgwqDCoCDCoCAwMDcxOsKgwqDCoCBpbXBvcnQgc2NyaXB0dXRpbHM8YnI+DQrCoMKgwqDC
oCDCoMKgIMKgIDAwNzI6wqDCoMKgIGZyb20gZGV2dG9vbCBpbXBvcnQgc2V0dXBfZ2l0X3JlcG88
YnI+DQrCoMKgwqDCoCBGaWxlOiA8YnI+DQomIzM5Oy93b3JrL3lvY3RvL2RldnRvb2wtcmVwcm9k
dWNlMi9zb3VyY2VzL3Bva3kvbWV0YS9saWIvb2UvcmVjaXBldXRpbHMucHkmIzM5OywgPGJyPg0K
bGluZW5vOiAyMSwgZnVuY3Rpb246ICZsdDttb2R1bGUmZ3Q7PGJyPg0KwqDCoCDCoMKgIMKgIMKg
IDAwMTc6aW1wb3J0IHNodXRpbDxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMDE4OmltcG9ydCByZTxi
cj4NCsKgwqAgwqDCoCDCoCDCoCAwMDE5OmltcG9ydCBmbm1hdGNoPGJyPg0KwqDCoCDCoMKgIMKg
IMKgIDAwMjA6aW1wb3J0IGdsb2I8YnI+DQrCoMKgwqDCoMKgICoqKiAwMDIxOmltcG9ydCBiYi50
aW5mb2lsPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAwMjI6PGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAw
MjM6ZnJvbSBjb2xsZWN0aW9ucyBpbXBvcnQgT3JkZXJlZERpY3QsIGRlZmF1bHRkaWN0PGJyPg0K
wqDCoCDCoMKgIMKgIMKgIDAwMjQ6ZnJvbSBiYi51dGlscyBpbXBvcnQgdmVyY21wX3N0cmluZzxi
cj4NCsKgwqAgwqDCoCDCoCDCoCAwMDI1Ojxicj4NCsKgwqDCoMKgIEZpbGU6IDxicj4NCiYjMzk7
L3dvcmsveW9jdG8vZGV2dG9vbC1yZXByb2R1Y2UyL3NvdXJjZXMvcG9reS9iaXRiYWtlL2xpYi9i
Yi90aW5mb2lsLnB5JiMzOTssIDxicj4NCmxpbmVubzogMTksIGZ1bmN0aW9uOiAmbHQ7bW9kdWxl
Jmd0Ozxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMDE1OmZyb20gY29sbGVjdGlvbnMgaW1wb3J0IE9y
ZGVyZWREaWN0LCBkZWZhdWx0ZGljdDxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMDE2OmZyb20gZnVu
Y3Rvb2xzIGltcG9ydCBwYXJ0aWFsPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAwMTc6PGJyPg0KwqDC
oMKgIMKgwqDCoCDCoCAwMDE4OmltcG9ydCBiYi5jYWNoZTxicj4NCsKgwqDCoMKgwqAgKioqIDAw
MTk6aW1wb3J0IGJiLmNvb2tlcjxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAyMDppbXBvcnQgYmIu
cHJvdmlkZXJzPGJyPg0KwqDCoMKgwqAgwqDCoCDCoCAwMDIxOmltcG9ydCBiYi50YXNrZGF0YTxi
cj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAyMjppbXBvcnQgYmIudXRpbHM8YnI+DQrCoMKgwqDCoCDC
oMKgIMKgIDAwMjM6aW1wb3J0IGJiLmNvbW1hbmQ8YnI+DQrCoMKgwqDCoCBGaWxlOiA8YnI+DQom
IzM5Oy93b3JrL3lvY3RvL2RldnRvb2wtcmVwcm9kdWNlMi9zb3VyY2VzL3Bva3kvYml0YmFrZS9s
aWIvYmIvY29va2VyLnB5JiMzOTssIDxicj4NCmxpbmVubzogMjUsIGZ1bmN0aW9uOiAmbHQ7bW9k
dWxlJmd0Ozxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMDIxOmltcG9ydCBiYiwgYmIuZXhjZXB0aW9u
cywgYmIuY29tbWFuZDxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAyMjpmcm9tIGJiIGltcG9ydCB1
dGlscywgZGF0YSwgcGFyc2UsIGV2ZW50LCBjYWNoZSwgPGJyPg0KcHJvdmlkZXJzLCB0YXNrZGF0
YSwgcnVucXVldWUsIGJ1aWxkPGJyPg0KwqDCoMKgwqAgwqDCoCDCoCAwMDIzOmltcG9ydCBxdWV1
ZTxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDAyNDppbXBvcnQgc2lnbmFsPGJyPg0KwqDCoMKgwqDC
oCAqKiogMDAyNTppbXBvcnQgcHJzZXJ2LnNlcnY8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAwMjY6
aW1wb3J0IHB5aW5vdGlmeTxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAyNzppbXBvcnQganNvbjxi
cj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAyODppbXBvcnQgcGlja2xlPGJyPg0KwqDCoMKgIMKgwqDC
oCDCoCAwMDI5OmltcG9ydCBjb2RlY3M8YnI+DQrCoMKgwqDCoCBGaWxlOiA8YnI+DQomIzM5Oy93
b3JrL3lvY3RvL2RldnRvb2wtcmVwcm9kdWNlMi9zb3VyY2VzL3Bva3kvYml0YmFrZS9saWIvcHJz
ZXJ2L3NlcnYucHkmIzM5OywgPGJyPg0KbGluZW5vOiA3LCBmdW5jdGlvbjogJmx0O21vZHVsZSZn
dDs8YnI+DQrCoMKgwqDCoCDCoCDCoMKgIDAwMDM6Izxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMDA0
Ojxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMDA1OmltcG9ydCBvcyxzeXMsbG9nZ2luZzxicj4NCsKg
wqAgwqDCoCDCoCDCoCAwMDA2OmltcG9ydCBzaWduYWwsIHRpbWU8YnI+DQrCoMKgwqDCoMKgICoq
KiAwMDA3OmZyb20geG1scnBjLnNlcnZlciBpbXBvcnQgU2ltcGxlWE1MUlBDU2VydmVyLCA8YnI+
DQpTaW1wbGVYTUxSUENSZXF1ZXN0SGFuZGxlcjxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAwODpp
bXBvcnQgdGhyZWFkaW5nPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDA5OmltcG9ydCBxdWV1ZTxi
cj4NCsKgwqDCoMKgIMKgwqAgwqAgMDAxMDppbXBvcnQgc29ja2V0PGJyPg0KwqDCoMKgIMKgwqDC
oCDCoCAwMDExOmltcG9ydCBpbzxicj4NCsKgwqDCoMKgIEZpbGU6ICYjMzk7L3Vzci9saWIvcHl0
aG9uMy44L3htbHJwYy9zZXJ2ZXIucHkmIzM5OywgbGluZW5vOiAxMTcsIGZ1bmN0aW9uOiA8YnI+
DQombHQ7bW9kdWxlJmd0Ozxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMTEzOmltcG9ydCBzb2NrZXRz
ZXJ2ZXI8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDExNDppbXBvcnQgc3lzPGJyPg0KwqDCoCDCoMKg
IMKgIMKgIDAxMTU6aW1wb3J0IG9zPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAxMTY6aW1wb3J0IHJl
PGJyPg0KwqDCoMKgwqDCoCAqKiogMDExNzppbXBvcnQgcHlkb2M8YnI+DQrCoMKgwqAgwqDCoMKg
IMKgIDAxMTg6aW1wb3J0IHRyYWNlYmFjazxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDExOTp0cnk6
PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMTIwOsKgwqDCoCBpbXBvcnQgZmNudGw8YnI+DQrCoMKg
wqDCoCDCoMKgIMKgIDAxMjE6ZXhjZXB0IEltcG9ydEVycm9yOjxicj4NCsKgwqDCoMKgIEZpbGU6
ICYjMzk7L3Vzci9saWIvcHl0aG9uMy44L3B5ZG9jLnB5JiMzOTssIGxpbmVubzogMzcwLCBmdW5j
dGlvbjogJmx0O21vZHVsZSZndDs8YnI+DQrCoMKgwqDCoCDCoCDCoMKgIDAzNjY6wqDCoMKgIHJl
dHVybiBtb2R1bGU8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDM2Nzo8YnI+DQrCoMKgIMKgwqAgwqAg
wqAgMDM2ODojIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0gPGJyPg0KZm9ybWF0dGVyIGJhc2UgY2xhc3M8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAz
Njk6PGJyPg0KwqDCoMKgwqDCoCAqKiogMDM3MDpjbGFzcyBEb2M6PGJyPg0KwqDCoCDCoMKgIMKg
IMKgIDAzNzE6PGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAzNzI6wqDCoMKgIFBZVEhPTkRPQ1MgPSBv
cy5lbnZpcm9uLmdldCgmcXVvdDtQWVRIT05ET0NTJnF1b3Q7LDxicj4NCsKgwqAgwqDCoCDCoCDC
oCAwMzczOiAmcXVvdDs8YSBocmVmPSJodHRwczovL2RvY3MucHl0aG9uLm9yZy8lZC4lZC9saWJy
YXJ5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2RvY3MucHl0aG9u
Lm9yZy8lZC4lZC9saWJyYXJ5PC9hPiZxdW90Ozxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDM3NDrC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAlIHN5cy52ZXJzaW9uX2luZm9bOjJdKTxicj4NCsKgwqDCoMKgIEZpbGU6ICYjMzk7L3Vz
ci9saWIvcHl0aG9uMy44L3B5ZG9jLnB5JiMzOTssIGxpbmVubzogNDAwLCBmdW5jdGlvbjogRG9j
PGJyPg0KwqDCoMKgwqAgwqAgwqDCoCAwMzk2OsKgwqDCoMKgwqDCoMKgIHJhaXNlIFR5cGVFcnJv
cihtZXNzYWdlKTxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDM5Nzo8YnI+DQrCoMKgwqAgwqDCoMKg
IMKgIDAzOTg6wqDCoMKgIGRvY21vZHVsZSA9IGRvY2NsYXNzID0gZG9jcm91dGluZSA9IGRvY290
aGVyID0gPGJyPg0KZG9jcHJvcGVydHkgPSBkb2NkYXRhID0gZmFpbDxicj4NCsKgwqDCoCDCoMKg
wqAgwqAgMDM5OTo8YnI+DQrCoMKgwqDCoMKgICoqKiAwNDAwOsKgwqDCoCBkZWYgZ2V0ZG9jbG9j
KHNlbGYsIG9iamVjdCwgPGJyPg0KYmFzZWRpcj1zeXNjb25maWcuZ2V0X3BhdGgoJiMzOTtzdGRs
aWImIzM5OykpOjxicj4NCsKgwqAgwqDCoCDCoCDCoCAwNDAxOsKgwqDCoMKgwqDCoMKgICZxdW90
OyZxdW90OyZxdW90O1JldHVybiB0aGUgbG9jYXRpb24gb2YgbW9kdWxlIGRvY3Mgb3IgTm9uZSZx
dW90OyZxdW90OyZxdW90Ozxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQwMjo8YnI+DQrCoMKgwqDC
oCDCoMKgIMKgIDA0MDM6wqDCoMKgwqDCoMKgwqAgdHJ5Ojxicj4NCsKgwqDCoCDCoMKgwqAgwqAg
MDQwNDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZpbGUgPSBpbnNwZWN0LmdldGFic2ZpbGUob2Jq
ZWN0KTxicj4NCsKgwqDCoMKgIEZpbGU6ICYjMzk7L3Vzci9saWIvcHl0aG9uMy44L3N5c2NvbmZp
Zy5weSYjMzk7LCBsaW5lbm86IDUxMiwgZnVuY3Rpb246IDxicj4NCmdldF9wYXRoPGJyPg0KwqDC
oCDCoMKgIMKgIMKgIDA1MDg6wqDCoMKgICZxdW90OyZxdW90OyZxdW90O1JldHVybiBhIHBhdGgg
Y29ycmVzcG9uZGluZyB0byB0aGUgc2NoZW1lLjxicj4NCsKgwqAgwqDCoCDCoCDCoCAwNTA5Ojxi
cj4NCsKgwqAgwqDCoCDCoCDCoCAwNTEwOsKgwqDCoCBgYHNjaGVtZWBgIGlzIHRoZSBpbnN0YWxs
IHNjaGVtZSBuYW1lLjxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDUxMTrCoMKgwqAgJnF1b3Q7JnF1
b3Q7JnF1b3Q7PGJyPg0KwqDCoMKgwqDCoCAqKiogMDUxMjrCoMKgwqAgcmV0dXJuIGdldF9wYXRo
cyhzY2hlbWUsIHZhcnMsIGV4cGFuZClbbmFtZV08YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDA1MTM6
PGJyPg0KwqDCoMKgwqAgwqDCoCDCoCAwNTE0Ojxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDUxNTpk
ZWYgZ2V0X2NvbmZpZ192YXJzKCphcmdzKTo8YnI+DQrCoMKgwqDCoCDCoMKgIMKgIDA1MTY6wqDC
oMKgICZxdW90OyZxdW90OyZxdW90O1dpdGggbm8gYXJndW1lbnRzLCByZXR1cm4gYSBkaWN0aW9u
YXJ5IG9mIGFsbCA8YnI+DQpjb25maWd1cmF0aW9uPGJyPg0KwqDCoMKgwqAgRmlsZTogJiMzOTsv
dXNyL2xpYi9weXRob24zLjgvc3lzY29uZmlnLnB5JiMzOTssIGxpbmVubzogNTAyLCBmdW5jdGlv
bjogPGJyPg0KZ2V0X3BhdGhzPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDA0OTg6wqDCoMKgIGBgc2No
ZW1lYGAgaXMgdGhlIGluc3RhbGwgc2NoZW1lIG5hbWUuIElmIG5vdCA8YnI+DQpwcm92aWRlZCwg
aXQgd2lsbDxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQ5OTrCoMKgwqAgcmV0dXJuIHRoZSBkZWZh
dWx0IHNjaGVtZSBmb3IgdGhlIGN1cnJlbnQgcGxhdGZvcm0uPGJyPg0KwqDCoMKgwqAgwqDCoCDC
oCAwNTAwOsKgwqDCoCAmcXVvdDsmcXVvdDsmcXVvdDs8YnI+DQrCoMKgwqDCoCDCoMKgIMKgIDA1
MDE6wqDCoMKgIGlmIGV4cGFuZDo8YnI+DQrCoMKgwqDCoMKgICoqKiAwNTAyOsKgwqDCoMKgwqDC
oMKgIHJldHVybiBfZXhwYW5kX3ZhcnMoc2NoZW1lLCB2YXJzKTxicj4NCsKgwqDCoCDCoMKgwqAg
wqAgMDUwMzrCoMKgwqAgZWxzZTo8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDA1MDQ6wqDCoMKgwqDC
oMKgwqAgcmV0dXJuIF9JTlNUQUxMX1NDSEVNRVNbc2NoZW1lXTxicj4NCsKgwqDCoCDCoMKgwqAg
wqAgMDUwNTo8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDA1MDY6PGJyPg0KwqDCoMKgwqAgRmlsZTog
JiMzOTsvdXNyL2xpYi9weXRob24zLjgvc3lzY29uZmlnLnB5JiMzOTssIGxpbmVubzogMTcyLCBm
dW5jdGlvbjogPGJyPg0KX2V4cGFuZF92YXJzPGJyPg0KwqDCoMKgwqAgwqAgwqDCoCAwMTY4OmRl
ZiBfZXhwYW5kX3ZhcnMoc2NoZW1lLCB2YXJzKTo8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDE2OTrC
oMKgwqAgcmVzID0ge308YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDE3MDrCoMKgwqAgaWYgdmFycyBp
cyBOb25lOjxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMTcxOsKgwqDCoMKgwqDCoMKgIHZhcnMgPSB7
fTxicj4NCsKgwqDCoMKgwqAgKioqIDAxNzI6wqDCoMKgIF9leHRlbmRfZGljdCh2YXJzLCBnZXRf
Y29uZmlnX3ZhcnMoKSk8YnI+DQrCoMKgwqDCoCDCoCDCoMKgIDAxNzM6PGJyPg0KwqDCoCDCoMKg
IMKgIMKgIDAxNzQ6wqDCoMKgIGZvciBrZXksIHZhbHVlIGluIF9JTlNUQUxMX1NDSEVNRVNbc2No
ZW1lXS5pdGVtcygpOjxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMTc1OsKgwqDCoMKgwqDCoMKgIGlm
IDxhIGhyZWY9Imh0dHA6Ly9vcy5uYW1lIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5vcy5uYW1lPC9hPiBpbiAoJiMzOTtwb3NpeCYjMzk7LCAmIzM5O250JiMzOTspOjxicj4NCsKg
wqAgwqDCoCDCoCDCoCAwMTc2OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFsdWUgPSBvcy5wYXRo
LmV4cGFuZHVzZXIodmFsdWUpPGJyPg0KwqDCoMKgwqAgRmlsZTogJiMzOTsvdXNyL2xpYi9weXRo
b24zLjgvc3lzY29uZmlnLnB5JiMzOTssIGxpbmVubzogNTUwLCBmdW5jdGlvbjogPGJyPg0KZ2V0
X2NvbmZpZ192YXJzPGJyPg0KwqDCoMKgwqAgwqAgwqDCoCAwNTQ2Ojxicj4NCsKgwqDCoCDCoMKg
wqAgwqAgMDU0NzrCoMKgwqDCoMKgwqDCoCBpZiA8YSBocmVmPSJodHRwOi8vb3MubmFtZSIgcmVs
PSJub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+b3MubmFtZTwvYT4gPT0gJiMzOTtudCYjMzk7
Ojxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDU0ODrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9pbml0
X25vbl9wb3NpeChfQ09ORklHX1ZBUlMpPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwNTQ5OsKgwqDC
oMKgwqDCoMKgIGlmIDxhIGhyZWY9Imh0dHA6Ly9vcy5uYW1lIiByZWw9Im5vcmVmZXJyZXIiIHRh
cmdldD0iX2JsYW5rIj5vcy5uYW1lPC9hPiA9PSAmIzM5O3Bvc2l4JiMzOTs6PGJyPg0KwqDCoMKg
wqDCoCAqKiogMDU1MDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9pbml0X3Bvc2l4KF9DT05GSUdf
VkFSUyk8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDU1MTrCoMKgwqDCoMKgwqDCoCAjIEZvciBiYWNr
d2FyZCBjb21wYXRpYmlsaXR5LCBzZWUgaXNzdWUxOTU1NTxicj4NCsKgwqAgwqDCoCDCoCDCoCAw
NTUyOsKgwqDCoMKgwqDCoMKgIFNPID0gX0NPTkZJR19WQVJTLmdldCgmIzM5O0VYVF9TVUZGSVgm
IzM5Oyk8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDU1MzrCoMKgwqDCoMKgwqDCoCBpZiBTTyBpcyBu
b3QgTm9uZTo8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDU1NDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IF9DT05GSUdfVkFSU1smIzM5O1NPJiMzOTtdID0gU088YnI+DQrCoMKgwqDCoCBGaWxlOiAmIzM5
Oy91c3IvbGliL3B5dGhvbjMuOC9zeXNjb25maWcucHkmIzM5OywgbGluZW5vOiA0MjEsIGZ1bmN0
aW9uOiA8YnI+DQpfaW5pdF9wb3NpeDxicj4NCsKgwqAgwqDCoCDCoCDCoCAwNDE3OmRlZiBfaW5p
dF9wb3NpeCh2YXJzKTo8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDQxODrCoMKgwqAgJnF1b3Q7JnF1
b3Q7JnF1b3Q7SW5pdGlhbGl6ZSB0aGUgbW9kdWxlIGFzIGFwcHJvcHJpYXRlIGZvciBQT1NJWCA8
YnI+DQpzeXN0ZW1zLiZxdW90OyZxdW90OyZxdW90Ozxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQx
OTrCoMKgwqAgIyBfc3lzY29uZmlnZGF0YSBpcyBnZW5lcmF0ZWQgYXQgYnVpbGQgdGltZSwgc2Vl
IDxicj4NCl9nZW5lcmF0ZV9wb3NpeF92YXJzKCk8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDA0MjA6
wqDCoMKgIG5hbWUgPSBfZ2V0X3N5c2NvbmZpZ2RhdGFfbmFtZSgpPGJyPg0KwqDCoMKgwqDCoCAq
KiogMDQyMTrCoMKgwqAgX3RlbXAgPSBfX2ltcG9ydF9fKG5hbWUsIGdsb2JhbHMoKSwgbG9jYWxz
KCksIDxicj4NClsmIzM5O2J1aWxkX3RpbWVfdmFycyYjMzk7XSwgMCk8YnI+DQrCoMKgwqAgwqDC
oMKgIMKgIDA0MjI6wqDCoMKgIGJ1aWxkX3RpbWVfdmFycyA9IF90ZW1wLmJ1aWxkX3RpbWVfdmFy
czxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQyMzrCoMKgwqAgdmFycy51cGRhdGUoYnVpbGRfdGlt
ZV92YXJzKTxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDQyNDo8YnI+DQrCoMKgwqAgwqDCoMKgIMKg
IDA0MjU6ZGVmIF9pbml0X25vbl9wb3NpeCh2YXJzKTo8YnI+DQrCoMKgwqDCoCBFeGNlcHRpb246
IE1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAmIzM5O19zeXNjb25maWdkYXRh
JiMzOTs8YnI+DQo8YnI+DQo8YnI+DQpUaGFua3MsPGJyPg0KL1BldGVyPGJyPg0KPGJyPg0KPC9i
bG9ja3F1b3RlPjwvZGl2Pg0K

--0000000000002e0cd305b3eb0d10--
