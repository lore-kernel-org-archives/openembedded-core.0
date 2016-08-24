Return-Path: <jeremy.rosen@smile.fr>
Received: from idris.smile.fr (idris.smile.fr [91.216.209.19])
	by mail.openembedded.org (Postfix) with ESMTP id A2D0E73169
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 14:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by idris.smile.fr (Postfix) with ESMTP id 2360D1EE0AB7;
	Wed, 24 Aug 2016 16:17:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at smile.fr
Received: from idris.smile.fr ([127.0.0.1])
	by localhost (bluemind-mta.prod.vitry.intranet [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ixx41yaAT4Xu; Wed, 24 Aug 2016 16:17:58 +0200 (CEST)
Received: from [10.9.18.210] (229.29.205.77.rev.sfr.net [77.205.29.229])
	by idris.smile.fr (Postfix) with ESMTPSA id C71431EE0A9C;
	Wed, 24 Aug 2016 16:17:57 +0200 (CEST)
To: Mark Hatle <mark.hatle@windriver.com>,
	"Burton, Ross" <ross.burton@intel.com>
References: <cover.a6e9ec329c3b0f51ecee82d0eb2842bbb091de1f.1471936926.git-series.jeremy.rosen@smile.fr>
	<4878b5cf9dd13a06a3c6aa1c9c126527918e0f62.1471936926.git-series.jeremy.rosen@smile.fr>
	<CAJTo0LbHr7Bi20zYEG5+1383UkSb8=YmKATxOoP57DO-ZKX1Aw@mail.gmail.com>
	<ff5fb210-3bed-d6e7-8c07-6c3a9079c90b@windriver.com>
	<17a87fc8-1cae-2393-ca91-67aa82b2e200@smile.fr>
	<0d5d7656-0bdb-faac-17ca-f156f3654e81@windriver.com>
From: =?UTF-8?B?SsOpcsOpbXkgUm9zZW4=?= <jeremy.rosen@smile.fr>
Message-ID: <a5c693a1-42a3-2234-291c-eef54f9a4358@smile.fr>
Date: Wed, 24 Aug 2016 16:17:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Firefox/45.0 Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <0d5d7656-0bdb-faac-17ca-f156f3654e81@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/8] [rpm] force a configure before make distclean
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
X-List-Received-Date: Wed, 24 Aug 2016 14:17:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 24/08/2016 16:13, Mark Hatle wrote:
>
> Make often has a rule looking at the time stamp of specific files and re-running
> specific autotools if they are 'out of date'.  That COULD be the cause of the
> errant call to gcc?
that would make sense...
>
> I have not observed the above occurring -- but the key thing is that syck needs
> to be cleaned of the generated files.  We don't want to run any host commands
> other then clean it.
>
> If you have to replace it with something else, you will need to identify all of
> the files that need to be cleaned and manually remove them avoiding the
> distclean call.
>
> Easiest way to do that.... extract the source for syck, back it up, run the make
> distclean.. compare the difference and use that list as a replacement 'cleanup'
> command.

That wouldn't be very robust to future change in syck, i'm afraid... but 
i'll have a look.
>
> --Mark
>
>


