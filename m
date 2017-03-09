Return-Path: <matt@madison.systems>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE7571D79
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 13:19:14 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id a6so28097922lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 05:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=R8JmnDpbtfSbBFUzQfmJqPopZTKzVrX+DCxXCxDG2Pg=;
	b=ml0ljSBuT8K4b4lCkyK7wLJHei94iL3u8IIw5As7NWw+81zhuu/g+L4Dl/cU2cqJGB
	nTjQ5Sru6JOwL2ibndlm4t2/h3LzQmztvM2FoE6sL7KFdLt/0agrP47wMdbCXJu7Ykg0
	Q1U8Vs6shb1BWJNrNEwBVBE0ndi1uTpUBORII+VKm4u42gKTMDfQ3QFijRJhDFbbEZjw
	lvy2DDU7Bbkpe/SbW8MGfW6Pt0Sv2qRBZ8nrWcQeKdZRENlu99+9HaU479S+sNIuhRN3
	kwICfRLIqDMX3iWuH+yLSpoYAVyu13ZOP+O5Ka+Fb0fdl1f8XAiwBug2LsavfTxpeLj/
	IMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=R8JmnDpbtfSbBFUzQfmJqPopZTKzVrX+DCxXCxDG2Pg=;
	b=JFyfREXeoJda7Cj+rLPV9i8EdxDMNWkm5GY85okyH2DzCplaFPuV7dXFm7fDFDjIwS
	negGqNRg+k/n8TVJGdri6EUFsWmyYyjYcibQqKbnqj2so/Pcl1MHB3r+Hi/P/6b1Q3dC
	F/fvTV0yx0vjN8rU5GvJwq7XNLbbYqOrLE3iGAA0TEm7urw5gg2hWYShnllbsEuOIDes
	czCD4SN4Sgf9lu73VIrm0vcr2S534Wd9iYzjj9uBelyaw/DLqNv7y+gotGM/9P0sC9nK
	7Izc8ZivqG+SJrjwgl2zLMTTExEnTHog216guQhXzX4DEtT3EC/wIGC9W7U4LwObCo8+
	bg9w==
X-Gm-Message-State: AMke39n4YTcgQbVcfjx3FXxw8xFCdW2kBgv3IcyPYHoc6O0vakeI7HGJI2j1aHSXIhHMuN8qGPqwuRmvDXgwPQ==
X-Received: by 10.46.8.65 with SMTP id g1mr4139389ljd.128.1489065555684; Thu,
	09 Mar 2017 05:19:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.80.71 with HTTP; Thu, 9 Mar 2017 05:19:15 -0800 (PST)
In-Reply-To: <a1284fc5-f4e3-75a9-6832-893fedef7b30@mender.io>
References: <20170303231811.27812-1-raj.khem@gmail.com>
	<CAGgRHJrrmcvv6CkO+fH++85YD+SxzrsrPeVCdP+MgsgP_iP23w@mail.gmail.com>
	<20170308221933.GA8506@haswell>
	<a1284fc5-f4e3-75a9-6832-893fedef7b30@mender.io>
From: Matt Madison <matt@madison.systems>
Date: Thu, 9 Mar 2017 05:19:15 -0800
Message-ID: <CAGgRHJpsOdcuPMCWnugXLOPNb=GexviSddFncwFwoi3Q0hp-gQ@mail.gmail.com>
To: Kristian Amlie <kristian.amlie@mender.io>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7] go: Add recipes for golang compilers and tools
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
X-List-Received-Date: Thu, 09 Mar 2017 13:19:15 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 8, 2017 at 11:03 PM, Kristian Amlie
<kristian.amlie@mender.io> wrote:
> On 08/03/17 23:19, Khem Raj wrote:
>>> ...
>>> For the following go-1.4 recipes:
>>>
>>> I wouldn't recommend fixing go-native at version 1.4, which is now
>>> postiviely ancient.
>>> Instead, add go1.4.3's SRC_URI into the go-native recipe, loading it
>>> in the right place so
>>> that make.bash finds it.  This way, you can have all the go toolchain
>>> recipes build at the
>>> same version.  The go team only supports go1.4 for bootstrapping the
>>> compiler build now
>>> anyway, IIRC.
>>
>> since we do not use go-native for anything other than bootstrapping
>> right now, thats why it is there. there is no intent of providing a
>> go-native version for general consumption
>
> Just FYI, in Mender we use the latest go-native, provided by
> github.com/mem/oe-meta-go, to compile some build tools. The layer has a
> separate go-bootstrap recipe, which is locked to 1.4, for the purpose of
> creating go-native and go-cross.

Yep, that's another way to handle it.  I just found go's built-in
bootstrap mechanism a bit cleaner.

-Matt

>
> --
> Kristian

