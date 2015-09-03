Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 01B5776FD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 12:31:32 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
From: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <55E83DCA.70402@communistcode.co.uk>
Date: Thu, 3 Sep 2015 13:32:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 12:31:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 02/09/15 16:55, Otavio Salvador wrote:
> On Tue, Sep 1, 2015 at 6:34 PM, Joe Slater <jslater@windriver.com> wrote:
>> Implements ifup and ifdown.
>>
>> Copied from https://github.com/WindRiver-OpenSourceLabs/meta-overc.git
>> as of commit aa89eebffe06e4aa04701eae9691cb3049cbaef9.
>>
>> Signed-off-by: Joe Slater <jslater@windriver.com>
>
> I think this belongs to meta-networking. Also, what this one provides
> which is not provided by the busybox one?
>

This provides hotplug support which the busybox version does not. I'm torn on 
where it should land i.e. meta-networking vs core but it is a useful addition 
regardless.

If you're attempting to do a non busybox based build, then I don't see the 
reasoning for not just using connman as your networking manager instead which is 
already supported in core.

