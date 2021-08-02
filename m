Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.20682.1627915017382237164
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 07:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WtSWzPU+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id k38-20020a05600c1ca6b029025af5e0f38bso2814458wms.5
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 07:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Ngdjhw57TrpWSh83IzzaU6/wRyeNwkl+sJKtNqcbgns=;
        b=WtSWzPU+pSuylB87VHgKhL0MSbbqoAF25eMWS7ILgcSGte8d6ks4wX6+GXE8G/07L6
         y2QsTjQtcWqO/rW/bHZiLu7A91ECXiMUcs71YnXHSe0h6/yIFWpSX3Rd7eYy/FSOazx3
         5slzaHShiYMkFhWoi54UXmszN5+13Hv9cffrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Ngdjhw57TrpWSh83IzzaU6/wRyeNwkl+sJKtNqcbgns=;
        b=Td2gCsPqw/a4LcO1AL6zSeS9D7xq+4S09VbF09ry26XbkKioFTJlDdROV0jq3TG5Ba
         WHNvbBCywLV9jo/v7Tuq/dRefklnqdaI2SeWNI+WXMH8QGvu2aloSrHmAGFjtfeUlnsn
         mWQxDxyGnCp8Pcb9QRygAfP/QGNoKgqBcnbjn0XgQo0PLckZGLpAzsuHfn1/0Su86xi+
         sDuCbWqUgOt/FF6jUrHKQcPuFQwi5HwYPBeLzIIk5mt5IkRo61FIAWtc1nuoOjdliMRh
         CkXRIlK2jamHJlck55vYSsLSARLQP0he39Wbqvyls/MXsraD6m+ATe2Z/5pBcJrVFNmA
         Stqw==
X-Gm-Message-State: AOAM530dZGXt7er6t6Kzw8c56XpETS6PfY6NHo2xFH9O3VA3dYNTL7S1
	nq2Xu3i0bf2wUNdQkfFW/4kgcw==
X-Google-Smtp-Source: ABdhPJzdHlFxivYE9k4oUhVlX/NeUhfoD1o0Q9ml2HtVGcWcHQGrd7duE29fdStO+aE7Ba4JFQnBXQ==
X-Received: by 2002:a1c:a510:: with SMTP id o16mr16894528wme.176.1627915015594;
        Mon, 02 Aug 2021 07:36:55 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c? ([2001:8b0:aba:5f3c:9aac:cd42:2ef7:1a7c])
        by smtp.gmail.com with ESMTPSA id n5sm11399943wri.31.2021.08.02.07.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 07:36:55 -0700 (PDT)
Message-ID: <c98abd643937b04a47744a4bdd0270f89eb098b9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: Fix rebuilds when changing layer config
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	openembedded-core@lists.openembedded.org
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Date: Mon, 02 Aug 2021 15:36:54 +0100
In-Reply-To: <62a315a0-5015-bd1f-3133-560ceaf051ce@bootlin.com>
References: <20210801124856.3413781-1-richard.purdie@linuxfoundation.org>
	 <62a315a0-5015-bd1f-3133-560ceaf051ce@bootlin.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2021-08-02 at 15:30 +0200, Michael Opdenacker wrote:
> Hi Richard,
> 
> On 8/1/21 2:48 PM, Richard Purdie wrote:
> > When adding a layer which changed SSTATE_EXCLUDEDEPS_SYSROOT, the state
> > hashes were changing when they should not. This was caused by wider use
> > of setscene_depvalid which means the dependency on the variable was seen
> > when it was previously not.
> > 
> > Exclude the variable since this should be be included in the hashes.
> 
> I realize that this variable isn't documented in any of the manuals.
> Should be document it?
> Thank you in advance for your advice.

Yes, this should be on the list of things to document.

Cheers,

Richard

