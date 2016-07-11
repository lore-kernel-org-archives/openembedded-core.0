Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id E36AD607A5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 15:10:18 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id m101so25168323ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 08:10:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=Thz/D4oyUeihgFkHZQHAmnRxpsPjImjpUhgO802nr+U=;
	b=YCBgHzX2iJiiS1f0SBRcaBa+Jx9JKLPfFAqnKcBQMj0ZiELExRlaz7glQJCV6oYZB3
	F6MjEmG0eGREGSmznXXOSgHI1lPXhiC5QURahKk+vCAAegE66KBfzVRQrHTBhwe90Vq9
	Gl6gvaD6WHFfS8bFIEyzMjOZZvCd9E5AyUnTI2ZCXmQ+Hs40B9US66V/BhEukRyTpOxk
	uRN+72FAE9Jfnn90453O0qmiHNyA/ap3ynEYVLatmfW2GB7IzmT0nrB/zYOAjazyG1ej
	+bkumHlDdAHpta3dvt4t/0Yz2R8JMHRz8mt6BSopbVS75JW+GKQvR9JJgHDQgKuLXVdT
	7X2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=Thz/D4oyUeihgFkHZQHAmnRxpsPjImjpUhgO802nr+U=;
	b=Oyw7nGP9NbyBaa4TBqyyk9ovD/pZGwyZxjwotyzq+/cjZBVSFxCzhXlouC38iNifpb
	zSSCny9Dl5g9eAgqELZq0PuOScuqfX9g243UCphdKOLRkMhsFBC/j4W5Yjsm37/ynsxt
	Tr0r0K3XZkSL2sBAvJvHUW7QTtOyoxcLeFxo9ZubPncsYAhyCyIn4cfkPSAbUNWeI8EY
	6FuWtzsxQYojUCC5VZ1aaaJTuLp+fLuw8Wx/ljqs/QA5PjQaZ/OZOl0s3mSCUH76cVQj
	0RqWk87MHo8ShOEz3p/uIg7C454r5Lwjz5UWwMaXljB5YMIvkSmi4aX6ulaxVmPUBJ/P
	WHHQ==
X-Gm-Message-State: ALyK8tIf/jhdJS34TPO1jhtxZlxov9F+fKQAaW15zhzgBaBcKAdTDQRTfmnOBXVv53rQjzQD
X-Received: by 10.107.130.170 with SMTP id m42mr8760226ioi.78.1468249819130;
	Mon, 11 Jul 2016 08:10:19 -0700 (PDT)
Received: from pohly-mobl1 (host-091-097-062-046.ewe-ip-backbone.de.
	[91.97.62.46]) by smtp.gmail.com with ESMTPSA id
	j201sm478167ioe.15.2016.07.11.08.10.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jul 2016 08:10:18 -0700 (PDT)
Message-ID: <1468249814.17048.1.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Mon, 11 Jul 2016 17:10:14 +0200
In-Reply-To: <CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
References: <cover.1467378176.git.patrick.ohly@intel.com>
	<25bb70f088ffb603e1f389b7657c1fbf3f2871bb.1467378176.git.patrick.ohly@intel.com>
	<CAP9ODKo=BAgtk8iUbSgcOVh4+uVW-SBuEri6f8MkRH2qXfpVSw@mail.gmail.com>
	<CAP9ODKrNecB=hRAkFb-LL4TcTc9XXw=AmKu-efdjPs3PKDkY1A@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] meta-ostro-fixes: initramfs-framework: add retry loop for slow boot devices (like USB)
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
X-List-Received-Date: Mon, 11 Jul 2016 15:10:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-07-11 at 11:35 -0300, Otavio Salvador wrote:
> Hello Ross,
> 
> On Fri, Jul 1, 2016 at 2:50 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> > Agreed but please split the rootfs in another module; so we don't
> > force it to be included. The e2fs can rdepend on it.
> 
> I noticed this has been merged but my comment here was totally ignored. Why?

I can't speak for Ross, but perhaps he felt that it was already a
worthwhile improvement. I wanted to address your comment (and still do),
but didn't find the time last week. I'll do it via another patch now,
okay?

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




