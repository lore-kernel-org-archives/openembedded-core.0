Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 970727704E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 19:13:12 +0000 (UTC)
Received: by igbni9 with SMTP id ni9so20951910igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 12:13:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=SStQChNgzV2d1wVNkXwAscpnVy4nXsgD0go8Ic4fzZQ=;
	b=g9pv5iq1jACt4RitK2Rx3/6HzCFJcbguLc+A2GXzzaFRvVISr/U4gOFMv7bAVanD9j
	okXgDTGYs1kySCpiRcPoFphJHHCuKJvXdXpNedd3ETd9kgGbb8MPIiBqB460iNTzNOdC
	bWN56s4RKjEz+oEi+PFqpoRtaQZLtm3ksuH6gu1/utIetcFfIeMk9Eb4cJ7lEUU1PcPf
	2Wc8A17h2jUUqU/AsEKCULiGZsfZo86pE0TAJIhv8iAX92X4A6SFT5UgMTbZF9Bc3yV6
	rIPev/8z1SNfI7SZQ6a27BhZN9ebHg/Xa7ME8lMdeqdaE8GgQYua1Zbu+e7Kq9emQz3X
	61UQ==
X-Gm-Message-State: ALoCoQkoAezrIxmNDLzWzznbdKpyqY8q6PweGXEr+O+h73MygpmRU/eMwuQ/9MdCqK7mpD4/3PHk
X-Received: by 10.50.44.73 with SMTP id c9mr10112537igm.3.1441393992934;
	Fri, 04 Sep 2015 12:13:12 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8FB6C.dip0.t-ipconnect.de. [93.232.251.108])
	by smtp.gmail.com with ESMTPSA id
	y14sm2010743iod.12.2015.09.04.12.13.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 12:13:12 -0700 (PDT)
Message-ID: <1441393988.9573.65.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Date: Fri, 04 Sep 2015 21:13:08 +0200
In-Reply-To: <55E750B8.70107@linux.intel.com>
References: <cover.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<16f26bbb5fa39e399b185cd26fe9205c2e0cc5d4.1436903712.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<1440746955.3006.73.camel@intel.com> <55E06356.8000607@linux.intel.com>
	<1440785288.3006.93.camel@intel.com> <55E750B8.70107@linux.intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: "Stoppa, Igor" <igor.stoppa@intel.com>, matt.fleming@intel.com,
	leonardo.sandoval.gonzalez@intel.com, ricardo.neri@intel.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 3/3] runqemu: Define OECORE_MACHINE_SYSROOT on setup_sysroot
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
X-List-Received-Date: Fri, 04 Sep 2015 19:13:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-02 at 14:40 -0500, Leonardo Sandoval wrote:
> these set of patches should be merged into master(next). I do not see 
> any heavy objection doing it. As you mentioned, there are some points to 
> improve but I think the latter can be done before 2.1 release.
> 
> Let me know if you have any objections, otherwise the merge is pending.

No objections from me.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




