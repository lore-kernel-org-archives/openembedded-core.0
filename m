Received: from smtp-relay2.palm.com ([64.28.152.243])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <prvs=394e1ab23=rich.pixley@palm.com>)
	id 1S0zzK-0007pZ-7U for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:35:26 +0100
X-IronPort-AV: E=Sophos;i="4.73,477,1325491200"; d="scan'208";a="11888834"
Received: from unknown (HELO ushqusdns3.palm.com) ([148.92.223.90])
	by smtp-relay2.palm.com with ESMTP; 24 Feb 2012 10:25:42 -0800
Received: from fuji.noir.com ([10.100.2.8])
	by ushqusdns3.palm.com (8.14.4/8.14.4) with ESMTP id q1OIPgCO031135;
	Fri, 24 Feb 2012 10:25:42 -0800
Message-ID: <4F47D629.9040108@palm.com>
Date: Fri, 24 Feb 2012 10:25:45 -0800
From: Rich Pixley <rich.pixley@palm.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1330088135.32006.14.camel@ted>
In-Reply-To: <1330088135.32006.14.camel@ted>
Subject: Re: Using external source trees with OE-Core
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
X-List-Received-Date: Fri, 24 Feb 2012 18:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2/24/12 04:55 , Richard Purdie wrote:
> Someone recently asked me about using external source trees with
> OE-Core. [...]
> Opinions on including this class?
I see value.

Our workflow, (based on an ancient branch of oe), uses something 
similar.  When working on a component in context, (as distinct from 
standalone), the developer sets S to point to his own directory and then 
just avoids the tasks with awkward side effects like clean and mrproper.

We had problems initially with people committing bb files with S still 
pointed to the local values.  There needs to be a safety catch for this 
somewhere as this mistake is too easy to make and affects everyone when 
it happens.

Against my better judgment, someone locally implemented a ~/oe.conf 
arrangement that developers now use to override S for the components in 
which they work.  That seems to have largely addressed the problem of 
accidental commits of bb files with bad S values, but has opened a 
completely different set of problems, of course.  I don't think this is 
the right solution to the accidental commit problem, but I think some 
sanity check or "best practice" for overriding S is required before 
including this class.

--rich


