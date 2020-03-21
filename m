Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.7770.1584797794182575726
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 06:36:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VhVzCMUa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id g62so9413566wme.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 06:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Op2VvzKbSh2MscBIo9Z2HW4dt1AOCnptQwJ2NILEWK8=;
        b=VhVzCMUaz4fpcXQH3/HlN1uAf/Ha3UAYpqhIfsNJMncHDDKeJUkKmVHNHk/a4PF2Xp
         arC8v0bS1cGkgI/UlfakgUI7IU0I08Ly9aeAms5t7667sKRSfLdtZ14G26gc8cwZxPr/
         hq9CeN13U5e79oPeAaXLyylFlLr+0llrCcpJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Op2VvzKbSh2MscBIo9Z2HW4dt1AOCnptQwJ2NILEWK8=;
        b=Z3kMBq49on33W1Z5Gj+P7o/GoAM/8Y8cFkAkj0kBOxvBqPV0LZW6W2rahAPriKgEVr
         VvsZV7PzpBX8yqkFSOSSVelZJiX1ZeoZ34ll+ur486TYf/L9LSngeokMAmhU5wfqsT5R
         r0wC20lgpby65RbKMfcd+Rbox5gsOuUGRmbNA/DH+GoA1foS8/86NoZIEuedUmz1JLvz
         PQhV/jX4DAiHGfd6rlwH+a/rq+lx4vPo47Kf5JHY8BAtkUKddArry+vKQ+jM2Qv4S8Qw
         9WX2mv2o65cdPyqag6VzkpXNykmqP7LJ1zxI3MttLObn6ewGnHXGXzCsLheRnK16HI/9
         V7Jw==
X-Gm-Message-State: ANhLgQ0VFJns1eBj47EGddej73H4v3Px0lf33+v+rBaDE7igaIjRFoBp
	JqRYZZ2l7Oyd2zFcwgNiqoD7KA==
X-Google-Smtp-Source: ADFU+vsukR6CqhniJvk+I/ZSUwzx78DD7lrmV/AzRxRRlaWdTSGwx4M1EJjp+NF275yguybO3NPLDg==
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr15813789wmc.19.1584797792577;
        Sat, 21 Mar 2020 06:36:32 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a16sm12478005wmm.20.2020.03.21.06.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2020 06:36:31 -0700 (PDT)
Message-ID: <a9d007004565cf8340d048803b30379158c012c8.camel@linuxfoundation.org>
Subject: Re: [OE-core] recipes that don't list where their source is
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: "rpjday@crashcourse.ca" <rpjday@crashcourse.ca>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 21 Mar 2020 13:36:30 +0000
In-Reply-To: <alpine.LFD.2.21.2003210818320.7869@localhost.localdomain>
References: <alpine.LFD.2.21.2003210818320.7869@localhost.localdomain>
User-Agent: Evolution 3.35.91-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2020-03-21 at 08:26 -0400, rpjday@crashcourse.ca wrote:
>   not sure what the policy is but, occasionally, i run across a
> recipe
> that doesn't identify the location of the source code (just in case i
> want to peruse it). case in point:  kexec-tools on master branch:
> 
> http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-kernel/kexec/kexec-tools_2.0.20.bb

Surely the recipe doesn't work if you can't access the source code? The
source code is clearly in the tarball.

> combining HOMEPAGE and SRC_URI, you get little more than the
> directory
> to download versioned tarballs, but nothing about the location of the
> source code itself, if it's available.
> 
>   is there a protocol for identifying the (accessible) location of
> the source code, or is that simply up to the maintainer to provide it
> if he or she wants?

Do you actually mean the upstream source control system supporting the
source code?

There is no requirement to have that. I agree its useful at times and
its up to the maintainer. Some source code doesn't have it publicly
available.

I'm actually a big supporter of devupstream being enabled in recipes
which would add more of this information to recipes. We don't have
enough maintainers to sustain regular testing of that though.

Cheers,

Richard



