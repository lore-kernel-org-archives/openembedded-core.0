Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id BA918606E8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 08:46:34 +0000 (UTC)
Received: by wesw62 with SMTP id w62so12689791wes.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Feb 2015 00:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=QE9TgpNnUhK5k4x6kUZIMhTk3De47O4GCJ9Z9BwqExE=;
	b=QmnwWBse7CKtf4fYQpOQcTJSgrvCnNdShm1BcmnUnVlbWu5xseOn9rzFDX5nZIBqd7
	KN+hPX8RKjWTE1i4MMZwl0hkVsMHBaqq7+Z/78X41tjPUebg9hptf1hNW1WJPtLjiP/O
	vwZT6HHOSdJv4RLhGgMssa5PmbneVY/8D+X257wG7xHC2kk2hYDxxvD7DPXhOURu654l
	rZGIDoWSwYx4b/hkMfVHrl2iQxTYs9bw4Yem/nW8tzcV2TYZl1Fi531gIbQV+w/gRlTJ
	mKWRenePkF0LHuAp1kbJFKhTlZRSK+VgqbRhoXi7+rpR0q3JfsexRLp2idi14nDfPcXk
	mWJA==
X-Received: by 10.180.105.97 with SMTP id gl1mr10285209wib.74.1424594794540;
	Sun, 22 Feb 2015 00:46:34 -0800 (PST)
Received: from [192.168.50.198] (ip-84-119-96-251.unity-media.net.
	[84.119.96.251]) by mx.google.com with ESMTPSA id
	hm6sm50105635wjb.32.2015.02.22.00.46.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 22 Feb 2015 00:46:33 -0800 (PST)
Message-ID: <54E99779.2030405@gmail.com>
Date: Sun, 22 Feb 2015 09:46:49 +0100
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org, rpjday@crashcourse.ca
References: <alpine.LFD.2.11.1502220327320.12673@localhost>
In-Reply-To: <alpine.LFD.2.11.1502220327320.12673@localhost>
Subject: Re: how to (yuck) add arbitrary external files into an image?
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
X-List-Received-Date: Sun, 22 Feb 2015 08:46:35 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Am 22.02.2015 um 09:33 schrieb Robert P. J. Day:
> 
>   as much as this disturbs me, i was asked about the easiest way to
> add arbitrary files scattered across the development host into the
> final OE-generated image and, based on richard purdie's recent
> clarification that *everything* that is listed in SRC_URI is unloaded
> into WORKDIR, i suspect the easiest thing to do is create a recipe
> where SRC_URI lists all of those files with "file:///", and write an
> explicit install task that manually copies them, one at a time, into
> their final location in D, yes?
> 
>   i don't like this at all, but if it has to be done, is this at least
> the "best" way to do it?

I think the "best" way would be to create one recipe that collects these
files and just installs them into $D. Then you could select this package
in IMAGE_INSTALL as you described above.

Another way is to use a ROOTFS_POSTPROCESS_COMMAND if you only need to
do this for one image.

