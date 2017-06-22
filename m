Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 59B507822E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 17:39:17 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id b205so24744245itg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 10:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=GHat7Uh6FJRg46ZiMY1Y2XEO7u35CB3fB+pLxrzlsKo=;
	b=vXtcuQ+e1HBQd7wvBZpQGRykR4egiKqc/H/hLtJ60gYSXjfZY95Vx4w9ZM6S4Nz5LQ
	OTqGLMqzUgVt+oGAAvBE5yktHcFy92nRTgoXb2TEM7FhkFsXxtQ4BUPnEn7KIsPqdmBa
	xsZpmusnqPoxkzSVgi2PNZ1DJoVm/9xFxmJ+XacOppk6u2XnDJ1ciXCcLTABNps0Smdk
	K4aXeVG9Kf9qzN4Bmygnflz+8UH0ZNiAqRKVnbjfSA2Ns1jLijZivjEBpPwrRi3K6PMY
	ufiJ/6nb8QSE9AM5t/sfYcW64WXTp187cufCBxuFVEP5wikFDMc42pYWSos6Glkqgxlq
	Vo/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=GHat7Uh6FJRg46ZiMY1Y2XEO7u35CB3fB+pLxrzlsKo=;
	b=W+D224O8T9vSC5mZXy6UmM3r3KRRI3w1dJoHcYdIgUdvLCP3B3pa9qRunomIk+VZi6
	7ei4icI4SbsoZiPyuF+dZAKfMWD8umPqtrIIwgiWULjb+ssdJpQmqPlPjTITKqY/hiBw
	d1zcm/bMXa0ECmxIVwizriTYLYivWcL9RK49aPpVIkpPnoaVclopEyKjVdLItCN/n+HP
	1CSR25bbREvz8t7XSA9HTUBxoU2FfkmlstAnnJ//owsp8TYA6/WTsOhiR1hwgBBgmc4b
	sKJXHFLjAkQ2QFMaOLSRgjVXAmA9mLFP+JnVS5Qimd1qzNJfAW6rx8zEJhprILP0rF4h
	OLRw==
X-Gm-Message-State: AKS2vOwZmVpDtRrWOe6avR0OjJEJMXYU9rEzF/fAGN90FE5uokVwwNnI
	BClv8YL1A9Z6IRcz
X-Received: by 10.36.106.5 with SMTP id l5mr3209723itc.95.1498153158664;
	Thu, 22 Jun 2017 10:39:18 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF96.dip0.t-ipconnect.de. [93.232.239.150])
	by smtp.gmail.com with ESMTPSA id
	131sm1322701itl.11.2017.06.22.10.39.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 10:39:17 -0700 (PDT)
Message-ID: <1498153154.22706.38.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Thu, 22 Jun 2017 19:39:14 +0200
In-Reply-To: <1498148311.31575.56.camel@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
	<1498147164.22706.30.camel@intel.com>
	<1498148311.31575.56.camel@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Thu, 22 Jun 2017 17:39:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 11:18 -0500, Leonardo Sandoval wrote:
> On Thu, 2017-06-22 at 17:59 +0200, Patrick Ohly wrote:
> > On Thu, 2017-06-22 at 10:37 -0500, Leonardo Sandoval wrote:
> > > On Thu, 2017-06-22 at 17:14 +0200, Patrick Ohly wrote:
> > > > On Thu, 2017-06-22 at 09:58 -0500, Leonardo Sandoval wrote:
> > > > > On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> > > > > > On Mon, 2017-06-19 at 07:39 -0700,
> > > > > > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > > > > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > > > > > > 
> > > > > > > Do not mix the stderr into stdout, allowing test cases to query
> > > > > > > the specific output.
> > > > > > 
> > > > > > This changes the behavior of functions that are also used outside of
> > > > > > OE-core in a way that won't be easy to notice. I also don't think that
> > > > > > it is the right default. For example, for bitbake it is easier to
> > > > > > understand where an error occurred when stderr goes to the same stream
> > > > > > as stdout.
> > > > > 
> > > > > how would that make it easier?
> > > > 
> > > > Because then output will be properly interleaved, as it would be on a
> > > > console.
> > > > 
> > > > Actually, the entire error reporting in runCmd() only prints
> > > > result.output, so with stderr going to result.error by default, you
> > > > won't get the actual errors reported anymore at all, will you? 
> > > > 
> > > 
> > > process stderr will go into result.error and process stdout into
> > > result.output. So when the process is executed ignoring the return
> > > status, then test must check result.error. I find the latter cleaner
> > > that checking errors into stdout.
> > 
> > It depends on how the result is used. That you prefer split output for
> > some tests does not mean that everyone wants the same in their tests. I
> > don't want it in my own usage of runCmd() or bitbake() because I don't
> > care about where a message was printed. I just want it in proper order.
> > 
> > If you change the default, then you will also have to enhance runCmd()'s
> > error handling to include results.error. That's currently missing in
> > your patch.
> 
> it is not missing, it is on 2/2

I'm talking about this code:

def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
          native_sysroot=None, limit_exc_output=0, **options):
...
    if result.status and not ignore_status:
        exc_output = result.output
        if limit_exc_output > 0:
            split = result.output.splitlines()
            if len(split) > limit_exc_output:
                exc_output = "\n... (last %d lines of output)\n" % limit_exc_output + \
                             '\n'.join(split[-limit_exc_output:])
        if assert_error:
            raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
        else:
            raise CommandError(result.status, command, exc_output)

You are not extending that in either 2/2, are you? At the moment, when a
command fails, one gets stdout+stderr. With your path, one only gets
stdout, which typically won't have the error message that caused the
non-zero status.

Here's my proposal:
     1. drop the "commands: send stderr to a new pipe" path, because
        that has much wider implications for everyone else
     2. in "selftest/cases: use stderr data when querying for errors",
        explicitly change the bitbake() calls so that they have
        stderr=subprocess.PIPE

Example:

     @OETestID(105)
     def test_bitbake_invalid_recipe(self):
-        result = bitbake('-b asdf', ignore_status=True)
-        self.assertTrue("ERROR: Unable to find any recipe file matching 'asdf'" in result.output, msg = "Though asdf recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % result.output)
+        invalid = 'asdf'
+        result = bitbake('-b %s' % invalid, ignore_status=True, stderr=subprocess.PIPE)
+        self.assertTrue("ERROR: Unable to find any recipe file matching '%s'" % invalid in result.error, msg = "Though %s recipe doesn't exist, bitbake didn't output any err. message. bitbake output: %s" % (invalid, result.error))



-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




