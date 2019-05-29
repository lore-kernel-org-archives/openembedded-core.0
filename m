Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B7717E33C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 12:25:44 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d9so1667119wrx.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2019 05:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=YJLL5Qww5ZhBclCyU+ZVL5fHY6SGzz8tIGi6sBSoL8s=;
	b=Mf8I1HXVyGncKITp3iHVayphChb9HnHb9t9gpBFTQG5jXUK+1fkcscZ61QxFcayvEC
	rY+ZLQ1R3tuEyzLcwMp5K7uRHEG5OPrrItOqKeqI770ocMLqA8Uxz4GdyI7Jc1pWvbr9
	5u/VcvObd0e4jhxMmA8Fr8io6KZAVW0QYno40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=YJLL5Qww5ZhBclCyU+ZVL5fHY6SGzz8tIGi6sBSoL8s=;
	b=fHw3lWKYNVOCPCDzjliGzGMN03WwAG/n7PSClzLqyu5VLJ0ytbGLcrTUFNnCAj128a
	tmTgrAjD+X+XL8FQdcShxVBlfh6tWYOwMSR2mKIYtsWSnvDzxUaJLXOlwDkwrI7RRP6C
	cIRcClQcK8Sb6JFpTmPRLQtZncrk8DTZ2Q0oiwNkHrOE9uQxpTo+Yoq++FrP2xrcfdnw
	SwIjoK1BJCr5YJM1RGIVfStAU3Y9yNl7klikz+TyA+J8aqNLeYLq2eGUHWj+Bl8tlktW
	GKB1VN45gVJZ5u+FGZUHKeExti/e5zowYj5sPgfaIiObc2VnuaOreMTk7WNjk6wiIOqj
	6Rsg==
X-Gm-Message-State: APjAAAXrVM0WhTITdvNInvm3T8lXztROpx3y90RN99nmQpsgXIXF1NV9
	khGomNOBbr+SN4nDCWe/RCJvqg==
X-Google-Smtp-Source: APXvYqwqziXhAQohmTNIZ9XcLy9J6HGRStvmGXGmjDjJh6FFKc9rQalxrP6qGFIEEDnzMd3Ye2Y33g==
X-Received: by 2002:a5d:5501:: with SMTP id b1mr61745026wrv.222.1559132745791; 
	Wed, 29 May 2019 05:25:45 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g2sm16870935wru.37.2019.05.29.05.25.44
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 29 May 2019 05:25:44 -0700 (PDT)
Message-ID: <e62c92f8fe20c45f016549f55047e3fd595edede.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Bai, Haiqing" <Haiqing.Bai@windriver.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 May 2019 13:25:43 +0100
In-Reply-To: <C2A454FDE6C23F41BD5011E2458C46C9F30CFADA@ALA-MBD.corp.ad.wrs.com>
References: <20190524054915.49751-1-Haiqing.Bai@windriver.com>
	<c44ab1cfbbaa2cb3bbfd6227539a278e7d61b775.camel@linuxfoundation.org>
	<C2A454FDE6C23F41BD5011E2458C46C9F30CFADA@ALA-MBD.corp.ad.wrs.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Subject: Re: [PATCH] make-mod-scripts: Add nostamp flag on configure task
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
X-List-Received-Date: Wed, 29 May 2019 12:25:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-05-28 at 07:25 +0000, Bai, Haiqing wrote:
> On Fri, 2019-05-24 at 13:49 +0800, Haiqing Bai wrote:
> > Error appears while building out of tree kernel module
> > l/kernel:do_compile_kernelmodules"
> >  
> > +do_configure[nostamp] = "1"
> > +
> >  DEPENDS += "bc-native"
> >  
> >  EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}
> > ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}""
> 
> This sounds like a really bad idea and will make anything depending
> on
> it rebuild in every build.
> [hqbai:  Actually package 'make-mod-scripts' is a building tool
> needed only by external modules,  if 'anything'   your mean here is
> these external  modules,  then the answer is 'yes',
> These external modules depend on 'make-mod-scripts.',   what's this
> package do is actually equal to  'make scripts'. 

Having all external kernel modules rebuild at every build is not an
acceptable solution.

> We need to ensure that these clean commands are not cleaning things
> out
> of the shared kernel directory that they don't own.
> [hqbai: Since the shared directory is 'kernel-build-
> artifacts/include/config/xxx', kernel is the owner of folder but not
> these files,   I think it does not make sense for kernel to keeps
> these stuff when do  clean/cleanall ]

Only make-mod-scripts should be removing these files since its the one
that has added them.

We should not be running "make clean" in the kernel build tree in those
cases if its going to remove things it doesn't "own".

Cheers,

Richard


