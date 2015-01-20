Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 2E00B71F1B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jan 2015 17:28:31 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 20 Jan 2015 18:28:26 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id B1DB72800CB;
	Tue, 20 Jan 2015 18:28:26 +0100 (CET)
Date: Tue, 20 Jan 2015 18:28:26 +0100
From: "Maxin B. John" <maxin.john@enea.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150120172826.GA58442@sestofb10.enea.se>
References: <1420632703-13393-1-git-send-email-maxin.john@enea.com>
	<20150119135710.GA21148@sestofb10.enea.se>
	<CAJTo0LZ2QXUwCP7B4y1ST2E0XCRozPyPgx4OqU5GrfayZ3bHiw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ2QXUwCP7B4y1ST2E0XCRozPyPgx4OqU5GrfayZ3bHiw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX08.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dizzy][PATCH] coreutils: Fix CVE-2014-9471
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
X-List-Received-Date: Tue, 20 Jan 2015 17:28:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi Ross,

On Tue, Jan 20, 2015 at 04:00:02PM +0000, Burton, Ross wrote:
> 
> On 19 January 2015 at 13:57, Maxin B. John <maxin.john@enea.com> wrote:
> 
>     On Wed, Jan 07, 2015 at 01:11:43PM +0100, Maxin B. John wrote:
>     > Fiedler Roman discovered that coreutils' parse_datetime() function
>     > has some flaws that may be exploitable if the date(1), touch(1),
>     > or potentially other programs, accept untrusted input for certain
>     > parameters. While researching this issue, he discovered that it
>     > was independently discovered by Bertrand Jacquin and reported at
>     > http://debbugs.gnu.org/cgi/bugreport.cgi?bug=16872
>     >
> 
> 
> Was this bug still in 8.23 so it needs to be applied to master, or is it
> dizzy-specific?

This bug is already fixed in 8.23. So, we don't have to apply this on
master.

> Ross 
Best Regards,
Maxin


