Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B3EF76AB81;
	Thu, 27 Jun 2013 16:08:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5RG8WKx024037
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2013 09:08:32 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 27 Jun 2013 09:08:32 -0700
Message-ID: <51CC637F.6010103@windriver.com>
Date: Thu, 27 Jun 2013 11:08:31 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <tsc@lists.openembedded.org>
References: <1371572589.20823.143.camel@ted> <51CC50B4.6060703@balister.org>
	<1372347506.9930.220.camel@ted>
In-Reply-To: <1372347506.9930.220.camel@ted>
Cc: openembedded-members@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE, the TSC and the future
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
X-List-Received-Date: Thu, 27 Jun 2013 16:08:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/27/13 10:38 AM, Richard Purdie wrote:
> On Thu, 2013-06-27 at 10:48 -0400, Philip Balister wrote:
>> On 06/18/2013 12:23 PM, Richard Purdie wrote:
>>> I should note that whilst I did take an action from the TSC to start a
>>> discussion and that the TSC does have some ideas in mind, I'm primarily
>>> expressing personal views here, not those of the TSC. Other TSC members
>>> are more than capable of expressing their own views!
>>
>> OpenEmbedded still needs a group of people to provide technical
>> leadership that are appointed/elected by the technical people active in
>> the project. How the TSC provides this leadership is up to them.
>
> Agreed, I still think there is a role for the TSC there, the time is
> just right to think about how it works and whether everything makes
> sense.
>
>> I'd like to see the TSC interact more with the larger community and be
>> less focused on meetings. As the OE board chair, I am fine with having
>> us chase infrastructure issues and letting the TSC focus on improving
>> OpenEmbedded.
>>
>> My challenge to the TSC is how can we improve the community of people
>> working on OpenEmbedded. Engaging with the Yocto Project has brought in
>> large numbers of new developers and I feel we have done a poor job
>> integrating them into the larger OpenEmbedded community.
>
> Personally, I don't see a split between OE and YP communities. Anyone
> submitting changes to OE-Core joins the OE-Core mailing list and becomes
> part of the OE community.
>
> I do wonder/worry whether we do get people involved into any of the
> projects as much as we could/should though. There aren't that many new
> faces taking ownership of areas of the codebase for example. We have
> gone to a lot of effort to try and make many things "just work", perhaps
> this is partly a result of that? It would be both a good and bad thing
> in that case!
>
>> I had hoped at one point we could use the Collab Summit for developer
>> meetings, like the old OEDEM (Open Embedded Developer European Meeting)
>> we had in the past. But the vibe there is all wrong and attendance is by
>> invite. Also the US West coast location is very painful for people from
>> Europe. (Mind you, Europe is painful for the US West Coast :)
>>
>> To give you an idea to kick around, we need to create some form of event
>> that corporate types can convince their managers is valuable to attend,
>> while avoiding the typical conference mode of people presenting to rooms
>> of people. My goal for such an event is have developers and the user
>> community exchanging ideas with high bandwidth channels. As opposed to
>> IRC, EMail, and telecons we normally use. (We make good use of these
>> tools, they each have limitations though)
>>
>> The word I have seen kicked around is "Unconference".
>
> I think the key here is to find someone interested in holding this event
> and that person making it happen. There are people around who could help
> but I think it would need someone from the OE community to step up and
> own it.
>
>> Like I said earlier, how the TSC achieves its mission is up to them.
>> Both of these suggestions looks sane. Having meetings for the sake of
>> having a meeting is not good.
>
> Agreed, I don't think the TSC has reached that point however there is a
> need for wider involvement of others in the community. I can only take
> silence in reply to my email as agreement although that makes it hard to
> tell :/.

In the last couple of years, I can only remember two or three meetings that we 
have nothing to discuss and we simply adjourned the meeting...

The key thing is that the roll of the TSC from technical body and necessary 
"fix-it" specialists is changing.  And we need to figure out how to better to 
get help when something is found to be in need of work.

Some of this will no doubt turn out to be janitorial type work.. and some of it 
may be new development.

>> The TSC is free to call on people as they see fit, however I would
>> expect any selection process to be very transparent and open to all
>> interested participants. Maybe a good first step would be document who
>> is doing what. It would be nice to have a web page on the wiki defining
>> layer maintainers, branch maintainers, active autobuilders etc. I know
>> all this is in readme;s etc, but having a central index of active people
>> would be really helpful to show people the extent of the OpenEmbedded
>> community.
>
> Who is going to do it? The information is all there, its perfectly
> possible. I'd like to see new faces involved though, the existing TSC
> members and board members do enough already. Much as I want to help with
> many different things, I don't scale and the usual suspects aren't going
> to either indefinitely :/.

I'd propose that we hold an open IRC meeting (similar to what was discussed in 
RP's original proposal) and attempt to gauge interest/self organize.  If a once 
a month open IRC meeting makes sense, great.. if people want to do a once a week 
sync-up, etc good as well.

Somehow we need to get more communication going between the members, 
contributors, TSC and general interested people.

> Cheers,
>
> Richard
>
>
> _______________________________________________
> tsc mailing list
> tsc@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/tsc
>


