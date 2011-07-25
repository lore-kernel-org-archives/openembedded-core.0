Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QlS3q-0004Ua-Hz
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:47:34 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1QlRzn-0001bd-54 from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 13:43:23 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 25 Jul 2011 13:43:22 -0700
Received: from [172.30.80.87] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Mon, 25 Jul 2011 13:43:22 -0700
Message-ID: <4E2DD567.5060303@mentor.com>
Date: Mon, 25 Jul 2011 13:43:19 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1311345613.git.richard.purdie@linuxfoundation.org>	<1311357628.2344.153.camel@rex>
	<4E29BE22.5060002@mentor.com>	<4E2DBC30.9070808@windriver.com>
	<4E2DC535.9030406@mentor.com>
	<1311626348.3098.20.camel@lenovo.internal.reciva.com>
In-Reply-To: <1311626348.3098.20.camel@lenovo.internal.reciva.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 25 Jul 2011 20:43:22.0976 (UTC)
	FILETIME=[7EBA3E00:01CC4B0B]
Subject: Re: [PATCH 5/3] conf/machine/include: Start to fill out architecture specific tune include files and tune features
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
X-List-Received-Date: Mon, 25 Jul 2011 20:47:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 07/25/2011 01:39 PM, Phil Blundell wrote:
> On Mon, 2011-07-25 at 12:34 -0700, Tom Rini wrote:
>> On 07/25/2011 11:55 AM, Mark Hatle wrote:
>>> I actually prefer "x86-64" I think that is a reasonable compromise between the
>>> x86_64 naming and the need to not use "_".
>>
>> That causes other problems, no?  Top of my head would be that deb/ipk
>> doesn't allow a dash in that field.  Could be mistaken tho...
> 
> The package management backend could always rewrite it to something else
> (under control of the DISTRO if need be, so AMD and Intel folks can each
> call it their own thing if they want to).
> 
> Personally though, I would be tempted just to call it "x64", which is
> then nicely symmetric with x32 and doesn't seem likely to collide with
> anything else.

Yeah, but x32 means something else (not i586, etc) :)  My main
suggestion is to follow existing conventions, so amd64 since we can't
match x86_64 like the RPM world.  FWIW, x64 appears to be the MS ABI for
this case, so.. not a bad idea?

-- 
Tom Rini
Mentor Graphics Corporation


