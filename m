Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1RH37d-0007LY-8t; Fri, 21 Oct 2011 02:38:05 +0200
Received: by gyc15 with SMTP id 15so3260659gyc.6
	for <multiple recipients>; Thu, 20 Oct 2011 17:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Opzi3QKP5MWAsJWIbfHyDewJe1b5ymebvn7Cr+VwwLQ=;
	b=OtqwxUKQgkfNgr2EDK99jk6HeBW8ozpkYxS+zH7HZg5bq88WQDaX/hpb4+okB+WQDw
	0r/02lBu1Qp4EsiQ2EGT2bLlKnjvHctCdRQ7o6CU9OVAMF2W/irRWx1QDhLKo8TvrOtO
	1v1TAT/3jzb+7g6GvzZFAhIgi666uuvgnmB2Y=
Received: by 10.68.32.138 with SMTP id j10mr17782176pbi.81.1319157131087; Thu,
	20 Oct 2011 17:32:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 17:31:41 -0700 (PDT)
In-Reply-To: <20111021002021.GV26170@denix.org>
References: <CAMKF1sqwC26Qo2MPCmNcwvsqweC-8F1P2y9myNOgihrBtCdTXA@mail.gmail.com>
	<20111021002021.GV26170@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 17:31:41 -0700
Message-ID: <CAMKF1srCsoXv+kiYypb1j3kHeo0_Opr6oR4MzARx0tuQgir71w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [ANNOUNCEMENT] New Patchwork available for testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Oct 2011 00:38:05 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Oct 20, 2011 at 5:20 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Mon, Oct 17, 2011 at 12:06:04PM -0700, Khem Raj wrote:
>> Hi
>>
>> Here is a new instance of patchwork accessible at
>> http://patchwork.openembedded.org
>>
>> This instance uses same database therefore it should not be any different than
>> existing patches.openembedded.org
>>
>> However with the new patchwork you will see additionally "Mail settings"
>> link on the right hand upper corner this could be used to subscribe to patchwork
>> activity. This is a new feature so try it out and report any issues.
>>
>> The patch capturing is done by the new patchwork.
>>
>> reiterating what Koen already announced, git post-recieve hook is
>> installed for meta-openembedded repository to interact with patchwork
>> on push so it will change the state of patch to "Accepted" once
>> it has been pushed. This should avoid lot of manual work for the maintainers
>
> Does this work for pull requests?

if patch appears in patchwork yet it will

>

> --
> Denys
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


