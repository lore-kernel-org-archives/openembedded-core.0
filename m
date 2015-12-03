Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 11049605B3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Dec 2015 09:56:31 +0000 (UTC)
Received: by ioc74 with SMTP id 74so75275767ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Dec 2015 01:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:content-type:mime-version:content-transfer-encoding;
	bh=HiUzV/flfHTSGUHokY9qgwOpI8L99Q2/3RfYU1YVhAw=;
	b=TBXSSBdl2rf9Bmdp3xo3oEu9Lvy/fGcSluKqfjFU0xRvDkGdqqMovysskiL/bwd5PH
	3oW8aQXbLpzu8Hhn2yVHMEoyjVcl7OJ5pcsNe/yWUgKPnSv7RvnUgxOizpi09dhtSUjy
	XZxh2gOthY72Saksj4Ev8SdyZFLDqf8ChqSN0o/5GxHJOo8qsKzz/5velXHPwKmQnzeJ
	BBLcDYn7Iajcy/npftsIka4vLGLkJ5b+JwEn19eYcPNTq1YizZcnnSd2W4NZT/EZtwvU
	xPgx9Q+/ieiP7MmeU/Y3/3Yq5By92aIYrc/AGAcqDVm0kHZhSHWX17mwJOLtBiVxG1WD
	RgMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=HiUzV/flfHTSGUHokY9qgwOpI8L99Q2/3RfYU1YVhAw=;
	b=byKQDqY0YMilHSUC6v2aGF7XpT8kiBIIMcuYPVRU/IqjJ21ze5LAKqSsFs1l3KYGV7
	3C2yVyCy1h4u/h+lFmQ0Ir2y0wOUrh5lS5VnznwXu2oogvuvvQeRI5RDGuZHaF2t4pD3
	F0x3cncmuZjESzDHQLHOwmWAGrjk8QRFa2xSMUuE+yXGTZXSs6kJ4u2P8j2wwZS7s8+Y
	x9fqqfWxfx5uGYqKDkNfhm6QnY5muOYRQ8qDKLNb4hGkWDZbagwmfn2XsPlRPaYoOk/q
	1NlWOtdW1vt3YTjtO1Pi7FKd051DLA4IyHDk5FdiaT4G3xeP0hp94jBFjYOgqUnNbgKp
	Comg==
X-Gm-Message-State: ALoCoQni6EJzwhdzMVP9ymLizKY9M0W5tzNw8px1NGezmQm8c7EUlmnoSxbf6P95um3xp+5cKxMH
X-Received: by 10.107.152.142 with SMTP id a136mr9388736ioe.110.1449136592417; 
	Thu, 03 Dec 2015 01:56:32 -0800 (PST)
Received: from pohly-mobl1 (p5DE8C352.dip0.t-ipconnect.de. [93.232.195.82])
	by smtp.gmail.com with ESMTPSA id k6sm2690321igx.20.2015.12.03.01.56.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Dec 2015 01:56:31 -0800 (PST)
Message-ID: <1449136589.10734.77.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 03 Dec 2015 10:56:29 +0100
In-Reply-To: <CAJTo0Laxb5Cs=86vkxeOddf-wViitJt2MfCDoLTqjaZz724w8w@mail.gmail.com>
References: <e36072a82de706f1485c054adf8cb2d38a01e899.1448029554.git.andrew.shadura@collabora.co.uk>
	<1449073639.10734.65.camel@intel.com>
	<CAJTo0LZZZ8O_xnpg2fmqbD77JVWq89aYSUUujAWm7JbN=Q51hw@mail.gmail.com>
	<1449128801.10734.73.camel@intel.com>
	<CAJTo0Laxb5Cs=86vkxeOddf-wViitJt2MfCDoLTqjaZz724w8w@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Thu, 03 Dec 2015 09:56:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-12-03 at 08:39 +0000, Burton, Ross wrote:
> 
> On 3 December 2015 at 07:46, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         In the layer I am trying to be compatible with OE-core master,
>         dizzy,
>         fido and jethro. That means I cannot "require
>         recipes-core/dbus/dbus_1.8.18.bb" because that file only
>         exists on
>         master.
> 
> In which case you're expecting the dbus.inc file to remain
> version-agnostic across three releases.

I agree, that's an unreasonable expectation (although it seemed to have
worked out in practice). Anyway, I already copied the file.

> Could dbus-cynara be replaced with a bbappend that adds a number of
> patches and a PACKAGECONFIG[cynara], which defaults to disabled for
> zero impact, but can be enabled at the distro level?

Unfortunately the current Cynara patches depend on an older version of
the main source code, so that won't work. Not ideal, I know, but a bit
out of my hands at the moment.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




