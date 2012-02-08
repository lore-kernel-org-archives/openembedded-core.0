Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rux3q-0002vc-2z
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 03:15:06 +0100
Received: by lahc1 with SMTP id c1so71211lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Feb 2012 18:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LPanFbXtEzXBDDCSmH076o1uv0osupT+YCNn2QnNqZg=;
	b=O4KG4dyIytuGbhVCw2MyQlCVF/pAdQkVdLT8lWC4x6R9xEtA+tWZKnpRNvyPKz2+vh
	XbmNa9BmKYLHxpMP6oVcrnxZFrRvCfvQsoT/lsS5SKOmOooCs+FHKFLwDV+/hAfO5eTb
	ddNytauT2Fh1p1t47kVTFsEIqcAFF0oEi+Zx4=
Received: by 10.112.28.169 with SMTP id c9mr7103827lbh.42.1328666823257; Tue,
	07 Feb 2012 18:07:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 7 Feb 2012 18:06:33 -0800 (PST)
In-Reply-To: <4F31BF7B.4040303@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Feb 2012 18:06:33 -0800
Message-ID: <CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Wed, 08 Feb 2012 02:15:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Can you verify if you have a .la file in you sysroot?


No its not there and thats the point we probably should learn to live
with out it
actually one of radical ideas I have is to get rid of all .la files in
OE completely
right now python modules e.g.  have them and thats wrong since they never use it
and there are other packages like that.


