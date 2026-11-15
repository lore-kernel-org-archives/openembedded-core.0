Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4380.1794732560518580472
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RmON/p++;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e10a70540so1244482f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732559; x=1795337359; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8O+zb38zKK5Dl+6wiJKC9xhYM9FHgAoprI0Ji5lTTYo=;
        b=RmON/p++EgDfZBl10cJKTx7ACCAYXVBYcXQqbnzgapdsorE3V/WKSyDh9tTcsT8CRN
         9Eh3s7QbOgW3nA3BWmSdKWqkMuKwWvulDtsyPcJPQmNwh8Ux4CgQ+9RSLZY9iPU6MoNh
         ytKLOYAG/yT1SZmzjTXx5bsBlmlJ1iiO0ewB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732559; x=1795337359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8O+zb38zKK5Dl+6wiJKC9xhYM9FHgAoprI0Ji5lTTYo=;
        b=MOUoFilaiw58k9221/TZk9w/++gF+Q5j1d+jEw6UtysLUcxwgRkM9QGHcbxO38FHgq
         Ct6Ps8E6kLYCvuXGBFQEIfDgq5BgMlaiYhZ4YrtSTYYX0bGcyl+StIMspmAi0xI9C4Z4
         JzVm3AUJ6lC6XFsLTdPXpXD3+ZB6xkd6lH184PbLkeORTmUoBy6q2pQUKAn2spJ5WU6Z
         lTklPsn9I/1bov9EY38+/nfC86Rbg4T+swd0pmu3GijgETHSuVxL5/tnIDg0W7UGCFSn
         NSS+OYVHt16vUzA6vIdHvfxHWjSoH3WdWyAWNj0NmvNr7i3LD8MkHu8r8zHvwiMiHGy5
         C/xg==
X-Gm-Message-State: APuU4Z9BedJlWJDXMOeij0ru0kh3wo0pvb8MPDC9V9PN3XOVKYPjMLlk
	TrJlHIE2cY1wLcf7pikanv+er1e3qNpV9P2DBrXi2bD/5l9VFhwLBaBEHhaHkp1lK+1jX9fHvl3
	v9Se/0kk=
X-Gm-Gg: AYBFou16yoTEdxPr7jI62I01NqCy7MIcfkPBq2d+qaUQvNoe9POfA8XWONVzviSkTx/
	P7sCxF4+CNxNxXkqu4gL7/e6ebsQO8/cMOaqyHIOSDetAxxvfG+FfLWsFklfDiXyivEt/AMIKTk
	mZWjTztN098ES6AEfL5znr0Izu5KD2XOqmD/FI3XNNThPROE+wFMFDtCKbWw3SGBLkfTiNW7hq9
	4szk2IUnMMAIA1BSaYAkmwRVe7x9/9HPc29E05C91TCpAhK+MHuR2tWHvKK7oSVoJMlxUs3a9DC
	HRDztWuAu19fS+3cQZ25FuSB7zpRXqj0GYc4a2c0LWEPC8Hl75cIxOajvTztS4uEatLg9tt43cs
	nNUBnXzcCjC6HLh2i8HOxLuznigz4qvPKoj2OqPSpzj/JRAw4LvCuUpxy/5injC3CH1++Ab8lfF
	OslfT5kwq5GBpd4wYyz/zbVLNePY+uLdPSoem6WLARO1nnhliaCZeyoFzwyCCpaxvLVdLfJ0bKZ
	ITCw4bbt7fVbcvkcEhzzrx3Ze3pAz6WyvCqK3ze75EAqq0Svyo8csTOmwcxNAcYlTQUE08TUEb8
	CJa5lAkuYw9CRRlQUJEE3KHx/uzfbt0awaAH/DmWXLacMkYzPiEI9vvn1Q==
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr17282800f8f.43.1794732558679;
        Sun, 15 Nov 2026 00:49:18 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:18 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 19/41] oeqa/lib/utils/decorators.py: Remove
