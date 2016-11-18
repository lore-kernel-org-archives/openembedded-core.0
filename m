Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id CC87771AB6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 07:44:47 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id y23so18352034itc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Nov 2016 23:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=ixcKl4v2amCpJbX8HRaah3rxvx47PgwyV6DouITo0yA=;
	b=BcUV+bq/jCOemHUHyyilbeJZ8/HLGrWd9j14QmTI9Ci2+zfjGUiMHQd4ih3rOVvS+H
	bA8uyfhG47F7+4935Tml8XTLjl0ZtYAeo5dkUezxJgofCZc/8JPeDwczUMDn6Ysb8WlQ
	TYR/A12LTyGr/zgeaDpzrcSpxA2uEQqSdx1cAy0as+cOOJznbqQC8OVXbX6qMr78f1CS
	7/6z+/F7fKgPvHypBCdrKz4i629Wri7mNDv0cUZTtSuGtHK54HZv/3j3TJf90B5Lmwo3
	GaZpWnDMHp3I3A2phZG/b3STG535iL/PtsgbZP+Cn+0O+WECygLAd7ePfLjBVcUUj7UC
	T5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=ixcKl4v2amCpJbX8HRaah3rxvx47PgwyV6DouITo0yA=;
	b=Uan79+Ies78i1CH4am50j018DknOSJaIWVGcRXujDFc1PIZqJuk/KWhvoG6IwIC26I
	GD7H9YH/AYe7BhE7KSskXO6yTliMeN9/dccCVhEmXNR/o30EAEhhmYYO7kUSzVhG60hg
	sa1buklYvUftsQ9gNtpuMuSc38vlGufjn1EUwej2Lg+G+lrcMuviQmhNGEXAJO4HRdJq
	dAVDm/Y+1JduITxVJpCqrE87118GH87WJYnk/MuvRSYsntHlNo+RfQ0uB4BbJhgaU0XA
	f3YkjJl5iYfYT44nDQPtJ+zKqxqV111/ygbQRi+j5mseNBfY1xjLgUDabUs/q1gnIq2Q
	mjZA==
X-Gm-Message-State: ABUngvdsxiitO/gtd2W5tdEPTk5KaN4426T3nS+mH7Rx9GVCtqnHGfLM/o/imfoxgmOUlq1T
X-Received: by 10.36.185.83 with SMTP id k19mr6948373iti.59.1479455088961;
	Thu, 17 Nov 2016 23:44:48 -0800 (PST)
Received: from pohly-mobl1 (p5DE8EE38.dip0.t-ipconnect.de. [93.232.238.56])
	by smtp.gmail.com with ESMTPSA id
	j189sm2682777ioe.14.2016.11.17.23.44.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Nov 2016 23:44:48 -0800 (PST)
Message-ID: <1479455085.27625.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 18 Nov 2016 08:44:45 +0100
In-Reply-To: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
References: <CAJ86T=U8RB13J_we2bte22bFQKwnahCe3v5L6na9SDPKm6O8bA@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Modifying SRC_URI from anonymous python
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
X-List-Received-Date: Fri, 18 Nov 2016 07:44:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-11-17 at 13:28 -0800, Andre McCurdy wrote:
> I have a supplier who provides recipes which set SRC_URI to their
> private git servers. To make those same recipes usable by others (ie
> me), some anonymous python is used to transform the default SRC_URI
> (elements which contain private git URLs are replaced, patches and
> other files are left as-is).
> 
> This apparently worked in OE 2.0 but from 2.1 onwards the anonymous
> python which modifies SRC_URI races with the anonymous python in
> base.bbclass which parses SRC_URI to determine additional
> do_fetch/do_unpack dependencies and whether or not to call
> fetch2.get_srcrev().

I have a patch which I intend to submit to bitbake which adds priorities
for anonymous python methods:
https://github.com/pohly/poky/commit/9d959e50e5f27d149654f5db0aff2fe51365ad68

With that in place, the anonymous python method which transforms the
SRC_URI could request to run sooner than the base.bbclass anonymous
python.

However, I am not sure whether that should be backported to 2.1 and 2.2.

>  Specifically I get failures because
> fetch2.get_srcrev() sees the original SRC_URI and tries to resolve
> AUTOREV from a repo to which I don't have access.
> 
> The proposed solution from the supplier is this patch to base.bbclass:
> 
> @@ -598,7 +598,7 @@ python () {
>              d.appendVarFlag('do_unpack', 'depends', '
> file-native:do_populate_sysroot')
> 
>      if needsrcrev:
> -        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}")
> +        d.setVar("SRCPV", "${@bb.fetch2.get_srcrev(d)}", parsing=True)
> 
>      set_packagetriplet(d)
> 
> After reading the setVar source I'm not very clear how or why this
> works, but it looks dubious. What is parsing=True intended to do?
> 
> Is it documented somewhere that modifying SRC_URI from anonymous
> python isn't allowed? I've now seen two suppliers both independently
> run into the same problem when updating to OE 2.1.

Sorry, I don't know about that.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




