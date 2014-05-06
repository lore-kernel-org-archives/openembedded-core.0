Return-Path: <Sean_Hudson@mentor.com>
X-Greylist: delayed 921 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 20:34:36 UTC
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 8B94865DC4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 20:34:36 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Whlpc-0004kw-EV from Sean_Hudson@mentor.com ;
	Tue, 06 May 2014 13:19:16 -0700
Received: from SVR-ORW-FEM-06.mgc.mentorg.com ([147.34.97.120]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 6 May 2014 13:19:15 -0700
Received: from [172.30.2.41] (147.34.91.1) by SVR-ORW-FEM-06.mgc.mentorg.com
	(147.34.97.120) with Microsoft SMTP Server id 14.2.247.3;
	Tue, 6 May 2014 13:19:15 -0700
Message-ID: <536943C2.3040800@mentor.com>
Date: Tue, 6 May 2014 15:19:14 -0500
From: Sean Hudson <sean_hudson@mentor.com>
Organization: Mentor Graphics - Embedded Software Division
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>,
	<openembedded-core@lists.openembedded.org>
References: <20140506200046.GC11339@denix.org>
In-Reply-To: <20140506200046.GC11339@denix.org>
X-Enigmail-Version: 1.5.2
X-OriginalArrivalTime: 06 May 2014 20:19:15.0993 (UTC)
	FILETIME=[73F42890:01CF6968]
Subject: Re: Recipes erroneously marked as "commercial"?
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
X-List-Received-Date: Tue, 06 May 2014 20:34:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/06/2014 03:00 PM, Denys Dmytriyenko wrote:
> So, long time ago we had a short list of "commercial" packages in a global 
> variable COMMERCIAL_LICENSE:
>
> COMMERCIAL_LICENSE ?= "lame gst-fluendo-mp3 libmad mpeg2dec ffmpeg qmmp"
>
> Then, at some point, the packages that depend on commercial ones were added to 
> the list, to allow wold builds to be successful:
>
> http://cgit.openembedded.org/openembedded-core/commit/?id=c69453fe94a649c518b0e6d79616f05579b864ce
>
> So, the list was appended with this:
>
> COMMERCIAL_LICENSE_DEPENDEES ?= "gst-plugins-ugly libomxil gst-openmax"
>
> Then, later on, the feature was changed from a global list to a per-recipe 
> flags:
>
> http://cgit.openembedded.org/openembedded-core/commit/?id=a2760661b8c7a4a1b6f2e556853b3a9ae38cbcb5
> http://cgit.openembedded.org/openembedded-core/commit/?id=43410523a07d9eb52a7d57ae3dc1cc320cbbc6f9
>
> And all those recipes got marked with LICENSE_FLAGS = "commercial" 
> automatically, even if they are not really commercial.
>
> The question is - should we clean those up now? I can send a quick patch, if 
> my understanding above is correct.
>
I encountered this issue recently and raised it in IRC.  As an
interested party, I'd love to see these updated.

  (Thanks Denys for sending it to the list so quickly.)

