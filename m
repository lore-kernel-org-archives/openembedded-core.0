Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RWTM9-0007G7-NW
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 14:40:49 +0100
Received: by vcbfo13 with SMTP id fo13so2324402vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 05:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DZj4IPd9/1tcsI4mVEUsAsw8M09Bwvd7SEoXm4jV7WQ=;
	b=iL9uWX0PHf/IR6kOZ3CpVqIf+1UWt9v/V0V1R/8vMUYSmZ1g8+bpWrZM9Kmqsjs74E
	+cksZHBw6KpucfgPCC5KKi6D9YOX+E8Z/4ZtOkaj35bpOTDAKQaO1rTYmvyfhAjyG+/I
	kiFByXLNzBKiqHMqHrbppvlkKmmixdlKF0Yq8=
MIME-Version: 1.0
Received: by 10.52.72.227 with SMTP id g3mr9246503vdv.10.1322832845865; Fri,
	02 Dec 2011 05:34:05 -0800 (PST)
Received: by 10.52.28.238 with HTTP; Fri, 2 Dec 2011 05:34:05 -0800 (PST)
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net>
	<1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net>
	<1322771625.17484.149.camel@ted>
	<ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
Date: Fri, 2 Dec 2011 14:34:05 +0100
Message-ID: <CACW_hTauUH+MErYe+AEMYNtJZ0rZ8D6ROS7-t8q=+4t23jwrqw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Coordinating inter-layer dependencies
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Dec 2011 13:40:49 -0000
Content-Type: multipart/alternative; boundary=bcaec5016525e0036204b31c0573

--bcaec5016525e0036204b31c0573
Content-Type: text/plain; charset=ISO-8859-1

Ideally a specific revision of a layer should specify on which revision it
depends on/was tested with, so people can reproduce that same setup.

Randomly mixing revisions is a recipe for problems.
Expecting that a layer informs its users that something is changing is
probably not workable. How would a layer maintainer know what layers are
actually depending on it (especially for things like oe-core)?

If one is using the head of a layer one is living on the bleeding edge (and
hence sometimes one bleeds) (and doing production work based on that seems
unwise).

Then again, I seem to recall that somewhere in the spring we agreed on a
deprecation policy where "high impact changes" like for toolchain would be
done like:
- commit new version
- wait a while (2 weeks?)
- remove old version

thus giving people a chance to migrate.

Frans.

(PS: of course it is also possible to proceed in a perfectly synchronised
lockstep, but that probably requires some central coordination and some
staging trees or so to test against before the lockstep is performed)

--bcaec5016525e0036204b31c0573
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ideally a specific revision of a layer should specify on which revision it =
depends on/was tested with, so people can reproduce that same setup.<br><br=
>Randomly mixing revisions is a recipe for problems. <br>Expecting that a l=
ayer informs its users that something is changing is probably not workable.=
 How would a layer maintainer know what layers are actually depending on it=
 (especially for things like oe-core)?<br>
<br>If one is using the head of a layer one is living on the bleeding edge =
(and hence sometimes one bleeds) (and doing production work based on that s=
eems unwise).<br><br>Then again, I seem to recall that somewhere in the spr=
ing we agreed on a deprecation policy where &quot;high impact changes&quot;=
 like for toolchain would be done like:<br>
- commit new version<br>- wait a while (2 weeks?)<br>- remove old version<b=
r><br>thus giving people a chance to migrate.<br><br>Frans.<br><br>(PS: of =
course it is also possible to proceed in a perfectly synchronised lockstep,=
 but that probably requires some central coordination and some staging tree=
s or so to test against before the lockstep is performed)<br>

--bcaec5016525e0036204b31c0573--
