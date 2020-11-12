Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web12.9661.1605209151097798677
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Nov 2020 11:25:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q2MFkztt;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id r14so3882181vsa.13
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Nov 2020 11:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qc7jzyNdrBPSo4tghHG4kJFT5sXa2A+vK4xF4Zx1xD0=;
        b=Q2MFkzttXSnQozK7yJ+Oj+UiXQ2vbWvWv2MrDNpzp/ZbyOdgIMIA8ltnVzcDhFzXqY
         y0PTekEXY8JJY2SkDzWDwojxxCTQaSEneHpq4bDak/6WHpQwrjFgZtRau8zALeS3Avon
         wXuq+CXMwY2c/QKsI82onZNKgDtiXFV03ULplpIf42eoFqwPyKJF396MhJJNji8Hkdbc
         6N4L61JgTsZ+Wq1zgOeIBq0dk0bT5AADLXzO7Tys1gOaGCcyZEANXd8g/MlKZzi3Q9GR
         Yfh9rbQS6kynCDFUjhevLvKzfZS+JrltKSdRUHZ6wCoBRjLTn7qZ0PZZhv3875nXLkAn
         Q1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qc7jzyNdrBPSo4tghHG4kJFT5sXa2A+vK4xF4Zx1xD0=;
        b=TRdjqlW0bsGRhqCbRrQ79QA5w+gD7geIB2cRVLy7xaOuvT1NZh4f52E7hne8dncfqM
         CWKvbbu0SktTzdWsTeV175EBi3F4TZEMr6r9bbLsayb5l60o5695xtINPSkuiSRjM/UQ
         AofBftV+qkuHvUYCreomQ7RkEbPhZywYjVElmxR6TGl2pssvUcbYalKWuP08iIT1vEVr
         Z3i/eM1Z+1Wi0p3o3VYkkXtr/vesyVSAaSFFYpn3rqKo7ClHwXp0wgRyODZo/iTbb837
         q+dGZRwnMb64OY9nF+iLEoSpP/crHMA0FsiSLPkF3VxvLS1eonUCuJWOa+a2gkuShl0e
         rJyQ==
X-Gm-Message-State: AOAM531oQ5Iiaa2nAIXbvqFFoiZ3zYI4EjxTIrIvgyf/R9j6CfqPT1+i
	ohMkhnX1d8ms0hJvf/N4YJG4B8Iyk6643h7wo0+wm8IvAoPG8A==
X-Google-Smtp-Source: ABdhPJwBbPohCboqlJnMSBXAbf3F+NoiM4LtXobxjctye1njlgNZNNtLi5m3RqLuP3wjIhlvO51DI9mjsufjtNLDpz0=
X-Received: by 2002:a05:6102:4a6:: with SMTP id r6mr818243vsa.41.1605209149943;
 Thu, 12 Nov 2020 11:25:49 -0800 (PST)
MIME-Version: 1.0
References: <76c7c436-29d1-1687-1889-72e883697a75@berginkonsult.se>
 <29322.1605179238305301621@lists.openembedded.org> <CANNYZj_d6uefKzNP1YQ=zGNuG2z0xRs=37Zv1vz3XFvL4i3KPA@mail.gmail.com>
 <d3a9efbd-e980-65e8-4bc0-15247a8966a1@berginkonsult.se> <1646CE2BCADFDD56.31886@lists.openembedded.org>
In-Reply-To: <1646CE2BCADFDD56.31886@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 12 Nov 2020 20:25:38 +0100
Message-ID: <CANNYZj_WNm8tHff5TV7_k-233LJqQ4sMJFEkC3S=eMjts9qRtw@mail.gmail.com>
Subject: Re: [OE-core] devtool modify - ModuleNotFoundError: No module named '_sysconfigdata'
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Peter Bergin <peter@berginkonsult.se>, ernst.sjostrand@lists.verisure.com, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002c334005b3ede13a"

--0000000000002c334005b3ede13a
Content-Type: text/plain; charset="UTF-8"

I have a tentative fix, but need to test it thoroughly, and adjust recipes
to use the new class where needed:
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=akanavin/package-version-updates&id=d6b6a6f67cc967c0ead6dbab3c95435b7ca85246

It does resolve the devtool issue though.

Alex

