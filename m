Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.371.1585079851634714809
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2020 12:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Za41ZYRg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f68.google.com with SMTP id w25so517516wmi.0
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2020 12:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=MFt7jAG6+r2BaVrbplVKPqfbRlxkrah8UUoVCjQzCCU=;
        b=Za41ZYRgKNnYTkhvAhFLPa3CeNqITCzeo9RZ0UjgeyLsPN6We5bylDxnZHVVjWFDTH
         q7hlzKWQGVcU1jFdEZnlese2dxSZUF2/7BzsdLY1YjUcdZ1cyMcj6Dx8GUOK60aypmiD
         fhKH9uYiCqRKbmlSyezwpmbihs4anX+eFCFNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MFt7jAG6+r2BaVrbplVKPqfbRlxkrah8UUoVCjQzCCU=;
        b=RwbSoL/VVUD2vo3ACprWiQxzWvPN1rVUUqkHbMJ2tpN4y1FFRTG8WFy5AMgF8d+o56
         aOT1dZ1qYCCiv3bmZIz8wbgTq1Gq0+XmkIh6dBIgPv+i0c7My5mM9CUXzGdv+rp+IX8z
         q3BV9ceNwEDkoyk+cckTjXp1HThxjEDS+miTOrhmIqE/uHpLi+UVsffT3vCHYXrKF3C2
         R1h0C+vWUeCg994Sr4LjX+EgUUieWxjEVJuRte3yVS7Z8QXoJA93JpZjLwbaVkT2D10d
         mEBOgIGFpPa+zsBp2IqRL0zehqKmnuq3KkY6EYDlLGv8ansmnxk0AZxroM9T6uKJa0tW
         u6/g==
X-Gm-Message-State: ANhLgQ0du43PdC0pH9Im8mgOXHtDQhJX0AC4UbL2D7GRDqqfykK7RFq+
	sd+dM9NqHI6Kwk2KVu/dSF5riw==
X-Google-Smtp-Source: ADFU+vulpjBVcy9RyE7B+d0YdvFuFjMSKhgcHozoUhJk0G6Dl7GCRPpswW2OSnMJ3nLpFF1sliGToQ==
X-Received: by 2002:a7b:cd88:: with SMTP id y8mr7197960wmj.129.1585079850104;
        Tue, 24 Mar 2020 12:57:30 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a16sm5309069wmm.20.2020.03.24.12.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2020 12:57:29 -0700 (PDT)
Message-ID: <fe9b411737f87754311de2c607656b8ac74aee86.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] gstreamer1.0-plugins-good: add qt5 PACKAGECONFIG
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Anuj Mittal <anuj.mittal@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 24 Mar 2020 19:57:27 +0000
In-Reply-To: <20200324193222.GA1578@denix.org>
References: <1582252918-89191-1-git-send-email-anuj.mittal@intel.com>
	 <1582252918-89191-2-git-send-email-anuj.mittal@intel.com>
	 <20200324175821.GW1578@denix.org>
	 <19b30b569a31c0068d5c3b46e1f83178942ecc8e.camel@linuxfoundation.org>
	 <20200324181234.GX1578@denix.org>
	 <355e8218d0ac4611df2ad2ed0c199149c1dd1465.camel@linuxfoundation.org>
	 <15FF5122E920BDAA.24006@lists.openembedded.org>
	 <20200324184323.GZ1578@denix.org>
	 <467110132be087c26851033a7b9e45972b5c0bd4.camel@linuxfoundation.org>
	 <20200324193222.GA1578@denix.org>
User-Agent: Evolution 3.35.92-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-03-24 at 15:32 -0400, Denys Dmytriyenko wrote:
> On Tue, Mar 24, 2020 at 07:29:42PM +0000, Richard Purdie wrote:
> > On Tue, 2020-03-24 at 14:43 -0400, Denys Dmytriyenko wrote:
> > > On Tue, Mar 24, 2020 at 02:33:19PM -0400, Denys Dmytriyenko
> > > wrote:
> > > > Richard,
> > > > 
> > > > Yes, yes, I understanf all that from a technical perspective
> > > > and
> > > > agree with 
> > > > it, but I was thinking about a more clear definition of this
> > > > policy
> > > > to be able 
> > > > to point anyone having such questions in the future...
> > > 
> > > BTW, I don't remember discussing this at YP TSC... Maybe OE TSC
> > > covered this in the past?
> > 
> > Metadata architecture decision would be the OE TSC and "TSC
> > discussion
> > long ago" means something from several years ago.
> 
> Thought so - were there any meeting minutes from back then? Sorry for
> being so 
> persistent, just trying to find some paper trail... :)

Yes, there is a record. You can find it quite easily. I don't need to
do this for you...

Cheers,

Richard

