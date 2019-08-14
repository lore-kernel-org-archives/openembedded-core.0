Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 54A2D7E5FA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 11:36:55 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z23so4162287wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2019 04:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=J858O2Urjb71cNzgWdHyNXimRINAJYSCNBF2nI4pZ1g=;
	b=hOW+yqpE5GqIAJFF6t/jgYEFid1dp6ymzETmFFTqb9D/pIqgl8jtYunVLb7qqKnK14
	oXbr1ZojYmGcjzERNvgUi79W/H89dT49D5UcJCfK2gtYuXdTV3SGL4irOJI4rlfkVqtn
	c/DfS5uNmz30pAfTgrZQTQGTgQ4BZW3r6qyz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=J858O2Urjb71cNzgWdHyNXimRINAJYSCNBF2nI4pZ1g=;
	b=YW2bg7bnghA9NkIO/qdqiKmM9mNJMQwe0WonWqgLbF13gmTrCwQ7j8iokOM1zwJ8qv
	pyssCpWw82ZSUnKn+UBu/yIH1g/ClEWZMHOQQaiPogQwIQ5Ava7tazjoenUdpolrDhRI
	ueERVc8wY/QnmqLyfWKDqQUTkYRk4157Y0i8SyKYokFlBjcsv3BhT9pj9VBkUwj+QqYL
	dk2MSu52peBvJssIf3kWdjTlETJ1Em6ol4u3VsA6O+oSlbBYg3yFvXUEygkWiTtgp3bH
	rw5h0ANzs/XaGqNV6WQrbDyLJWDPaxI8T+vzAwaWqAMKeUqvcZQJuCyKRRcPdALNrgO4
	qYZg==
X-Gm-Message-State: APjAAAWgx4msO10f1d/GiboMOyDoFTDn88O+NB/WIq5aPjjqFFsOn60T
	tfoRURMxr2jniWXGMUF5mr34kA==
X-Google-Smtp-Source: APXvYqxRSe8ZOxXdLzEpr4pwrJwwiWiIQP/jNhC9ePU4AldMRYklwoVhSe7i7xu1bCSRTUMolRRZ4g==
X-Received: by 2002:a1c:4383:: with SMTP id q125mr8330947wma.16.1565782615830; 
	Wed, 14 Aug 2019 04:36:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id e6sm1358136wrr.14.2019.08.14.04.36.54
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 14 Aug 2019 04:36:55 -0700 (PDT)
Message-ID: <6551fb5303bcc8dbf3a9d55a1aa6a9ecd2baeb13.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Aug 2019 12:36:53 +0100
In-Reply-To: <CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
References: <fcc15178e58e4ef0a8e2cf3047109bd5@xbox06.axis.com>
	<33bca828a78daaefc32fe497e7f244e3208bc968.camel@linuxfoundation.org>
	<2a106fcffc331009abdb6498ffe8c4f3c99ee80b.camel@linuxfoundation.org>
	<CANNYZj9HHxJa5NKWU9r09NXgBy8aD0RTkugQ-k6esVNCTVOa6w@mail.gmail.com>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Long delays with latest bitbake (was: [PATCH 1/7] insane.bbclass: in file-rdeps do not look into RDEPENDS recursively)
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
X-List-Received-Date: Wed, 14 Aug 2019 11:36:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2019-08-14 at 13:25 +0200, Alexander Kanavin wrote:
> On Tue, 13 Aug 2019 at 21:18, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
> > I had a glance at the profile output from master-next and the
> > problem
> > wasn't where I thought it would be, it was in the scheduler code.
> > That
> > is good as those classes are effectively independent of the other
> > changes and hence are a separate fix.
> > 
> > I've put a patch in -next which takes the above test to 36s which
> > is
> > close to the older bitbake.
> > 
> > Could be interesting to see how it looks for others and different
> > workloads.
> 
> I just tried the same test I did yesterday with
> ab56d466452148e5fce330d279d13e2495eceb1f. Unfortunately it doesn't
> seem to improve things much: bitbake is stuck at "NOTE: Executing
> Tasks" for 15 minutes now.

This might sound slightly crazy but can you try commenting out this
line in runqueue.py:

logger.debug(2, "Holding off tasks %s" % pprint.pformat(self.holdoff_tasks))

?

This was with the hash server disabled, right?

Cheers,

Richard


