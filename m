Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.212.1589487010307944360
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 13:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LTWB/SYw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f67.google.com with SMTP id l18so299228wrn.6
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 13:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=4AFJ6KxgKMaOV+CnmeFL67e8pdmqDPZvnVK6+x3Bf/A=;
        b=LTWB/SYwvmJvdEXLLsdIkaXVg/gq5ZYZcQBBr6GvUUlFGjHutk01GytInpDeggDWG8
         lL8gp76ntKPYzJBuuemQYXA20Pf5SvV+vflISyUqmn94TBYlrIlsTAS1rrsBFbBOD1WX
         F0hMV8GJJbq+ey5G22lZKXhpc918jWIU5TVoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=4AFJ6KxgKMaOV+CnmeFL67e8pdmqDPZvnVK6+x3Bf/A=;
        b=RtG2GhMVe0C5i2hp+hnH7IlzJHQCFrbcPMd7cr6flY1jJTgnlPwJBrq4/y9kU/csyd
         zvhk+od6rHp1rlFyQILCiunpqBSKLW3cUbJ6VgC56AjHUAK6wZomXMjfts5TPhc7tyh/
         M3m7ccB9gi0Ek+ZhHMpTGHlDSasPKwZ4Al4Mt30HJqiTWPBIpJhXqX/KfIIlIgazRsVo
         wrJlQyGQ0NOOnq+1Pr5dWFrf/ZQLLTqnDDPpn044zMcRiRhPK2DRDpuenkpA/5apM0HX
         VQNPhae8TYFOYIHn4hz7JuioJhRb7dEQGHpY8goCeG942uTmTu9OupxN54IW8AKNaYlK
         Os/Q==
X-Gm-Message-State: AOAM530wmObiNPHGzllp1h5WuYflgtvkHTK0SIQlXCumuPARgXcj9NwR
	23wPyDIbBXtLMFgKBKhSalJAdA==
X-Google-Smtp-Source: ABdhPJwa6W2P5sgQnRyK1n5Y0rrt7vaTYclx1LZzf/hP8fMP61wBvYbLhBcdO4Fg0zdv9lFYqWerBw==
X-Received: by 2002:a5d:61c3:: with SMTP id q3mr113465wrv.405.1589487008790;
        Thu, 14 May 2020 13:10:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id a14sm217031wme.21.2020.05.14.13.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2020 13:10:07 -0700 (PDT)
Message-ID: <78de346ce051f49a641ca92edd33a778b6881e93.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 0/4] kernel/kernel-yocto: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Date: Thu, 14 May 2020 21:10:06 +0100
In-Reply-To: <CADkTA4N9OVMWenYf1p5Tq6xvoa12JOaNNKfccT4of-t33NH6WA@mail.gmail.com>
References: <cover.1589378829.git.bruce.ashfield@gmail.com>
	 <4586b07ae3f2c70500b6627645de2f71760b45e4.camel@linuxfoundation.org>
	 <160EEB0DDF36CFC2.25549@lists.openembedded.org>
	 <CADkTA4N9OVMWenYf1p5Tq6xvoa12JOaNNKfccT4of-t33NH6WA@mail.gmail.com>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-05-14 at 15:44 -0400, Bruce Ashfield wrote:
> On Thu, May 14, 2020 at 10:22 AM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> > On Thu, May 14, 2020 at 10:09 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Wed, 2020-05-13 at 10:24 -0400, bruce.ashfield@gmail.com wrote:
> > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > 
> > > > Hi all,
> > > > 
> > > > This is a resend of the v5.4 stable bump to v5.4.38, plus a new
> > > > -stable
> > > > bump to v5.4.40.
> > > > 
> > > > The extra changes to make these pass the AB tests are the kernel
> > > > reproducibility commits.
> > > > 
> > > > The issue we had on the last submission was that IKHEADERS was
> > > > switched
> > > > to a module, and hence was failing reproducibility tests as we didn't
> > > > have the timestamp variables exported for the module build. It has
> > > > always been a problem, just one we hadn't hit.
> > > > 
> > > > I've left the fix as two commits on purpose, since the copy of the
> > > > reproducibility export fixes the problem, and is definitely safe for
> > > > dunfell,
> > > > and the second commit is my effort to remove the duplication of logic
> > > > and
> > > > create a common python routine they can call. I've used the
> > > > techniques for
> > > > subprocess running that I've done in other kernel build elements, but
> > > > if they
> > > > aren't the right ones to use, point me in the right direction.
> > > > 
> > > > All said, these are green on the AB and should be ok for master and
> > > > dunfell.
> > > 
> > > I think this triggers something here:
> > > 
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1914
> > > 
> > 
> > In that case, just drop my effort at factoring out the source date
> > epoch into a python function.
> > 
> > It looks like the git check went nuts, and since we don't need it, and
> > I won't have time to work on it again for a while, if you toss it in
> > the bin, all should be well.
> 
> I did tweak the python code to handle the git return code more
> gracefully. I did test all the conditional paths before, and they
> worked, so I'm not sure how to trigger the failure here.
> 
> I can try an AB run against the fixed up routine, but what target
> should I be running ? Obviously quick doesn't hit it, or I would have
> seen it.

You need to push a plain oe-core branch to oe-core-contrib and point
the build at that. This is the target:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47

(qemuarm-oecore)

Not setting a DISTRO would also do it.

Cheers,

Richard



