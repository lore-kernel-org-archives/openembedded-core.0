Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B33C44511
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:20 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1639.1784055852287787135
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SP3Xq/Vr;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43cce34c881so733538fac.2
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055851; x=1784660651; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWD+LucbplYhRuKyT8Zc/wOgrN0AnGwkd5naR2N3GxA=;
        b=SP3Xq/Vr5cg8RB7BttfQH2QELxn/0O8QazF+44xUUFjNxzofYz6W6ptX51xXZsxOer
         fBfnTbUt8nvE3kP1daD8kkt0aiq+hG61XjIxEd4HTITVXsrtu52JrE4E4whOFI4d3rTU
         qPnOq6aCcpvJyfs6YqE+sn40glUOYZZ9EM6K8bhx7BPuLpr87ochK3swqpYZ1SPu1h58
         k7ttnVtgCTjmS+kL+kpeUnGDjrAor7EVEEzLNIqZ3jlpOUALqdeG4we3Vb+T3JFUszsJ
         GuJgbnSR5C875ARIP7oWUkc834c8pEDTyj12+Mi5R9yLNBu4j4haSjbrDaBeF2bAfWK/
         FIRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055851; x=1784660651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NWD+LucbplYhRuKyT8Zc/wOgrN0AnGwkd5naR2N3GxA=;
        b=hUnG0/dRJYCwlVcz+hmKjh0ptlwYm4AzpRo3TYPFfwijOtUv8/9OO7M992JF8GI9wZ
         4CPEpCsv4MP+juSZ7X1vccGhJQUg4/xpRHDZYymNmtRsW7vz/4LKXLPg+lpW4h1Ch9IZ
         5L0WF6GlpnilrO0COcJJq9RrG07h+TrlZJCSew3nRm0mEacvGgz4n9RJ36W2JE2IscJu
         mVJjpKL50LqChlolkLXUg+6B0KYMXBZi9SUQnV8/jPTnQYV2STOQUyUg7X/+Ec3l+dv5
         2TyuObRCUy/YstiiN3yudQ3nMq4K/qGbZmwU4WYvCgKdNa27WVCRc73FbXRJ7uPjh6ud
         hwrQ==
X-Gm-Message-State: AOJu0Yzi540x2KZbYsfQ0mJoQwEAb+SNjoldvGu6F6HtMbg4sLZuMMDH
	jnEtAyLt40Td1ZahRAfvtej0fhZiJdcgdapZFmV6pYyEatwNMxP091CUp+xnWQ==
X-Gm-Gg: AfdE7ck3T97DQn36c2koCFjj/rYPRsVStNcjyhabHbMIjXH/tBF/ONF5YJU6ydLi53a
	8jiwQfJE+Gnkg1Jv6eFl4uhuZT8HNH3Ua3/zg6CsYboBe9TbgFmU2wQ+ScWPUi7/e1E1JGO5WxT
	4+YtSsg5QMcpErSXXHTxvr1FOKlm+bsyWmEsfCyGnBP72GQtCO97Whw0+Ie+0Ck15ONpIp/3GB3
	RFbat2U9gtJcw/ktkyQag8vv8MUMjMDaRHdWlRAEiSlAfqac/XtqGa9W2Hb/6hDKnOeJEeDPcG4
	wYKr44JC56NdCQT9k9SxdwTjeov0jXun2/jfYch6BQAEw/UFpno7vEAW+l7/ljvzdiPvnVdBLgA
	KLs/Lc/w35a2u5LkysvyFjTcKZzD9CSFniynlCiHj2hIDoSQ8a1dXNSS79moLSLGEqJfOPbLryr
	tiRO3ldDJacw==
X-Received: by 2002:a05:6870:31c4:b0:448:3eb2:8c8c with SMTP id 586e51a60fabf-451f1035f42mr8362507fac.6.1784055851286;
        Tue, 14 Jul 2026 12:04:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:10 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 03/22] Add SPDX license library
