Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 2717B6E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 17:06:18 +0000 (UTC)
Received: (qmail 23259 invoked by uid 1003); 24 Apr 2017 17:06:19 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@71.171.14.190)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	24 Apr 2017 17:06:19 -0000
To: Trevor Woerner <twoerner@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <CALxi_JEEcpVbqSuaUbqd-GrNw7jdn2JU196tofw3jYHtowhMGw@mail.gmail.com>
	<CAJTo0LbK23V+To_EhP_jOT89a5Uz+TPSqaiCax-tGXz5HyZ2qg@mail.gmail.com>
	<CALxi_JE_6qJVza0p825Ooe3YgZn89af3Cuxbpp0g=TydJtgOpA@mail.gmail.com>
	<CAJTo0LbgWj0uz8XrB5ofGOCs6FTtACE4g4vbXxVSrGu-yN6pQw@mail.gmail.com>
	<CAHUNapT-aiuWn5GZ=LvdunfGoODChH9U767aHCZyt9mdrB0k5Q@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <4d387a04-89f4-cbba-9bec-2062d726ee49@balister.org>
Date: Mon, 24 Apr 2017 13:06:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapT-aiuWn5GZ=LvdunfGoODChH9U767aHCZyt9mdrB0k5Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Add LAPACK/ATLAS/BLAS library to OE-CORE
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
X-List-Received-Date: Mon, 24 Apr 2017 17:06:20 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 04/24/2017 12:05 PM, Trevor Woerner wrote:
> On Mon, Apr 24, 2017 at 10:32 AM, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 24 April 2017 at 15:29, david bensoussan <minipada@gmail.com> wrote:
>>>
>>> I'm going to make some tests if it's possible and if performance is good
>>> doing so. If not, from what I understand, the PR will probably be refused?
>>
>>
>> For oe-core, yes.  There are other layers, such as meta-oe, but I'd actually
>> suggest as you'll be shipping binaries in the layer that you write your own
>> layer and publish it.
> 
> 
> Or meta-ros?
> https://layers.openembedded.org/layerindex/branch/master/layer/meta-ros/
> 

I'd rather not see them in meta-ros. I think they will have a broader
audience. ATLAS comes up form time to time and having something we can
work with will be helpful. I'd like to get scipy built one day and think
I need ATLAS for that.

Philip

