Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id B1D61618B5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 14:48:20 +0000 (UTC)
Received: (qmail 5147 invoked by uid 1003); 27 Jun 2013 14:45:04 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@96.240.165.115)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Jun 2013 14:45:04 -0000
Message-ID: <51CC50B4.6060703@balister.org>
Date: Thu, 27 Jun 2013 10:48:20 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-members@lists.openembedded.org
References: <1371572589.20823.143.camel@ted>
In-Reply-To: <1371572589.20823.143.camel@ted>
X-Enigmail-Version: 1.5.1
Cc: tsc <tsc@lists.openembedded.org>,
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
X-List-Received-Date: Thu, 27 Jun 2013 14:48:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/18/2013 12:23 PM, Richard Purdie wrote:
> I think its fair to say that OpenEmbedded has changed quite a bit over
> the last few years. Prior to the Yocto Project, OE struggled to figure
> out how to engage with the commercial side of the ecosystem and how to
> scale and I think there have been many positive changes in the way
> everything works, not least with the layers approach and the pull model
> for changes.
> 
> Whilst the ecosystem has changed, the structures that make up OE such as
> the TSC have not changed that much. They were setup to address problems
> which in some cases no longer exist for example.
> 
> We're coming up to the next round of TSC elections, the board is aware
> of this but have asked that we figure out the TSC's role going forward
> before those elections.
> 
> There has been limited discussion about this on the members list
> previously, it was met with a lot of silence but I do think the time is
> right to think about things a bit.

In case people are not aware, this is a description if the TSC:

http://www.openembedded.org/wiki/TSC

> 
> I should note that whilst I did take an action from the TSC to start a
> discussion and that the TSC does have some ideas in mind, I'm primarily
> expressing personal views here, not those of the TSC. Other TSC members
> are more than capable of expressing their own views!
> 

OpenEmbedded still needs a group of people to provide technical
leadership that are appointed/elected by the technical people active in
the project. How the TSC provides this leadership is up to them.

I'd like to see the TSC interact more with the larger community and be
less focused on meetings. As the OE board chair, I am fine with having
us chase infrastructure issues and letting the TSC focus on improving
OpenEmbedded.

My challenge to the TSC is how can we improve the community of people
working on OpenEmbedded. Engaging with the Yocto Project has brought in
large numbers of new developers and I feel we have done a poor job
integrating them into the larger OpenEmbedded community.

I had hoped at one point we could use the Collab Summit for developer
meetings, like the old OEDEM (Open Embedded Developer European Meeting)
we had in the past. But the vibe there is all wrong and attendance is by
invite. Also the US West coast location is very painful for people from
Europe. (Mind you, Europe is painful for the US West Coast :)

To give you an idea to kick around, we need to create some form of event
that corporate types can convince their managers is valuable to attend,
while avoiding the typical conference mode of people presenting to rooms
of people. My goal for such an event is have developers and the user
community exchanging ideas with high bandwidth channels. As opposed to
IRC, EMail, and telecons we normally use. (We make good use of these
tools, they each have limitations though)

The word I have seen kicked around is "Unconference".


> In brief summary the TSC has been doing two main things, acting as a
> task force and also being able to make a decision when needed. The
> latter has not happened much at all, the main work was as a task force
> on various issues, firstly engaging with the Yocto Project and figuring
> that out, more recently dealing with infrastructure issues and generally
> ensuring the health of OE.
> 
> I don't think the task force should be limited to the TSC members
> although it can be lead by them (or delegated). As such I think the TSC
> would like to see that element get opened up to a public IRC meeting,
> maybe monthly at a set time when people get together and discuss those
> topics. The TSC members could be responsible for giving that process and
> meeting some kind of structure but it would be open to all.
> 
> The decision making element of the TSC would remain with them, likely
> done by calling a special meeting as needed (we haven't needed many
> official decisions).
> 
> At this point I'll open that to discussion. Any objections or other
> proposals?
> 

Like I said earlier, how the TSC achieves its mission is up to them.
Both of these suggestions looks sane. Having meetings for the sake of
having a meeting is not good.

The TSC is free to call on people as they see fit, however I would
expect any selection process to be very transparent and open to all
interested participants. Maybe a good first step would be document who
is doing what. It would be nice to have a web page on the wiki defining
layer maintainers, branch maintainers, active autobuilders etc. I know
all this is in readme;s etc, but having a central index of active people
would be really helpful to show people the extent of the OpenEmbedded
community.

Philip

> Speaking of TSC elections, I know I'm due for re-election first. I'm
> also due to be away for a few weeks shortly so I'd like to make it known
> that I would like to stand for re-election. I've hopefully done some
> good for OE over what amounts to nearly a decade (scary when put like
> that!) and I'm not quite done yet! :)
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-members mailing list
> Openembedded-members@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-members
> 

