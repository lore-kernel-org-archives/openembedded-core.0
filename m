Received: from mail-ia0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1Tsqby-0000Ei-1d
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 09:02:19 +0100
Received: by mail-ia0-f171.google.com with SMTP id q36so646431iaq.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 23:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:cc
	:content-type; bh=DZdD+iF8cWI2O2o4D8YU7oNOOe7w3hgNAG3gBtVNPqA=;
	b=htUNbzoNxowSssaPB+Y2AuWvLAdJ8an4+qWCTbpViz7lyaprHGdU9xHtAoZpCzqjmA
	2MslO5G5dJ1BUTcVHPd61/EPtV8/jf09vdTkv4lIfpYzb8W5tCl/MIEu2T02Y1srEG/T
	8RY69Lf/9zmUHxIMPaQ4m0PXLc2/ArjMDaFaQcsuG6P/hkfAfS21tAL63hv4KxxfebME
	J0zIvyjQj44w70xwgYDaCFemrEC6dxV0sZframFi4yO0k44f9roYTI1y2iibByOjNUjp
	QK9Hw79bvki3w8cdVJLjPHS6cM6Hdr2zmV3fWBoDxS+qKAEtv81F1wQdHnAoitjQvIXR
	PSYw==
MIME-Version: 1.0
Received: by 10.50.42.167 with SMTP id p7mr613446igl.7.1357717617880; Tue, 08
	Jan 2013 23:46:57 -0800 (PST)
Received: by 10.42.167.196 with HTTP; Tue, 8 Jan 2013 23:46:57 -0800 (PST)
In-Reply-To: <CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
References: <cover.1357366840.git.sgw@linux.intel.com>
	<CAF6bG8ed60RO2bBTPFhKQiG+3xis6-H9icmLDWtwHCO9NAyadw@mail.gmail.com>
	<50E8FDBB.5080500@linux.intel.com>
	<CAF6bG8fBgAP_No6RkckjvEQ2XquwKagbyn-Rh01CY7Hi+8MfFw@mail.gmail.com>
Date: Wed, 9 Jan 2013 09:46:57 +0200
Message-ID: <CAF6bG8cuLp7nGzKUZscUrRoa1Z5_mrSduvWQ4r4YbvtZx2rFdg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (V2) 00/35] Updates, Multilib Patches and other fixes
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
X-List-Received-Date: Wed, 09 Jan 2013 08:02:21 -0000
Content-Type: text/plain; charset=UTF-8

On 6 January 2013 22:28, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 6 January 2013 06:29, Saul Wold <sgw@linux.intel.com> wrote:
>>>
>> Even after a number of years, I
>> loose track sometimes of what's stable vs unstable (odd vs .99 vs ??)
>
>  Another challenge for http://packages.yoctoproject.org/ ?

 Actually, does it even know how new major versions will be in new
directory? Asking because I don't know even if it collects the URL to
check from recipes, or is that given in some specfile. At least gtk+3
recipe in meta-openembedded has that directory hardcoded
".../gtk+/3.4/gtk+-${PV}.tar.xz" so when ever updating to new major
version, SRC_URI needs to be touched.
 What I'm envisioning is that maybe bitbake should provide us with new
variable PM or PMV (major version) that's basically PV with last dot
and everything after it removed. That would allow us to easily make
many such SRC_URIs dynamic, e.g., ".../gtk+/${PM}/gtk+-${PV}.tar.xz".
This would be more worthsome if it's something
packages.yoctoproject.org too could benefit from.


 - ML


