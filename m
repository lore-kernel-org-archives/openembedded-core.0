Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web10.56723.1584979893233328569
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Mar 2020 09:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VmmtI+SY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h9so17807103wrc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 23 Mar 2020 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Sy4g9kStflUumS8gsxZPhsOMPTOkfdyUmA71X0VPibM=;
        b=VmmtI+SYgYkntlgktbwpMqTebEEWZkwMdlYxXxBCKhXHV8x0aIufTyTQVIomYyJBe/
         Tmus4JS5XZ7NtyM+9syYpfhMODKKBGu47W4aQrFGnUFD4Xx7gbyK+f38keIy6/LU33d3
         ieSIaE32mXZPBa0s3M9VMZQPpZhoqoh2aub4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Sy4g9kStflUumS8gsxZPhsOMPTOkfdyUmA71X0VPibM=;
        b=Fk5UglfaFnYlXBXxKEo/YwGyVn6mnkqFfuvCqaYP7NUPs9vq+wETYjeWT4WDdglTco
         fx+UH2ICJ1r/KuOuCQBiYTLoeq7R8GD3ikBSwDc1F90AXd9pASeTwjYfnnqBC3MjAIi9
         oidNmrJVsmACImo54rDCsFUB+YZYxAADJ0wd18ep+qaQ31Ig6ySwTPVqw0dFBwn14RM7
         UqHzRC2J9rUUP8XUdh1vWoWnoAGascE6eUMuHj4Ztif8JEAy7dqaiW3mYAbfLwrlbwAc
         yragBY1h3rwPWYmewMeJqxa3fjNvgMI4j5eb56WZ/YgpgcOcvnaj8OUXJ2drfi32RgMj
         uhOA==
X-Gm-Message-State: ANhLgQ1eCRQ46R9tC/K7coRbMoBRrM+0Ltl7MYDbTo/ZscFu4wAnRu8X
	OAZL83c7ieNL6d1IssGXXSZvsA==
X-Google-Smtp-Source: ADFU+vtwVqMAfaJ2O+wcBrwvrFzeH2RV2n/9XbvidwFVXvtvtZflS5J3QsjVdeTzdmNBUKbnm5Wu8g==
X-Received: by 2002:adf:90ee:: with SMTP id i101mr30405953wri.417.1584979891710;
        Mon, 23 Mar 2020 09:11:31 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id c7sm13311420wrn.49.2020.03.23.09.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2020 09:11:31 -0700 (PDT)
Message-ID: <534b0df5f09c60381ed520ff3f840a1b315d3142.camel@linuxfoundation.org>
Subject: Re: [OE-core] what is the current purpose of PRIORITY variable?
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Mar 2020 16:11:29 +0000
In-Reply-To: <alpine.LFD.2.21.2003231206180.20339@localhost.localdomain>
References: <alpine.LFD.2.21.2003230924440.14394@localhost.localdomain>
	 <89ed530a5dc904f8ea677e2633f3732b59b3bbc8.camel@linuxfoundation.org>
	 <alpine.LFD.2.21.2003231206180.20339@localhost.localdomain>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-03-23 at 12:06 -0400, Robert P. J. Day wrote:
> On Mon, 23 Mar 2020, Richard Purdie wrote:
> 
> > On Mon, 2020-03-23 at 09:28 -0400, rpjday@crashcourse.ca wrote:
> > >   continuing my travels, ran across "PRIORITY" variable that i
> > > was
> > > not
> > > aware of, was introduced in bitbake.conf way back in 2005 in
> > > oelint.bbclass, but there are only a few lonely references to it
> > > these days:
> > > 
> > > meta/conf/documentation.conf:PRIORITY[doc] = "Indicates the
> > > importance
> > > of a package.  The default value is 'optional'.  Other standard
> > > values
> > > are 'required', 'standard' and 'extra'."
> > > 
> > > meta/conf/bitbake.conf:PRIORITY = "optional"
> > > 
> > > meta/classes/package_ipk.bbclass:        fields.append(["Priority
> > > :
> > > %s\n", ['PRIORITY']])
> > > 
> > > meta/classes/package_ipk.bbclass:IPKEXTRAVARS = "PRIORITY
> > > MAINTAINER
> > > PACKAGE_ARCH HOMEPAGE"
> > > 
> > > meta/classes/package_deb.bbclass:        fields.append(["Priority
> > > :
> > > %s\n", ['PRIORITY']])
> > > 
> > > meta/classes/package_deb.bbclass:do_package_write_deb[vardeps] +=
> > > "PKGV PKGR PKGV DESCRIPTION SECTION PRIORITY MAINTAINER DPKG_ARCH
> > > PN
> > > HOMEPAGE"
> > > 
> > >   is this doing anything useful these days?
> > 
> > Not really, no.
> 
>   any objection to my submitting a patch to remove it?

I'm torn on that. The Priority field is a standard part of a debian
package (
https://www.debian.org/doc/manuals/debian-faq/ch-pkg_basics.en.html#s-priority
) and also part of opkg's implementation.

We don't use it, I'm not sure that means we should remove the code
which would allow someone to though.

I also don't know if dpkg/apt supports an unset value for it.

Cheers,

Richard

