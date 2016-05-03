Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id C094260043
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 18:49:05 +0000 (UTC)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6M00LTA6X3Q160@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 03 May 2016 13:48:39 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=8nJEP1OIZ-IA:10 a=yrkiwgmsf1kA:10	a=VwQbUJbxAAAA:8 a=CEtC_dnCAAAA:8
	a=JqEG_dyiAAAA:8 a=jU4qhlNgAAAA:8	a=Q4-j1AaZAAAA:8
	a=knBSBKHGuYGI9Ncj7G0A:9 a=wPNLvfGTeEIA:10
Received: by 100.15.86.14 with SMTP id 2e379934; Tue, 03 May 2016 18:48:39 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B78BA161FDE; Tue,
	3 May 2016 14:48:38 -0400 (EDT)
Date: Tue, 03 May 2016 14:48:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20160503184838.GE27602@denix.org>
References: <alpine.LFD.2.20.1605031245360.6672@localhost.localdomain>
	<CADkTA4PPYfetBymZ1mii_sc7f71za-V0dBbcgApHyhDHwxKyVw@mail.gmail.com>
	<alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
MIME-version: 1.0
In-reply-to: <alpine.LFD.2.20.1605031421460.12750@localhost.localdomain>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: clarifying details about "is not set" lines in kernel config fragment files
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
X-List-Received-Date: Tue, 03 May 2016 18:49:05 -0000
Content-type: text/plain; charset=iso-8859-1
Content-disposition: inline
Content-transfer-encoding: 8bit

On Tue, May 03, 2016 at 02:27:38PM -0400, Robert P. J. Day wrote:
> On Tue, 3 May 2016, Bruce Ashfield wrote:
> 
> > On Tue, May 3, 2016 at 1:04 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> >         oddly, in the current YP kernel dev manual, i don't see the
> >       phrase "is not set" explained anywhere in the entire doc,
> >       which is weird since it seems like it would be important.
> >
> > The manuals don't cover the mechanics of how the mainline kernel is
> > configured. Just the same way the don't cover the configuration
> > language for any number of packages in the system.
> 
>   assuming i'm understanding your position, that's where i'm going to
> *strongly* disagree. people who work with the mainline kernel in a
> non-OE environment don't use kernel config fragment files. period.
> AFAIK (and correct me if i'm wrong), .cfg kernel config fragment files
> are exclusively an OE/YP thing, so there is no reason for normal
> kernel developers to understand how they work.

You are *strongly* wrong! I know many kernel developers using this:
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/scripts/kconfig/merge_config.sh


>   knowing how regular kernel configuration works, and how kernel
> config fragment files are processed to aid in that process, are two
> *entirely* different things, and how those files are processed is,
> IMHO, most assuredly the responsibility of the OE/YP docs to explain.
> 
> rday
> 
> -- 
> 
> ========================================================================
> Robert P. J. Day                                 Ottawa, Ontario, CANADA
>                         http://crashcourse.ca
> 
> Twitter:                                       http://twitter.com/rpjday
> LinkedIn:                               http://ca.linkedin.com/in/rpjday
> ========================================================================

> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


