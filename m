Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web12.9748.1628698499803027114
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 09:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=SW51Ji39;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id DqsTmLPk5HBkXDqsUm3ehD; Wed, 11 Aug 2021 17:14:52 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=8AHkEIZyAAAA:8 a=TqlozkeXAIqzUpm2Wq0A:9
 a=CjuIK1q_8ugA:10
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=yUanRG1/xGRdu47jZshxGtfIHVcYtu9Thi9obQT96cM=; b=SW51J
	i391OygBm1XZOOXaN9sSQmfLm+iqcwp8gDSwdj0oFZb60Srwo+lKKtzutdYNlBC7L52hvJxRNNCOK
	CqeNRDDRKZoU9hXKIqayDtTr37emqwDmyDJoLD8QVCfY+4F5yOpIP/0ewLCbfPHhphz3ufMMOtQ37
	DPHrQpHbhxsp3bo6+Yr+wkEyo+epPLrW5cdRlkcCf2SyFvB6rm2JJZao9xInyLn6aAO9T+zGgJ+FC
	3Rkd9C3RlGu1OVchuat3c5aULCbmrZVJaUSV1Zj/N+h8JUQbuY+Sor9I4sZPc3IrqaZFFUs6JKl2S
	Wfg2KFxIyJiWj3CjT4Z6KekmZtbkw==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDqsT-00025u-Br; Wed, 11 Aug 2021 17:14:49 +0100
Date: Wed, 11 Aug 2021 17:14:49 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
	"Zhang, Qiang" <qiang.zhang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
Message-ID: <20210811161449.GA7254@mcrowe.com>
References: <20210803051138.30790-1-qiang.zhang@windriver.com>
 <CAAnfSTtD=Vz-3SY0UYBh62en9Z_WMzWP7iRQPynmJPmCR+PiHQ@mail.gmail.com>
 <CANNYZj9y7qXt92w0hfkWJufJ=7i6m8ddDcNfNzOJCUw+Ci_a+Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj9y7qXt92w0hfkWJufJ=7i6m8ddDcNfNzOJCUw+Ci_a+Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfNWpEKvzO/b0KY3jmG/5EwJm5dlPw3+OpLUCSBuhFu7TnvH6H0xdf6vYnQmwl/rnrE+zheenO6chnwxg9xE9SNngsAReVoLcfVxFhs+ggw1vF0w6TLaq
 MF4VO/HcVIB1nKf39OCxyAG29GWQsGFCMQhS24CUxwRHERM8hHznShRtV2b8IkCEzpiMWyMjuZS25Q==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 11 August 2021 at 13:36:23 +0200, Alexander Kanavin wrote:
> I too do not think this is sufficiently explained. All of python ptests
> pass, so there needs to be a demonstrator of incorrect behavior, or let's
> just revert it.

I agree regarding the lack of explanation. However, even if the problem is
real (which it looks like it is based on https://bugs.python.org/issue41710)
then it wouldn't be expected to cause test failures unless the system clock
was being warped at inconvenient times during the tests.

Thanks.

Mike.
