Return-Path: <david.c.stewart@intel.com>
X-Greylist: delayed 599 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 01 May 2014 17:54:23 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 58E3C60E1E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 May 2014 17:54:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 May 2014 10:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,966,1389772800"; d="scan'208";a="504471722"
Received: from orsmsx101.amr.corp.intel.com ([10.22.225.128])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2014 10:44:23 -0700
Received: from orsmsx151.amr.corp.intel.com (10.22.226.38) by
	ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 1 May 2014 10:44:23 -0700
Received: from orsmsx113.amr.corp.intel.com ([169.254.7.62]) by
	ORSMSX151.amr.corp.intel.com ([169.254.7.229]) with mapi id
	14.03.0123.003; Thu, 1 May 2014 10:44:23 -0700
From: "Stewart, David C" <david.c.stewart@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] My thoughts on the future of OE?
Thread-Index: AQHPZV9svujzIWnQEkyMd7pBcDCT9Jsr/ziA
Date: Thu, 1 May 2014 17:44:22 +0000
Message-ID: <CF87D471.90C19%david.c.stewart@intel.com>
References: <1398963761.12731.1.camel@ted>
In-Reply-To: <1398963761.12731.1.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Microsoft-MacOutlook/14.4.1.140326
x-originating-ip: [10.24.4.140]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 01 May 2014 17:54:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <A9366CCC60DE5E4FA5C745540D823F3B@intel.com>
Content-Transfer-Encoding: quoted-printable

davest throws in his two cents below...

On 5/1/14, 10:02 AM, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>I was asked what I thought were things that needed discussion at OEDAM.
>Sadly I won't be there but I thought it might help to write down my
>thoughts in a few areas.
>
>Developer Workflow
>------------------
>
>Firstly, I think the big piece we need to address as a project is
>"developer workflow" as this is where people are struggling using it.
>
>Unfortunately "developer workflow" means different things to different
>people? Which one do I mean then? I actually mean all of them. As some
>examples:
>
>-----------------------------------------------------------------------
>
>* A kernel developer wanting to rebuild a kernel
>  [on/off target, with the ADT/SDK or a recipe]
>* A kernel developer wanting to build a kernel module
>  [on/off target, with the ADT/SDK or a recipe]
>* An application developer wanting to build a single App
>  [on/off target, with the ADT/SDK or a recipe]
>* An application developer wanting to (re)build a library, linking an
>  App to it
>  [on/off target, with the ADT/SDK or a recipe]
>* A user wanting to rebuild an image with a package added
>  [on and off target - feeds or a build]
>* A user wanting to rebuild an image with more advanced changes
>
>The user may want to skip the image creation step and deploy data
>straight onto an existing running target using rsync.
>
>Their application/kernel may be in an external directory already under
>SCM control.
>
>There are requests for "real time" viewing of the build logs
>
>There are requests for the python devshell to better be able to poke
>around the datastore
>
>There are requests for a shell like environment with commands
>interacting with a memory resident bitbake.
>
>In a team environment how should patch review work? Which tools would we
>recommend to help people? Where does and autobuilder fit into this?
>Gerrit? How to handle bugs/regressions/features?
>
>Also, when something fails, how do they get help and fix it? My dream
>here is an error reporting server and over time, we can attach "fixes"
>to those failures showing people how to potentially fix their problems.

