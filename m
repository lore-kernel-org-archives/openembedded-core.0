Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id BCB2B71C5F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:36:55 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id d9so24711763itc.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 04:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=EjApngLGXBDE4azegEM7/c/hLHEb2+FSEym+Kg8Ts5Y=;
	b=dkmkItLMWn7PUBtryt1ilzhsUm7QbnS3TMy2giVtWzjg5woQOP9zTeqB0l/BVwaZwR
	XOCReV1tVeIztjtGIVE6k+RXdBqTj9K6SX9B5qwdn1Gc2OrALZkhtU8B8LaNN32lPxa2
	uztTNVAPV8pA9eyvy9s7u7n9gGHqeEKyVPLmxtfqVQJdvwRtOBwYEZmqQTO5ANZiaWjq
	3haq4uYBH6CGOeNYxwcB6pSQcjfK4SWy5oOGCEiQWGNxsWVVSMH4kEd8vQo26WG11cmg
	VdmPYJY4SHk5PPd4YwUtAHNcQnk1i5kEIgIdmOVPmM7uuRXadWzlDwTq5SmaiEIjs/JO
	vcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=EjApngLGXBDE4azegEM7/c/hLHEb2+FSEym+Kg8Ts5Y=;
	b=Xi7HtgXfem3Qka1NdT8NsXak9UXJBxIxItApOW8ek/D5b1/x1gq2Yvya6xQbixrslo
	Qo+lE/0FwyFE6Y2VGIfZK7leDTNXnpBhGDUApBoVFiF+b7P98CcHAQuQvkNdY88hw6sZ
	o9vIVQHM5fFkWvoPGZE2amFnKvqD2s9JK4nD3hnNJVL2vynQ3GzsIeNRJsuy9IJZPhC8
	yQZKPjOXdnbyTxAtcz5Cid/Gx3red8Q2UMkQKcyN+oEK+JMV5/Qaui3m6M538R9gKhnz
	gs47e0DyFq/V4VOFsGejUicWEKBuFvEh0Hw/mzsn8oOBz42+i9KhOE5SMLEBAzkU83EP
	QTkA==
X-Gm-Message-State: AMke39lYNWXlMuVqziAxDishiFUzwr1mv49gl/tty78tGNdUG6UQ7eAZn2VgnmzFxlRad5ov
X-Received: by 10.36.190.199 with SMTP id i190mr344990itf.123.1487594215768;
	Mon, 20 Feb 2017 04:36:55 -0800 (PST)
Received: from pohly-mobl1 (ip-64-134-128-59.public.wayport.net.
	[64.134.128.59]) by smtp.gmail.com with ESMTPSA id
	e139sm8936678iof.54.2017.02.20.04.36.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 04:36:54 -0800 (PST)
Message-ID: <1487594212.4285.27.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 20 Feb 2017 13:36:52 +0100
In-Reply-To: <1487530021.30548.22.camel@linuxfoundation.org>
References: <1487288761-22432-1-git-send-email-sgw@linux.intel.com>
	<1487316357.13854.504.camel@intel.com>
	<1487530021.30548.22.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] native.bbclass: populate native recipe with it's files
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
X-List-Received-Date: Mon, 20 Feb 2017 12:36:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-02-19 at 10:47 -0800, Richard Purdie wrote:
> On Fri, 2017-02-17 at 08:25 +0100, Patrick Ohly wrote:
> > On Thu, 2017-02-16 at 15:46 -0800, Saul Wold wrote:
> > > 
> > > This allows a native package's recipe-sysroot-native to be
> > > populated with
> > > that packages native image files.  This in turns allows it to be
> > > used by
> > > scripts or other tools without creating un-necessary DEPENDS.
> > > 
> > > An example of this is systemtap-native and the crosstap script.
> > The intended usage wasn't clear to me at first. I think it is
> > something
> > like "bitbake foobar-native" and then calling foobar's tools directly
> > from tmp/work/*/foobar-native/*/recipe-sysroot-native (?).
> > 
> > If true, then any recipe intending to be used like that also needs to
> > exclude itself from do_rm_work:
> > RM_WORK_EXCLUDE += "${PN}"
> > 
> > Or perhaps more selectively exclude the RSS:
> > RM_WORK_EXCLUDE_ITEMS += "recipe-sysroot-native" (is there a variable
> > for this name?)
> 
> I've been idly wondering whether just excluding recipe-sysroot* from
> rm_work might be useful since its mostly hardlinked files anyway and
> likely doesn't cause too much of a space issue...

It might still be useful to remove even the hardlinks, to spread out the
IO required to clean up after a build - "rm -rf tmp" can take a long
time. But I haven't measured how much of a difference rm_work makes in
this case.

Regarding Saul's patch: I've used it together with devtool to build and
debug a native tool. After "devtool build foo-native" one cannot
actually run foo because it is not installed in a sysroot. "bitbake
foo-native:do_addto_recipe_sysroot" fixes that. I also enabled debug
information and prevented native sysroot stripping for this particular
use-case. I'll probably file an enhancement request for devtool about
this...

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




