Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa09-04.prod.phx3.secureserver.net
	(p3plsmtpa09-04.prod.phx3.secureserver.net [173.201.193.233])
	by mail.openembedded.org (Postfix) with ESMTP id 497AB65D4F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Nov 2014 16:53:31 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa09-04.prod.phx3.secureserver.net with 
	id FstW1p0030BVjqb01stWjP; Sat, 15 Nov 2014 09:53:31 -0700
Message-ID: <54678509.3080902@pabigot.com>
Date: Sat, 15 Nov 2014 10:53:29 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <5466E6B7.2050609@pabigot.com>
	<1416068535.28563.0.camel@linuxfoundation.org>
In-Reply-To: <1416068535.28563.0.camel@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: why does useradd.bbclass loop retrying its commands?
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
X-List-Received-Date: Sat, 15 Nov 2014 16:53:37 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/2014 10:22 AM, Richard Purdie wrote:
> On Fri, 2014-11-14 at 23:37 -0600, Peter A. Bigot wrote:
>> The useradd, groupadd, and groupmems commands in useradd.bbclass are
>> executed in a loop with up to 10 failed attempts before they give up.
>> This appears to have always been the case, as long as that file has been
>> present.
>>
>> Is there any reason why an initial failed attempt to execute one of
>> these commands would be expected to succeed on retry, other than because
>> delaying failure gives a chance for concurrently executing task to
>> complete and so satisfy a dependency?
> Another recipe can be altering the files and holding the lock so in
> theory, yes, the retries can help.

Makes sense.  I do see that extrausers.bbclass has a comment explaining 
why it only passes retries=1.

Peter

