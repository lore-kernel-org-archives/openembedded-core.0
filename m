Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15463.1794778982421693074
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 13:43:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=fUfSxqKm;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20261115214300979f7e6fe500020733-otw9cx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20261115214300979f7e6fe500020733
        for <openembedded-core@lists.openembedded.org>;
        Sun, 15 Nov 2026 22:43:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=L+G1SgviYQyhACpv3wJw7uBLx+9Rv8YBgtWuFZdKql8=;
 b=fUfSxqKmvpZxfbrU/QUcMA5/HiyvZYi71YTXQ8E7iavC/4b/RfacHbCQ8ixGQZC78HI37n
 K/jLwklH0I/MhJUx/hZY30aTGJKY+ea21zGF4X8QnzxI1AbK3IE3mfDXqthtyt4O68MUna/M
 LK9wHgNfXamenY6yDLegYpUpnkFPCu7EATuPCtp2ln0ehQ+sdqj7MNz1BjCWpzvquh5kEbKC
 qRb/QYV54SJ//nHIkd+ijkilu4EoOXXzGczeSrAm7MFLer/zXRk6CdE48W1Af8PkvlaxwiOw
 BpyosHRhhTHsz4tZR/NhaRA0LnnF6C3KdXkrf3HNGNlywazWlXOHlB+A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 7/9] ruby: upgrade 4.0.5 -> 4.0.6
Date: Sun, 15 Nov 2026 22:39:41 +0100
Message-ID: <20261115213944.1653468-7-peter.marko@siemens.com>
In-Reply-To: <20261115213944.1653468-1-peter.marko@siemens.com>
References: <20261115213944.1653468-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 21:43:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250296
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

Bug fixes only, upstream release notes:

- Thread.each_caller_location(1, 1) segfaults when called from a cfunc
- heap-use-after-free in rb_vm_ci_lookup under parallel Ractors
- defined? returns nil for protected methods defined in a module even when callable
- [BUG] should have cvar cache entry
- YJIT misaligns locals when there are > 256 local variables
- GC compaction breaks compare-by-identity sets
- invokesuper from define_method in Ractor can call wrong super method or crash
- Array#sum takes slow path, does not perform compensated summation of Float elements when init argument is a Float
- Float#round(n) returns a wrong result when n is big
- Float#ceil gives incorrect result
- Freeing a mutex locked by a fiber inside fiber scheduler can crash
- Crash when modifying instance variables during inspect or Marshal dump
- ASAN heap-use-after-free in rb_data_free after TypedData dfree frees dynamic rb_data_type_t
- Constant-folded /o regexp crashes with dupstring of a Regexp
- $! stays as the first exception in Ruby Box
- Split the root box into the (newer) root box and the master of copied user boxes
- Segfault caused by ar_find_entry_hint() not checking for conversion to st_table
- error_highlight raises NotImplementedError for ArgumentErrors that get wrapped
- Inconsistencies in type coercion error messages for integers
- IO::Buffer#locked leaves the buffer locked when the block raises
- parse.y regexp crash on invalid encoding
- Stack underflow for partial DCE and loops
- void value missed in parse.y
- Segfault in PRISM while Bootsnap compiles aws-sdk client_api.rb
- Unnecessary context-switching, especially bad on multi-core machines.
- Keyword-only method silently accepts a positional argument
- parse.y interpolation inside lambda literal
- SEGV in branch peephole optimization due to label/insn struct aliasing
- Ruby's default SIGINT handling ignores Thread.handle_interrupt masking.
- Enumerator::Lazy#to_enum does not accept method names as strings
- Signal.trap(:EXIT) exception only shown if at_exit also raises

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1a1d2e4179e3b36cec01e95911f7e695957f3551)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/ruby/{ruby_4.0.5.bb => ruby_4.0.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ruby/{ruby_4.0.5.bb => ruby_4.0.6.bb} (98%)

diff --git a/meta/recipes-devtools/ruby/ruby_4.0.5.bb b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
similarity index 98%
rename from meta/recipes-devtools/ruby/ruby_4.0.5.bb
rename to meta/recipes-devtools/ruby/ruby_4.0.6.bb
index a0981bf622..3e9381ba63 100644
--- a/meta/recipes-devtools/ruby/ruby_4.0.5.bb
+++ b/meta/recipes-devtools/ruby/ruby_4.0.6.bb
@@ -48,7 +48,7 @@ do_configure:prepend() {
 
 DEPENDS:append:libc-musl = " libucontext"
 
-SRC_URI[sha256sum] = "7d6149079a63f8ae1d326c9fa65c6019ba2dc3155eae7b39159817911c88958e"
+SRC_URI[sha256sum] = "837d299e8f7ddf2be31a229a7a7e019d354979825117989acb3b32b1a9be262a"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
