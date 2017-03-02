Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 427BE7304D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Mar 2017 09:38:49 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id l7so49402423ioe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Mar 2017 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=BFE77Wtmfz6k10M7ieu7Ka5MizOlusjuJUBhw8ocAtk=;
	b=vbH6xMhlnIq7fetlU9B9r6Fhd4r8Gx/DwSwkTnCKq3sXObcQPZJgR/ctXZvm27om0F
	j2cesfBfT4jJIGgxmTYO0zA8QbqF9HSEKXTsxfFvsqnqS3p0df4iYC3TPuRq/e0QJNao
	dFjY/KhBdmrBkVx4iAOYItiGi4zqa+WwNKUovDq3PstSy6WOVBEwSskkBmFjmTnqRgwD
	TccaEUpbDiL5bD8UcuyL2vboM9hXzLs/I5f19zNT42wNJdwHtdAPd9a+/JBXCQPYKn4Z
	vjras8gZ7X+FCyVzVCqDiFdzAVu0Eap9L+Z6KGZn+aZENvu6tqFhONhV/h3ikC8TN4gm
	Nwlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=BFE77Wtmfz6k10M7ieu7Ka5MizOlusjuJUBhw8ocAtk=;
	b=jeVUkv8QvoN99xU49GNbrGLD9hzh4RZRpk7tBhKgseTJHZJMN7Ie0F+YyMicbaCdeA
	kKLdlatao+Wshkq74RaY4EHemkzXdrJaXmXKz53QCMxXy3/2CzbCmHD5T2eetOQbhITz
	FP1Eh5OWluVi1ZpAVOOkv5BkZKUAiw4pxXHb6YhQKn2F3eRIRs2h8J4ggwjZM11Kkoy/
	aqZ6dUrrdMZ4RW/q1UQQcocy9xGS+Lay0/sWxbH8mdgMTMay3eML5sTapd1JaLDygOkR
	DJLyYT+Tkkoe3hRzot+Q0eu4NkZiBt3yTHmRYvexSNUbBIaj+9TldLonJDuh4hqUIJc/
	tEdA==
X-Gm-Message-State: AMke39ljq9MoPwurXXjbiuciNRVAIoybvABC4SH6w2o09IseVysq6+ipVpwH+OuOcV3qorCg
X-Received: by 10.107.170.12 with SMTP id t12mr13141336ioe.113.1488447530912; 
	Thu, 02 Mar 2017 01:38:50 -0800 (PST)
Received: from pohly-mobl1 (p5DE8E17A.dip0.t-ipconnect.de. [93.232.225.122])
	by smtp.gmail.com with ESMTPSA id v197sm402792ita.2.2017.03.02.01.38.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Mar 2017 01:38:49 -0800 (PST)
