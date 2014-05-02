Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 511 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 14:18:43 UTC
Received: from smtp08.online.nl (smtp08.online.nl [194.134.42.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D02B60144
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 14:18:43 +0000 (UTC)
Received: from smtp08.online.nl (localhost [127.0.0.1])
	by smtp08.online.nl (Postfix) with ESMTP id 870E166C07;
	Fri,  2 May 2014 16:10:09 +0200 (CEST)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp08.online.nl (Postfix) with ESMTP;
	Fri,  2 May 2014 16:10:09 +0200 (CEST)
Message-ID: <5363A741.6080508@topic.nl>
Date: Fri, 02 May 2014 16:10:09 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1398963761.12731.1.camel@ted> <5363970A.8000601@topic.nl>
	<CAJTo0LaYfVWuBkn4wsHcjWQvoGBv6r+U+Vd+ozb=_=ynPYvkHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaYfVWuBkn4wsHcjWQvoGBv6r+U+Vd+ozb=_=ynPYvkHQ@mail.gmail.com>
X-Online-Scanned: by Cloudmark authority (on smtp08.online.nl)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: My thoughts on the future of OE?
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
X-List-Received-Date: Fri, 02 May 2014 14:18:45 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/02/2014 03:47 PM, Burton, Ross wrote:
> On 2 May 2014 14:00, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>> Just about fifteen minutes ago I was asked the question of "Yay, I could
>> build a complete image for the board from scratch. Now how do I create and
>> run a HelloWorld application on it?"
>
> Depending on context simply adding the "tools-sdk dev-pkgs"
> IMAGE_FEATURES is sufficient to build applications on the target, as
> long as it's for the hello world or iterative development approaches.
> Obviously a recipe would need to be written at some point but getting
> a toolchain in the image for development on the target is trivial.
>
> Ross
>

That would be for "how do I create and run a HelloWorld application on 
target without using my PC at all?".

I guess I'm still a bit stuck in the era where the target had very 
limited resources. For first time users, this is much easier, and for a 
workshop, I've indeed supplied a dozen boards that had editors, 
compilers and library headers pre-installed for immediate development.

That will work for hello-world style apps, but for more complex projects 
that draw in a few dozen complex libraries (gstreamer comes to mind) 
this is not going to be very satisfactory.


What he was asking for was "How do I use the cross-compile environment 
to develop my own application and run it on the target machine?"


-- 
Mike Looijmans

