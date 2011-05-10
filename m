Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QJvyL-0005TO-Vu
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 01:04:10 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QJvvh-0004Yt-43 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 16:01:25 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 10 May 2011 15:59:40 -0700
Received: from [172.30.12.232] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Tue, 10 May 2011 16:01:24 -0700
Message-ID: <4DC9C3B2.3050201@mentor.com>
Date: Tue, 10 May 2011 16:01:06 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1305053706-19572-1-git-send-email-tom_rini@mentor.com>
	<BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
In-Reply-To: <BANLkTin42LTK6D9ui-C_SXmWiNLAz1T66Q@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 10 May 2011 22:59:40.0313 (UTC)
	FILETIME=[F167D890:01CC0F65]
Subject: Re: [PATCH] create-pull-request: Add -l location switch
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
X-List-Received-Date: Tue, 10 May 2011 23:04:10 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/10/2011 12:18 PM, Otavio Salvador wrote:
> On Tue, May 10, 2011 at 15:55, Tom Rini <tom_rini@mentor.com> wrote:
>> Add a -l switch that takes an argument of either github or gitorious
>> and will make the cover letter have a fill-in-the-blank of where the
>> changes are on either github or gitorious.
> 
> Another possibility would be to use git config interface to store
> those. You might have something like:
> 
> [oe-core-pull-request]
> mode = github
> user = foo
> 
> or
> 
> [oe-core-pull-request]
> mode = gitorious
> user = bar
> 
> This could be used to fill the fields in a proper way since those are
> predictable.

If I had a good bit more time, I might re-write the script in python and
parse .ini files (same syntax as gitconfig) so that lots of useful
defaults could be saved.  But here's the real test, given that you're an
intended user, would you use the -l switch or just make a local change
to the script like Martin showed?

-- 
Tom Rini
Mentor Graphics Corporation