Date: Tue, 14 Jul 2026 12:31:13 -0600
Message-ID: <20260714190405.3328796-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240910

Adds a library to parse SPDX license expressions into an abstract syntax
tree

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/spdx_license.py | 760 ++++++++++++++++++++++++++++++++++++
 1 file changed, 760 insertions(+)
 create mode 100644 meta/lib/oe/spdx_license.py

diff --git a/meta/lib/oe/spdx_license.py b/meta/lib/oe/spdx_license.py
new file mode 100644
index 0000000000..f14683f428
--- /dev/null
+++ b/meta/lib/oe/spdx_license.py
@@ -0,0 +1,760 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import re
+import json
+from abc import abstractmethod, ABC
+from enum import Enum
+from pathlib import Path
+from dataclasses import dataclass
+
+THIS_DIR = Path(__file__).parent
+
+_LICENSES = {}
+_EXCEPTIONS = {}
+
+
+def _load_licenses():
+    p = THIS_DIR.parent.parent / "files" / "spdx-licenses.json"
+    with p.open("r") as f:
+        data = json.load(f)
+
+    for lic in data["licenses"]:
+        _LICENSES[lic["licenseId"].lower()] = lic
+
+
+_load_licenses()
+
+
+def _load_exceptions():
+    p = THIS_DIR.parent.parent / "files" / "spdx-exceptions.json"
+    with p.open("r") as f:
+        data = json.load(f)
+
+    for lic in data["exceptions"]:
+        _EXCEPTIONS[lic["licenseExceptionId"].lower()] = lic
+
+
+_load_exceptions()
+
+
+def get_license(ident):
+    return _LICENSES.get(ident.lower())
+
+
+def get_exception(ident):
+    return _EXCEPTIONS.get(ident.lower())
+
+
+class ParseError(Exception):
+    def __init__(self, n, s):
+        super().__init__(s)
+        self.n = n
+        self.expression = ""
+
+    def format(self, *, prefix="ERROR:"):
+        if not self.n:
+            return f"{prefix}0: {str(self)}\n{self.expression}"
+
+        start, end = self.n.get_range()
+
+        if start < 0:
+            start = 0
+
+        if end < 0:
+            end = len(self.expression)
+
+        ident = " " * start
+        for i in range(start, end):
+            ident += "^"
+
+        return "\n".join(
+            [
+                f"{prefix}{start}: " + str(self),
+                self.expression,
+                ident,
+            ]
+        )
+
+
+def check_stack_types(stack, types):
+    if len(stack) < len(types):
+        return False
+
+    for i, t in enumerate(types):
+        if isinstance(t, list):
+            t = tuple(t)
+        if not isinstance(stack[-(len(types) - i)], t):
+            return False
+
+    return True
+
+
+class Token(object):
+    def __init__(self):
+        self.value = ""
+        self.start = 0
+        self.end = 0
+
+    def copy(self):
+        t = self.__class__()
+        t.value = self.value
+        t.start = self.start
+        t.value = self.value
+        return t
+
+    def get_range(self):
+        return self.start, self.end
+
+
+class Node(ABC):
+    @dataclass
+    class Sort:
+        node: object
+        key: list
+
+    def __init__(self, children, *, token=None):
+        self.token = token
+        self.children = children
+
+    @abstractmethod
+    def copy(self):
+        raise NotImplementedError("Method not implemented")
+
+    @abstractmethod
+    def to_string(self):
+        raise NotImplementedError("Method not implemented")
+
+    def _copy_token(self):
+        if self.token:
+            return self.token.copy()
+        return None
+
+    def iter(self):
+        yield self
+
+        for c in self.children:
+            yield from c.iter()
+
+    def get_range(self):
+        if self.token:
+            start = self.token.start
+            end = self.token.end
+        else:
+            start = -1
+            end = -1
+
+        for c in self.children:
+            child_start, child_end = c.get_range()
+            if start < 0:
+                start = child_start
+            else:
+                start = min(start, child_start)
+            if end < 0:
+                end = child_end
+            else:
+                end = max(end, child_end)
+
+        return start, end
+
+    def _simplify(self):
+        self.children = [c._simplify() for c in self.children]
+        return self
+
+    def to_ast_string(self, indent=0):
+        s = " " * indent + self.__class__.__name__
+        if self.token:
+            s += f"({self.token.value})"
+        s += "\n"
+        for c in self.children:
+            s += c.to_ast_string(indent + 2)
+        return s
+
+    def sort(self):
+        """
+        Sort the tree into a consistent ordering and removing duplicate
+        licenses (e.g. "FOO AND FOO" or "FOO OR FOO")
+
+        Returns the root of a new tree which is a sorted copy of the original
+        """
+        return self.copy()._sort().node
+
+    def _sort(self):
+        raise NotImplementedError("Method not implemented")
+
+
+class ReservedToken(Node):
+    def __init__(self, **kwargs):
+        super().__init__([], **kwargs)
+
+    def copy(self):
+        return self.__class__(token=self._copy_token())
+
+    @property
+    def value(self):
+        return self.token.value
+
+    def to_string(self):
+        return self.token.value
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, [Token]):
+            return False
+
+        token = stack[-1]
+        if not token.value in RESERVED:
+            return False
+
+        stack.pop()
+        stack.append(cls(token=token))
+
+    def _sort(self):
+        return Node.Sort(self, [self.__class__.__name__, self.token.value])
+
+
+class Identifier(Node):
+    def __init__(self, ident, **kwargs):
+        super().__init__([], **kwargs)
+        self.ident = ident
+
+    def copy(self):
+        return self.__class__(self.ident, token=self._copy_token())
+
+    def to_string(self):
+        return self.ident
+
+    def _sort(self):
+        return Node.Sort(self, [self.__class__.__name__, self.ident])
+
+
+class UnknownId(Identifier):
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, [Token]):
+            return False
+
+        t = stack.pop()
+        stack.append(cls(t.value, token=t))
+        return True
+
+
+class LicenseId(Identifier):
+    @property
+    def deprecated(self):
+        return get_license(self.ident)["isDeprecatedLicenseId"]
+
+    @property
+    def name(self):
+        return self.ident
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, [Token]):
+            return False
+
+        lic = get_license(stack[-1].value)
+        if lic is None:
+            return False
+
+        stack.append(cls(lic["licenseId"], token=stack.pop()))
+        return True
+
+
+class ExceptionId(Identifier):
+    @property
+    def deprecated(self):
+        return get_exception(self.ident)["isDeprecatedLicenseId"]
+
+    @property
+    def name(self):
+        return self.ident
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, [Token]):
+            return False
+
+        lic = get_exception(stack[-1].value)
+        if lic is None:
+            return False
+
+        stack.append(cls(lic["licenseExceptionId"], token=stack.pop()))
+        return True
+
+
+class LicenseRef(Identifier):
+    REGEX = re.compile(
+        r"^(DocumentRef-[A-Za-z0-9\.\-]+:)?LicenseRef-(?P<name>[A-Za-z0-9\.\-]+)$"
+    )
+
+    def __init__(self, ident, name, **kwargs):
+        super().__init__(ident, **kwargs)
+        self.name = name
+
+    def copy(self):
+        return self.__class__(self.ident, self.name, token=self._copy_token())
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, [Token]):
+            return False
+
+        m = cls.REGEX.match(stack[-1].value)
+        if m is None:
+            return False
+
+        t = stack.pop()
+        stack.append(cls(t.value, m.group("name"), token=t))
+        return True
+
+
+class CompoundExpression(Node):
+    def __init__(self, child, **kwargs):
+        super().__init__([child], **kwargs)
+
+    def copy(self):
+        return self.child.copy()
+
+    @property
+    def child(self):
+        return self.children[0]
+
+    def to_string(self):
+        return self.child.to_string()
+
+    def _simplify(self):
+        return self.child._simplify()
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if check_stack_types(stack, [ReservedToken]) and stack[-1].value == ")":
+            if not check_stack_types(
+                stack,
+                [
+                    COMPOUND_EXPRESSION,
+                    ReservedToken,
+                ],
+            ):
+                raise ParseError(stack[-2], "Invalid expression for parentheses")
+
+            if not check_stack_types(
+                stack,
+                [
+                    ReservedToken,
+                    COMPOUND_EXPRESSION,
+                    ReservedToken,
+                ],
+            ):
+                raise ParseError(stack[-1], "Missing matching '('")
+
+            rparen = stack[-1]
+            n = stack[-2]
+            lparen = stack[-3]
+
+            if lparen.value != "(":
+                raise ParseError(lparen, "'(' expected, but not found")
+
+            stack.pop()
+            stack.pop()
+            stack.pop()
+
+            stack.append(cls(n))
+            return True
+
+        if not check_stack_types(
+            stack,
+            [(AndOp, OrOp, WithOp)],
+        ):
+            return False
+
+        stack.append(cls(stack.pop()))
+        return True
+
+    def _sort(self):
+        return self.child._sort()
+
+
+SIMPLE_EXPRESSION = [LicenseId, LicenseRef, UnknownId]
+COMPOUND_EXPRESSION = SIMPLE_EXPRESSION + [CompoundExpression]
+
+
+class Operator(Node):
+    OPERATORS = {}
+
+
+class UnaryOp(Operator):
+    def __init__(self, child, **kwargs):
+        super().__init__([child], **kwargs)
+
+    def __init_subclass__(cls):
+        Operator.OPERATORS[cls.NAME] = cls
+
+    def copy(self):
+        return self.__class__(self.child.copy(), token=self._copy_token())
+
+    @property
+    def child(self):
+        return self.children[0]
+
+    def to_string(self):
+        if isinstance(self.child, Operator) and self.child.PRECEDENCE > self.PRECEDENCE:
+            return self.NAME + " (" + self.child.to_string() + ")"
+        return self.NAME + " " + self.child.to_string()
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, cls.TYPES):
+            return False
+
+        child = stack[-1]
+        token = stack[-2]
+
+        if token.value != cls.NAME:
+            return False
+
+        if token.value not in cls.OPERATORS:
+            return False
+
+        if (
+            lookahead
+            and lookahead.value in cls.OPERATORS
+            and cls.PRECEDENCE < cls.OPERATORS[lookahead.value].PRECEDENCE
+        ):
+            return False
+
+        stack.pop()
+        stack.pop()
+
+        stack.append(cls(child, token=token))
+        return True
+
+
+class BinOp(Operator):
+    def __init__(self, left, right, **kwargs):
+        super().__init__([left, right], **kwargs)
+
+    def __init_subclass__(cls):
+        if name := getattr(cls, "NAME", None):
+            Operator.OPERATORS[name] = cls
+
+    def copy(self):
+        return self.__class__(
+            self.left.copy(), self.right.copy(), token=self._copy_token()
+        )
+
+    @property
+    def left(self):
+        return self.children[0]
+
+    @property
+    def right(self):
+        return self.children[1]
+
+    def to_string(self):
+        strs = []
+        for c in self.children:
+            s = c.to_string()
+            if isinstance(c, BinOp) and c.PRECEDENCE < self.PRECEDENCE:
+                s = "(" + s + ")"
+            if strs:
+                strs.append(self.NAME)
+            strs.append(s)
+
+        return " ".join(strs)
+
+    @classmethod
+    def reduce(cls, stack, lookahead):
+        if not check_stack_types(stack, cls.TYPES):
+            return False
+
+        right = stack[-1]
+        token = stack[-2]
+        left = stack[-3]
+
+        if token.value != cls.NAME:
+            return False
+
+        if token.value not in cls.OPERATORS:
+            return False
+
+        if (
+            lookahead
+            and lookahead.value in cls.OPERATORS
+            and cls.PRECEDENCE < cls.OPERATORS[lookahead.value].PRECEDENCE
+        ):
+            return False
+
+        stack.pop()
+        stack.pop()
+        stack.pop()
+
+        stack.append(cls(left, right, token=token))
+        return True
+
+
+class ConjunctionOp(BinOp):
+    def __init__(self, left, right, **kwargs):
+        super().__init__(left, right, **kwargs)
+
+    @classmethod
+    def join(cls, nodes):
+        if len(nodes) == 0:
+            return None
+
+        if len(nodes) == 1:
+            return nodes[0]
+
+        root = cls(nodes.pop(), nodes.pop())
+        while nodes:
+            root = cls(root, nodes.pop())
+        return root
+
+    def _sort(self):
+        # Sort children
+        children = sorted([c._sort() for c in self.children], key=lambda x: x.key)
+        self.children = [c.node for c in children]
+        s = Node.Sort(self, [self.__class__.__name__] + [c.key for c in children])
+
+        if children[0].key == children[1].key:
+            # Duplicate expressions
+            return children[0]
+
+        if isinstance(self.left, Identifier) and isinstance(self.right, Identifier):
+            if self.left.ident == self.right.ident:
+                return (self.left, [self.left.ident])
+            # Already sorted
+            return s
+
+        # Find the parent of the left most child of the right child
+        right_parent = None
+        if isinstance(self.right, self.__class__):
+            right_parent = self.right
+            while isinstance(right_parent.left, self.__class__):
+                right_parent = right_parent.left
+
+        # Find the parent of the right most child of the left child
+        left_parent = None
+        if isinstance(self.left, self.__class__):
+            left_parent = self.left
+            while isinstance(left_parent.right, self.__class__):
+                left_parent = left_parent.right
+
+        if left_parent and right_parent:
+            left_key = left_parent.right._sort().key
+            right_key = right_parent.left._sort().key
+            if left_key == right_key:
+                # Swap right children to allow the identical nodes to
+                # eventually merge together
+                tmp = self.children[1]
+                self.children[1] = self.left.children[1]
+                self.left.children[1] = tmp
+
+                # Sort again
+                return self._sort()
+
+            if left_key > right_key:
+                tmp = left_parent.children[1]
+                left_parent.children[1] = right_parent.children[0]
+                right_parent.children[0] = tmp
+
+                # Sort again
+                return self._sort()
+
+            # We don't want a "balanced" node (that is, one with both
+            # children being the same) to ensure that the resulting
+            # tree is consistent (and thus, comparable). Swap terminal
+            # nodes left to "bubble" up this node
+            tmp = left_parent.children[1]
+            left_parent.children[1] = self.children[1]
+            self.children = [tmp, left_parent]
+            return self._sort()
+
+        elif left_parent:
+            left_key = left_parent.right._sort().key
+            right_key = self.right._sort().key
+            if left_key == right_key:
+                return children[0]
+
+            if left_key > right_key:
+                tmp = self.children[1]
+                self.children[1] = left_parent.children[1]
+                left_parent.children[1] = tmp
+
+                # Sort again
+                return self._sort()
+
+        elif right_parent:
+            left_key = self.left._sort().key
+            right_key = right_parent.left._sort().key
+            if left_key == right_key:
+                return children[1][0], children[1][1]
+
+            if left_key > right_key:
+                tmp = self.children[0]
+                self.children[0] = right_parent.children[0]
+                right_parent.children[0] = tmp
+
+                # Sort again
+                return self._sort()
+
+        return s
+
+
+class OrOp(ConjunctionOp):
+    NAME = "OR"
+    PRECEDENCE = 1
+    TYPES = [COMPOUND_EXPRESSION, ReservedToken, COMPOUND_EXPRESSION]
+
+
+class AndOp(ConjunctionOp):
+    NAME = "AND"
+    PRECEDENCE = 2
+    TYPES = [COMPOUND_EXPRESSION, ReservedToken, COMPOUND_EXPRESSION]
+
+
+class NotOp(UnaryOp):
+    NAME = "NOT"
+    PRECEDENCE = 3
+    TYPES = [ReservedToken, COMPOUND_EXPRESSION]
+
+
+class WithOp(BinOp):
+    NAME = "WITH"
+    PRECEDENCE = 4
+    TYPES = [SIMPLE_EXPRESSION, ReservedToken, ExceptionId]
+
+    @property
+    def license(self):
+        return self.left
+
+    @property
+    def exception(self):
+        return self.right
+
+    def _sort(self):
+        return Node.Sort(
+            self,
+            [
+                self.__class__.__name__,
+                self.license._sort().key,
+                self.exception._sort().key,
+            ],
+        )
+
+
+RESERVED = set(Operator.OPERATORS.keys()) | {"(", ")", "+"}
+
+REDUCTIONS = (
+    ReservedToken.reduce,
+    LicenseId.reduce,
+    ExceptionId.reduce,
+    LicenseRef.reduce,
+    WithOp.reduce,
+    NotOp.reduce,
+    AndOp.reduce,
+    OrOp.reduce,
+    CompoundExpression.reduce,
+)
+
+
+def _reduce(stack, lookahead):
+    # print(stack)
+    for r in REDUCTIONS:
+        if r(stack, lookahead):
+            # print(f"Applied reduction {r}")
+            _reduce(stack, lookahead)
+
+
+def tokenize(s):
+    tokens = []
+    t = Token()
+
+    def end_token(end):
+        nonlocal t
+        nonlocal tokens
+        if t.value:
+            t.end = end + 1
+            tokens.append(t)
+        t = Token()
+
+    for idx, c in enumerate(s):
+        if c in RESERVED:
+            end_token(idx - 1)
+            t.start = idx
+            t.value = c
+            end_token(idx)
+        elif c in (" ", "\t", "\n", "\r"):
+            end_token(idx - 1)
+        else:
+            if not t.value:
+                t.start = idx
+            t.value += c
+
+    end_token(len(s) - 1)
+    return tokens
+
+
+def create_ast(tokens, *, allow_unknown=False):
+    stack = []
+    while tokens:
+        t = tokens.pop(0)
+
+        if tokens:
+            lookahead = tokens[0]
+        else:
+            lookahead = None
+
+        stack.append(t)
+        _reduce(stack, lookahead)
+        # If unknown IDs are allowed, attempt a reduction to an unknown ID
+        if allow_unknown and UnknownId.reduce(stack, lookahead):
+            _reduce(stack, lookahead)
+
+    if len(stack) == 0:
+        raise ParseError(None, "Empty expression")
+
+    # Error on any unknown tokens
+    for n in stack:
+        if isinstance(n, Token):
+            raise ParseError(n, f"Unknown Expression '{n.value}'")
+
+    # Error on any unconsumed reserved keywords
+    for n in stack:
+        if isinstance(n, ReservedToken):
+            raise ParseError(n, f"Unexpected '{n.value}'")
+
+    if len(stack) > 1:
+        raise ParseError(stack[1], "Unexpected Expression")
+
+    return stack.pop()._simplify()
+
+
+def parse(s, *, allow_unknown=False):
+    def check_node(n):
+        if isinstance(n, NotOp):
+            raise ParseError(n, "Expression not allowed in this context")
+
+        for child in n.children:
+            check_node(child)
+
+    try:
+        tokens = tokenize(s)
+        n = create_ast(tokens, allow_unknown=allow_unknown)
+        check_node(n)
+        return n
+    except ParseError as e:
+        e.expression = s
+        raise
+
+
+def parse_match(s):
+    try:
+        tokens = tokenizer(s)
+        return create_ast(tokens)
+    except ParseError as e:
+        e.expression = s
+        raise
-- 
2.54.0


