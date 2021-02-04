Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.2107.1612470860898058044
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Feb 2021 12:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AvyvIvX1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id t142so2088806wmt.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Feb 2021 12:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=2ZhnFoBMgnclxpXRXYW7G8FlTf53aMZMh/TpVRlOqcE=;
        b=AvyvIvX1lupQKREJ0hqZSHa8TeL9dvj7lJObhO8UpE7ZJOlNqhUIUhKBz5m092gxNf
         27YURWyL6H7qeX/gW/Fi/YXcuR5aTJ1wkP/1ngo8c1VTlfEnVKnF4pqZJT6ICJDD1nXH
         DlDZ16jjQIKqEoP7cZOMRnxMziGZ3vHVJRees=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=2ZhnFoBMgnclxpXRXYW7G8FlTf53aMZMh/TpVRlOqcE=;
        b=UM7Nb2YVXOKeqRcwIyuawo+Xg/cGVzGbuWI5V5cfwHQzbnU+IDcu/fFI5odgzCXrZL
         LXqNir9OEilQxbDZX+MNtW/SOr8m1QxpR00ftWTzfUMzNcM2o/4P5Sn0HzpwF50cbSND
         w+OSwh4jdgGFBK2wWUgIuvV03HAFgiNqQNFzE3AZXv84Nod+wlEe8HCGsIQcACEhy9+3
         plHIEy7nB+Y+vsHXELquNij4sIHvhISNdKVnBAc9LqCLi61YaJcZv1mbvwEiZRjjkjZf
         R5sLrpClRy3Crh/RZDk5zg1le9u4nOCp3b3Z9bXrkcNeqCXC4s4iUKtR1MnjlHf/OaWw
         d3LA==
X-Gm-Message-State: AOAM531HRPPpLFwq/u6+5TVXu2nlGzRYVt5Nm/etBsHzndA+ZvtKoC3/
	7nbt1Pq2mI4osrEVkpwu3ytJuA==
X-Google-Smtp-Source: ABdhPJwZWx9MYdK1IfCQ81qRLkfdhAXyJygDYnNRLW1DYC3B6veFN1FyaUjBE7oSVbhiELuZ7jC+xQ==
X-Received: by 2002:a1c:7fca:: with SMTP id a193mr767729wmd.189.1612470859321;
        Thu, 04 Feb 2021 12:34:19 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:d1b2:8778:591e:ef47? ([2001:8b0:aba:5f3c:d1b2:8778:591e:ef47])
        by smtp.gmail.com with ESMTPSA id l11sm9059821wrt.23.2021.02.04.12.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:34:18 -0800 (PST)
Message-ID: <ca17a635c2003515d48cb229a351e69d2d85525c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 6/7] native: Stop clearing PACKAGES
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 04 Feb 2021 20:34:17 +0000
In-Reply-To: <19078ab047664bb995906baf0a36a54c@XBOX03.axis.com>
References: <20210127172753.1286275-1-richard.purdie@linuxfoundation.org>
	 <20210127172753.1286275-6-richard.purdie@linuxfoundation.org>
	 <19078ab047664bb995906baf0a36a54c@XBOX03.axis.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-02-04 at 19:43 +0000, Peter Kjellerstedt wrote:
> 
> 
> > diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> > b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> > index 16708fd581d..226e1c7b89f 100644
> > --- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> > +++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.40.0.bb
> > @@ -13,6 +13,7 @@ LIC_FILES_CHKSUM = "
> > file://COPYING;md5=4fbd65380cdd255951079008b364516c \
> >  SECTION = "libs"
> > 
> >  DEPENDS = "glib-2.0 gdk-pixbuf-native shared-mime-info"
> > +DEPENDS_remove_class-native = "gdk-pixbuf-native"
> 
> Given that I know you want to avoid using _remove in OE-Core, is
> there 
> any reason to not write this as:
> 
> DEPENDS = "glib-2.0 shared-mime-info"
> DEPENDS_append_class-target = " gdk-pixbuf-native"
> DEPENDS_append_class-nativesdk = " gdk-pixbuf-native"

That would be better, yes. I'll admit with this series I was dealing
with a lot of weird issues so the end result still could use some
improvement. There are probably a few places in the metadata we could
improve now.

> (I'm not sure the append for nativesdk should be there, but I added
> it to match the original code.)

I'd suspect the nativesdk is needed.

Cheers,

Richard

