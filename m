Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 3946F78242
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 15:14:31 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id c201so24843642ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=aR/kQDvdzX6z4sguDzRTkmI6+HA+lnYso9jFJvVz2ag=;
	b=eMsPguWbYWbdoJh6NdjjjbIHCNPMsqe1Jnu8aU4VPrmEJVkuIth5CWzwRUcSVsk5aF
	QkdoXqB2VWFb6cHD5qAuhfF288qY4OaCXjKLQ92tta4spkj0qMv7pFw4E2XJmGD9q2+P
	1Nltw0jjTGaFaRGE1MccBcDDgX2JTdb3ScOrBHi/6ye1yvv7vwhS0zBGnB+KUjYkdqON
	YHKWvBXC6Ow/Gr7nhfGlf5syRqwkBXjcviqIirVYXVHEcPZD/Nm9tw4cIQtJdKWpAol8
	mSf9Na4VXmjnIB2En6GWvKBVzafT1M1OtCY3j8Jae9GG/9mtJ6xQ2oqjFQ8BbG0EbCHn
	5ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=aR/kQDvdzX6z4sguDzRTkmI6+HA+lnYso9jFJvVz2ag=;
	b=jnP6lRojIVoKASPaW1r2ei+hSzHH2feqDRu2d1o8NDaAlO4dpibg79RRb+sKjFoMX5
	iUFFSnOYmGJBcx2G3z6MFNNwXbagE7deDaf3v4xTnCLsatoFUPbjsNMa/nZoxVxi6nlk
	Pw0varDt6gh6e9k8v1/0xxVu9zLFwhqaiP/Cvbs6EYvI+OJcY4HQmGxh5yPJL1hRasvM
	SYGrukoVYyBeBvG9OBnnBVLp5OvOrKuORk2kKh7rRavqkh46wANE/ts4Mt1hX/tPiZZV
	QtLELl6kQtd+1wNmmaqTyFMHrehXJTXKqqHSBPM7Nc23U6TcGZPAWfcn5ZHRowbkBYxg
	gYGw==
X-Gm-Message-State: AKS2vOyDe9ow2pYMrfllqWyfR8wglbJVtAEpujL2I7bA348hkm8X/P88
	RnJoDNLD39fXEG8S
X-Received: by 10.107.154.5 with SMTP id c5mr3054800ioe.109.1498144473113;
	Thu, 22 Jun 2017 08:14:33 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EF96.dip0.t-ipconnect.de. [93.232.239.150])
	by smtp.gmail.com with ESMTPSA id o14sm1122881itb.8.2017.06.22.08.14.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Jun 2017 08:14:31 -0700 (PDT)
Message-ID: <1498144469.22706.10.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Thu, 22 Jun 2017 17:14:29 +0200
In-Reply-To: <1498143522.31575.41.camel@linux.intel.com>
References: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<1498141053.22706.4.camel@intel.com>
	<1498143522.31575.41.camel@linux.intel.com>
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
X-List-Received-Date: Thu, 22 Jun 2017 15:14:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-22 at 09:58 -0500, Leonardo Sandoval wrote:
> On Thu, 2017-06-22 at 16:17 +0200, Patrick Ohly wrote:
> > On Mon, 2017-06-19 at 07:39 -0700,
> > leonardo.sandoval.gonzalez@linux.intel.com wrote:
> > > From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
> > > 
> > > Do not mix the stderr into stdout, allowing test cases to query
> > > the specific output.
> > 
> > This changes the behavior of functions that are also used outside of
> > OE-core in a way that won't be easy to notice. I also don't think that
> > it is the right default. For example, for bitbake it is easier to
> > understand where an error occurred when stderr goes to the same stream
> > as stdout.
> 
> how would that make it easier?

Because then output will be properly interleaved, as it would be on a
console.

Actually, the entire error reporting in runCmd() only prints
result.output, so with stderr going to result.error by default, you
won't get the actual errors reported anymore at all, will you? 

> > Can't you keep the current semantic and just override it explicitly in
> > those tests that need separate stdout/stderr?
> > 
> 
> My proposed patch was mainly based on a RP's comment [1], suggesting to
> split std[out|err].

He did not suggest to change the default behavior. I agree that using
split stdout/stderr in those specific tests which specifically want to
check for error messages makes sense, but only in those tests.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




