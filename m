Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2D517606CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 09:17:21 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 203so12671917ith.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Feb 2017 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=1MgW5NvVfe4l1CKN29kv1Pt6lKfIZhUAe4RSrNJv2qs=;
	b=BBWeogSmaVZyrXL8CMcn6rAtpbjwR0gaLqCbPPhQTSgXemeEXETxjDycGAXQQWdsvA
	l6/YSdTCCcaKTmo4St0vfVMvS6P+/PxDlXdSRQuyUk7MpaQ8rcFyh+uc43tI7jvR3IQ4
	/4tYjdWgSQPTFi+nSx38m4U0joTp2EK61tG1IfGV5m8eV7lYeV+2e+bemR0iUn5+M7u1
	m6cS2CChM/tESEcO4fdScpGutH/cTFYhcgZhl59B/rcC/QY2seJngODHqPts6Q/bbCf/
	rtWPlIdZKHhD1jzVWl9HPffqFyQrY0sxuBZ2VasKtzgCu3zANmIhWcvWvEn7UWXfAQT2
	R3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=1MgW5NvVfe4l1CKN29kv1Pt6lKfIZhUAe4RSrNJv2qs=;
	b=LZWXgy3Ei0x3PP3MBgkaufuQihfEvPfGfGs7GOJ9H2vui+Vf0eZU7FK14HxAvP9xE/
	irzy8ne4xch3nlfbPnX+pq8X/ain58wwsj/bCflRe0n+yBDUHVAEubYqRl9E6KSW3Y7h
	bn/mQIXhrYTofTIWv87EsYXSMA+vtHsv1ddKxpu7cqb6YpmzHodqvz5pp1pIJOQAwJ4V
	yqkis6akvjN0QtwcO9ShBEjv3NZpHVSs5a9P1gExfzx+/shvSbBgBINxfN4vYLtatsn9
	4nynF10+OVO2sAipVOpydVhM22wOKOgdRd5IQRW4n43Jcu/aIud9AfYQc5xX8G0XNNWd
	gxnw==
X-Gm-Message-State: AIkVDXIdSQFIigOglByJ38idkbwLpUqUdS5z711CXaCnu2IvpCpIpdZuDfxsiz/sJTWkdrZj
X-Received: by 10.36.61.136 with SMTP id n130mr1591478itn.107.1485940641582;
	Wed, 01 Feb 2017 01:17:21 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DF4F.dip0.t-ipconnect.de. [93.232.223.79])
	by smtp.gmail.com with ESMTPSA id 9sm9716476itm.18.2017.02.01.01.17.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Feb 2017 01:17:20 -0800 (PST)
Message-ID: <1485940638.20333.187.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 01 Feb 2017 10:17:18 +0100
In-Reply-To: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
References: <cover.55ff1fc2ce63597ab9f5324450132e786a996ac5.1485867027.git-series.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: verify-bashisms + shellcheck (was: Re: [PATCH 0/8] verify-bashisms: fix script and one issue found by it)
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
X-List-Received-Date: Wed, 01 Feb 2017 09:17:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-01-31 at 13:50 +0100, Patrick Ohly wrote:
> The script broke when introducing tinfoil2. The patches also include
> several usability enhancements, like making the output less redundant
> and including information about the actual file and line where the
> offending script can be found.

