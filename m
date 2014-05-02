Return-Path: <philip@balister.org>
X-Greylist: delayed 400 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 May 2014 16:11:46 UTC
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 3ADB8606A2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 May 2014 16:11:46 +0000 (UTC)
Received: (qmail 28158 invoked by uid 1003); 2 May 2014 16:05:06 -0000
Received: from unknown (HELO ?10.16.37.49?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	2 May 2014 16:05:06 -0000
Message-ID: <5363C230.5070508@balister.org>
Date: Fri, 02 May 2014 09:05:04 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Mike Looijmans <mike.looijmans@topic.nl>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <1398963761.12731.1.camel@ted>
	<5363970A.8000601@topic.nl>	<CAJTo0LaYfVWuBkn4wsHcjWQvoGBv6r+U+Vd+ozb=_=ynPYvkHQ@mail.gmail.com>
	<5363A741.6080508@topic.nl>
In-Reply-To: <5363A741.6080508@topic.nl>
X-Enigmail-Version: 1.6
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
X-List-Received-Date: Fri, 02 May 2014 16:11:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 05/02/2014 07:10 AM, Mike Looijmans wrote:
> On 05/02/2014 03:47 PM, Burton, Ross wrote:
>> On 2 May 2014 14:00, Mike Looijmans <mike.looijmans@topic.nl> wrote:
>>> Just about fifteen minutes ago I was asked the question of "Yay, I could
>>> build a complete image for the board from scratch. Now how do I
>>> create and
>>> run a HelloWorld application on it?"
>>
>> Depending on context simply adding the "tools-sdk dev-pkgs"
>> IMAGE_FEATURES is sufficient to build applications on the target, as
>> long as it's for the hello world or iterative development approaches.
>> Obviously a recipe would need to be written at some point but getting
>> a toolchain in the image for development on the target is trivial.
>>
>> Ross
>>
> 
> That would be for "how do I create and run a HelloWorld application on
> target without using my PC at all?".
> 
> I guess I'm still a bit stuck in the era where the target had very
> limited resources. For first time users, this is much easier, and for a
> workshop, I've indeed supplied a dozen boards that had editors,
> compilers and library headers pre-installed for immediate development.
> 
> That will work for hello-world style apps, but for more complex projects
> that draw in a few dozen complex libraries (gstreamer comes to mind)
> this is not going to be very satisfactory.
> 
> 
> What he was asking for was "How do I use the cross-compile environment
> to develop my own application and run it on the target machine?"
> 
> 

https://github.com/balister/meta-sdr/wiki/CrossCompile

IS what I tell people for GNU Radio. The generic method should be OK for
other cases. I need to collect techniques to move output onto the target.

Philip

