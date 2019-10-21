Return-Path: <sean@geanix.com>
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
	by mail.openembedded.org (Postfix) with ESMTP id 005DF7D25F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2019 06:09:29 +0000 (UTC)
Received: from [192.168.100.95] (unknown [95.138.208.137])
	by first.geanix.com (Postfix) with ESMTPSA id 3EA9ACCC;
	Mon, 21 Oct 2019 06:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1571638108; bh=/p7S79fGy15ZcAi+4RlaQPpjc+lHW2jYr20uLcFqMeI=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=jfHEW6KRx7efbURx42VwBxapSsVstkeTjeifM8OIipB9IWBwlGbWwfcIkV0fwWFHq
	dejo2wP1huR+zJwJCBLExbuJC9LK6WDOMUOG861Qwtx5E59Y8XEJfZAeuGqXUFCREV
	Kl9tRhXHDzcHZUmmu7sLPEVivk4k/qrdLrHzm1Pu9CcXUaM5wOvlFQbLAbYJJMlerV
	gle/kx7EBXlmtwbztCmh4Ab1SRHgvR+NvyXuxYAmh9op+ku0Dmql6P97MoSttN5bW7
	o0gEFQ9+LC+6gXGRPYhmD+vQCRqFAxFxMRntzwdPRmwawBQTURNm2NVasz9AG4eKbe
	qqZimQKVbUqSQ==
To: akuster808 <akuster808@gmail.com>,
	Alejandro Del Castillo <alejandro.delcastillo@ni.com>,
	Denys Dmytriyenko <denis@denix.org>
References: <1571325700-5138-1-git-send-email-akuster808@gmail.com>
	<20191017184222.GN17412@denix.org>
	<2e2b16b4-fff6-b84c-1f48-0e020a0f3629@gmail.com>
	<20191017200153.GO17412@denix.org>
	<80a9db47-73ab-3326-3488-d5d9649e352f@ni.com>
	<21ecbf49-d34f-414c-bb05-636626ac6ee9@gmail.com>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <e1c28508-ddba-32c1-73da-29d4511fefe8@geanix.com>
Date: Mon, 21 Oct 2019 08:08:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <21ecbf49-d34f-414c-bb05-636626ac6ee9@gmail.com>
X-Spam-Status: No, score=-1.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	PDS_TONAME_EQ_TOLOCAL_SHORT,URIBL_BLOCKED autolearn=disabled
	version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on b0d531b295e6
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [thud][PATCH] Revert "OpkgPM: use --add-ignore-recommends to process BAD_RECOMMENDATIONS"
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
X-List-Received-Date: Mon, 21 Oct 2019 06:09:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit



On 18/10/2019 23.18, akuster808 wrote:
> I am not aware of any for thud. IIRC, this commit was a backport request
> from the community.
> 
> It would be interesting if those who have issues with thud check against
> master.
> 
> - armin

Hi,

Sorry I was slow to report :)
Was this also an issue on warrior and master?

/Sean

