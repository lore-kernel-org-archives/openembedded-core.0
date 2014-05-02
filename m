Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 541 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 13:10:00 UTC
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 818E0605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 13:10:00 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id 36ADF8E5ED;
	Fri,  2 May 2014 15:00:59 +0200 (CEST)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP;
	Fri,  2 May 2014 15:00:58 +0200 (CEST)
Message-ID: <5363970A.8000601@topic.nl>
Date: Fri, 02 May 2014 15:00:58 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1398963761.12731.1.camel@ted>
In-Reply-To: <1398963761.12731.1.camel@ted>
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
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
X-List-Received-Date: Fri, 02 May 2014 13:10:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2014 07:02 PM, Richard Purdie wrote:
> I was asked what I thought were things that needed discussion at OEDAM.
> Sadly I won't be there but I thought it might help to write down my
> thoughts in a few areas.
>
> Developer Workflow
> ------------------
>
> Firstly, I think the big piece we need to address as a project is
> "developer workflow" as this is where people are struggling using it.
>
> Unfortunately "developer workflow" means different things to different
> people? Which one do I mean then? I actually mean all of them. As some
> examples:

Just about fifteen minutes ago I was asked the question of "Yay, I could 
build a complete image for the board from scratch. Now how do I create 
and run a HelloWorld application on it?"

The answer I was forced to give him was still horribly complicated - 
create a repository, create a recipe, add the recipe, build the image, 
and loop until it works. That's the method I usually follow myself, but 
there are probably a few dozen others.

I expect him back in about an hour asking: "How can I quickly recompile 
and run after changing the code?"

My answer again is going to be disappointing to him again. I'll be 
forced to say he'll have to commit the change and build the image again.

After the weekend he'll ask me how to debug his code on target. The 
answer to that? Well, I have the whole weekend to think about that.


This is basically what scares away new developers. It's easy to compile 
an image, but it there isn't an obvious way to start developing your own 
application.


Don't get me wrong. OE is still by far the best cross-compile 
environment in existence.


Mike.

