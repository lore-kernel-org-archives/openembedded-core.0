Received: from mail-vc0-f171.google.com ([209.85.220.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UINRj-00028G-Ir
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 19:09:11 +0100
Received: by mail-vc0-f171.google.com with SMTP id ha11so1563024vcb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 10:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=lgHDDdYoO9DSDUDUtzxAug6ig5H+p/BbHxb7jQBJsWo=;
	b=lHjPpje656sSMNckRwL7O7+24Z7uCGq4x7syc1a4xpPIE3pzye69T3XrmTTvATa/+l
	bsY2uy+4Ic0zmGS/AMu6o/R8Caoyzb1An/Eg1QdCrVkbTGkgCzhQp9bgXvTUCouUx18D
	ZzAqdfbHc2Fk6U8klwSYrxZKXNoVLDwmxpS4ZfjixXvCWjSwJmyA4LtJDSmIQ2lFYktk
	mHlLgsLa0kAfXQttXGUs/4toETlGOznFktA53Fz9EQkkYSbimd6T/RbxE8YtVHsY8c5e
	DsDPsvwWU6qrmvuvzhBL68J529MBeS1ydAOVlNJyF2F5n+OzL4rv6KgDkv6iGDbkm20/
	hMuA==
X-Received: by 10.220.153.143 with SMTP id k15mr9344934vcw.13.1363801936086;
	Wed, 20 Mar 2013 10:52:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Wed, 20 Mar 2013 10:51:55 -0700 (PDT)
In-Reply-To: <6D1DEA39-FE6F-4D2D-AE73-0CA6A2881EE3@gmail.com>
References: <cover.1363287636.git.sgw@linux.intel.com>
	<1363313340.14476.13.camel@ted>
	<CAJTo0LaU2iEeg-2z=nwaw3O-kTX_VLpKcZ9TUjGGU4gmAzPKqA@mail.gmail.com>
	<6D1DEA39-FE6F-4D2D-AE73-0CA6A2881EE3@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 Mar 2013 17:51:55 +0000
Message-ID: <CAJTo0LYiTwx0xeeMPpfyXt2=vC6Bz_zdTOBkVWJP8cD0aqbEEA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQkP1d6uePAg5YyGC/Q0F97fjlEF/TzyyIE2ihuMUngxX+qdrqL1v8XZWtXhOrxVeHbsBSvL
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/29] SystemD and other fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 18:09:11 -0000
Content-Type: text/plain; charset=UTF-8

On 20 March 2013 17:48, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Mar 20, 2013, at 10:41 AM, "Burton, Ross" <ross.burton@intel.com> wrote:
>
>> Using ac_prog_cc_for_build.m4 to incorporate CC_FOR_BUILD would be the
>> logical solution
>
> btw, I did considered that :) but thought of not pursuing it

Probably worth bringing it up with the upstream maintainer so we don't
need to continue this hackery, but some maintainers certainly are...
reluctant.

Ross


