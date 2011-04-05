Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q6wBs-0001N8-5n
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 04:40:24 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q6w9r-00072x-Pr from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 19:38:19 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 4 Apr 2011 19:38:19 -0700
Received: from [172.30.80.151] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 4 Apr 2011 19:38:17 -0700
Message-ID: <4D9A8094.6060904@mentor.com>
Date: Mon, 4 Apr 2011 19:38:12 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1301631488.git.raj.khem@gmail.com>	<9778c2218ffe94c96e816b203ded8569b19a1faf.1301631488.git.raj.khem@gmail.com>
	<1301917403.24596.335.camel@rex>
In-Reply-To: <1301917403.24596.335.camel@rex>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 05 Apr 2011 02:38:19.0637 (UTC)
	FILETIME=[8642D250:01CBF33A]
Subject: Re: [PATCH 02/46] classes: Use virtual/libintl instead of gettext
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
X-List-Received-Date: Tue, 05 Apr 2011 02:40:24 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 04/04/2011 04:43 AM, Richard Purdie wrote:
[snip]
> As an example of the opposite problem, sending 20 patches which change
> DEPENDS = "gettext" to "inherit gettext" isn't especially useful and we
> could do that as one patch.

I'd like to use this specific example (and some lessons learned doing
this in openembedded.master) as a way to say "commits are cheap, and 20
commits for 20 recipes for 20 1-liners isn't a bad thing".  If we do
this as one commit and there's a subtle bug somewhere, the bisect says
"this big list here".  And you can probably find it.  But if you do this
as 20 commits, you know where it is.  And if it's harder to fix (some of
them were) you can just revert for now and not loose all of the work you
did.

Now, separate pull request?  Certainly, and then you can just pull and
check since to me that's a lot easier for the one-liners.

-- 
Tom Rini
Mentor Graphics Corporation