Date: Sun, 15 Nov 2026 08:48:22 +0000
Message-ID: <20261115084845.701136-19-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250250
Content-Type: text/plain; charset="utf-8"

This was only used by oetest.py which has been removed. Drop it.
It was replaced by core/decorator/.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/decorators.py | 212 ------------------------------
 1 file changed, 212 deletions(-)
 delete mode 100644 meta/lib/oeqa/utils/decorators.py

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
deleted file mode 100644
index c45d5f4512c..00000000000
--- a/meta/lib/oeqa/utils/decorators.py
+++ /dev/null
@@ -1,212 +0,0 @@
-#
-# Copyright (C) 2013 Intel Corporation
-#
-# SPDX-License-Identifier: MIT
-#
-
-# Some custom decorators that can be used by unittests
-# Most useful is skipUnlessPassed which can be used for
-# creating dependecies between two test methods.
-
-import os
-import logging
-import sys
-import unittest
-import threading
-import signal
-from functools import wraps
-
-class testcase:
-    def __init__(self, test_case):
-        self.test_case = test_case
-
-    def __call__(self, func):
-        @wraps(func)
-        def wrapped_f(*args, **kwargs):
-            return func(*args, **kwargs)
-        wrapped_f.test_case = self.test_case
-        wrapped_f.__name__ = func.__name__
-        return wrapped_f
-
-class NoParsingFilter(logging.Filter):
-    def filter(self, record):
-        return record.levelno == 100
-
-import inspect
-
-def LogResults(original_class):
-    orig_method = original_class.run
-
-    from time import strftime, gmtime
-    caller = os.path.basename(sys.argv[0])
-    timestamp = strftime('%Y%m%d%H%M%S',gmtime())
-    logfile = os.path.join(os.getcwd(),'results-'+caller+'.'+timestamp+'.log')
-    linkfile = os.path.join(os.getcwd(),'results-'+caller+'.log')
-
-    def get_class_that_defined_method(meth):
-        if inspect.ismethod(meth):
-            for cls in inspect.getmro(meth.__self__.__class__):
-               if cls.__dict__.get(meth.__name__) is meth:
-                    return cls
-            meth = meth.__func__ # fallback to __qualname__ parsing
-        if inspect.isfunction(meth):
-            cls = getattr(inspect.getmodule(meth),
-                          meth.__qualname__.split('.<locals>', 1)[0].rsplit('.', 1)[0])
-            if isinstance(cls, type):
-               return cls
-        return None
-
-    #rewrite the run method of unittest.TestCase to add testcase logging
-    def run(self, result, *args, **kws):
-        orig_method(self, result, *args, **kws)
-        passed = True
-        testMethod = getattr(self, self._testMethodName)
-        #if test case is decorated then use it's number, else use it's name
-        try:
-            test_case = testMethod.test_case
-        except AttributeError:
-            test_case = self._testMethodName
-
-        class_name = str(get_class_that_defined_method(testMethod)).split("'")[1]
-
-        #create custom logging level for filtering.
-        custom_log_level = 100
-        logging.addLevelName(custom_log_level, 'RESULTS')
-
-        def results(self, message, *args, **kws):
-            if self.isEnabledFor(custom_log_level):
-                self.log(custom_log_level, message, *args, **kws)
-        logging.Logger.results = results
-
-        logging.basicConfig(filename=logfile,
-                            filemode='w',
-                            format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
-                            datefmt='%H:%M:%S',
-                            level=custom_log_level)
-        for handler in logging.root.handlers:
-            handler.addFilter(NoParsingFilter())
-        local_log = logging.getLogger(caller)
-
-        #check status of tests and record it
-
-        tcid = self.id()
-        for (name, msg) in result.errors:
-            if tcid == name.id():
-                local_log.results("Testcase "+str(test_case)+": ERROR")
-                local_log.results("Testcase "+str(test_case)+":\n"+msg)
-                passed = False
-        for (name, msg) in result.failures:
-            if tcid == name.id():
-                local_log.results("Testcase "+str(test_case)+": FAILED")
-                local_log.results("Testcase "+str(test_case)+":\n"+msg)
-                passed = False
-        for (name, msg) in result.skipped:
-            if tcid == name.id():
-                local_log.results("Testcase "+str(test_case)+": SKIPPED")
-                passed = False
-        if passed:
-            local_log.results("Testcase "+str(test_case)+": PASSED")
-
-        # XXX: In order to avoid race condition when test if exists the linkfile
-        # use bb.utils.lock, the best solution is to create a unique name for the
-        # link file.
-        try:
-            import bb
-            has_bb = True
-            lockfilename = linkfile + '.lock'
-        except ImportError:
-            has_bb = False
-
-        if has_bb:
-            lf = bb.utils.lockfile(lockfilename, block=True)
-        # Create symlink to the current log
-        if os.path.lexists(linkfile):
-            os.remove(linkfile)
-        os.symlink(logfile, linkfile)
-        if has_bb:
-            bb.utils.unlockfile(lf)
-
-    original_class.run = run
-
-    return original_class
-
-class TimeOut(BaseException):
-    pass
-
-def timeout(seconds):
-    def decorator(fn):
-        if hasattr(signal, 'alarm'):
-            @wraps(fn)
-            def wrapped_f(*args, **kw):
-                current_frame = sys._getframe()
-                def raiseTimeOut(signal, frame):
-                    if frame is not current_frame:
-                        raise TimeOut('%s seconds' % seconds)
-                prev_handler = signal.signal(signal.SIGALRM, raiseTimeOut)
-                try:
-                    signal.alarm(seconds)
-                    return fn(*args, **kw)
-                finally:
-                    signal.alarm(0)
-                    signal.signal(signal.SIGALRM, prev_handler)
-            return wrapped_f
-        else:
-            return fn
-    return decorator
-
-__tag_prefix = "tag__"
-def tag(*args, **kwargs):
-    """Decorator that adds attributes to classes or functions
-    for use with the Attribute (-a) plugin.
-    """
-    def wrap_ob(ob):
-        for name in args:
-            setattr(ob, __tag_prefix + name, True)
-        for name, value in kwargs.items():
-            setattr(ob, __tag_prefix + name, value)
-        return ob
-    return wrap_ob
-
-def gettag(obj, key, default=None):
-    key = __tag_prefix + key
-    if not isinstance(obj, unittest.TestCase):
-        return getattr(obj, key, default)
-    tc_method = getattr(obj, obj._testMethodName)
-    ret = getattr(tc_method, key, getattr(obj, key, default))
-    return ret
-
-def getAllTags(obj):
-    def __gettags(o):
-        r = {k[len(__tag_prefix):]:getattr(o,k) for k in dir(o) if k.startswith(__tag_prefix)}
-        return r
-    if not isinstance(obj, unittest.TestCase):
-        return __gettags(obj)
-    tc_method = getattr(obj, obj._testMethodName)
-    ret = __gettags(obj)
-    ret.update(__gettags(tc_method))
-    return ret
-
-def timeout_handler(seconds):
-    def decorator(fn):
-        if hasattr(signal, 'alarm'):
-            @wraps(fn)
-            def wrapped_f(self, *args, **kw):
-                current_frame = sys._getframe()
-                def raiseTimeOut(signal, frame):
-                    if frame is not current_frame:
-                        try:
-                            self.target.restart()
-                            raise TimeOut('%s seconds' % seconds)
-                        except:
-                            raise TimeOut('%s seconds' % seconds)
-                prev_handler = signal.signal(signal.SIGALRM, raiseTimeOut)
-                try:
-                    signal.alarm(seconds)
-                    return fn(self, *args, **kw)
-                finally:
-                    signal.alarm(0)
-                    signal.signal(signal.SIGALRM, prev_handler)
-            return wrapped_f
-        else:
-            return fn
-    return decorator
