Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SyVRL-0003jk-Nn
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 00:06:19 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 06 Aug 2012 14:54:33 -0700
Received: by pbcxa7 with SMTP id xa7so1413785pbc.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 14:54:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=zhnkqjVMk2nOnS6ATlqO1rznHapFvmca5FEp3Ngh69c=;
	b=XixPuh+ftf4169w/oYsgB0YQacYD+zpV7Kgp0ORUQtpsTE0e6scOHiK47ARYm/EFrk
	PRI59g17nmAPk3hR2NzYLUMEb4YUsfRs6de8w65suxQksQTCS1AquNdEyFkF5ScNIIzp
	p1qkrvxouAv0UJCl8QRT1eneHHjednqy0nQWECOAzxvvF5tEbiLPj+bQ0WkYOKZxsyK7
	fBgoNZ03DCbFwM8J9yuUGVLsXHex7c/bdPba6ExiUOkZUkple5iP7sv4CZay2Bq/aOeb
	w6h/4cd8gtTnW4GH4inFp+ERIvgcKLHN1ubT6M1oxH4OtThalEA3ncmJdZpIY8MmVXZ/
	Kspg==
Received: by 10.68.218.101 with SMTP id pf5mr22121545pbc.60.1344290072384;
	Mon, 06 Aug 2012 14:54:32 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id wn1sm2366727pbc.57.2012.08.06.14.54.31
	(version=SSLv3 cipher=OTHER); Mon, 06 Aug 2012 14:54:31 -0700 (PDT)
Message-ID: <50203D20.4040907@intel.com>
Date: Mon, 06 Aug 2012 14:54:40 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <8F29D6B095ED194EA1980491A5E029710C28379D@DFLE30.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C28379D@DFLE30.ent.ti.com>
X-Gm-Message-State: ALoCoQnsTTNsGg5hV9iSazUPIdo4AtDkLDRhlsEVF/llnazzw1cRueUYaTu9dgKe3KXbfcGuQJqL
Cc: "Purdie, Richard" <richard.purdie@intel.com>
Subject: Re: [denzil branch] Update to the latest version of psplash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2012 22:06:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 08/06/2012 02:43 PM, Cooper Jr., Franklin wrote:
> In the latest version of psplash
> (http://git.yoctoproject.org/cgit/cgit.cgi/psplash/)  there are two
> patches that are not in the version of psplash used in the oe-core
> denzil branch. The first patch called Make it easier to customise
> colours
> <http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=84764337a584002a92940323d374b0e417c573a6>moves
> some color definitions from being hardcoded into psplash.c and puts it
> in a new header file called psplash-colors.h.  The second patch Fix for
> psplash segmentation fault
> <http://git.yoctoproject.org/cgit/cgit.cgi/psplash/commit/?id=de9979aefbc56af59b4d236a4b63dd19dcdcfb53>fixes
> a segment fault issue.
>
> What I would like to do is update the psplash_git.bb recipe to use the
> latest version of psplash that pulls in these two tweaks. The second
> patch has zero impact on existing users of the pslash recipe. If a
> particular layer tweaks the color definitions in psplash by patching the
> psplash.c file then the second patch mentioned above could result in a
> minor tweak having to be made to those layers to address the changes. In
> oe-classic noticed that there is a patch for psplash
> (http://cgit.openembedded.org/openembedded/tree/recipes/psplash/psplash-ti/0001-configurability-for-rev-422.patch)
> that patches psplash in almost the same exact way as the “Make it easier
> to customize colours” patch.
>
> Are there any objections in bumping the version of psplash to
> incorporate the above mentioned patches? I haven’t seen any layer adjust
> the psplash color definitions so I doubt there truly being any impact at
> all.**

Franklin and I discussed this on IRC and I suggested he bring this up on 
the mailing list.

I'm inclined to take and backport the segfault patch into the current 
version of psplash in denzil (which is a git recipe fixed at e05374a). 
Bumping the SRCREV of the recipe and including the color definitions 
patch I'm not so sure about - vocal support from the community could tip 
the scales, though, so speak up if this would be of value to you.

The segfault patch is being tracked with bug #2903:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2903

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


