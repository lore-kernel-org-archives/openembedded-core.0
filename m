Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8D852608CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 14:14:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JEK7lW026185; Wed, 19 Jun 2013 15:20:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id orZ5_JBW1eup; Wed, 19 Jun 2013 15:20:06 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JEK0wR026162
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 19 Jun 2013 15:20:01 +0100
Message-ID: <1371651221.20823.190.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Saul Wold <sgw@linux.intel.com>
Date: Wed, 19 Jun 2013 15:13:41 +0100
In-Reply-To: <51C1B7FE.1020602@linux.intel.com>
References: <1371647117.20823.182.camel@ted> <51C1B7FE.1020602@linux.intel.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utility-tasks: Add recideptask flag for fetchall/checkuriall
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
X-List-Received-Date: Wed, 19 Jun 2013 14:14:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-06-19 at 06:54 -0700, Saul Wold wrote:
> On 06/19/2013 06:05 AM, Richard Purdie wrote:
> >   addhandler prexport_handler
> > -prexport_handler bb.event.RecipeParsed bb.event.ParseStarted bb.event.ParseCompleted"
> > +prexport_handler[eventmask] = "bb.event.RecipeParsed bb.event.ParseStarted bb.event.ParseCompleted"
> > diff --git a/meta/classes/utility-tasks.bbclass b/meta/classes/utility-tasks.bbclass
> > index bb26eb7..507e0f1 100644
> > --- a/meta/classes/utility-tasks.bbclass
> > +++ b/meta/classes/utility-tasks.bbclass
> > @@ -48,6 +48,7 @@ python do_checkuri() {
> >
> >   addtask checkuriall after do_checkuri
> >   do_checkuriall[recrdeptask] = "do_checkuriall do_checkuri"
> > +do_checkuriall[recideptask] = "do_${BB_DEFAULT_TASK}"
> >   do_checkuriall[nostamp] = "1"
> >   do_checkuriall() {
> >   	:
> > @@ -55,6 +56,7 @@ do_checkuriall() {
> >
> >   addtask fetchall after do_fetch
> >   do_fetchall[recrdeptask] = "do_fetchall do_fetch"
> > +do_fetchall[recideptask] = "do_${BB_DEFAULT_TASK}"
> 
> Would this change be needed in some of the distrodata tasks also? 
> Mostly they operate on world or universe and not images, but I could see 
> someone trying to get that info for a given image.

Possibly, yes.

Cheers,

Richard