On Thu, 12 Nov 2020 at 17:03, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> I have just seen it first-hand for the first time. It happens on Ubuntu
> 20.04, but not on for example OpenSuse tumbleweed. So something in Ubuntu
> causes the native python environment to leak into the host python
> environment. Will investigate.
>
> Alex
>
> On Thu, 12 Nov 2020 at 13:59, Peter Bergin <peter@berginkonsult.se> wrote:
>
>> Hi Alex,
>>
>> On 2020-11-12 12:38, Alexander Kanavin wrote:
>> > If you can provide exact steps to reproduce (the recipe is not
>> > available in oe-core), I can take a look. It's been reported plenty of
>> > times, but always with something not in core and not easily available.
>>
>> here are the steps to reproduce with only poky. I hope it can help you
>> find the root cause:
>>
>>      $ git clone https://git.yoctoproject.org/git/poky sources/poky
>>      $ . ./sources/poky/oe-init-build-env
>>      $ echo 'MACHINE = "qemuarm64"' >> conf/auto.conf
>>      $ devtool modify u-boot
>>
>> And here is the output on my machine:
>>
>>      Build Configuration:
>>      BB_VERSION           = "1.49.0"
>>      BUILD_SYS            = "x86_64-linux"
>>      NATIVELSBSTRING      = "ubuntu-20.04"
>>      TARGET_SYS           = "aarch64-poky-linux"
>>      MACHINE              = "qemuarm64"
>>      DISTRO               = "poky"
>>      DISTRO_VERSION       = "3.2+snapshot-20201112"
>>      TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
>>      TARGET_FPU           = ""
>>      meta
>>      meta-poky
>>      meta-yocto-bsp       =
>> "master:e949e76d0f6897ec5d4feaa47afd2b049b32707f"
>>      workspace            = "<unknown>:<unknown>"
>>
>>      Initialising tasks: 100%
>> |###########################################################| Time:
>> 0:00:00
>>      Sstate summary: Wanted 20 Found 20 Missed 0 Current 0 (100% match,
>> 0% complete)
>>      NOTE: Executing Tasks
>>      ERROR: Error executing a python function in exec_python_func()
>> autogenerated:
>>
>>      The stack trace of python calls that resulted in this
>> exception/failure was:
>>      File: 'exec_python_func() autogenerated', lineno: 2, function:
>> <module>
>>           0001:
>>       *** 0002:devtool_post_unpack(d)
>>           0003:
>>      File:
>> '/work/yocto/devtool-reproduce2/sources/poky/meta/classes/devtool-source.bbclass',
>>
>> lineno: 68, function: devtool_post_unpack
>>           0064:}
>>           0065:
>>           0066:
>>           0067:python devtool_post_unpack() {
>>       *** 0068:    import oe.recipeutils
>>           0069:    import shutil
>>           0070:    sys.path.insert(0, os.path.join(d.getVar('COREBASE'),
>> 'scripts', 'lib'))
>>           0071:    import scriptutils
>>           0072:    from devtool import setup_git_repo
>>      File:
>> '/work/yocto/devtool-reproduce2/sources/poky/meta/lib/oe/recipeutils.py',
>> lineno: 21, function: <module>
>>           0017:import shutil
>>           0018:import re
>>           0019:import fnmatch
>>           0020:import glob
>>       *** 0021:import bb.tinfoil
>>           0022:
>>           0023:from collections import OrderedDict, defaultdict
>>           0024:from bb.utils import vercmp_string
>>           0025:
>>      File:
>> '/work/yocto/devtool-reproduce2/sources/poky/bitbake/lib/bb/tinfoil.py',
>> lineno: 19, function: <module>
>>           0015:from collections import OrderedDict, defaultdict
>>           0016:from functools import partial
>>           0017:
>>           0018:import bb.cache
>>       *** 0019:import bb.cooker
>>           0020:import bb.providers
>>           0021:import bb.taskdata
>>           0022:import bb.utils
>>           0023:import bb.command
>>      File:
>> '/work/yocto/devtool-reproduce2/sources/poky/bitbake/lib/bb/cooker.py',
>> lineno: 25, function: <module>
>>           0021:import bb, bb.exceptions, bb.command
>>           0022:from bb import utils, data, parse, event, cache,
>> providers, taskdata, runqueue, build
>>           0023:import queue
>>           0024:import signal
>>       *** 0025:import prserv.serv
>>           0026:import pyinotify
>>           0027:import json
>>           0028:import pickle
>>           0029:import codecs
>>      File:
>> '/work/yocto/devtool-reproduce2/sources/poky/bitbake/lib/prserv/serv.py',
>> lineno: 7, function: <module>
>>           0003:#
>>           0004:
>>           0005:import os,sys,logging
>>           0006:import signal, time
>>       *** 0007:from xmlrpc.server import SimpleXMLRPCServer,
>> SimpleXMLRPCRequestHandler
>>           0008:import threading
>>           0009:import queue
>>           0010:import socket
>>           0011:import io
>>      File: '/usr/lib/python3.8/xmlrpc/server.py', lineno: 117, function:
>> <module>
>>           0113:import socketserver
>>           0114:import sys
>>           0115:import os
>>           0116:import re
>>       *** 0117:import pydoc
>>           0118:import traceback
>>           0119:try:
>>           0120:    import fcntl
>>           0121:except ImportError:
>>      File: '/usr/lib/python3.8/pydoc.py', lineno: 370, function: <module>
>>           0366:    return module
>>           0367:
>>           0368:# ----------------------------------------------------
>> formatter base class
>>           0369:
>>       *** 0370:class Doc:
>>           0371:
>>           0372:    PYTHONDOCS = os.environ.get("PYTHONDOCS",
>>           0373: "https://docs.python.org/%d.%d/library"
>>           0374:                                % sys.version_info[:2])
>>      File: '/usr/lib/python3.8/pydoc.py', lineno: 400, function: Doc
>>           0396:        raise TypeError(message)
>>           0397:
>>           0398:    docmodule = docclass = docroutine = docother =
>> docproperty = docdata = fail
>>           0399:
>>       *** 0400:    def getdocloc(self, object,
>> basedir=sysconfig.get_path('stdlib')):
>>           0401:        """Return the location of module docs or None"""
>>           0402:
>>           0403:        try:
>>           0404:            file = inspect.getabsfile(object)
>>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 512, function:
>> get_path
>>           0508:    """Return a path corresponding to the scheme.
>>           0509:
>>           0510:    ``scheme`` is the install scheme name.
>>           0511:    """
>>       *** 0512:    return get_paths(scheme, vars, expand)[name]
>>           0513:
>>           0514:
>>           0515:def get_config_vars(*args):
>>           0516:    """With no arguments, return a dictionary of all
>> configuration
>>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 502, function:
>> get_paths
>>           0498:    ``scheme`` is the install scheme name. If not
>> provided, it will
>>           0499:    return the default scheme for the current platform.
>>           0500:    """
>>           0501:    if expand:
>>       *** 0502:        return _expand_vars(scheme, vars)
>>           0503:    else:
>>           0504:        return _INSTALL_SCHEMES[scheme]
>>           0505:
>>           0506:
>>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 172, function:
>> _expand_vars
>>           0168:def _expand_vars(scheme, vars):
>>           0169:    res = {}
>>           0170:    if vars is None:
>>           0171:        vars = {}
>>       *** 0172:    _extend_dict(vars, get_config_vars())
>>           0173:
>>           0174:    for key, value in _INSTALL_SCHEMES[scheme].items():
>>           0175:        if os.name in ('posix', 'nt'):
>>           0176:            value = os.path.expanduser(value)
>>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 550, function:
>> get_config_vars
>>           0546:
>>           0547:        if os.name == 'nt':
>>           0548:            _init_non_posix(_CONFIG_VARS)
>>           0549:        if os.name == 'posix':
>>       *** 0550:            _init_posix(_CONFIG_VARS)
>>           0551:        # For backward compatibility, see issue19555
>>           0552:        SO = _CONFIG_VARS.get('EXT_SUFFIX')
>>           0553:        if SO is not None:
>>           0554:            _CONFIG_VARS['SO'] = SO
>>      File: '/usr/lib/python3.8/sysconfig.py', lineno: 421, function:
>> _init_posix
>>           0417:def _init_posix(vars):
>>           0418:    """Initialize the module as appropriate for POSIX
>> systems."""
>>           0419:    # _sysconfigdata is generated at build time, see
>> _generate_posix_vars()
>>           0420:    name = _get_sysconfigdata_name()
>>       *** 0421:    _temp = __import__(name, globals(), locals(),
>> ['build_time_vars'], 0)
>>           0422:    build_time_vars = _temp.build_time_vars
>>           0423:    vars.update(build_time_vars)
>>           0424:
>>           0425:def _init_non_posix(vars):
>>      Exception: ModuleNotFoundError: No module named '_sysconfigdata'
>>
>>
>> Thanks,
>> /Peter
>>
>>
> 
>
>

--0000000000002c334005b3ede13a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5JIGhhdmUgYSB0ZW50YXRpdmUgZml4LCBidXQgbmVlZCB0byB0
ZXN0IGl0IHRob3JvdWdobHksIGFuZCBhZGp1c3QgcmVjaXBlcyB0byB1c2UgdGhlIG5ldyBjbGFz
cyB3aGVyZSBuZWVkZWQ6PC9kaXY+PGRpdj48YSBocmVmPSJodHRwOi8vZ2l0LnlvY3RvcHJvamVj
dC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5LWNvbnRyaWIvY29tbWl0Lz9oPWFrYW5hdmluL3BhY2th
Z2UtdmVyc2lvbi11cGRhdGVzJmFtcDtpZD1kNmI2YTZmNjdjYzk2N2MwZWFkNmRiYWIzYzk1NDM1
YjdjYTg1MjQ2Ij5odHRwOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvY2dpdC9jZ2l0LmNnaS9wb2t5
LWNvbnRyaWIvY29tbWl0Lz9oPWFrYW5hdmluL3BhY2thZ2UtdmVyc2lvbi11cGRhdGVzJmFtcDtp
ZD1kNmI2YTZmNjdjYzk2N2MwZWFkNmRiYWIzYzk1NDM1YjdjYTg1MjQ2PC9hPjwvZGl2PjxkaXY+
PGJyPjwvZGl2PjxkaXY+SXQgZG9lcyByZXNvbHZlIHRoZSBkZXZ0b29sIGlzc3VlIHRob3VnaC48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkFsZXg8YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xh
c3M9ImdtYWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1
LCAxMiBOb3YgMjAyMCBhdCAxNzowMywgQWxleGFuZGVyIEthbmF2aW4gdmlhIDxhIGhyZWY9Imh0
dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnIj5saXN0cy5vcGVuZW1iZWRkZWQub3JnPC9hPiAm
bHQ7YWxleC5rYW5hdmluPTxhIGhyZWY9Im1haWx0bzpnbWFpbC5jb21AbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyI+Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc8L2E+Jmd0OyB3cm90ZTo8
YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPjxkaXYgZGlyPSJsdHIiPjxkaXY+SSBoYXZlIGp1c3Qgc2VlbiBpdCBm
aXJzdC1oYW5kIGZvciB0aGUgZmlyc3QgdGltZS4gSXQgaGFwcGVucyBvbiBVYnVudHUgMjAuMDQs
IGJ1dCBub3Qgb24gZm9yIGV4YW1wbGUgT3BlblN1c2UgdHVtYmxld2VlZC4gU28gc29tZXRoaW5n
IGluIFVidW50dSBjYXVzZXMgdGhlIG5hdGl2ZSBweXRob24gZW52aXJvbm1lbnQgdG8gbGVhayBp
bnRvIHRoZSBob3N0IHB5dGhvbiBlbnZpcm9ubWVudC4gV2lsbCBpbnZlc3RpZ2F0ZS48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2PkFsZXg8YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gVGh1LCAxMiBO
b3YgMjAyMCBhdCAxMzo1OSwgUGV0ZXIgQmVyZ2luICZsdDs8YSBocmVmPSJtYWlsdG86cGV0ZXJA
YmVyZ2lua29uc3VsdC5zZSIgdGFyZ2V0PSJfYmxhbmsiPnBldGVyQGJlcmdpbmtvbnN1bHQuc2U8
L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBz
dHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2Io
MjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkhpIEFsZXgsPGJyPg0KPGJyPg0KT24gMjAy
MC0xMS0xMiAxMjozOCwgQWxleGFuZGVyIEthbmF2aW4gd3JvdGU6PGJyPg0KJmd0OyBJZiB5b3Ug
Y2FuIHByb3ZpZGUgZXhhY3Qgc3RlcHMgdG8gcmVwcm9kdWNlICh0aGUgcmVjaXBlIGlzIG5vdCA8
YnI+DQomZ3Q7IGF2YWlsYWJsZSBpbiBvZS1jb3JlKSwgSSBjYW4gdGFrZSBhIGxvb2suIEl0JiMz
OTtzIGJlZW4gcmVwb3J0ZWQgcGxlbnR5IG9mIDxicj4NCiZndDsgdGltZXMsIGJ1dCBhbHdheXMg
d2l0aCBzb21ldGhpbmcgbm90IGluIGNvcmUgYW5kIG5vdCBlYXNpbHkgYXZhaWxhYmxlLjxicj4N
Cjxicj4NCmhlcmUgYXJlIHRoZSBzdGVwcyB0byByZXByb2R1Y2Ugd2l0aCBvbmx5IHBva3kuIEkg
aG9wZSBpdCBjYW4gaGVscCB5b3UgPGJyPg0KZmluZCB0aGUgcm9vdCBjYXVzZTo8YnI+DQo8YnI+
DQrCoMKgwqDCoCAkIGdpdCBjbG9uZSA8YSBocmVmPSJodHRwczovL2dpdC55b2N0b3Byb2plY3Qu
b3JnL2dpdC9wb2t5IiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5odHRwczovL2dp
dC55b2N0b3Byb2plY3Qub3JnL2dpdC9wb2t5PC9hPiBzb3VyY2VzL3Bva3k8YnI+DQrCoMKgwqDC
oCAkIC4gLi9zb3VyY2VzL3Bva3kvb2UtaW5pdC1idWlsZC1lbnY8YnI+DQrCoMKgwqDCoCAkIGVj
aG8gJiMzOTtNQUNISU5FID0gJnF1b3Q7cWVtdWFybTY0JnF1b3Q7JiMzOTsgJmd0OyZndDsgY29u
Zi9hdXRvLmNvbmY8YnI+DQrCoMKgwqDCoCAkIGRldnRvb2wgbW9kaWZ5IHUtYm9vdDxicj4NCjxi
cj4NCkFuZCBoZXJlIGlzIHRoZSBvdXRwdXQgb24gbXkgbWFjaGluZTo8YnI+DQo8YnI+DQrCoMKg
wqDCoCBCdWlsZCBDb25maWd1cmF0aW9uOjxicj4NCsKgwqDCoMKgIEJCX1ZFUlNJT07CoMKgwqDC
oMKgwqDCoMKgwqDCoCA9ICZxdW90OzEuNDkuMCZxdW90Ozxicj4NCsKgwqDCoMKgIEJVSUxEX1NZ
U8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDt4ODZfNjQtbGludXgmcXVvdDs8YnI+DQrC
oMKgwqDCoCBOQVRJVkVMU0JTVFJJTkfCoMKgwqDCoMKgID0gJnF1b3Q7dWJ1bnR1LTIwLjA0JnF1
b3Q7PGJyPg0KwqDCoMKgwqAgVEFSR0VUX1NZU8KgwqDCoMKgwqDCoMKgwqDCoMKgID0gJnF1b3Q7
YWFyY2g2NC1wb2t5LWxpbnV4JnF1b3Q7PGJyPg0KwqDCoMKgwqAgTUFDSElORcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgID0gJnF1b3Q7cWVtdWFybTY0JnF1b3Q7PGJyPg0KwqDCoMKgwqAgRElT
VFJPwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCA9ICZxdW90O3Bva3kmcXVvdDs8YnI+DQrC
oMKgwqDCoCBESVNUUk9fVkVSU0lPTsKgwqDCoMKgwqDCoCA9ICZxdW90OzMuMitzbmFwc2hvdC0y
MDIwMTExMiZxdW90Ozxicj4NCsKgwqDCoMKgIFRVTkVfRkVBVFVSRVPCoMKgwqDCoMKgwqDCoCA9
ICZxdW90O2FhcmNoNjQgYXJtdjhhIGNyYyBjb3J0ZXhhNTcmcXVvdDs8YnI+DQrCoMKgwqDCoCBU
QVJHRVRfRlBVwqDCoMKgwqDCoMKgwqDCoMKgwqAgPSAmcXVvdDsmcXVvdDs8YnI+DQrCoMKgwqDC
oCBtZXRhPGJyPg0KwqDCoMKgwqAgbWV0YS1wb2t5PGJyPg0KwqDCoMKgwqAgbWV0YS15b2N0by1i
c3DCoMKgwqDCoMKgwqAgPSA8YnI+DQomcXVvdDttYXN0ZXI6ZTk0OWU3NmQwZjY4OTdlYzVkNGZl
YWE0N2FmZDJiMDQ5YjMyNzA3ZiZxdW90Ozxicj4NCsKgwqDCoMKgIHdvcmtzcGFjZcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgPSAmcXVvdDsmbHQ7dW5rbm93biZndDs6Jmx0O3Vua25vd24mZ3Q7JnF1
b3Q7PGJyPg0KPGJyPg0KwqDCoMKgwqAgSW5pdGlhbGlzaW5nIHRhc2tzOiAxMDAlIDxicj4NCnwj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
I3wgVGltZTogMDowMDowMDxicj4NCsKgwqDCoMKgIFNzdGF0ZSBzdW1tYXJ5OiBXYW50ZWQgMjAg
Rm91bmQgMjAgTWlzc2VkIDAgQ3VycmVudCAwICgxMDAlIG1hdGNoLCA8YnI+DQowJSBjb21wbGV0
ZSk8YnI+DQrCoMKgwqDCoCBOT1RFOiBFeGVjdXRpbmcgVGFza3M8YnI+DQrCoMKgwqDCoCBFUlJP
UjogRXJyb3IgZXhlY3V0aW5nIGEgcHl0aG9uIGZ1bmN0aW9uIGluIGV4ZWNfcHl0aG9uX2Z1bmMo
KSA8YnI+DQphdXRvZ2VuZXJhdGVkOjxicj4NCjxicj4NCsKgwqDCoMKgIFRoZSBzdGFjayB0cmFj
ZSBvZiBweXRob24gY2FsbHMgdGhhdCByZXN1bHRlZCBpbiB0aGlzIDxicj4NCmV4Y2VwdGlvbi9m
YWlsdXJlIHdhczo8YnI+DQrCoMKgwqDCoCBGaWxlOiAmIzM5O2V4ZWNfcHl0aG9uX2Z1bmMoKSBh
dXRvZ2VuZXJhdGVkJiMzOTssIGxpbmVubzogMiwgZnVuY3Rpb246ICZsdDttb2R1bGUmZ3Q7PGJy
Pg0KwqDCoMKgwqAgwqDCoMKgwqAgMDAwMTo8YnI+DQrCoMKgwqDCoMKgICoqKiAwMDAyOmRldnRv
b2xfcG9zdF91bnBhY2soZCk8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAwMDM6PGJyPg0KwqDCoMKg
wqAgRmlsZTogPGJyPg0KJiMzOTsvd29yay95b2N0by9kZXZ0b29sLXJlcHJvZHVjZTIvc291cmNl
cy9wb2t5L21ldGEvY2xhc3Nlcy9kZXZ0b29sLXNvdXJjZS5iYmNsYXNzJiMzOTssIDxicj4NCmxp
bmVubzogNjgsIGZ1bmN0aW9uOiBkZXZ0b29sX3Bvc3RfdW5wYWNrPGJyPg0KwqDCoMKgwqAgwqDC
oMKgwqAgMDA2NDp9PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDY1Ojxicj4NCsKgwqDCoMKgIMKg
wqAgwqAgMDA2Njo8YnI+DQrCoMKgwqDCoCDCoMKgIMKgIDAwNjc6cHl0aG9uIGRldnRvb2xfcG9z
dF91bnBhY2soKSB7PGJyPg0KwqDCoMKgwqDCoCAqKiogMDA2ODrCoMKgwqAgaW1wb3J0IG9lLnJl
Y2lwZXV0aWxzPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDY5OsKgwqDCoCBpbXBvcnQgc2h1dGls
PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDcwOsKgwqDCoCBzeXMucGF0aC5pbnNlcnQoMCwgb3Mu
cGF0aC5qb2luKGQuZ2V0VmFyKCYjMzk7Q09SRUJBU0UmIzM5OyksIDxicj4NCiYjMzk7c2NyaXB0
cyYjMzk7LCAmIzM5O2xpYiYjMzk7KSk8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAwNzE6wqDCoMKg
IGltcG9ydCBzY3JpcHR1dGlsczxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDA3MjrCoMKgwqAgZnJv
bSBkZXZ0b29sIGltcG9ydCBzZXR1cF9naXRfcmVwbzxicj4NCsKgwqDCoMKgIEZpbGU6IDxicj4N
CiYjMzk7L3dvcmsveW9jdG8vZGV2dG9vbC1yZXByb2R1Y2UyL3NvdXJjZXMvcG9reS9tZXRhL2xp
Yi9vZS9yZWNpcGV1dGlscy5weSYjMzk7LCA8YnI+DQpsaW5lbm86IDIxLCBmdW5jdGlvbjogJmx0
O21vZHVsZSZndDs8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDAxNzppbXBvcnQgc2h1dGlsPGJyPg0K
wqDCoCDCoMKgIMKgIMKgIDAwMTg6aW1wb3J0IHJlPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAwMTk6
aW1wb3J0IGZubWF0Y2g8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDAyMDppbXBvcnQgZ2xvYjxicj4N
CsKgwqDCoMKgwqAgKioqIDAwMjE6aW1wb3J0IGJiLnRpbmZvaWw8YnI+DQrCoMKgIMKgwqAgwqAg
wqAgMDAyMjo8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDAyMzpmcm9tIGNvbGxlY3Rpb25zIGltcG9y
dCBPcmRlcmVkRGljdCwgZGVmYXVsdGRpY3Q8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDAyNDpmcm9t
IGJiLnV0aWxzIGltcG9ydCB2ZXJjbXBfc3RyaW5nPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAwMjU6
PGJyPg0KwqDCoMKgwqAgRmlsZTogPGJyPg0KJiMzOTsvd29yay95b2N0by9kZXZ0b29sLXJlcHJv
ZHVjZTIvc291cmNlcy9wb2t5L2JpdGJha2UvbGliL2JiL3RpbmZvaWwucHkmIzM5OywgPGJyPg0K
bGluZW5vOiAxOSwgZnVuY3Rpb246ICZsdDttb2R1bGUmZ3Q7PGJyPg0KwqDCoCDCoMKgIMKgIMKg
IDAwMTU6ZnJvbSBjb2xsZWN0aW9ucyBpbXBvcnQgT3JkZXJlZERpY3QsIGRlZmF1bHRkaWN0PGJy
Pg0KwqDCoCDCoMKgIMKgIMKgIDAwMTY6ZnJvbSBmdW5jdG9vbHMgaW1wb3J0IHBhcnRpYWw8YnI+
DQrCoMKgIMKgwqAgwqAgwqAgMDAxNzo8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAwMTg6aW1wb3J0
IGJiLmNhY2hlPGJyPg0KwqDCoMKgwqDCoCAqKiogMDAxOTppbXBvcnQgYmIuY29va2VyPGJyPg0K
wqDCoMKgIMKgwqDCoCDCoCAwMDIwOmltcG9ydCBiYi5wcm92aWRlcnM8YnI+DQrCoMKgwqDCoCDC
oMKgIMKgIDAwMjE6aW1wb3J0IGJiLnRhc2tkYXRhPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDIy
OmltcG9ydCBiYi51dGlsczxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDAyMzppbXBvcnQgYmIuY29t
bWFuZDxicj4NCsKgwqDCoMKgIEZpbGU6IDxicj4NCiYjMzk7L3dvcmsveW9jdG8vZGV2dG9vbC1y
ZXByb2R1Y2UyL3NvdXJjZXMvcG9reS9iaXRiYWtlL2xpYi9iYi9jb29rZXIucHkmIzM5OywgPGJy
Pg0KbGluZW5vOiAyNSwgZnVuY3Rpb246ICZsdDttb2R1bGUmZ3Q7PGJyPg0KwqDCoCDCoMKgIMKg
IMKgIDAwMjE6aW1wb3J0IGJiLCBiYi5leGNlcHRpb25zLCBiYi5jb21tYW5kPGJyPg0KwqDCoMKg
IMKgwqDCoCDCoCAwMDIyOmZyb20gYmIgaW1wb3J0IHV0aWxzLCBkYXRhLCBwYXJzZSwgZXZlbnQs
IGNhY2hlLCA8YnI+DQpwcm92aWRlcnMsIHRhc2tkYXRhLCBydW5xdWV1ZSwgYnVpbGQ8YnI+DQrC
oMKgwqDCoCDCoMKgIMKgIDAwMjM6aW1wb3J0IHF1ZXVlPGJyPg0KwqDCoMKgwqAgwqDCoCDCoCAw
MDI0OmltcG9ydCBzaWduYWw8YnI+DQrCoMKgwqDCoMKgICoqKiAwMDI1OmltcG9ydCBwcnNlcnYu
c2Vydjxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDAyNjppbXBvcnQgcHlpbm90aWZ5PGJyPg0KwqDC
oMKgIMKgwqDCoCDCoCAwMDI3OmltcG9ydCBqc29uPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDI4
OmltcG9ydCBwaWNrbGU8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAwMjk6aW1wb3J0IGNvZGVjczxi
cj4NCsKgwqDCoMKgIEZpbGU6IDxicj4NCiYjMzk7L3dvcmsveW9jdG8vZGV2dG9vbC1yZXByb2R1
Y2UyL3NvdXJjZXMvcG9reS9iaXRiYWtlL2xpYi9wcnNlcnYvc2Vydi5weSYjMzk7LCA8YnI+DQps
aW5lbm86IDcsIGZ1bmN0aW9uOiAmbHQ7bW9kdWxlJmd0Ozxicj4NCsKgwqDCoMKgIMKgIMKgwqAg
MDAwMzojPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAwMDQ6PGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAw
MDU6aW1wb3J0IG9zLHN5cyxsb2dnaW5nPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAwMDY6aW1wb3J0
IHNpZ25hbCwgdGltZTxicj4NCsKgwqDCoMKgwqAgKioqIDAwMDc6ZnJvbSB4bWxycGMuc2VydmVy
IGltcG9ydCBTaW1wbGVYTUxSUENTZXJ2ZXIsIDxicj4NClNpbXBsZVhNTFJQQ1JlcXVlc3RIYW5k
bGVyPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMDA4OmltcG9ydCB0aHJlYWRpbmc8YnI+DQrCoMKg
wqAgwqDCoMKgIMKgIDAwMDk6aW1wb3J0IHF1ZXVlPGJyPg0KwqDCoMKgwqAgwqDCoCDCoCAwMDEw
OmltcG9ydCBzb2NrZXQ8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAwMTE6aW1wb3J0IGlvPGJyPg0K
wqDCoMKgwqAgRmlsZTogJiMzOTsvdXNyL2xpYi9weXRob24zLjgveG1scnBjL3NlcnZlci5weSYj
Mzk7LCBsaW5lbm86IDExNywgZnVuY3Rpb246IDxicj4NCiZsdDttb2R1bGUmZ3Q7PGJyPg0KwqDC
oCDCoMKgIMKgIMKgIDAxMTM6aW1wb3J0IHNvY2tldHNlcnZlcjxicj4NCsKgwqAgwqDCoCDCoCDC
oCAwMTE0OmltcG9ydCBzeXM8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDExNTppbXBvcnQgb3M8YnI+
DQrCoMKgIMKgwqAgwqAgwqAgMDExNjppbXBvcnQgcmU8YnI+DQrCoMKgwqDCoMKgICoqKiAwMTE3
OmltcG9ydCBweWRvYzxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDExODppbXBvcnQgdHJhY2ViYWNr
PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMTE5OnRyeTo8YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDAx
MjA6wqDCoMKgIGltcG9ydCBmY250bDxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDEyMTpleGNlcHQg
SW1wb3J0RXJyb3I6PGJyPg0KwqDCoMKgwqAgRmlsZTogJiMzOTsvdXNyL2xpYi9weXRob24zLjgv
cHlkb2MucHkmIzM5OywgbGluZW5vOiAzNzAsIGZ1bmN0aW9uOiAmbHQ7bW9kdWxlJmd0Ozxicj4N
CsKgwqDCoMKgIMKgIMKgwqAgMDM2NjrCoMKgwqAgcmV0dXJuIG1vZHVsZTxicj4NCsKgwqAgwqDC
oCDCoCDCoCAwMzY3Ojxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMzY4OiMgLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSA8YnI+DQpmb3JtYXR0ZXIgYmFz
ZSBjbGFzczxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDM2OTo8YnI+DQrCoMKgwqDCoMKgICoqKiAw
MzcwOmNsYXNzIERvYzo8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDM3MTo8YnI+DQrCoMKgIMKgwqAg
wqAgwqAgMDM3MjrCoMKgwqAgUFlUSE9ORE9DUyA9IG9zLmVudmlyb24uZ2V0KCZxdW90O1BZVEhP
TkRPQ1MmcXVvdDssPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAzNzM6ICZxdW90OzxhIGhyZWY9Imh0
dHBzOi8vZG9jcy5weXRob24ub3JnLyVkLiVkL2xpYnJhcnkiIHJlbD0ibm9yZWZlcnJlciIgdGFy
Z2V0PSJfYmxhbmsiPmh0dHBzOi8vZG9jcy5weXRob24ub3JnLyVkLiVkL2xpYnJhcnk8L2E+JnF1
b3Q7PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMzc0OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICUgc3lzLnZlcnNpb25faW5mb1s6
Ml0pPGJyPg0KwqDCoMKgwqAgRmlsZTogJiMzOTsvdXNyL2xpYi9weXRob24zLjgvcHlkb2MucHkm
IzM5OywgbGluZW5vOiA0MDAsIGZ1bmN0aW9uOiBEb2M8YnI+DQrCoMKgwqDCoCDCoCDCoMKgIDAz
OTY6wqDCoMKgwqDCoMKgwqAgcmFpc2UgVHlwZUVycm9yKG1lc3NhZ2UpPGJyPg0KwqDCoMKgIMKg
wqDCoCDCoCAwMzk3Ojxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDM5ODrCoMKgwqAgZG9jbW9kdWxl
ID0gZG9jY2xhc3MgPSBkb2Nyb3V0aW5lID0gZG9jb3RoZXIgPSA8YnI+DQpkb2Nwcm9wZXJ0eSA9
IGRvY2RhdGEgPSBmYWlsPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwMzk5Ojxicj4NCsKgwqDCoMKg
wqAgKioqIDA0MDA6wqDCoMKgIGRlZiBnZXRkb2Nsb2Moc2VsZiwgb2JqZWN0LCA8YnI+DQpiYXNl
ZGlyPXN5c2NvbmZpZy5nZXRfcGF0aCgmIzM5O3N0ZGxpYiYjMzk7KSk6PGJyPg0KwqDCoCDCoMKg
IMKgIMKgIDA0MDE6wqDCoMKgwqDCoMKgwqAgJnF1b3Q7JnF1b3Q7JnF1b3Q7UmV0dXJuIHRoZSBs
b2NhdGlvbiBvZiBtb2R1bGUgZG9jcyBvciBOb25lJnF1b3Q7JnF1b3Q7JnF1b3Q7PGJyPg0KwqDC
oMKgIMKgwqDCoCDCoCAwNDAyOjxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDQwMzrCoMKgwqDCoMKg
wqDCoCB0cnk6PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwNDA0OsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZmlsZSA9IGluc3BlY3QuZ2V0YWJzZmlsZShvYmplY3QpPGJyPg0KwqDCoMKgwqAgRmlsZTog
JiMzOTsvdXNyL2xpYi9weXRob24zLjgvc3lzY29uZmlnLnB5JiMzOTssIGxpbmVubzogNTEyLCBm
dW5jdGlvbjogPGJyPg0KZ2V0X3BhdGg8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDUwODrCoMKgwqAg
JnF1b3Q7JnF1b3Q7JnF1b3Q7UmV0dXJuIGEgcGF0aCBjb3JyZXNwb25kaW5nIHRvIHRoZSBzY2hl
bWUuPGJyPg0KwqDCoCDCoMKgIMKgIMKgIDA1MDk6PGJyPg0KwqDCoCDCoMKgIMKgIMKgIDA1MTA6
wqDCoMKgIGBgc2NoZW1lYGAgaXMgdGhlIGluc3RhbGwgc2NoZW1lIG5hbWUuPGJyPg0KwqDCoMKg
IMKgwqDCoCDCoCAwNTExOsKgwqDCoCAmcXVvdDsmcXVvdDsmcXVvdDs8YnI+DQrCoMKgwqDCoMKg
ICoqKiAwNTEyOsKgwqDCoCByZXR1cm4gZ2V0X3BhdGhzKHNjaGVtZSwgdmFycywgZXhwYW5kKVtu
YW1lXTxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDUxMzo8YnI+DQrCoMKgwqDCoCDCoMKgIMKgIDA1
MTQ6PGJyPg0KwqDCoMKgwqAgwqDCoCDCoCAwNTE1OmRlZiBnZXRfY29uZmlnX3ZhcnMoKmFyZ3Mp
Ojxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDUxNjrCoMKgwqAgJnF1b3Q7JnF1b3Q7JnF1b3Q7V2l0
aCBubyBhcmd1bWVudHMsIHJldHVybiBhIGRpY3Rpb25hcnkgb2YgYWxsIDxicj4NCmNvbmZpZ3Vy
YXRpb248YnI+DQrCoMKgwqDCoCBGaWxlOiAmIzM5Oy91c3IvbGliL3B5dGhvbjMuOC9zeXNjb25m
aWcucHkmIzM5OywgbGluZW5vOiA1MDIsIGZ1bmN0aW9uOiA8YnI+DQpnZXRfcGF0aHM8YnI+DQrC
oMKgIMKgwqAgwqAgwqAgMDQ5ODrCoMKgwqAgYGBzY2hlbWVgYCBpcyB0aGUgaW5zdGFsbCBzY2hl
bWUgbmFtZS4gSWYgbm90IDxicj4NCnByb3ZpZGVkLCBpdCB3aWxsPGJyPg0KwqDCoMKgIMKgwqDC
oCDCoCAwNDk5OsKgwqDCoCByZXR1cm4gdGhlIGRlZmF1bHQgc2NoZW1lIGZvciB0aGUgY3VycmVu
dCBwbGF0Zm9ybS48YnI+DQrCoMKgwqDCoCDCoMKgIMKgIDA1MDA6wqDCoMKgICZxdW90OyZxdW90
OyZxdW90Ozxicj4NCsKgwqDCoMKgIMKgwqAgwqAgMDUwMTrCoMKgwqAgaWYgZXhwYW5kOjxicj4N
CsKgwqDCoMKgwqAgKioqIDA1MDI6wqDCoMKgwqDCoMKgwqAgcmV0dXJuIF9leHBhbmRfdmFycyhz
Y2hlbWUsIHZhcnMpPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwNTAzOsKgwqDCoCBlbHNlOjxicj4N
CsKgwqDCoCDCoMKgwqAgwqAgMDUwNDrCoMKgwqDCoMKgwqDCoCByZXR1cm4gX0lOU1RBTExfU0NI
RU1FU1tzY2hlbWVdPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwNTA1Ojxicj4NCsKgwqDCoCDCoMKg
wqAgwqAgMDUwNjo8YnI+DQrCoMKgwqDCoCBGaWxlOiAmIzM5Oy91c3IvbGliL3B5dGhvbjMuOC9z
eXNjb25maWcucHkmIzM5OywgbGluZW5vOiAxNzIsIGZ1bmN0aW9uOiA8YnI+DQpfZXhwYW5kX3Zh
cnM8YnI+DQrCoMKgwqDCoCDCoCDCoMKgIDAxNjg6ZGVmIF9leHBhbmRfdmFycyhzY2hlbWUsIHZh
cnMpOjxicj4NCsKgwqAgwqDCoCDCoCDCoCAwMTY5OsKgwqDCoCByZXMgPSB7fTxicj4NCsKgwqAg
wqDCoCDCoCDCoCAwMTcwOsKgwqDCoCBpZiB2YXJzIGlzIE5vbmU6PGJyPg0KwqDCoCDCoMKgIMKg
IMKgIDAxNzE6wqDCoMKgwqDCoMKgwqAgdmFycyA9IHt9PGJyPg0KwqDCoMKgwqDCoCAqKiogMDE3
MjrCoMKgwqAgX2V4dGVuZF9kaWN0KHZhcnMsIGdldF9jb25maWdfdmFycygpKTxicj4NCsKgwqDC
oMKgIMKgIMKgwqAgMDE3Mzo8YnI+DQrCoMKgIMKgwqAgwqAgwqAgMDE3NDrCoMKgwqAgZm9yIGtl
eSwgdmFsdWUgaW4gX0lOU1RBTExfU0NIRU1FU1tzY2hlbWVdLml0ZW1zKCk6PGJyPg0KwqDCoCDC
oMKgIMKgIMKgIDAxNzU6wqDCoMKgwqDCoMKgwqAgaWYgPGEgaHJlZj0iaHR0cDovL29zLm5hbWUi
IHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPm9zLm5hbWU8L2E+IGluICgmIzM5O3Bv
c2l4JiMzOTssICYjMzk7bnQmIzM5Oyk6PGJyPg0KwqDCoCDCoMKgIMKgIMKgIDAxNzY6wqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2YWx1ZSA9IG9zLnBhdGguZXhwYW5kdXNlcih2YWx1ZSk8YnI+DQrC
oMKgwqDCoCBGaWxlOiAmIzM5Oy91c3IvbGliL3B5dGhvbjMuOC9zeXNjb25maWcucHkmIzM5Oywg
bGluZW5vOiA1NTAsIGZ1bmN0aW9uOiA8YnI+DQpnZXRfY29uZmlnX3ZhcnM8YnI+DQrCoMKgwqDC
oCDCoCDCoMKgIDA1NDY6PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwNTQ3OsKgwqDCoMKgwqDCoMKg
IGlmIDxhIGhyZWY9Imh0dHA6Ly9vcy5uYW1lIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2Js
YW5rIj5vcy5uYW1lPC9hPiA9PSAmIzM5O250JiMzOTs6PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAw
NTQ4OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX2luaXRfbm9uX3Bvc2l4KF9DT05GSUdfVkFSUyk8
YnI+DQrCoMKgwqAgwqDCoMKgIMKgIDA1NDk6wqDCoMKgwqDCoMKgwqAgaWYgPGEgaHJlZj0iaHR0
cDovL29zLm5hbWUiIHJlbD0ibm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPm9zLm5hbWU8L2E+
ID09ICYjMzk7cG9zaXgmIzM5Ozo8YnI+DQrCoMKgwqDCoMKgICoqKiAwNTUwOsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgX2luaXRfcG9zaXgoX0NPTkZJR19WQVJTKTxicj4NCsKgwqAgwqDCoCDCoCDC
oCAwNTUxOsKgwqDCoMKgwqDCoMKgICMgRm9yIGJhY2t3YXJkIGNvbXBhdGliaWxpdHksIHNlZSBp
c3N1ZTE5NTU1PGJyPg0KwqDCoCDCoMKgIMKgIMKgIDA1NTI6wqDCoMKgwqDCoMKgwqAgU08gPSBf
Q09ORklHX1ZBUlMuZ2V0KCYjMzk7RVhUX1NVRkZJWCYjMzk7KTxicj4NCsKgwqAgwqDCoCDCoCDC
oCAwNTUzOsKgwqDCoMKgwqDCoMKgIGlmIFNPIGlzIG5vdCBOb25lOjxicj4NCsKgwqAgwqDCoCDC
oCDCoCAwNTU0OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX0NPTkZJR19WQVJTWyYjMzk7U08mIzM5
O10gPSBTTzxicj4NCsKgwqDCoMKgIEZpbGU6ICYjMzk7L3Vzci9saWIvcHl0aG9uMy44L3N5c2Nv
bmZpZy5weSYjMzk7LCBsaW5lbm86IDQyMSwgZnVuY3Rpb246IDxicj4NCl9pbml0X3Bvc2l4PGJy
Pg0KwqDCoCDCoMKgIMKgIMKgIDA0MTc6ZGVmIF9pbml0X3Bvc2l4KHZhcnMpOjxicj4NCsKgwqAg
wqDCoCDCoCDCoCAwNDE4OsKgwqDCoCAmcXVvdDsmcXVvdDsmcXVvdDtJbml0aWFsaXplIHRoZSBt
b2R1bGUgYXMgYXBwcm9wcmlhdGUgZm9yIFBPU0lYIDxicj4NCnN5c3RlbXMuJnF1b3Q7JnF1b3Q7
JnF1b3Q7PGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAwNDE5OsKgwqDCoCAjIF9zeXNjb25maWdkYXRh
IGlzIGdlbmVyYXRlZCBhdCBidWlsZCB0aW1lLCBzZWUgPGJyPg0KX2dlbmVyYXRlX3Bvc2l4X3Zh
cnMoKTxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQyMDrCoMKgwqAgbmFtZSA9IF9nZXRfc3lzY29u
ZmlnZGF0YV9uYW1lKCk8YnI+DQrCoMKgwqDCoMKgICoqKiAwNDIxOsKgwqDCoCBfdGVtcCA9IF9f
aW1wb3J0X18obmFtZSwgZ2xvYmFscygpLCBsb2NhbHMoKSwgPGJyPg0KWyYjMzk7YnVpbGRfdGlt
ZV92YXJzJiMzOTtdLCAwKTxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQyMjrCoMKgwqAgYnVpbGRf
dGltZV92YXJzID0gX3RlbXAuYnVpbGRfdGltZV92YXJzPGJyPg0KwqDCoMKgIMKgwqDCoCDCoCAw
NDIzOsKgwqDCoCB2YXJzLnVwZGF0ZShidWlsZF90aW1lX3ZhcnMpPGJyPg0KwqDCoMKgwqAgwqDC
oCDCoCAwNDI0Ojxicj4NCsKgwqDCoCDCoMKgwqAgwqAgMDQyNTpkZWYgX2luaXRfbm9uX3Bvc2l4
KHZhcnMpOjxicj4NCsKgwqDCoMKgIEV4Y2VwdGlvbjogTW9kdWxlTm90Rm91bmRFcnJvcjogTm8g
bW9kdWxlIG5hbWVkICYjMzk7X3N5c2NvbmZpZ2RhdGEmIzM5Ozxicj4NCjxicj4NCjxicj4NClRo
YW5rcyw8YnI+DQovUGV0ZXI8YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo8YnI+DQo8
YnI+DQo8YnI+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+DQo=

--0000000000002c334005b3ede13a--
