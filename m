Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id 76B296D73F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 23:00:06 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id w5so3239198vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2013 15:00:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=llG2IbwYLL8dlVAT/2WMwfTKrxWDDywecXma76JKS00=;
	b=SvXQFHhJHbg9IvE1TIFIIk7blw8qJjbQko1/Fd/0fpxjLgP5jQnIkYYNUhY0PibbBK
	Zsp0OwvV7sABr7ExXAJBNg9Q3NsiZ9fANzAkQk4FGI/tSjqD/DZX0yiHNzoUOEGIWEy6
	30HGVh+Rz9MYSBq9YswBFxvniG/OzfjJuxL+0tQJ+8bddh5YQX2ICL9z20H1drs+ANjZ
	ow/F0sKsBw/Os5qjCNsbGLg7dI83hOzfNPfh072aTnRmDL3yc78AEje0syGsM3g04VWZ
	StXuhH8Ngqk55naxtrkn912CIeb2BGKbXbfTIsojoXc9LB9J7kBcevqvZS3DuxUnMQ4H
	JLtQ==
X-Gm-Message-State: ALoCoQn+8ugJF7uNs/rfdbzvy3pK+DeRD+wyYi4i8Q7M6NvazRnYf1UHixPAJgveg7q7NM4l5VUG
X-Received: by 10.221.19.68 with SMTP id qj4mr283865vcb.60.1384556407832; Fri,
	15 Nov 2013 15:00:07 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Fri, 15 Nov 2013 14:59:47 -0800 (PST)
In-Reply-To: <528653E0.4090908@linux.intel.com>
References: <1384498379-30017-1-git-send-email-hongbo.zhong@windriver.com>
	<528653E0.4090908@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Nov 2013 22:59:47 +0000
Message-ID: <CAJTo0LZWLOvgOn0Lr65krAKEpBx1Sa_MCU9C1DWV8FZF79OKVA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [V2 1/2] bluez4: Install the test script
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
X-List-Received-Date: Fri, 15 Nov 2013 23:00:07 -0000
Content-Type: text/plain; charset=UTF-8

On 15 November 2013 17:03, Saul Wold <sgw@linux.intel.com> wrote:
> I think these tests are not the same as ptest, I think these are more like
> testapps, so I am not sure using ptest as a PACKAGECONFIG is correct.

Correct, respecting ptest here is entirely wrong.

> They could be packaged as testtools similar to bluez5 and installed with
> packagegroup-core-tools-testapps,

Yes, that would be very useful.

Ross

