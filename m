Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id A28767826C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:48:48 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id i7so21134768ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Jun 2017 07:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=9NdLEwTFh4mLHJichnNK1VrPRXGW3HbQKxtQzGcExBk=;
	b=mGq7jm+0vyzWvl72BD+ilYGaQuFbw8KNma1BCnTsBZhZr/M+nln9qdfv61rGSEOEIy
	r+jH2n9eAks3Kj4DhL7C0I5vXMfICdfsWwsv4/Qk/FUlmPZiRUQk1263/YMfqqSH0LJR
	72PrpXZPCS92boIJbmbC1ZJLxlfVRD5J7ZbWbf+THohI6/k0ND1HkvWfI0SpMe73FemQ
	Pkt3OrngFCXdFG3l/evEK2XF5BxHb6C4fwme6/QnjhrdJMMle07cVcQ14N9y+G0Hge/t
	8paOvkjBLrxgdRpkI52usWLQ+wjxEyBfZKO1EjEXcq+Fe/HOUGkdTogcJzxDHrqneZ6y
	7TKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=9NdLEwTFh4mLHJichnNK1VrPRXGW3HbQKxtQzGcExBk=;
	b=b+0gyvS+kts7BBZQn1LjieW+1ikgf4mYEzDEJtLTPqjyWvSYbwuCdWOTiZ+g7bCeaA
	gWsPOpFM9q2SIMPovh1lV2ig+f3hoM76Xf0n6Ve2UXq3XAXUd5CxL65B8kmCwJ9NqIVj
	M4262Uel8h11YYMivY9XOdcIHWa3hqKmtYmJ+SITLVfGU/6ipH0SfJNn5VfXqWvfcfTB
	8/3jfKZWE8U6YciUFCqY3BVzysvtnP5jR8Rn34o5zeoF4bSU2sgWWB30r0rbpTXpao0P
	ku0qfMTaP+YxOliwUStuIxNLSUw3GbM7IuAbJBLWT6Yqbz4kh/qB6BiYVk4UTp8MxTR5
	FIBQ==
X-Gm-Message-State: AODbwcCGqnUMUq31ws/vldTf2MTGhwp9jo6wIbejiJftR6l6JgahTKxb
	7snU9jyc5sK1BFkh
X-Received: by 10.107.169.220 with SMTP id f89mr25326055ioj.97.1496933329456; 
	Thu, 08 Jun 2017 07:48:49 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CE54.dip0.t-ipconnect.de. [93.232.206.84])
	by smtp.gmail.com with ESMTPSA id
	h76sm2455902ith.24.2017.06.08.07.48.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Jun 2017 07:48:48 -0700 (PDT)
Message-ID: <1496933325.30163.142.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Thu, 08 Jun 2017 16:48:45 +0200
In-Reply-To: <1496932400.6630.250.camel@linuxfoundation.org>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
	<1496932400.6630.250.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Thu, 08 Jun 2017 14:48:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-06-08 at 15:33 +0100, Richard Purdie wrote:
> Patrick for example mentioned IMAGE_FEATURES. This one is fraught with
> problems since:
> 
> a) Its a recipe level setting so using it in a base configuration
> context would end badly

We cannot even rely on DISTRO_FEATURES in the middle of the base
configuration construction; basically conditional includes in the base
configuration are not reliable at all.

> b) Users change this in a variety of places some of which would be
> bitten by the immediate expansion problem even just in recipe context

I agree. The same had already occurred to me, with a slightly different
failure mode:

c) base image recipe does the conditional include based on
   IMAGE_FEATURES, bbappend is used to change IMAGE_FEATURES => include
   done based on something other than the final IMAGE_FEATURES

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




