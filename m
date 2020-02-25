Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9B660211
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 13:33:54 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id z12so3010544wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=EpiNPMw3PE26ComawyYStaUKpa7AsHpAqF9RnBhTAn0=;
	b=cnbG0PTCKRXWuWoKGYW+a3dfmRhyOFPkjVdSnBWWQpVL5+e7RsudhPtiXzztkYdOJo
	cB7uc2NTe0vaNd/Qh+A08uQyuoWyS9KvQOu92IR3bcsAxEExynP6s1tXjCQy8s8NdHhv
	HFHacfunheUTDTU7jqSNwN5dkgbuPkjQKI0f4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=EpiNPMw3PE26ComawyYStaUKpa7AsHpAqF9RnBhTAn0=;
	b=ecvYvRl0DnE9gCtOc1BVmXnoJPJOw/t9vEAXdfQ58c+zztZ8HKbFVF3wFreY3umwp/
	MGr2DAvx7UWTcATqJj4JGxqAu9zJquLV3mSRAd6cfzgGeKRXCdschqxik0rsbMp9PFmD
	RtK7/FahkSJmbqmXBNn92N4awJKOJ5ZtXE1gOpcwYf3rleWBzRigJGlCUFE94lzh1zO0
	A+bvyS8u4qwV6p2N3x4qZxGSUpOTYBJ6Lx5s/7Va+DQ5Oa+zP9BksoCrp4LBYuqYW/Xw
	X568iQk5AoglfyS+u4tmvXFQ3TVmSlENR0zoUTr/v2FVjN0oWJU11l1ClHKLCkky4hbg
	FfVA==
X-Gm-Message-State: APjAAAVSYy/TpSbYSKZFpiJUHksDKymSyv5hBbqNxCWWh6XQxCABRULM
	HLJnM/gT2WzBA0v/TdSsAMj9Qg==
X-Google-Smtp-Source: APXvYqwHlwaOeacyGnRNkxbpdYuSO0iKQ7EnaoI4yDjSWzpEpTLMVFnlJgS8GQ9TLXE0SFJmXNOqGw==
X-Received: by 2002:a1c:7c11:: with SMTP id x17mr5762510wmc.168.1582637635211; 
	Tue, 25 Feb 2020 05:33:55 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h2sm24085479wrt.45.2020.02.25.05.33.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 25 Feb 2020 05:33:54 -0800 (PST)
Message-ID: <42d690f3ae40a420179cb85453d2722c153c2d8c.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 25 Feb 2020 13:33:53 +0000
In-Reply-To: <a133657b-8b8f-a4e9-5999-41781f74db6d@gmail.com>
References: <20200222185400.32136-1-jpuhlman@mvista.com>
	<a133657b-8b8f-a4e9-5999-41781f74db6d@gmail.com>
User-Agent: Evolution 3.34.1-4 
MIME-Version: 1.0
Subject: Re: [PATCH] readline/ediline: Fix conflicting manpages.
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
X-List-Received-Date: Tue, 25 Feb 2020 13:33:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-25 at 14:08 +0100, Jacob Kroon wrote:
> On 2/22/20 7:54 PM, Jeremy A. Puhlman wrote:
> >   BBCLASSEXTEND = "native nativesdk"
> > +
> > +inherit update-alternatives
> > +
> > +ALTERNATIVE_PRIORITY = "90"
> > +ALTERNATIVE_${PN} = "history.3"
> > +ALTERNATIVE_LINK_NAME[history.3] = "${mandir}/man3/history.3"
> > 
> 
> With this change (I think), I now get a file
> 
> > +lrwxrwxrwx root       root               38
> > ./usr/share/man/man3/history.3 ->
> > /usr/share/man/man3/history.3.readline
> 
> in my rootfs, which is wierd since I don't have any other man pages
> in my image..

At a guess, ALTERNATIVE_${PN} should be ALTERNATIVE_${PN}-doc ?

Cheers,

Richard