Message-ID: <1488447526.7785.205.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 02 Mar 2017 10:38:46 +0100
In-Reply-To: <20170301155243.GA3290@jama>
References: <cover.1483696378.git.patrick.ohly@intel.com>
	<6787329b6c24642352cd015ae22b5dfa579ca010.1483696378.git.patrick.ohly@intel.com>
	<CA+chaQebkND=ipbVvDGAJo=o79SsucECyyNgaaMRYyiOuVqZ2g@mail.gmail.com>
	<1487240814.13854.449.camel@intel.com> <20170301155243.GA3290@jama>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] rm_work.bbclass: clean up sooner
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
X-List-Received-Date: Thu, 02 Mar 2017 09:38:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-01 at 16:52 +0100, Martin Jansa wrote:
> On Thu, Feb 16, 2017 at 11:26:54AM +0100, Patrick Ohly wrote:
> > On Wed, 2017-02-15 at 19:32 +0100, Martin Jansa wrote:
> > > Are all changes necessary for this to work already in master?
> > 
> > Yes.
> > 
> > > Yesterday I've noticed that rm_work for some components which are
> > > early in the dependency (like qtbase) are executed relatively late
> > > (together with do_package_qa).
> > 
> > Could do_rm_work run before do_package_qa? rm_work.bbclass doesn't know
> > that, and therefore schedules do_rm_work after do_package_qa.
> > 
> > If yes, then adding a list of tasks that can be ignored would be
> > trivial. This can be a variable, so a recipe can even add their own
> > ones, if necessary.
> 
> That's now what I've meant.
> 
> I believe that rm_work needs to be executed after do_package_qa, but I
> don't understand the scheduler code enough (at least not yet) to say
> that higher priority of rm_work task also makes all the tasks rm_work
> depends on e.g. do_package_qa to be executed sooner.
> 
> From my observation it looked like do_package_qa is still executed
> "late", but immediately followed by rm_work thanks to its high priority
> (so it's executed as soon as it can, but it's still late in progress of
> the whole build).
> 
> Another interesting test from today was to run:
> # rm -rf tmp-glibc/*
> # bitbake -n zlib | tee log.zlib.rm_work
> # cd oe-core; git revert -1 936179754c8d0f98e1196ddc6796fdfd72c0c3b4; cd ..
> # rm -rf tmp-glibc/*
> # bitbake -n zlib | tee log.zlib.rm_work.revert
> 
> and it shows interesting difference that many rm_work tasks aren't
> executed at all:
> 
> # grep rm_work log.zlib.rm_work* | grep zlib_
> log.zlib.rm_work:NOTE: Running task 526 of 527 (/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 128 of 721 (virtual:native:/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 717 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 721 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all)
> 
> # grep rm_work log.zlib.rm_work* | grep gcc
> log.zlib.rm_work.revert:NOTE: Running task 2 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-source_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 240 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 250 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc-initial_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 634 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 674 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/libgcc_6.3.bb:do_rm_work)
> log.zlib.rm_work.revert:NOTE: Running task 678 of 721 (/OE/build/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_6.3.bb:do_rm_work)

I can reproduce that.

The root cause for the current behavior is that zlib:do_build does not
depend on zlib-native:do_build and thus does not enable
zlib-native:do_rm_work:

# bitbake -g zlib
# grep -e '->.*zlib-native' task-depends.dot | grep -v '^.zlib-native'
"binutils-cross-x86_64.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"rpm-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"gcc-cross-initial-x86_64.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"binutils-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"gcc-cross-x86_64.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"file-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"pigz-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"elfutils-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"python-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"libpcre-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"

Only tasks that are required by the current build target(s) are
executed. From that perspective, the current behavior makes sense
(although it is of course not desirable).

More interesting is why it worked before. The answer is this:

# grep rm_work_all log.zlib.rm_work.revert 
NOTE: Running task 721 of 721 (/work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all)
# grep -e '->.*zlib-native' task-depends.dot | grep -v '^.zlib-native'
"elfutils-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"binutils-cross-x86_64.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"pigz-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"gcc-cross-x86_64.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"binutils-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"gcc-cross-initial-x86_64.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"python-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"rpm-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"zlib.do_rm_work_all" -> "zlib-native.do_rm_work"
"libpcre-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"
"file-native.do_prepare_recipe_sysroot" -> "zlib-native.do_populate_sysroot"

In other words, do_rm_work_all (the default task for "bitbake zlib" in
the previous approach) was responsible for triggering do_rm_work in
everything that zlib depended upon.

A side effect of that was that do_rm_work itself also caused more work
to be done than strictly necessary for the build:

# grep Running log.zlib.rm_work | sed 's/ [0-9]* of [0-9]*//' | grep -v rm_work | grep -v 'noexec task' | wc -l
54
# grep Running log.zlib.rm_work.revert | sed 's/ [0-9]* of [0-9]*//' | grep -v rm_work | grep -v 'noexec task' | wc -l
156

