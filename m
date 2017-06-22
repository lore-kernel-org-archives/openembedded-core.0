Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id EC41171996
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 21:07:19 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id b205so27472332itg.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 14:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=s2t5KtJF539hU4u8uNDNIv9NYi8DlmxhaVZqVOdolcs=;
	b=qfKLGn3vlKBhmT2BuO3LSgolvmlus0B1D0+eu5/Mbj/W+c5G+AxTPdLY/hHAb5N1Nq
	QVagqx+ZvbNp1jzP+U52WFw9Ohs+j7afgcmcZulHYBtBVh9kOc68QY2vdLRKjFwAgY5Z
	wJywODJuIGSOjx/ygyR+AFo0uA7j7w1R1HOkR2DKwd8e5+A7m9ixx9JJ2ilK7mdnIPir
	U0w//lLzEN7SAo/E0ib9DyO3k7TRh1fSzwyFVUSiS3uzbwUneIE9QifcTdMtiFdY52k1
	GQAYYVXDMVK3m5n5CcDsLuT8Md+9LICI3xMYx0TRo8PghEkYU+JiSF7xbyFS7hEzjDyv
	jYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=s2t5KtJF539hU4u8uNDNIv9NYi8DlmxhaVZqVOdolcs=;
	b=OXKayuwqPBPNtUTXyZ9qbV26vtlQE7rg/5EzzjlDCRmiiB8rN2UaNluzzcKBeRZ5n9
	rus/EmdPt6k5gRIvH1UXNCfVgG9mcHYSThEy64GZzdgbN+Bj2HMsV4VOnH3Wi0wJBy+u
	hpRAUs9eNDItaTXYcYFh/UOL4hJJktTo1cdQJxs6uM24IqBU6sfMLAOC2B5w36Whnne1
	VYfgNZ8qxGxshADaBMDknuK4yE7wzuE9h4By00RPajVSO3EiviMjXnPAO1RJEpUbbII9
	0RUeGRO9IXENwfsolYAOtPc78TpQDR2u+apW9zinm8HTRinOFNs2ffZabk8VwQn4rkKG
	QBDg==
X-Gm-Message-State: AKS2vOwsX2v+nNmBFAh1JyiH+41CQY1rxNAijr/2wdtC15hbW0/Es4kq
	pifJY2FAhkzYP2OsNzA=
X-Received: by 10.36.141.134 with SMTP id w128mr3927605itd.84.1498165640440;
	Thu, 22 Jun 2017 14:07:20 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF96.dip0.t-ipconnect.de. [93.232.239.150])
	by smtp.gmail.com with ESMTPSA id
	e79sm1664064iof.41.2017.06.22.14.07.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 14:07:19 -0700 (PDT)
