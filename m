Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id BC4DA73223
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 May 2015 16:45:18 +0000 (UTC)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 7CA0C1A004A;
	Sat, 30 May 2015 18:45:17 +0200 (CEST)
Message-ID: <5569E91D.8070104@topic.nl>
Date: Sat, 30 May 2015 18:45:17 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Phil Blundell <pb@pbcl.net>
References: <5568AEC2.7090606@topic.nl> <1432937385.2461.36.camel@pbcl.net>
In-Reply-To: <1432937385.2461.36.camel@pbcl.net>
X-Online-CMAE-Analyze: v=2.1 cv=BsVgutj5 c=1 sm=0 tr=0
	a=M4Ogp90E6oguCDKW2C1mSw==:117 a=M4Ogp90E6oguCDKW2C1mSw==:17
	a=hTJJpgObMeYA:10 a=N659UExz7-8A:10 a=NEAV23lmAAAA:8
	a=nsSocbw-zJU0hF0PfJwA:9 a=pILNOxqGKmIA:10
X-Online-Scanned: by Cloudmark authority (on smtp.online.nl)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: boost fails to build on MIPS
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
X-List-Received-Date: Sat, 30 May 2015 16:45:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 30-05-15 00:09, Phil Blundell wrote:
> On Fri, 2015-05-29 at 20:24 +0200, Mike Looijmans wrote:
>> On current OE master, boost fails to build, because something attempts
>> to add "-m32" to the gcc commandline for no apparent reason.
>>
>> Can anyone confirm this, or am I the only MIPS user in the world?
>
> This is an upstream boost bug.  See the entertaining history at:
>
> https://github.com/boostorg/build/commit/9576ca216cae888d7efb5da97c009c245c5ba567

Strange, I added this fix as a patch to bjam (which seems to be the one 
causing all the troubles), but still get the same build error, even 
after cleansstate both bjam-native and boost.

Maybe some cross-compiler stupidity like that it looks at the build 
machine's arch instead of the target host's?



-- 
Mike Looijmans