$ diff <(grep Running log.zlib.rm_work | sed 's/ [0-9]* of [0-9]*//' | grep -v rm_work | grep -v 'noexec task' | sort) <(grep Running log.zlib.rm_work.revert | sed 's/ [0-9]* of [0-9]*//' | grep -v rm_work | grep -v 'noexec task' | sort)
0a1,11
> NOTE: Running setscene task (virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb:do_populate_lic_setscene)
> NOTE: Running setscene task (virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-connectivity/openssl/openssl_1.0.2k.bb:do_populate_sysroot_setscene)
> NOTE: Running setscene task (virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/expat/expat_2.2.0.bb:do_populate_lic_setscene)
> NOTE: Running setscene task (virtual:native:/work/iot-ref-kit/openembedded-core/meta/recipes-core/expat/expat_2.2.0.bb:do_populate_sysroot_setscene)
...
> NOTE: Running setscene task (/work/iot-ref-kit/openembedded-core/meta/recipes-core/glibc/glibc_2.25.bb:do_package_qa_setscene)
20a94
> NOTE: Running setscene task (/work/iot-ref-kit/openembedded-core/meta/recipes-core/glibc/glibc_2.25.bb:do_populate_lic_setscene)
22a97
> NOTE: Running setscene task (/work/iot-ref-kit/openembedded-core/meta/recipes-core/glibc/glibc-initial_2.25.bb:do_populate_lic_setscene)
...
> NOTE: Running setscene task (/work/iot-ref-kit/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.0.bb:do_populate_sysroot_setscene)

When rm_work.bbclass is not active, the old code did not execute these
tasks for "bitbake zlib".

Ideally, enabling rm_work.bbclass should trigger the recursive
do_rm_work (as before) but without triggering extra work (unlike
before). I just can't think of a way to do that - not with the kind of
dependencies we have in bitbake at the moment. We would have to
distinguish between "strong" dependencies (if A is active and depends on
B, then B must be executed first) and "weak" ordering (if A and B both
must run and A must run before B, then execute A first).

Given that most tasks triggered by do_rm_work on top of
do_populate_sysroot seem to be fairly light, enabling them in addition
to do_rm_work itself is probably better. Here's a tentative patch
achieving that:

# git diff
diff --git a/meta/classes/rm_work.bbclass b/meta/classes/rm_work.bbclass
index 054c93716e..eeb83d386a 100644
--- a/meta/classes/rm_work.bbclass
+++ b/meta/classes/rm_work.bbclass
@@ -102,6 +102,14 @@ do_rm_work () {
         rm -f $i
     done
 }
+do_rm_work_all () {
+    :
+}
+do_rm_work_all[recrdeptask] = "do_rm_work do_rm_work_all"
+do_rm_work_all[noexec] = "1"
+addtask rm_work_all after before do_build
+
+do_rm_work_all[recrdeptask] = "do_rm_work"
 
 do_populate_sdk[postfuncs] += "rm_work_populatesdk"
 rm_work_populatesdk () {
@@ -138,9 +146,8 @@ python inject_rm_work() {
         # do_build inherits additional runtime dependencies on
         # other recipes and thus will typically run much later than completion of
         # work in the recipe itself.
-        deps = bb.build.preceedtask('do_build', True, d)
-        if 'do_build' in deps:
-            deps.remove('do_build')
+        deps = set(bb.build.preceedtask('do_build', True, d))
+        deps.difference_update(('do_build', 'do_rm_work_all'))
         # In practice, addtask() here merely updates the dependencies.
         bb.build.addtask('do_rm_work', 'do_build', ' '.join(deps), d)
 }



# bitbake -n zlib | tee log.zlib.rm_work.patched
$ diff <(grep Running log.zlib.rm_work.patched | sed 's/ [0-9]* of [0-9]*//' | grep -v 'noexec task' | sort) <(grep Running log.zlib.rm_work.revert | sed 's/ [0-9]* of [0-9]*//' | grep -v 'noexec task' | sort)
202a203
> NOTE: Running task (/work/iot-ref-kit/openembedded-core/meta/recipes-core/zlib/zlib_1.2.8.bb:do_rm_work_all)

The only difference compared to before is because of the slight
do_rm_work_all[noexec] tweak.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




