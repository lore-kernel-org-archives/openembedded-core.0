Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
 by mx.groups.io with SMTP id smtpd.web12.15820.1592943442928621585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 13:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YEmDs8ab;
 spf=pass (domain: gmail.com, ip: 209.85.210.194, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f194.google.com with SMTP id 136so1019525pfv.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 13:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3D5HBIQMqN3+/wdUmlPpAuQCzybd9QovCEmh2RiPxbA=;
        b=YEmDs8abyOU4UaklwV+AX2qxWHCm0cex+PrsqbCM82wB34buSYCoLsIG15el/lymWg
         hSTc1OLOhaxaZ6TE7ekLh9nWqtCYGqtqWc3dXvwklXmAozWB789/qGVCA2bwx08JkRDq
         /2+iRYkR67BgCkfr5gi4QDjci0QwIZQ8yfXbGcITNvMukPXvIwIIYxDfVYgycPpPS7ce
         gC78kKHL9yZfruq62fdxjoq7UZAZJdHwZIbIyis7a0/hvLK8FKmdFiTT+VWYojwz6Kwi
         Lr4fl/Tpr+bKlITzdcU5JmE9Diry+8nEjuwKP/ubt1c+DgymMO9eOhSc7l11GMG42IUE
         2kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3D5HBIQMqN3+/wdUmlPpAuQCzybd9QovCEmh2RiPxbA=;
        b=lXXdM97cGpI6AgF6KIB7fug2vb+b4YLadcjJ24fMyF7ae8jls7ZJE9Wtbs5OwvyJSc
         AO+PIaJRnqc00EFGayn8P4gS+XYlwtGCcVUQj+1s7HShgACS/Bc02jcnArlLdLTxqb2e
         /1r9E6/dHAltOPoWwBFBdzSToVSF+UgC9I+YTf8BFM/4fM+bj2l04cXrLrOoHYEim84D
         dExto0cK6dTuywL7GK9iJ3oNtzSaTSJSXsaxNn9tGEVPEP09OfGB9CixEKKzBCIfxoDC
         VOkZt4oEvU8X4ltTCPtbxsmQDRGpHx/UnXUUtp+I498oB8NhlmzdZIBuicdH1SVNmSVi
         lJfw==
X-Gm-Message-State: AOAM5306DNIkEm+zrgxjBU7tGNdxfhISAqAj6ka/skrBkCFO2XwgHsMh
	EiROHYLRS/m8r280yVYV0PtzkCndTt0=
X-Google-Smtp-Source: ABdhPJylfPgcGeNw0N831zTIg3A5pjPQ0zfD/rX9e2PFHNbMaSERf9KlFv+zblh/DSIPnwOKKNyCrw==
X-Received: by 2002:a63:5024:: with SMTP id e36mr17919920pgb.438.1592943441881;
        Tue, 23 Jun 2020 13:17:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a? ([2601:646:9200:4e0:3ce8:8e51:3e8d:ab7a])
        by smtp.gmail.com with ESMTPSA id q7sm3260954pfq.139.2020.06.23.13.17.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2020 13:17:21 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] vulkan-headers: Fix upstream branch deletion issue
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <20200623134150.603584-1-richard.purdie@linuxfoundation.org>
 <a9fe68d2-b2d0-4ba8-dca8-78dca19ebb6d@gmail.com>
 <CANNYZj834SO=HUDqHw+0JAY4VApZGUa8gXgEX6S0Po5SUNvqqg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <826b33b3-268d-edfe-080e-8e02f5b344d1@gmail.com>
Date: Tue, 23 Jun 2020 13:17:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj834SO=HUDqHw+0JAY4VApZGUa8gXgEX6S0Po5SUNvqqg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 6/23/20 1:13 PM, Alexander Kanavin wrote:
> Latest released gstreamer will fail to build with the latest vulkan, so 
> we have to defer that.

I see, what errors do we get ?

> 
> Alex
> 
> On Tue, 23 Jun 2020 at 21:46, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>     On 6/23/20 6:41 AM, Richard Purdie wrote:
>      > The upstream branch was deleted but the commit is in master so
>     reference
>      > that instead.
>      >
>      > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
>     <mailto:richard.purdie@linuxfoundation.org>>
>      > ---
>      >   meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
>     <http://vulkan-headers_1.2.135.0.bb> | 3 ++-
>      >   1 file changed, 2 insertions(+), 1 deletion(-)
>      >
>      > diff --git
>     a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
>     <http://vulkan-headers_1.2.135.0.bb>
>     b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
>     <http://vulkan-headers_1.2.135.0.bb>
>      > index 54cee96cce0..d21c3d62b90 100644
>      > --- a/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
>     <http://vulkan-headers_1.2.135.0.bb>
>      > +++ b/meta/recipes-graphics/vulkan/vulkan-headers_1.2.135.0.bb
>     <http://vulkan-headers_1.2.135.0.bb>
>      > @@ -5,7 +5,8 @@ SECTION = "libs"
>      >
>      >   LICENSE = "Apache-2.0"
>      >   LIC_FILES_CHKSUM =
>     "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
>      > -SRC_URI =
>     "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135
>     <http://github.com/KhronosGroup/Vulkan-Headers.git;branch=sdk-1.2.135>"
>      > +# was sdk-1.2.135 branch but it was removed upstream, commit is
>     in master branch though
>      > +SRC_URI =
>     "git://github.com/KhronosGroup/Vulkan-Headers.git;branch=master
>     <http://github.com/KhronosGroup/Vulkan-Headers.git;branch=master>"
>      >
> 
>     perhaps better to update to SHA of latest tag ?
>     https://github.com/KhronosGroup/Vulkan-Headers/releases/tag/v1.2.145
> 
>      >   SRCREV = "fb7f9c9bcd1d1544ea203a1f3d4253d0e90c5a90"
>      >
>      >
>      >
>      >
>      >
>     
> 