Message-ID: <1498165636.22706.67.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Thu, 22 Jun 2017 23:07:16 +0200
In-Reply-To: <1498164469.31575.64.camel@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
	<1498144469.22706.10.camel@intel.com>
	<1498145851.31575.50.camel@linux.intel.com>
	<1498147164.22706.30.camel@intel.com>
	<1498148311.31575.56.camel@linux.intel.com>
	<1498153154.22706.38.camel@intel.com>
	<1498164469.31575.64.camel@linux.intel.com>
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
X-List-Received-Date: Thu, 22 Jun 2017 21:07:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 15:47 -0500, Leonardo Sandoval wrote:
> On Thu, 2017-06-22 at 19:39 +0200, Patrick Ohly wrote:
> > On Thu, 2017-06-22 at 11:18 -0500, Leonardo Sandoval wrote:
> > > On Thu, 2017-06-22 at 17:59 +0200, Patrick Ohly wrote:
> > > > On Thu, 2017-06-22 at 10:37 -0500, Leonardo Sandoval wrote:
> > > > > On Thu, 2017-06-22 at 17:14 +0200, Patrick Ohly wrote:
> > > > > > On Thu, 2017-06-22 at 09:58 -0500, Leonardo Sandoval wrote:
> > > > > > > On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> > > > > > > > On Mon, 2017-06-19 at 07:39 -0700,
> > > > > > > > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > > > > > > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > > > > > > > > 
> > > > > > > > > Do not mix the stderr into stdout, allowing test cases to query
> > > > > > > > > the specific output.
> > > > > > > > 
> > > > > > > > This changes the behavior of functions that are also used outside of
> > > > > > > > OE-core in a way that won't be easy to notice. I also don't think that
> > > > > > > > it is the right default. For example, for bitbake it is easier to
> > > > > > > > understand where an error occurred when stderr goes to the same stream
> > > > > > > > as stdout.
> > > > > > > 
> > > > > > > how would that make it easier?
> > > > > > 
> > > > > > Because then output will be properly interleaved, as it would be on a
> > > > > > console.
> > > > > > 
> > > > > > Actually, the entire error reporting in runCmd() only prints
> > > > > > result.output, so with stderr going to result.error by default, you
> > > > > > won't get the actual errors reported anymore at all, will you? 
> > > > > > 
> > > > > 
> > > > > process stderr will go into result.error and process stdout into
> > > > > result.output. So when the process is executed ignoring the return
> > > > > status, then test must check result.error. I find the latter cleaner
> > > > > that checking errors into stdout.
> > > > 
> > > > It depends on how the result is used. That you prefer split output for
> > > > some tests does not mean that everyone wants the same in their tests. I
> > > > don't want it in my own usage of runCmd() or bitbake() because I don't
> > > > care about where a message was printed. I just want it in proper order.
> > > > 
> > > > If you change the default, then you will also have to enhance runCmd()'s
> > > > error handling to include results.error. That's currently missing in
> > > > your patch.
> > > 
> > > it is not missing, it is on 2/2
> > 
> > I'm talking about this code:
> > 
> > def runCmd(command, ignore_status=False, timeout=None, assert_error=True,
> >           native_sysroot=None, limit_exc_output=0, **options):
> > ...
> >     if result.status and not ignore_status:
> >         exc_output = result.output
> >         if limit_exc_output > 0:
> >             split = result.output.splitlines()
> >             if len(split) > limit_exc_output:
> >                 exc_output = "\n... (last %d lines of output)\n" % limit_exc_output + \
> >                              '\n'.join(split[-limit_exc_output:])
> >         if assert_error:
> >             raise AssertionError("Command '%s' returned non-zero exit status %d:\n%s" % (command, result.status, exc_output))
> >         else:
> >             raise CommandError(result.status, command, exc_output)
> > 
> 
> 
> 
> 
> > You are not extending that in either 2/2, are you? At the moment, when a
> > command fails, one gets stdout+stderr. With your path, one only gets
> > stdout, which typically won't have the error message that caused the
> > non-zero status.
> 
> that is not true. I tested my patch and all tests are green.

That's not addressing the point that I raised. I am pointing out a
functional deficiency in runCmd that is caused by the first patch.
Probably there are no tests which rely on the AssertionError, so you
won't see test failures due to the changed exception message. But when a
command fails unexpectedly, the error reporting will be incomplete.

The exception is supposed to explain why a command failed. With your
patch, it doesn't achieve that goal anymore because error messages of
the command are not included (only stdout is).

Regarding your argument that "all tests are green": you are changing the
API of oeqa in a way that made it necessary to change tests in OE-core.
Other layers will be affected the same way. You haven't run "all tests"
that use oeqa, so you can't know that they "are green".

Just as an aside, your patch series breaks testing of OE-core (in the
first commit) and fixes that (in the second). That's bad for bisecting.
You would have to combine both changes in one commit to avoid that.

> If you look
> at the code, the  'if len(split) > limit)exc)output' body is not
> changing the result object, so what you get from cmd.run() is what what
> is it returned.

But it's not the same result as before, so you are changing a public API
of OE-core.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




