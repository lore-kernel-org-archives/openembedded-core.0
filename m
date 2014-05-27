Return-Path: <Sean_Hudson@mentor.com>
Received: from relay1.mentorg.com (unknown [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 2ED596FA84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 16:16:55 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1WpK3c-0001yH-AV from Sean_Hudson@mentor.com ;
	Tue, 27 May 2014 09:16:56 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Tue, 27 May 2014 09:16:56 -0700
Received: from [172.30.4.225] (147.34.91.1) by svr-orw-fem-05.mgc.mentorg.com
	(147.34.97.43) with Microsoft SMTP Server id 14.2.247.3;
	Tue, 27 May 2014 09:16:49 -0700
Message-ID: <5384BA76.4080700@mentor.com>
Date: Tue, 27 May 2014 11:16:54 -0500
From: Sean Hudson <sean_hudson@mentor.com>
Organization: Mentor Graphics - Embedded Software Division
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Valentin Popa
	<valentin.popa@intel.com>
References: <cover.1400690725.git.valentin.popa@intel.com>	<537E25A9.9080106@intel.com>
	<CAJTo0Lb6Wa8tdyjB7yPK7w_PLuaKq9OKZAU8W+cXds+nt4PbeA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb6Wa8tdyjB7yPK7w_PLuaKq9OKZAU8W+cXds+nt4PbeA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
X-OriginalArrivalTime: 27 May 2014 16:16:56.0170 (UTC)
	FILETIME=[1437FCA0:01CF79C7]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] [V3]mesa: upgrade to 10.1.3
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
X-List-Received-Date: Tue, 27 May 2014 16:16:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 05/22/2014 11:58 AM, Burton, Ross wrote:
> For these three patches:
> 
> On 22 May 2014 17:28, Valentin Popa <valentin.popa@intel.com> wrote:
>>>    dri3proto: add it to oe-core
>>>    libxshmfence: add it to oe-core
>>>    eglinfo: patched to compile with mesa10+
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> 
> Mesa needs more testing, but these pieces are good to merge.
> 
> Ross
> 

  I don't have a specific need to preserve MESA 9.x (that I know of
right now), but it seems like we might consider keeping it around a bit
longer in parallel with MESA 10.x and then formally deprecate it in the
next release.

Regards,
     Sean