I've further modified verify-bashisms so that it can optionally run the
scripts through shellcheck (https://www.shellcheck.net/).

I'm quite impressed with how much real issues shellcheck finds and I
also found the recommendations useful. However, it is too verbose to be
applied to all scripts in OE. For example, it warns about missing
quotation marks around variables a lot.

There is no simple "check for bashisms" command line flag or "enable
just these checks" mode. One can disable warnings, so perhaps excluding
a long list of know "harmless" checks would be a way how shellcheck
could replace checkbashisms.pl?

My current solution always calls checkbashisms.pl, and shellcheck only
when a function is annotated:

foobar () {
   echo hello world
}
foobar[shellcheck] = "sh"

This sets "sh" as expected shell flavor. I did it this way because I can
imagine that someone might want to have some functions with bash
features and then ensure that bash is used to execute the code.

I can also imagine that this varflag could be used to exclude certain
checks with "sh SC2001 SC2002 ...", although the same can also be done
with inline comments for specific lines:

foobar () {
   # shellcheck disable=SC2003
   i=$( expr $i + 1 )  
}

Using expr triggers a warning because usually $(( )) is a better
alternative. However, that currently can't be used in bitbake functions
because the shell parser chokes on it:

   NotImplementedError: $((

So I've disabled that check by default.

Any suggestions how to proceed with this?

Note that shellcheck is written in Haskell. Getting it installed
automatically via a recipe would imply adding Haskell support to
OE-core. OTOH it seems to be packaged quite widely, so assuming it to be
installed on the host seems okay.

The "verify-bashisms" name of the script no longer quite matches the
actual functionality when using shellcheck, but that's minor (?).

FWIW, current additional patch is here:

diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index dab64ef5019..000ed3f1764 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -24,8 +24,9 @@ def is_whitelisted(s):
 
 SCRIPT_LINENO_RE = re.compile(r' line (\d+) ')
 BASHISM_WARNING = re.compile(r'^(possible bashism in.*)$', re.MULTILINE)
+SHELLCHECK_LINENO_RE = re.compile(r'^(In .* line )(\d+):$', re.MULTILINE)
 
-def process(filename, function, lineno, script):
+def process(filename, function, lineno, script, shellcheck):
     import tempfile
 
     if not script.startswith("#!"):
@@ -35,10 +36,10 @@ def process(filename, function, lineno, script):
     fn.write(script)
     fn.flush()
 
+    results = []
     try:
         subprocess.check_output(("checkbashisms.pl", fn.name), universal_newlines=True, stderr=subprocess.STDOUT)
-        # No bashisms, so just return
-        return
+        # No bashisms, so just continue
     except subprocess.CalledProcessError as e:
         # TODO check exit code is 1
 
@@ -48,33 +49,53 @@ def process(filename, function, lineno, script):
             # Probably starts with or contains only warnings. Dump verbatim
             # with one space indention. Can't do the splitting and whitelist
             # checking below.
-            return '\n'.join([filename,
-                              ' Unexpected output from checkbashisms.pl'] +
-                             [' ' + x for x in output.splitlines()])
-
-        # We know that the first line matches and that therefore the first
-        # list entry will be empty - skip it.
-        output = BASHISM_WARNING.split(output)[1:]
-        # Turn the output into a single string like this:
-        # /.../foobar.bb
-        #  possible bashism in updatercd_postrm line 2 (type):
-        #   if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
-        #  ...
-        #   ...
-        result = []
-        # Check the results against the whitelist
-        for message, source in zip(output[0::2], output[1::2]):
-            if not is_whitelisted(source):
-                if lineno is not None:
-                    message = SCRIPT_LINENO_RE.sub(lambda m: ' line %d ' % (int(m.group(1)) + int(lineno) - 1),
-                                                   message)
-                result.append(' ' + message.strip())
-                result.extend(['  %s' % x for x in source.splitlines()])
-        if result:
-            result.insert(0, filename)
-            return '\n'.join(result)
+            results.extend([' Unexpected output from checkbashisms.pl'] +
+                           [' ' + x for x in output.splitlines()])
         else:
-            return None
+            # We know that the first line matches and that therefore the first
+            # list entry will be empty - skip it.
+            output = BASHISM_WARNING.split(output)[1:]
+            # Turn the output into a single string like this:
+            # /.../foobar.bb
+            #  possible bashism in updatercd_postrm line 2 (type):
+            #   if ${@use_updatercd(d)} && type update-rc.d >/dev/null 2>/dev/null; then
+            #  ...
+            #   ...
+            # Check the results against the whitelist
+            for message, source in zip(output[0::2], output[1::2]):
+                if not is_whitelisted(source):
+                    if lineno is not None:
+                        message = SCRIPT_LINENO_RE.sub(lambda m: ' line %d ' % (int(m.group(1)) + int(lineno) - 1),
+                                                       message)
+                    results.append(' ' + message.strip())
+                    results.extend(['  %s' % x for x in source.splitlines()])
+
+    if shellcheck:
+        try:
+            excluded = []
+            # SC2003 warns about using expr instead of $(( )).
+            # bitbake's shell parser chokes on $(( )), so expr
+            # is what embedded scripts have to use - ignore the warning.
+            excluded.append("SC2003")
+            subprocess.check_output(["shellcheck", "--shell=%s" % shellcheck] +
+                                    ["-e%s" % x for x in excluded] +
+                                    [fn.name],
+                                    universal_newlines=True, stderr=subprocess.STDOUT)
+            # No shell warnings, so just continue.
+        except subprocess.CalledProcessError as e:
+            # Replace the temporary filename with the function,
+            # update line numbers and indent the output.
+            output = e.output.replace(fn.name, function)
+            results.extend([' ' +
+                            (x if lineno is None else
+                             SHELLCHECK_LINENO_RE.sub(lambda m: m.group(1) + str(int(m.group(2)) + int(lineno) - 1), x))
+                            for x in output.splitlines()])
+
+    if results:
+        results.insert(0, filename)
+        return '\n'.join(results)
+    else:
+        return None
 
 def get_tinfoil():
     scripts_path = os.path.dirname(os.path.realpath(__file__))
@@ -94,12 +115,16 @@ if __name__=='__main__':
         print("Cannot find checkbashisms.pl on $PATH, get it from https://anonscm.debian.org/cgit/collab-maint/devscripts.git/plain/scripts/checkbashisms.pl")
         sys.exit(1)
 
+    if shutil.which("shellcheck") is None:
+        print("Cannot find shellcheck on $PATH, get it from your distro or https://www.shellcheck.net/")
+        sys.exit(1)
+
     # The order of defining the worker function,
     # initializing the pool and connecting to the
     # bitbake server is crucial, don't change it.
     def func(item):
-        (filename, key, lineno), script = item
-        return process(filename, key, lineno, script)
+        (filename, key, lineno), (script, shellcheck) = item
+        return process(filename, key, lineno, script, shellcheck)
 
     import multiprocessing
     pool = multiprocessing.Pool()
@@ -129,16 +154,22 @@ if __name__=='__main__':
                 data = tinfoil.parse_recipe_file(realfn)
                 for key in data.keys():
                     if data.getVarFlag(key, "func") and not data.getVarFlag(key, "python"):
+                        # Do not expand by default, it could change line numbers.
                         script = data.getVar(key, False)
+                        if script and '${@' in script:
+                            # Embedded Python code confuses the checkers too much,
+                            # we have to expand.
+                            script = data.getVar(key, True)
                         if script:
                             filename = data.getVarFlag(key, "filename")
                             lineno = data.getVarFlag(key, "lineno")
+                            shellcheck = data.getVarFlag(key, "shellcheck")
                             # There's no point in checking a function multiple
                             # times just because different recipes include it.
                             # We identify unique scripts by file, name, and (just in case)
                             # line number.
                             attributes = (filename or realfn, key, lineno)
-                            scripts.setdefault(attributes, script)
+                            scripts.setdefault(attributes, (script, shellcheck))
 
 
     print("Scanning scripts...\n")




-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




