Return-Path: <pidge@toganlabs.com>
X-Greylist: delayed 1125 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 02 Nov 2016 23:01:26 UTC
Received: from nov-007-i517.relay.mailchannels.net
	(nov-007-i517.relay.mailchannels.net [46.232.183.71])
	by mail.openembedded.org (Postfix) with ESMTP id 028D771B5C
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 23:01:24 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 199D81213A4;
	Wed,  2 Nov 2016 22:42:37 +0000 (UTC)
Received: from hp181.hostpapa.com (ip-10-229-10-199.us-west-2.compute.internal
	[10.229.10.199])
	by relay.mailchannels.net (Postfix) with ESMTPA id 553FF121E43;
	Wed,  2 Nov 2016 22:42:36 +0000 (UTC)
X-Sender-Id: hostpapa|x-authuser|pidge@toganlabs.com
Received: from hp181.hostpapa.com (hp181.hostpapa.com [10.133.132.59])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
	by 0.0.0.0:2500 (trex/5.7.8); Wed, 02 Nov 2016 22:42:37 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostpapa|x-authuser|pidge@toganlabs.com
X-MailChannels-Auth-Id: hostpapa
X-MC-Loop-Signature: 1478126556675:3179805848
X-MC-Ingress-Time: 1478126556675
Received: from [37.228.247.203] (port=27286 helo=[192.168.0.60])
	by hp181.hostpapa.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.87)
	(envelope-from <pidge@toganlabs.com>)
	id 1c24Ev-003Qlg-Bd; Wed, 02 Nov 2016 23:42:38 +0100
Message-ID: <1478126553.32080.27.camel@toganlabs.com>
From: Beth 'pidge' Flanagan <pidge@toganlabs.com>
Reply-To: pidge@toganlabs.com
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 02 Nov 2016 22:42:33 +0000
In-Reply-To: <CAJTo0LZ-LDz2_=g73WRQQCg3Hv32CYONnu-WbzDrOOJKmRa4hQ@mail.gmail.com>
References: <1478099232-23987-1-git-send-email-ross.burton@intel.com>
	<1478111855.32080.20.camel@toganlabs.com>
	<CAJTo0LZ-LDz2_=g73WRQQCg3Hv32CYONnu-WbzDrOOJKmRa4hQ@mail.gmail.com>
Organization: toganlabs.com
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AuthUser: pidge@toganlabs.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/license: copy licenses even if there are no checksummed files
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
X-List-Received-Date: Wed, 02 Nov 2016 23:01:29 -0000
Content-Type: multipart/alternative; boundary="=-cOyZl+ji4vdECi2oOkKS"

--=-cOyZl+ji4vdECi2oOkKS
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-02 at 20:22 +0000, Burton, Ross wrote:
>=20
> On 2 November 2016 at 18:37, Beth 'pidge' Flanagan=20
> om> wrote:
> > It's been a bit since I've looked at license.bbclass, but I guess
> > my
> > question here is this seems to take out all notification that a
> > recipe
> > doesn't have a LIC_FILES_CHKSUM, correct?
> >=20
> > I'd rather we maybe kept the note in and maybe whitelisted recipes
> > that
> > did interesting things so that didn't appear than just ignored when
> > a
> > recipe was missing it.=C2=A0
> >=20
> > Because if we don't at least bb.note it, I can see people just
> > ignoring
> > it entirely (which would be bad in a lot of ways)
> >=20
> No, this check was belt-and-braces (the other check is a
> bb.error()).=C2=A0 Also bb.note() from tasks don't appear in the user-
> visible log by default, you've got to dig into the task log to see
> them which is buried in the work directories.
Ah, correct (I generally see them since I'm piping most of the time).
Ok, in that case then yes, that makes sense.
-b
> > Ross
>=20

--=-cOyZl+ji4vdECi2oOkKS
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Wed, 2016-11-02 at 20:22 +0000, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On 2 November 2016 at 18:37, Beth 'pidge' Flanagan <span dir="ltr">&lt;<a href="mailto:pidge@toganlabs.com" target="_blank">pidge@toganlabs.com</a>&gt;</span> wrote:<br><blockquote type="cite"><div id="gmail-:1o8" class="gmail-a3s gmail-aXjCH gmail-m1582655997bb7aaa">It's been a bit since I've looked at license.bbclass, but I guess my<br>
question here is this seems to take out all notification that a recipe<br>
doesn't have a LIC_FILES_CHKSUM, correct?<br>
<br>
I'd rather we maybe kept the note in and maybe whitelisted recipes that<br>
did interesting things so that didn't appear than just ignored when a<br>
recipe was missing it.&nbsp;<br>
<br>
Because if we don't at least bb.note it, I can see people just ignoring<br>
it entirely (which would be bad in a lot of ways)</div><br></blockquote></div><br>No, this check was belt-and-braces (the other check is a bb.error()).&nbsp; Also bb.note() from tasks don't appear in the user-visible log by default, you've got to dig into the task log to see them which is buried in the work directories.</div></div></blockquote><div><br></div><div>Ah, correct (I generally see them since I'm piping most of the time). Ok, in that case then yes, that makes sense.</div><div><br></div><div>-b</div><div><br></div><blockquote type="cite"><div dir="ltr"><div class="gmail_extra"><br></div><div class="gmail_extra">Ross</div></div>
</blockquote></body></html>

--=-cOyZl+ji4vdECi2oOkKS--
