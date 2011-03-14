Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1PzArB-0001et-Mt
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 17:42:57 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1PzApa-00038H-9M from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 14 Mar 2011 09:41:18 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 14 Mar 2011 09:40:03 -0700
Received: from [172.30.80.14] (147.34.91.1) by svr-orw-fem-05 (147.34.97.43)
	with Microsoft SMTP Server id 14.1.270.1;
	Mon, 14 Mar 2011 09:40:03 -0700
Message-ID: <4D7E44D4.2020701@mentor.com>
Date: Mon, 14 Mar 2011 09:39:48 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <629947F1-FA71-48CF-91BF-CBA98C302DFF@dominion.thruhere.net>
In-Reply-To: <629947F1-FA71-48CF-91BF-CBA98C302DFF@dominion.thruhere.net>
X-OriginalArrivalTime: 14 Mar 2011 16:40:03.0857 (UTC)
	FILETIME=[7808B810:01CBE266]
Subject: Re: [RFC] Make GNU_HASH failures fatal
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
X-List-Received-Date: Mon, 14 Mar 2011 16:42:57 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2011 08:35 AM, Koen Kooi wrote:
> Hi,
>
> GNU_HASH QA failures are nearly gone in .dev, but still rampant in
> oe-core. I would like to propose making them fatal so they get fixed.
> The most worrysome offenders currently are gcc-runtime and perl.

It's a little worse than that actually.  Nothing is fatal currently.  I 
think we should grab warning/error
bit I did in oe.dev and pull that in (and then talk about adding RPATH 
to the fatal list).

-- 
Tom Rini
Mentor Graphics Corporation


