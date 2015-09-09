Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id AB3527404E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 07:05:20 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so7608709igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Sep 2015 00:05:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=tGQ0GN0wxIuDAPL0ycBoR9nwHMnUGvmcVfHBj0K7g9c=;
	b=LdWo86hb3B04fvw4CAn7g/vo0wdgxRRGRAnxMjLk9fZl2Kr8AE79Tw8aVNg3t0Q9uM
	hEiF9KdTo55IiJfGR1drM+Y15Fx4I/MdQIObJf4NZb9CbMvTgyveHG3HnDBv7XeFED9w
	Z5dVhwkWoBtp3NPNkwQp2yrV14q8eD8P0vzaRi+d8kifn8Jh4azJk57+uH2yoHTi7Qw3
	T3SRVcuwURwZqHoPLeNUq0rD9teaTy6HZtmdUa9eL6IZ8MMqlEBGvvIkAEk7j0KfRwAd
	58BnKoN+SJtwdD8jqpDD/4sKjyi5oKiHdnjG1X9Oe0GkAH66kooooP4qepkiFXpadLmI
	ymrw==
X-Gm-Message-State: ALoCoQlyAPJjIHcLktEEdqLy+sCDgFNyYY6UCh6uP1DudqGr+SizGOEkEBHC57yzG2ZFlqkETgzL
X-Received: by 10.50.143.1 with SMTP id sa1mr542727igb.32.1441782320329;
	Wed, 09 Sep 2015 00:05:20 -0700 (PDT)
Received: from pohly-mobl1 (p57A56733.dip0.t-ipconnect.de. [87.165.103.51])
	by smtp.gmail.com with ESMTPSA id
	gb7sm1095705igd.20.2015.09.09.00.05.18
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Sep 2015 00:05:19 -0700 (PDT)
Message-ID: <1441782317.11229.7.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Wed, 09 Sep 2015 09:05:17 +0200
In-Reply-To: <55EF9D64.8000601@windriver.com>
References: <2236FBA76BA1254E88B949DDB74E612B41976CB1@IRSMSX102.ger.corp.intel.com>
	<55EF9D64.8000601@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: How to put a correct dependency with regards to gcc?
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
X-List-Received-Date: Wed, 09 Sep 2015 07:05:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-08 at 22:45 -0400, Randy MacLeod wrote:
> Maybe we have to fix gcc-source after all rather than use the
> EXCLUDE_WORLD change I made in:
>     https://bugzilla.yoctoproject.org/show_bug.cgi?id=7878
> Does your scheme work for the kernel source? See:
> 
> Search for "kernel-devsrc" here:
>   http://comments.gmane.org/gmane.comp.handhelds.openembedded.core/68352

Also possibly related: 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=7959

"archiver.bbclass: fails for linux--yocto when archiving patched source"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




