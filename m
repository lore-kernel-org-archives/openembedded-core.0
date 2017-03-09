Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id DE9556612D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Mar 2017 11:40:31 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170309114031877_0685
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Mar 2017 03:40:31 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=47745 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1clwQk-00013J-Iz for openembedded-core@lists.openembedded.org;
	Thu, 09 Mar 2017 06:40:26 -0500
Date: Thu, 9 Mar 2017 06:40:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703090635210.18662@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: does "devtool add" no longer calculate the recipe name?
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
X-List-Received-Date: Thu, 09 Mar 2017 11:40:33 -0000
Content-Type: text/plain; charset=US-ASCII


  hoping it's not something silly i did but, recently, i used devtool
add to create a recipe for mod_auth_tkt from the github repo. i didn't
specify the recipe name, just used:

  $ devtool add https://github.com/gavincarr/mod_auth_tkt.git

which seemed to work fine in that it figured out that the recipe name
would be mod-auth-tkt and created the directories by that name.

  i just did it again, and now the name is left as '%{name}',
suggesting that devtool is no longer determining what the recipe name
should be.

  if i specify the recipe name explicitly:

$ devtool add mod-auth-tkt https://github.com/gavincarr/mod_auth_tkt.git

then it works fine. but i'm sure i previously didn't need to do
that. has the behaviour of devtool changed in that respect?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


