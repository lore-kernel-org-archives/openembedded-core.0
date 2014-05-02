Return-Path: <ml@communistcode.co.uk>
X-Greylist: delayed 2175 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 14:59:17 UTC
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 78662606D5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 14:59:17 +0000 (UTC)
Message-ID: <5363AA55.4070305@communistcode.co.uk>
Date: Fri, 02 May 2014 15:23:17 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1398963761.12731.1.camel@ted> <5363970A.8000601@topic.nl>
	<CAJTo0LaYfVWuBkn4wsHcjWQvoGBv6r+U+Vd+ozb=_=ynPYvkHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LaYfVWuBkn4wsHcjWQvoGBv6r+U+Vd+ozb=_=ynPYvkHQ@mail.gmail.com>
Subject: Re: My thoughts on the future of OE?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ml@communistcode.co.uk
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 May 2014 14:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/05/14 14:47, Burton, Ross wrote:
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

Or generating and installing the SDK, then develop -> cross compile ->
copy to target -> run -> rinse and repeat.

Then when working, update your applications recipe to point to the new
revision and have a "clean" production image pop out.

The pain points with this come when you want to use new libraries etc
and you have to do a rootfs + sdk rebuild and upgrade but in reality
these are few and far between.

Cheers,

-- 
  Jack Mitchell (jack@embed.me.uk)
  Embedded Systems Engineer
  Cambridgeshire, UK
  http://www.embed.me.uk
-- 

