Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 52D2561329
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 10:33:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id p9so1414270wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2020 02:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=ENda3+DnZBD0ZKF9EONxg3CgRZAcWtjO7SABlAT/R8M=;
	b=hNodSMiqy+SzP6RgS1wg2xfjtsR3F8rfVtvNQDaACVobiNakzrZ+fK8vVkFHjExPgF
	lR0rGbLUpu4KEtnoQ1dWvxAzEgOPdMTvFA9vvKN91w/KN+zFYxCy2Akw42VdEGLyf6mL
	iZ2S3YFTdJUDOWawo7gzkIo7TjoctyH5FxYYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=ENda3+DnZBD0ZKF9EONxg3CgRZAcWtjO7SABlAT/R8M=;
	b=eFBnTOuu6c1XGlOGOOqrpI9jZgVdXnQe96IHh/snwvWxqgMveJDqfSWSzeIbfryiny
	8vRD4jpZqpTwy7umHDtpH4JbrVMpPlF6hfm3oSEpPz1BpA9fi7BS1VY//2JgRttsLg9r
	8fTdFAaIe7w6nXcdjzSvCYUGMV2av69ud+k+/7HnpRHgefjOMw3A5Q9aH+uFM332PoKV
	SLrID9guN0yCFMeAmNX64vpF7aO9JUxjggW4UioCoO+wHy79nShbZMCCD1CPvpXLrhvo
	v+RgnhFNnhLaC2BU6LVyc5YGJo3pm+YKg9UAXcuJLIWHFWSrD9GLYZz33L3Ld3E6M7/3
	q9YA==
X-Gm-Message-State: APjAAAWQCtFoxq+xTdOV3qGy08iIE6LLHCGfs6hszNNDoYfwTYHiGxfP
	hpD7GkR3aGHtFmFFqzZ+WgELCA==
X-Google-Smtp-Source: APXvYqwNMsQUJ8FfJ34FbeOlyqkzaJ2qvDC77HuScc3sVquu0OMDLOHBOsJb4sFMne2oXWxuIAWeqA==
X-Received: by 2002:a7b:c4c5:: with SMTP id g5mr3781551wmk.85.1582194830102;
	Thu, 20 Feb 2020 02:33:50 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t128sm4192321wmf.28.2020.02.20.02.33.48
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Feb 2020 02:33:49 -0800 (PST)
Message-ID: <77217fc86fe8451eae53e3b6e93cd9cefab8b022.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>, "sjolley.yp.pm@gmail.com"
	<sjolley.yp.pm@gmail.com>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>,  "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Thu, 20 Feb 2020 10:33:47 +0000
In-Reply-To: <CY4PR11MB18792EA8DAE6F08AD3CED448E3130@CY4PR11MB1879.namprd11.prod.outlook.com>
References: <0b8a01d5e675$d2363e30$76a2ba90$@gmail.com>
	<CY4PR11MB18792EA8DAE6F08AD3CED448E3130@CY4PR11MB1879.namprd11.prod.outlook.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: Yocto Project Status WW07'20
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
X-List-Received-Date: Thu, 20 Feb 2020 10:33:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2020-02-20 at 07:46 +0000, Jain, Sangeeta wrote:
> Planned upcoming dot releases:
>  YP 2.7.3 built and in QA
>  
> I didn’t see any notification for this build. Am I missing something?

No, its due to be built but isn't built yet!

I think that was meant to say 3.0.2, sorry about any confusion.

Cheers,

Richard


