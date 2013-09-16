Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id DDEEA6BF60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:30:21 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hu8so127033vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=J0ree2Wip+EomV3DN6fursKByPX+CT1rBCdI7IzpPB4=;
	b=VgTIEUnE6cf5VTDUvHM9NcPSCvlwPYmFmIBTPftt24HWfOxTXBk7IxNduX9GHYJGqC
	Zd4r55uulXS/mHoD7gpROmlUsX1YL8OBJyZ2gkM6EQmtI0hFjCwG7UD/aWIRmQdumkdj
	h425ajlzWLH9LRgrTTWlaSDWrudEDjAP460A8JL6wq/5SAymFr9H4C7BFHnfjPuYwAiH
	6TExuzTdTVXO96/h5rFOcwwJr64OOzJtf+L2PGsvMh+PZyExn8b8HATT70kbqJ84pfFd
	dGLT8qpbnub8tb729dbvcutjsjoSPru7Aqxv1uGC6W3Dm6hQYlTowq/awNojDAlPRPyz
	FU0Q==
X-Gm-Message-State: ALoCoQkdyOZ8TtmY6l66pQ/7XY4hd9sTawRsa6svkIpmDAnBGHuLMaWeXOSGa+JVJNfdY6J+4XGu
X-Received: by 10.220.199.5 with SMTP id eq5mr26057923vcb.16.1379323823305;
	Mon, 16 Sep 2013 02:30:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 02:30:03 -0700 (PDT)
In-Reply-To: <CAJTo0LYqh0+TY8hgv4NufumF_uu6c_sVSG5=Eyf2b=FNe+FRhA@mail.gmail.com>
References: <1379319989-9475-1-git-send-email-ross.burton@intel.com>
	<5236C833.30002@windriver.com>
	<CAJTo0LYqh0+TY8hgv4NufumF_uu6c_sVSG5=Eyf2b=FNe+FRhA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Sep 2013 10:30:03 +0100
Message-ID: <CAJTo0LZPbYuFyCK2xRy4QcM=miAKaEQby+7Hxgw3V1WAuhVkAQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] transfig-native: remove, nothing depends on it
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
X-List-Received-Date: Mon, 16 Sep 2013 09:30:22 -0000
Content-Type: text/plain; charset=UTF-8

On 16 September 2013 10:15, Burton, Ross <ross.burton@intel.com> wrote:
> On 16 September 2013 09:58, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Is there a specify reason that we need to remove it ? transfig
>> provides fig2dev which is used for building the documentation,
>> for example, gstreamer and libtheora may use fig2dev.
>
> Considering nothing depends on it, clearly not in stock oe-core.
> Presumably you have some patches to enable the documentation builds
> and add the missing dependencies?

It also appears that GStreamer (at least gstreamer itself, HEAD of
master and 0.10) doesn't actually use fig files for the documentation,
just PNG.

If we're talking about a large number of packages then I'd agree, but
if we're saying that oe-core should have imake and transfig-native so
that if you patch libtheora to build documentation it has diagrams,
then I'm not sure that's a suitable trade-off.

Ross