If I were managing engineers creating an embedded device (which I'm not),
and let's say I had a team of 10 engineers working on some application /
middleware / service which goes into a line of devices, I might add:

* If I need to add a recipe to my standard image builds or patch one, how
do I communicate that fact to the maintainer of my product's metadata?

* If a developer is ready to merge their code with the device's master
branch, how can this trigger an automated rebuild?

I have a feeling that OE today is well suited for a single developer or a
really small team, but it doesn't scale up particularly well to larger
teams. At least, not without a lot of work. Is there anything we can do to
help that?

>
>
>-----------------------------------------------------------------------
>
>So my first ask is that we actually try and write down all these
>different cases which is no small task in itself. I've a start of a list
>above, we should probably put this into the wiki and have people add
>their own use cases (or use cases of those around them in their company
>etc.). The trouble is there are some many different variants!
>
>Once we have some idea of the cases, we can start to put together some
>kind of plan about how we intend to help the given use cases and to try
>and prioritise them. Perhaps we should put some kind of weighting
>against them in the wiki and people can increase the numbers of say
>their top three desires.
>
>Whilst this looks like an impossible problem, the good news is that I
>believe we can solve it and we actually already have a rather powerful
>toolbox to help work on it. I have a rough idea of a roadmap that can
>move us forward:
>
>a) locked sstate - I know its not in master yet but I believe this is
>key to allowing some of the use cases where you want to change some
>number of things but keep the rest of the system the same.
>
>b) Rework the ADT so it consists of a build of prebuilt objects and
>locked sstate and bitbake is hiding behind the scenes. There would be
>some kind of setup command (which would extract the toolchain and core
>libs for example) and then they could use it like the existing ADT.
>
>c) We could then document workflows where you could build an extra app
>into an image and so on.
>
>d) In parallel with the above, we need to look at things like
>externalsrc and see if there are ways we can better integrate it. Maybe
>some helper scripts? Can it work with the new ADT/SDK?
>
>Hopefully the above is enough to seed some discussion! :)
>
>
>Automated XYZ
>-------------
>
>We've made great steps forward with the automation we have. I would like
>to see us move forward in a few key areas:
>
>a) Allow automated ptest running as part of our qemu image tests. This
>   is harder since it means:
>
>     i) installing ptest packages
>     ii) collecting up the results in some wya that can be parsed
>     iii) allow comparison of existing results with previous runs
>     iv) report regressions
>
>b) Implement automated recipe upgrade detection. We have proof of
>   concept code for this and there are some logical steps for how to
>   proceed:
>
>     i) I'd like to see it integrated into the fetcher codebase. There
>        are some proof of concept patches at:
>       =20
>http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=3Drpurdie/t222=
&i
>d=3D46ba4664a8b1d2d59de5fba92e7e77929a0ee24d
>        (and the preceding patches)
>     ii) We will probably need to markup the recipes themselves with
>         some new data. Some example data:
>        =20
>http://git.yoctoproject.org/cgit.cgi/poky/tree/meta-yocto/conf/distro/incl
>ude/package_regex.inc
>
>     iii) Feed the data from the above code into the package reporting
>system
>
>   The parts are there and have been proven to roughly work. The next
>   step would be to bring them into the core and start using them
>   properly. Its not an easy thing to get right but I think the
>   potential benefits are worth it.
>
>c) Implement code which attempts automated package upgrades and then
>   reports the success/failure. This depends on a) and b) for best
>   results.
>
>d) Continue to move forward with automated testing on real hardware
>   too. The idea is that the above tests in a) should also be usable
>   here so we can test significantly more of the software stack than
>   we've ever been able to before.
>
>e) Continue to add test cases for:
>
>     i) the images (ptest and others)
>     ii) oe-selftest
>     iii) bitbake-selftest
>     iv) add new tests like tests for the toaster UI
>
>The basic idea here is that existing work done manually isn't going to
>scale. We have all the foundations to be able to do something few
>projects have ever done before and automate this on a scale not
>previously seen. This means it would stop people from having to do
>"boring" work and concentrate on the interesting pieces where the
>problems are. It also means we should be able to track down regressions
>much earlier and deal with them more quickly.
>
>How soon will all of this work? Probably not overnight but I believe its
>something to aim for.
>
>
>Contributors to the Project
>---------------------------
>
>This is an open question. How do we attract more developers to work on
>the project? This applies both to layers like OE-Core and outside that,
>we could all use some help in the maintainership, the development and
>the testing. What blocks people from joining us? How can we encourage
>more people to participate?
>
>Unfortunately when things are working for people they tend to think that
>ok, they'll go and do something else (like work on their product!) but
>is there a way we could get some involvement from them? Lots of small
>pieces of help could build to a large whole...
>
>
>Conclusion
>----------
>
>I've probably rambled enough. The project is I believe in a strong
>position but the above are areas I think we need to work on if we want
>to truly fulfil the project's potential.
>
>Cheers,
>
>Richard
>
>
>
>
>
>
>
>
>--=20
>_______________________________________________
>Openembedded-core mailing list
>Openembedded-core@lists.openembedded.org
>http://lists.openembedded.org/mailman/listinfo/openembedded-core


