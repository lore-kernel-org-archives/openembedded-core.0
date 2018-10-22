Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id A74BB7453F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 09:34:29 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 206-v6so9507938wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 02:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=IWdVGuLt2/z8+zlXCCsIzvaLD/eKZ6RcPJ8ZOqpC1xc=;
	b=Whsj3tzgdA3H5lbAH4Urj4OCnpB5U1cFuK6syr3qqRQxQ6BdxGFdLFmHN7NllC3MmA
	1i1xv2Pk53SxwBf6LC6fv1CREh+gM59JpQ6CM55Nkf1FFQoZfYIRXiK/80cUVFo63O3i
	oJHrDyLHxWDfVD94zceZCnfIkBnk/6QSCp4uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=IWdVGuLt2/z8+zlXCCsIzvaLD/eKZ6RcPJ8ZOqpC1xc=;
	b=tuWZLKdWdYgZsMlDJX+DYiouMa08xIG4XvRW6nSg8RgpwTSzTEXcsMl3v37dFb53Mc
	gbHJD5MSNv2J+g9QGH5IM/we8Pe2Obps1m5tcA46EkbQQhcpMNvybf+FJa1SpJbR19Ph
	dNgQNG50W0lNUgB9cccPc+JqQ1b7mFg0mVPmj7B6YWsClE30l3l0N6BQM8ALtHqx53u+
	DLeSn7yh/WrS0HqCPt9gdRtkbZ7gN2r+uMxFkJAZLjf9FH7xP9PvSlS4OzlPJUfXKH6w
	CvyogBWWl+jYzEcJO6jQk8/hp/XixFZHU37Z4mPZnZlY8tVUAVRB0sJmZk1ZEUXx2knl
	Wabg==
X-Gm-Message-State: ABuFfogIltc0JmAmb0b7//25UQV4w27zTegGQN91o0esppEgU7RZ21Xm
	uIMiphDDdetStqKKmqIMGu0GLxlBq6Q=
X-Google-Smtp-Source: ACcGV60EN2GSUjZgqgtyd0XebSA/oxinYoRucCGjkrL0f2INLSD6iwMRExgi7iioI7czctDQaQppYw==
X-Received: by 2002:a1c:790:: with SMTP id
	138-v6mr15301961wmh.122.1540200869980; 
	Mon, 22 Oct 2018 02:34:29 -0700 (PDT)
Received: from hex ([185.7.230.214]) by smtp.gmail.com with ESMTPSA id
	140-v6sm10569356wmx.34.2018.10.22.02.34.28
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 22 Oct 2018 02:34:28 -0700 (PDT)
Message-ID: <ef9026ca2498e333392215eb630e153908c1cedb.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 10:34:27 +0100
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335ECDDF9@KMSMSX155.gar.corp.intel.com>
References: <1540191264-12332-1-git-send-email-ee.peng.yeoh@intel.com>
	<a12cf13bca36f6573be192ada5bbf60dbaa4b902.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECDDF9@KMSMSX155.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 22 Oct 2018 09:34:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-10-22 at 08:59 +0000, Yeoh, Ee Peng wrote:
> Hi Richard
> 
> Current codes does load existing testresult json file if it exist,
> then it will write the new testresult into it based on the result_id.
> > +    def _get_testresults(self, write_dir):
> > +        testresults = {}
> > +        file = os.path.join(write_dir, self.testresult_filename)
> > +        if os.path.exists(file):
> > +            with open(file, "r") as f:
> > +                testresults = json.load(f)
> > +        return testresults

I managed to miss that function and call, sorry. That should be fine. I
think we may want to inline some of these functions to make things
clearer.

> I did have the same thinking on if we can have a common function to
> manage configuration and result_id or let individual test classes to
> manage it, in the end, the thinking was configuration/result_id were
> really responsibility of each test classes, where the json helper
> class inside runner shall not have the knowledge or know-how on
> configuration/result_id. Thus the decision in the end was to make
> json helper class responsibility as simple as to consume the
> configuration, results, result_id information provided by the test
> classes. Hope this explain the reason behind current design. 
> 
> Thank you very much for your attention & knowledge sharing! 

You could just do what amounts to getVar("LOGDIR") + "/oeqa" and have
that as the default test result location?

Cheers,

Richard




