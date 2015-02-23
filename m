Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5BB2B72D36
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 17:41:33 +0000 (UTC)
Received: by ykt10 with SMTP id 10so118905ykt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 09:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=SzD8mpGEip1Lgg4h0vs/l/hQ0iLOIFB2K3OA2XJTQMQ=;
	b=of65fwH94crthARwxJVKX3SGviEAAK5XLy/RwrgfOKetnfyycjMPqzlV5RTwFFYeZV
	FyLeMVo5EZBMYzv/XZGCTabgK2SNUZKebESnYBcFLxU4oSy6dzcSsZNHndrtImK/2VoZ
	HHpbAo/hS0GM/3VJz4ScFW/Y3xQetXccdYTinrAfJxvQiJMinNyKk6t7F235MP6iCkaX
	zJ/3VyphS7NTyCwpvQDKlqw4q8qCk6YHWNXcSES5BL3ilXzs/2pZKdjCxEBEW7aXtCQz
	WInY62QtaBQFKk3Ap+H8AS1y9QRox7PVJvxEINoWxlwFrPR+OmhQ/W8UeBURkLHNFn8+
	yo4w==
MIME-Version: 1.0
X-Received: by 10.170.133.202 with SMTP id z193mr12268056ykb.30.1424713294715; 
	Mon, 23 Feb 2015 09:41:34 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 23 Feb 2015 09:41:34 -0800 (PST)
In-Reply-To: <dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
References: <cover.1424709353.git.paul.eggleton@linux.intel.com>
	<dbb562e543729b016d4a31ceaf08da3abb24f267.1424709353.git.paul.eggleton@linux.intel.com>
Date: Mon, 23 Feb 2015 14:41:34 -0300
X-Google-Sender-Auth: LUn4-4kGIyJ_MfwHTPrcQKTzh84
Message-ID: <CAP9ODKqa+7EZ_4hw=_-XOgQMyxeiSRRMAcXrGVpKwXLcLLrNPw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 9/9] populate_sdk_ext: add extensible SDK
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
X-List-Received-Date: Mon, 23 Feb 2015 17:41:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 23, 2015 at 2:00 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> From: Randy Witt <randy.e.witt@linux.intel.com>
>
> This bbclass will create an SDK with a copy of bitbake and the metadata
> and sstate for the target specified for the task. The idea is to let
> "system" developers both work on applications and then test adding them
> to an image without having to switch between workspaces or having to
> download separate items.
>
> Rather than running bitbake directly however, the primary way of running
> builds within the extensible SDK is to use the "devtool" command. The
> rest of the build system is fixed via locked shared state signatures,
> and thus only the recipes you have added get built.
>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>

Why another class? it could be tuned using SDKIMAGE_FEATURES

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

