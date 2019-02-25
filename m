Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f177.google.com (mail-it1-f177.google.com
	[209.85.166.177])
	by mail.openembedded.org (Postfix) with ESMTP id A16557C8DD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 18:54:12 +0000 (UTC)
Received: by mail-it1-f177.google.com with SMTP id f186so493223ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4pIFSzZ+1SrE1W6fsKH0oZBfhiuBLzwDTBTbZJFBYZY=;
	b=Wl37Bcaj72Vb3bzQZOy1ucVYJs7HVMKBQv07MaRoQiCmULTRAheoZEyMhnP36I/7es
	w+28V4byxxnwtJkhcwZXAlrv1iiMG2PTJrRZrHXxFEcdFYLX/R7IhhoRvUQUMF79rIDG
	u0uY6uktugHLHhUc8TGXGoR2rekRoPWMweRzrrU/hReO7KtJ3CpubOeABAjOpH9nom0/
	syjXpPHqEVUoVKSGkWwREDETR3ROSv+/Bex0s/YRK3vxKsi+fw/14vcla8HBfLCzPpld
	lrCuZfjQFy+la53dA5QpL4KkUmcG1SbTUffDJJzbLkJmZV0UVgW/yl+BVmomzlzVRG24
	zwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4pIFSzZ+1SrE1W6fsKH0oZBfhiuBLzwDTBTbZJFBYZY=;
	b=B5VOjo696gwOFOAqePgV//SfrvFSL2FaidFMXaeTAWZrIiF2xuhG1P+H8ip+VdqALw
	vvS3JXYNE1gLUehfyyrfWpKeffj86hN9DII/EDFXbsxpYEVJJabPjvJqnA/Nxaw/YO15
	F0Xw74QGojVumEYrtlEotL2C00e3RuthdaLFN8OgTXRp0ESyQ67uDZTikhB3oqiSJhIn
	b99k30JuVGwyVX0/krqRqxdcUgHjUv4ZG01i69zT+uyIAbhdOgOlS3DPQg9Hxhwhp44k
	2CxNQrd6GEJmtbfmxSakFxUThEXr36YkMd0WMrZ6OPwJeMgUbHri8ANEoAhTaftavSCE
	dwGA==
X-Gm-Message-State: AHQUAuaavjjc7g+X9SRFdvAc8ER/V+hOjrvJfclQ783dctLLEMwqK15j
	WcdysaSU56XYQcIDh7O4gcYoSoegjDelGEk9ZMxfNg==
X-Google-Smtp-Source: AHgI3IazLoxdypwT/ae3AaTzMQaD4XAxHBwpPxZ9YLNmNgNfOD61/9IDiQWGt1+SdnhtEPmvy+6atc3DwI8olG2LJAQ=
X-Received: by 2002:a24:7294:: with SMTP id x142mr195978itc.26.1551120853654; 
	Mon, 25 Feb 2019 10:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
In-Reply-To: <20190222142333.9780-1-fabio.berton@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Feb 2019 18:54:02 +0000
Message-ID: <CAJTo0LbhhwpyLh9wP+JswymO+T9CRJ64w8hw6g8HsxUSLg9jOw@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: Jussi Kukkonen <jussi.kukkonen@intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC][PATCH v4] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Mon, 25 Feb 2019 18:54:12 -0000
Content-Type: text/plain; charset="UTF-8"

packages/corei7-64-poky-linux/mesa/libgles1-mesa: FILELIST: removed
"/usr/lib/libGLESv1_CM.so.1.1.0", added
"/usr/lib/libGLESv1_CM.so.1.0.0"

Is that intentional?  Looks like a version mistake in the meson.build.

Ross

