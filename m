Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id 384A872F7B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 15:37:29 +0000 (UTC)
Date: Wed, 22 Mar 2017 11:37:22 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170322113722.00005429@cshore.thecshore.com>
In-Reply-To: <CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
References: <alpine.LFD.2.20.1703220707490.15622@uk63952.mitel.com>
	<CAJTo0LZe1-9x4=w5KtK0AVFo5TawB=Ceohvmw48qy+QkyrhMLg@mail.gmail.com>
	<CADkTA4Oj1mC+CMoT=DJAzsDtmCnm6TdZAO_xVFhujg+3kiwWVw@mail.gmail.com>
	<CAJTo0LaNwjnEvRRYrXwP6DJptvHc0Cm6E2QZyVEKsk1xLVoNJA@mail.gmail.com>
	<CADkTA4NhsEnk1j=_i3ahu2Lt23t802wn7yfyb5-fK9K3XAdM_Q@mail.gmail.com>
	<alpine.LFD.2.20.1703220821160.16426@uk63952.mitel.com>
	<CADkTA4OV+n4cMpR-6GTbM+Qu+bJ8TNntOXyQ7UWYDLHtB_JYfg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: design question: should layer.conf contain "PREFERRED_VERSION" settings?
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
X-List-Received-Date: Wed, 22 Mar 2017 15:37:31 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Mar 2017 08:33:17 -0400
Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> On Wed, Mar 22, 2017 at 8:24 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> 
> >
> >   proper attributions seem to have been totally lost here ...
> >
> > On Wed, 22 Mar 2017, Bruce Ashfield wrote:
> >  
> > > On Wed, Mar 22, 2017 at 8:02 AM, Burton, Ross
> > > <ross.burton@intel.com>  
> > wrote:  
> > >
> > >       On 22 March 2017 at 11:57, Bruce Ashfield <
> > bruce.ashfield@gmail.com> wrote:
> > >             So where are they supposed to be specified ? Surely
> > > not a  
> > separate distro .conf ? and most  
> > > certainly not in local.conf ... I've always been unsure of where
> > > the  
> > right place to specify  
> > > versions like that.
> > >
> > > If it were my layer I'd have an .inc file that set all the
> > > preferred versions where the defaults don't work, that the user
> > > would have to include in their distro.
> > >
> > > Aha. Kind of like the old versions file that used to float around.
> > >
> > > Seems reasonable (if a bit less automatic than someone like me who
> > > wants .. to use the layer like a black box)
> > >
> > > Luckily I have push access to that layer, so I can make a change
> > > like that ;)
> > >
> > > One final question, is it considered a design option to set those
> > > versions triggered off an IMAGE or DISTRO feature ? i.e. in
> > > anonymous python .. or is that already too late in the
> > > parsing/resolution process ?
> > >
> > > Bruce  
> >
> >   sorry, didn't mean to start something this early in the
> > morning ... ok, i did. :-)
> >
> >   in any event, can we agree that:
> >
> > 1) it's bad layer design if the simple act of including a layer in
> > bblayers.conf suddenly causes weird things to happen like the above?
> >
> > 2) regardless of how the developer eventually does it, picking up
> > those PREFERRED VERSIONS from meta-openstack should require *some*
> > kind of explicit selection?
> >  
> 
> 
> Honestly .. I disagree on #2.
> 
> The packages within the openstack layer *will not work* with other
> versions of those
> packages.
> 
> So if someone actually wants to use the functionality provided by the
> layer, they are
> not optional. And the errors/issues that you get are extremely obtuse
> and hard to
> debug. That's the design point of the layer .. it doesn't let that
> happen.
> 
> Hence making it something they must do as an extra step .. really is
> a bad idea.
> 
> It gets in the way of people picking packages out of that layer if
> they don't want to
> actually build openstack, that's the crux of the problem. But to
> answer that issue,
> that's why meta-cloud-services exists, that doesn't' force versions
> and holds the
> generally useful "cloud" packages.
> 

Wouldn't that make the openstack layer more of a distro or distro
fragment then?  Wouldn't it make sense to have a openstack.bbclass and
INHERIT in local.conf or distro.conf (depending on whether create a
distro or a one-off test?) that takes care of the specific
dependencies for that specific use-case?

Specific use-cases seems to be the point of distros and images to me,
whereas recipes should be pick and choose...

Regards,

Daniel

